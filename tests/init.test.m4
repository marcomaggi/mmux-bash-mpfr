#!#
#!# Part of: MMUX Bash MPFR
#!# Contents: tests for initialisation and finalisation builtins
#!# Date: Sep 15, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/init.test ; less tests/init.log
#!#
#!#	that will select these tests.
#!#
#!# Copyright (c) 2024 Marco Maggi
#!# <mrc.mgg@gmail.com>
#!#
#!# The author hereby  grants permission to use,  copy, modify, distribute, and  license this software
#!# and its documentation  for any purpose, provided  that existing copyright notices  are retained in
#!# all copies and that this notice is  included verbatim in any distributions.  No written agreement,
#!# license,  or royalty  fee is  required for  any  of the  authorized uses.   Modifications to  this
#!# software may  be copyrighted by their  authors and need  not follow the licensing  terms described
#!# here, provided that the new terms are clearly indicated  on the first page of each file where they
#!# apply.
#!#
#!# IN NO EVENT SHALL THE AUTHOR OR DISTRIBUTORS BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, SPECIAL,
#!# INCIDENTAL, OR CONSEQUENTIAL DAMAGES  ARISING OUT OF THE USE OF  THIS SOFTWARE, ITS DOCUMENTATION,
#!# OR ANY  DERIVATIVES THEREOF,  EVEN IF  THE AUTHOR  HAVE BEEN  ADVISED OF  THE POSSIBILITY  OF SUCH
#!# DAMAGE.
#!#
#!# THE AUTHOR AND  DISTRIBUTORS SPECIFICALLY DISCLAIM ANY WARRANTIES, INCLUDING,  BUT NOT LIMITED TO,
#!# THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT.
#!# THIS  SOFTWARE IS  PROVIDED  ON AN  \"AS  IS\" BASIS,  AND  THE AUTHOR  AND  DISTRIBUTORS HAVE  NO
#!# OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
#!#


#### macros

MBFL_DEFINE_QQ_MACRO
MBFL_DEFINE_UNDERSCORE_MACRO_FOR_SLOTS


#### setup

mbfl_embed_library(__LIBMBFL_LINKER__)
mbfl_linker_source_library_by_stem(core)
mbfl_linker_source_library_by_stem(tests)

source "$MMUX_LIBRARY"


#### basic initialisation and finalisation

function mpfr-init-1.1 () {
    # We print an initialised but unset number.
    declare -r EXPECTED_RESULT='@NaN@'
    declare OP RESULT

    #dotest-set-debug
    dotest-debug mpfr_SIZEOF_MPFR=WW(mpfr_SIZEOF_MPFR)

    mbfl_location_enter
    {
	if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF_MPFR)
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug OP=WW(OP)

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_dump WW(OP))
    }
    mbfl_location_leave
    dotest-equal QQ(EXPECTED_RESULT) QQ(RESULT)
}

function mpfr-init-1.2 () {
    # We print an initialised but unset number.
    declare -r EXPECTED_RESULT='0.10000000000000000000000000000000000000000000000000000E2'
    declare OP RESULT

    #dotest-set-debug
    dotest-debug mpfr_SIZEOF_MPFR=WW(mpfr_SIZEOF_MPFR)

    mbfl_location_enter
    {
	if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF_MPFR)
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug OP=WW(OP)

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	mpfr_set_d WW(OP) '2.0' WW(MPFR_RNDN)

	RESULT=$(mpfr_dump WW(OP))
    }
    mbfl_location_leave
    dotest-equal QQ(EXPECTED_RESULT) QQ(RESULT)
}


#### compount allocation and initialisation

function mpfr-alloc-and-init-1.1 () {
    declare -r EXPECTED_RESULT='0.123000e3'
    declare OP

    mbfl_location_enter
    {
	if mpfr_alloc_and_init OP
	then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_si WW(OP) 123 WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-equal QQ(EXPECTED_RESULT) QQ(RESULT)
    }
    mbfl_location_leave
}


#### mpfr_init2

function mpfr-init2-1.1 () {
    # We print an initialised but unset number.
    declare -r PREC=123 EXPECTED_RESULT='@NaN@'
    declare OP RESULT

    mbfl_location_enter
    {
	if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF_MPFR)
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init2 WW(OP) WW(PREC)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
    }
    mbfl_location_leave
    dotest-equal QQ(EXPECTED_RESULT) QQ(RESULT)
}



#### mpfr_inits, mpfr_clears

function mpfr-inits-1.1 () {
    declare -ra EXPECTED_RESULTS=('0.000000e0' '0.100000e1' '0.200000e1' '0.300000e1' '0.400000e1')
    declare -r OPNUM=mbfl_slots_number(EXPECTED_RESULTS)
    declare -a OPS
    declare -i IDX
    declare -a RESULTS

    dotest-unset-debug

    mbfl_location_enter
    {
	if mmux_libc_calloc mbfl_slot_spec(OPS,0) WW(mpfr_SIZEOF_MPFR) WW(OPNUM)
	then mbfl_location_handler "mmux_libc_free mbfl_slot_ref(OPS,0)"
	else mbfl_location_leave_then_return_failure
	fi

	for ((IDX=1; IDX < OPNUM; ++IDX))
	do mmux_pointer_add mbfl_slot_spec(OPS,WW(IDX)) mbfl_slot_qref(OPS,0) $(( IDX * mpfr_SIZEOF_MPFR ))
	done

	{
	    declare CLEAR_HANDLER='mpfr_clears'

	    for ((IDX=0; IDX < OPNUM; ++IDX))
	    do CLEAR_HANDLER+=" mbfl_slot_ref(OPS,$IDX)"
	    done

	    dotest-debug CLEAR_HANDLER=WW(CLEAR_HANDLER)

	    if mpfr_inits mbfl_slots_values(OPS)
	    then mbfl_location_handler WW(CLEAR_HANDLER)
	    else mbfl_location_leave_then_return_failure
	    fi
	}

	dotest-debug setting

	for ((IDX=0; IDX < OPNUM; ++IDX))
	do mpfr_set_si mbfl_slot_qref(OPS,WW(IDX)) WW(IDX) WW(MPFR_RNDN)
	done

	for ((IDX=0; IDX < OPNUM; ++IDX))
	do
	    RESULT=$(mpfr_just_printit_dammit mbfl_slot_qref(OPS,WW(IDX)))
	    mbfl_slot_set(RESULTS,WW(IDX),$RESULT)
	done

	for ((IDX=0; IDX < OPNUM; ++IDX))
	do
	    dotest-debug check mbfl_slot_qref(EXPECTED_RESULTS,WW(IDX)) mbfl_slot_qref(RESULTS,WW(IDX))
	    if ! dotest-equal mbfl_slot_qref(EXPECTED_RESULTS,WW(IDX)) mbfl_slot_qref(RESULTS,WW(IDX))
	    then mbfl_location_leave_then_return_failure
	    fi
	done
    }
    mbfl_location_leave
}


#### mpfr_inits2, mpfr_clears

function mpfr-inits2-1.1 () {
    declare -ra EXPECTED_RESULTS=('0.000000e0' '0.100000e1' '0.200000e1' '0.300000e1' '0.400000e1')
    declare -r PREC=123 OPNUM=mbfl_slots_number(EXPECTED_RESULTS)
    declare -a OPS
    declare -i IDX
    declare -a RESULTS

    dotest-unset-debug

    mbfl_location_enter
    {
	if mmux_libc_calloc mbfl_slot_spec(OPS,0) WW(mpfr_SIZEOF_MPFR) WW(OPNUM)
	then mbfl_location_handler "mmux_libc_free mbfl_slot_ref(OPS,0)"
	else mbfl_location_leave_then_return_failure
	fi

	for ((IDX=1; IDX < OPNUM; ++IDX))
	do mmux_pointer_add mbfl_slot_spec(OPS,WW(IDX)) mbfl_slot_qref(OPS,0) $(( IDX * mpfr_SIZEOF_MPFR ))
	done

	{
	    declare CLEAR_HANDLER='mpfr_clears'

	    for ((IDX=0; IDX < OPNUM; ++IDX))
	    do CLEAR_HANDLER+=" mbfl_slot_ref(OPS,$IDX)"
	    done

	    dotest-debug CLEAR_HANDLER=WW(CLEAR_HANDLER)

	    if mpfr_inits2 WW(PREC) mbfl_slots_values(OPS)
	    then mbfl_location_handler WW(CLEAR_HANDLER)
	    else mbfl_location_leave_then_return_failure
	    fi
	}

	dotest-debug setting

	for ((IDX=0; IDX < OPNUM; ++IDX))
	do mpfr_set_si mbfl_slot_qref(OPS,WW(IDX)) WW(IDX) WW(MPFR_RNDN)
	done

	for ((IDX=0; IDX < OPNUM; ++IDX))
	do
	    RESULT=$(mpfr_just_printit_dammit mbfl_slot_qref(OPS,WW(IDX)))
	    mbfl_slot_set(RESULTS,WW(IDX),$RESULT)
	done

	for ((IDX=0; IDX < OPNUM; ++IDX))
	do
	    dotest-debug check mbfl_slot_qref(EXPECTED_RESULTS,WW(IDX)) mbfl_slot_qref(RESULTS,WW(IDX))
	    if ! dotest-equal mbfl_slot_qref(EXPECTED_RESULTS,WW(IDX)) mbfl_slot_qref(RESULTS,WW(IDX))
	    then mbfl_location_leave_then_return_failure
	    fi
	done
    }
    mbfl_location_leave
}


#### initialise shell array

# Let's do this in a format that can be copied in the documentation.
#
function mpfr-init-shell-array-1.1 () {
    declare -a OPS
    declare -i NUM=5

    mpfr_alloc_shell_array OPS $NUM
    {
	mpfr_init_shell_array OPS
	{
	    for ((IDX=0; IDX < ${#OPS[@]}; ++IDX))
	    do
		mpfr_set_si ${OPS[$IDX]} $IDX $MPFR_RNDN
		mpfr_just_printit_dammit ${OPS[$IDX]}
	    done

            declare -n ROP=OPS[0]
            declare -n OP1=OPS[1]
            declare -n OP2=OPS[2]

	    mpfr_just_printit_dammit $ROP
	    mpfr_just_printit_dammit $OP1
	    mpfr_just_printit_dammit $OP2
	}
	mpfr_clear_shell_array OPS
    }
    mpfr_free_shell_array OPS
}

function mpfr-init-shell-array-1.2 () {
    declare -a OPS
    declare -i NUM=5
    declare -i PREC=17

    mpfr_alloc_shell_array OPS $NUM
    {
	mpfr_init_shell_array OPS $PREC
	{
	    for ((IDX=0; IDX < ${#OPS[@]}; ++IDX))
	    do
		mpfr_set_si ${OPS[$IDX]} $IDX $MPFR_RNDN
		mpfr_just_printit_dammit ${OPS[$IDX]}
	    done

            declare -n ROP=OPS[0]
            declare -n OP1=OPS[1]
            declare -n OP2=OPS[2]

	    mpfr_just_printit_dammit $ROP
	    mpfr_just_printit_dammit $OP1
	    mpfr_just_printit_dammit $OP2
	}
	mpfr_clear_shell_array OPS
    }
    mpfr_free_shell_array OPS
}

function mpfr-init-shell-array-1.3 () {
    declare -a OPS
    declare -i NUM=5

    mpfr_alloc_and_init_shell_array OPS $NUM
    {
	for ((IDX=0; IDX < ${#OPS[@]}; ++IDX))
	do
	    mpfr_set_si ${OPS[$IDX]} $IDX $MPFR_RNDN
	    mpfr_just_printit_dammit ${OPS[$IDX]}
	done

        declare -n ROP=OPS[0]
        declare -n OP1=OPS[1]
        declare -n OP2=OPS[2]

	mpfr_just_printit_dammit $ROP
	mpfr_just_printit_dammit $OP1
	mpfr_just_printit_dammit $OP2
    }
    mpfr_clear_and_free_shell_array OPS
}
function mpfr-init-shell-array-1.4 () {
    declare -a OPS
    declare -i NUM=5
    declare -i PREC=17

    mpfr_alloc_and_init_shell_array OPS $NUM $PREC
    {
	for ((IDX=0; IDX < ${#OPS[@]}; ++IDX))
	do
	    mpfr_set_si ${OPS[$IDX]} $IDX $MPFR_RNDN
	    mpfr_just_printit_dammit ${OPS[$IDX]}
	done

        declare -n ROP=OPS[0]
        declare -n OP1=OPS[1]
        declare -n OP2=OPS[2]

	mpfr_just_printit_dammit $ROP
	mpfr_just_printit_dammit $OP1
	mpfr_just_printit_dammit $OP2
    }
    mpfr_clear_and_free_shell_array OPS
}


#### mpfr_set_default_prec, mpfr_get_default_prec

function mpfr-set-default-prec-1.1 () {
    declare -r NEW_PREC=17 EXPECTED_PREC=17
    declare PREC

    if ! mpfr_set_default_prec $NEW_PREC
    then return 1
    fi

    if ! mpfr_get_default_prec PREC
    then return 1
    fi

    dotest-equal WW(EXPECTED_PREC) WW(PREC)
}
function mpfr-set-default-prec-1.2 () {
    declare -r EXPECTED_PREC=53
    declare PREC

    if ! mpfr_get_default_prec PREC
    then return 1
    fi

    dotest-equal WW(EXPECTED_PREC) WW(PREC)
}


#### mpfr_set_prec, mpfr_get_prec

function mpfr-set-prec-1.1 () {
    declare OP PREC EXPECTED_PREC

    mbfl_location_enter
    {
	if ! mpfr_get_default_prec EXPECTED_PREC
	then mbfl_location_leave_then_return_failure
	fi

	if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF_MPFR)
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_get_prec PREC $OP
	then mbfl_location_leave_then_return_failure
	fi
    }
    mbfl_location_leave
    dotest-equal QQ(EXPECTED_PREC) QQ(PREC)
}
function mpfr-set-prec-1.2 () {
    declare -r NEW_PREC=17 EXPECTED_PREC=17
    declare OP PREC

    mbfl_location_enter
    {
	if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF_MPFR)
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_prec $OP $NEW_PREC
	then mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_get_prec PREC $OP
	then mbfl_location_leave_then_return_failure
	fi
    }
    mbfl_location_leave
    dotest-equal QQ(EXPECTED_PREC) QQ(PREC)
}


#### let's go

dotest mpfr-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
