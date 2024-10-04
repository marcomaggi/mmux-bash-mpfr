#!#
#!# Part of: MMUX Bash MPFR
#!# Contents: tests for conversion functions
#!# Date: Sep 15, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/conversion.test ; less tests/conversion.log
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

source WW(MMUX_LIBRARY)


# mpfr_get_si

if mmux_bash_pointers_builtin_p mpfr_get_si
then

function conversion-mpfr_get_si-1.1 () {
    declare -r	INITVAL='123'
    declare	ROP OP

    dotest-unset-debug

    mbfl_location_enter
    {
	if mpfr_alloc_and_init OP
	then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug WW(OP) WW(INITVAL) WW(MPFR_RNDN)

	if ! mpfr_set_si WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_get_si ROP WW(OP) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	dotest-debug WW(INITVAL) WW(ROP)
	dotest-equal WW(INITVAL) WW(ROP)
    }
    mbfl_location_leave
}

fi


# mpfr_get_ui

if mmux_bash_pointers_builtin_p mpfr_get_ui
then

function conversion-mpfr_get_ui-1.1 () {
    declare -r	INITVAL='123'
    declare	ROP OP

    dotest-unset-debug

    mbfl_location_enter
    {
	if mpfr_alloc_and_init OP
	then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug WW(OP) WW(INITVAL) WW(MPFR_RNDN)

	if ! mpfr_set_ui WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_get_ui ROP WW(OP) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	dotest-debug WW(INITVAL) WW(ROP)
	dotest-equal WW(INITVAL) WW(ROP)
    }
    mbfl_location_leave
}

fi


# mpfr_get_sj

if mmux_bash_pointers_builtin_p mpfr_get_sj
then

function conversion-mpfr_get_sj-1.1 () {
    declare -r	INITVAL='123'
    declare	ROP OP

    dotest-unset-debug

    mbfl_location_enter
    {
	if mpfr_alloc_and_init OP
	then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug WW(OP) WW(INITVAL) WW(MPFR_RNDN)

	if ! mpfr_set_si WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_get_sj ROP WW(OP) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	dotest-debug WW(INITVAL) WW(ROP)
	dotest-equal WW(INITVAL) WW(ROP)
    }
    mbfl_location_leave
}

fi


# mpfr_get_uj

if mmux_bash_pointers_builtin_p mpfr_get_uj
then

function conversion-mpfr_get_uj-1.1 () {
    declare -r	INITVAL='123'
    declare	ROP OP

    dotest-unset-debug

    mbfl_location_enter
    {
	if mpfr_alloc_and_init OP
	then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug WW(OP) WW(INITVAL) WW(MPFR_RNDN)

	if ! mpfr_set_si WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_get_uj ROP WW(OP) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	dotest-debug WW(INITVAL) WW(ROP)
	dotest-equal WW(INITVAL) WW(ROP)
    }
    mbfl_location_leave
}

fi



# mpfr_get_flt
# mpfr_get_d
# mpfr_get_ld
# mpfr_get_float128
# mpfr_get_decimal64
# mpfr_get_decimal128
# mpfr_get_d_2exp
# mpfr_get_ld_2exp
# mpfr_frexp
# mpfr_get_str
# mpfr_fits_sshort_p
# mpfr_fits_ushort_p
# mpfr_fits_sint_p
# mpfr_fits_uint_p
# mpfr_fits_slong_p
# mpfr_fits_ulong_p
# mpfr_fits_intmax_p
# mpfr_fits_uintmax_p
# mpfr_get_z_2exp
# mpfr_get_z
# mpfr_get_q
# mpfr_get_f
# mpfr_get_str_ndigits


#### mpfr-get-str

function conversion-mpfr_get_str-1.1 () {
    # We print an uninitialised but unset number.
    declare -r EXPECTED_MAN_RESULT='12300000000000000' EXPECTED_EXP_RESULT='1'
    declare MPFR_OP MAN_RESULT EXP_RESULT
    declare -ri BASE=10 NDIGITS=0

    #dotest-set-debug
    dotest-debug mpfr_SIZEOF=$mpfr_SIZEOF

    mbfl_location_enter
    {
	if mmux_libc_calloc MPFR_OP 1 $mpfr_SIZEOF
	then mbfl_location_handler "mmux_libc_free $MPFR_OP"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug OP=$MPFR_OP

	if mpfr_init $MPFR_OP
	then mbfl_location_handler "mpfr_clear $MPFR_OP"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_d $MPFR_OP '1.23' $MPFR_RNDN
	then mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_get_str MAN_RESULT EXP_RESULT $BASE $NDIGITS $MPFR_OP $MPFR_RNDN
	then mbfl_location_leave_then_return_failure
	fi
    }
    mbfl_location_leave
    dotest-equal QQ(EXPECTED_MAN_RESULT) QQ(MAN_RESULT) &&
	dotest-equal QQ(EXPECTED_EXP_RESULT) QQ(EXP_RESULT)
}


#### let's go

dotest conversion-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
