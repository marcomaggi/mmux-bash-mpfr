#!#
#!# Part of: MMUX Bash MPFR
#!# Contents: tests for setter builtins
#!# Date: Sep 15, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/setters.test ; less tests/setters.log
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

function mpfr_just_printit_dammit () {
    declare OP=${1:?"missing mandatory parameter MPFR_PTR in call to '$FUNCNAME'"}
    declare -ri BASE=10 NDIGITS=6
    declare MAN EXP

    mpfr_get_str MAN EXP "$BASE" "$NDIGITS" "$OP" "$MPFR_RNDN"

    if test "${MAN:0:1}" = '-'
    then printf -- '-0.%se%s\n' "${MAN:1}" "$EXP"
    else printf --  '0.%se%s\n' "$MAN" "$EXP"
    fi
}

function mmux_bash_builtin_p () {
    declare NAME=${1:?"missing mandatory parameter NAME in call to '$FUNCNAME'"}

    test 'builtin' = "$(type -t $NAME)"
}


#### setters: slong

function mpfr-set-slong-1.1 () {
    declare -r EXPECTED_RESULT='0.123000e3'
    declare OP RESULT

    dotest-unset-debug
    dotest-debug mpfr_SIZEOF_MPFR=WW(mpfr_SIZEOF_MPFR)

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug OP=WW(OP)

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_si WW(OP) '123' WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-debug WW(RESULT)
    }
    mbfl_location_leave
    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
}
function mpfr-set-slong-1.2 () {
    declare -r EXPECTED_RESULT='-0.123000e3'
    declare OP RESULT

    dotest-unset-debug
    dotest-debug mpfr_SIZEOF_MPFR=WW(mpfr_SIZEOF_MPFR)

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug OP=WW(OP)

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_si WW(OP) '-123' WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-debug WW(RESULT)
    }
    mbfl_location_leave
    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
}


#### setters: ulong

function mpfr-set-ulong-1.1 () {
    declare -r EXPECTED_RESULT='0.123000e3'
    declare OP RESULT

    dotest-unset-debug
    dotest-debug mpfr_SIZEOF_MPFR=WW(mpfr_SIZEOF_MPFR)

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug OP=WW(OP)

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_ui WW(OP) '123' WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-debug WW(RESULT)
    }
    mbfl_location_leave
    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
}


#### setters: sintmax

function mpfr-set-sintmax-1.1 () {
    declare -r EXPECTED_RESULT='0.123000e3'
    declare OP RESULT

    dotest-unset-debug
    dotest-debug mpfr_SIZEOF_MPFR=WW(mpfr_SIZEOF_MPFR)

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug OP=WW(OP)

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_sj WW(OP) '123' WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-debug WW(RESULT)
    }
    mbfl_location_leave
    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
}
function mpfr-set-sintmax-1.2 () {
    declare -r EXPECTED_RESULT='-0.123000e3'
    declare OP RESULT

    dotest-unset-debug
    dotest-debug mpfr_SIZEOF_MPFR=WW(mpfr_SIZEOF_MPFR)

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug OP=WW(OP)

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_sj WW(OP) '-123' WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-debug WW(RESULT)
    }
    mbfl_location_leave
    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
}


#### setters: uintmax

function mpfr-set-uintmax-1.1 () {
    declare -r EXPECTED_RESULT='0.123000e3'
    declare OP RESULT

    dotest-unset-debug
    dotest-debug mpfr_SIZEOF_MPFR=WW(mpfr_SIZEOF_MPFR)

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug OP=WW(OP)

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_uj WW(OP) '123' WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-debug WW(RESULT)
    }
    mbfl_location_leave
    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
}


#### setters: float

function mpfr-set-float-1.1 () {
    declare -r EXPECTED_RESULT='0.123457e3'
    declare OP RESULT

    #dotest-set-debug
    dotest-debug mpfr_SIZEOF_MPFR=WW(mpfr_SIZEOF_MPFR)

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug OP=WW(OP)

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_flt WW(OP) '123.4567890' WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-debug WW(RESULT)
    }
    mbfl_location_leave
    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
}


#### setters: double

function mpfr-set-double-1.1 () {
    declare -r EXPECTED_RESULT='0.123457e3'
    declare OP RESULT

    #dotest-set-debug
    dotest-debug mpfr_SIZEOF_MPFR=WW(mpfr_SIZEOF_MPFR)

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug OP=WW(OP)

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_d WW(OP) '123.4567890' WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-debug WW(RESULT)
    }
    mbfl_location_leave
    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
}


#### setters: ldouble

if mmux_bash_builtin_p 'mpfr_set_ld'
then

function mpfr-set-ldouble-1.1 () {
    declare -r EXPECTED_RESULT='0.123000e3'
    declare OP RESULT

    dotest-unset-debug
    dotest-debug mpfr_SIZEOF_MPFR=WW(mpfr_SIZEOF_MPFR)

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug OP=WW(OP)

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_ld WW(OP) WW(mmux_libc_MAX_LDOUBLE) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-debug WW(RESULT)
    }
    mbfl_location_leave
    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
}

fi


#### setters: float128

if mmux_bash_builtin_p 'mpfr_set_float128'
then

function mpfr-set-float128-1.1 () {
    declare -r EXPECTED_RESULT='0.123457e3'
    declare OP RESULT

    #dotest-set-debug
    dotest-debug mpfr_SIZEOF_MPFR=WW(mpfr_SIZEOF_MPFR)

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug OP=WW(OP)

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_float128 WW(OP) '123.4567890' WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-debug WW(RESULT)
    }
    mbfl_location_leave
    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
}

fi


#### setters: decimal64

if mmux_bash_builtin_p 'mpfr_set_decimal64'
then

function mpfr-set-decimal64-1.1 () {
    declare -r EXPECTED_RESULT='0.123457e3'
    declare OP RESULT

    #dotest-set-debug
    dotest-debug mpfr_SIZEOF_MPFR=WW(mpfr_SIZEOF_MPFR)

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug OP=WW(OP)

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_decimal64 WW(OP) '123.4567890' WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-debug WW(RESULT)
    }
    mbfl_location_leave
    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
}

fi


#### setters: decimal128

if mmux_bash_builtin_p 'mpfr_set_decimal128'
then

function mpfr-set-decimal128-1.1 () {
    declare -r EXPECTED_RESULT='0.123457e3'
    declare OP RESULT

    #dotest-set-debug
    dotest-debug mpfr_SIZEOF_MPFR=WW(mpfr_SIZEOF_MPFR)

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug OP=WW(OP)

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_decimal128 WW(OP) '123.4567890' WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-debug WW(RESULT)
    }
    mbfl_location_leave
    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
}

fi


#### setters: mpfr

function mpfr-set-1.1 () {
    declare -r EXPECTED_RESULT='0.123457e3'
    declare OP1 OP2 RESULT

    mbfl_location_enter
    {
	if mmux_libc_calloc OP1 WW(mpfr_SIZEOF_MPFR) 2
	then mbfl_location_handler "mmux_libc_free WW(OP1)"
	else mbfl_location_leave_then_return_failure
	fi

	mmux_pointer_add OP2 WW(OP1) WW(mpfr_SIZEOF_MPFR)

	if mpfr_init WW(OP1)
	then mbfl_location_handler "mpfr_clear WW(OP1)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP2)
	then mbfl_location_handler "mpfr_clear WW(OP2)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_d WW(OP1) '123.4567890' WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set WW(OP2) WW(OP1) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP2))
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}


#### setters: mpfr_set_si_2exp

### $ octave --eval 'format long ; 123 * 2^45'
# =>  4327677766926336
# 98765432109876543210
function mpfr-set-si-2exp-1.1 () {
    declare -r MANT='123' EXP='45' EXPECTED_RESULT='0.432768e16'
    declare OP RESULT

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_si_2exp WW(OP) WW(MANT) WW(EXP) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}
function mpfr-set-si-2exp-1.2 () {
    declare -r MANT='-123' EXP='45' EXPECTED_RESULT='-0.432768e16'
    declare OP RESULT

    dotest-unset-debug

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug WW(OP) WW(MANT) WW(EXP) WW(MPFR_RNDN)
	if ! mpfr_set_si_2exp WW(OP) WW(MANT) WW(EXP) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}


#### setters: mpfr_set_ui_2exp

### $ octave --eval 'format long ; 123 * 2^45'
# =>  4327677766926336
# 98765432109876543210
function mpfr-set-ui-2exp-1.1 () {
    declare -r MANT='123' EXP='45' EXPECTED_RESULT='0.432768e16'
    declare OP RESULT

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_ui_2exp WW(OP) WW(MANT) WW(EXP) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}


#### setters: mpfr_set_sj_2exp

### $ octave --eval 'format long ; 123 * 2^45'
# =>  4327677766926336
# 98765432109876543210
function mpfr-set-sj-2exp-1.1 () {
    declare -r MANT='123' EXP='45' EXPECTED_RESULT='0.432768e16'
    declare OP RESULT

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_sj_2exp WW(OP) WW(MANT) WW(EXP) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}
function mpfr-set-sj-2exp-1.2 () {
    declare -r MANT='-123' EXP='45' EXPECTED_RESULT='-0.432768e16'
    declare OP RESULT

    dotest-unset-debug

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug WW(OP) WW(MANT) WW(EXP) WW(MPFR_RNDN)
	if ! mpfr_set_sj_2exp WW(OP) WW(MANT) WW(EXP) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}


#### setters: mpfr_set_uj_2exp

### $ octave --eval 'format long ; 123 * 2^45'
# =>  4327677766926336
# 98765432109876543210
function mpfr-set-uj-2exp-1.1 () {
    declare -r MANT='123' EXP='45' EXPECTED_RESULT='0.432768e16'
    declare OP RESULT

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_uj_2exp WW(OP) WW(MANT) WW(EXP) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}


#### let's go

dotest mpfr-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
