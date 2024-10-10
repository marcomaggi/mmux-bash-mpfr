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
#!# This program is free  software: you can redistribute it and/or modify it  under the terms of the
#!# GNU General Public License as published by the Free Software Foundation, either version 3 of the
#!# License, or (at your option) any later version.
#!#
#!# This program  is distributed  in the  hope that  it will  be useful,  but WITHOUT  ANY WARRANTY;
#!# without even the implied  warranty of MERCHANTABILITY or FITNESS FOR  A PARTICULAR PURPOSE.  See
#!# the GNU General Public License for more details.
#!#
#!# You should have received  a copy of the GNU General Public License  along with this program.  If
#!# not, see <http://www.gnu.org/licenses/>.
#!#


#### macros

MBFL_DEFINE_QQ_MACRO
MBFL_DEFINE_UNDERSCORE_MACRO_FOR_SLOTS


#### setup

mbfl_embed_library(__LIBMBFL_LINKER__)
mbfl_linker_source_library_by_stem(core)
mbfl_linker_source_library_by_stem(tests)

source WW(MMUX_LIBRARY)


#### setters: slong

function mpfr-set-slong-1.1 () {
    declare -r EXPECTED_RESULT='0.123000e3'
    declare OP RESULT

    dotest-unset-debug
    dotest-debug mpfr_SIZEOF=WW(mpfr_SIZEOF)

    mbfl_location_enter
    {
	if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF)
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
    dotest-debug mpfr_SIZEOF=WW(mpfr_SIZEOF)

    mbfl_location_enter
    {
	if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF)
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
    dotest-debug mpfr_SIZEOF=WW(mpfr_SIZEOF)

    mbfl_location_enter
    {
	if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF)
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
    dotest-debug mpfr_SIZEOF=WW(mpfr_SIZEOF)

    mbfl_location_enter
    {
	if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF)
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
    dotest-debug mpfr_SIZEOF=WW(mpfr_SIZEOF)

    mbfl_location_enter
    {
	if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF)
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
    dotest-debug mpfr_SIZEOF=WW(mpfr_SIZEOF)

    mbfl_location_enter
    {
	if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF)
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
    dotest-debug mpfr_SIZEOF=WW(mpfr_SIZEOF)

    mbfl_location_enter
    {
	if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF)
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
    dotest-debug mpfr_SIZEOF=WW(mpfr_SIZEOF)

    mbfl_location_enter
    {
	if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF)
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

function mpfr-set-ldouble-1.1 () {
    if mmux_bash_pointers_builtin_p 'mpfr_set_ld'
    then
	declare -r INITVAL='123' EXPECTED_RESULT='0.123000e3'
	declare OP RESULT

	dotest-set-debug
	dotest-debug mpfr_SIZEOF=WW(mpfr_SIZEOF)

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free RR(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug OP=WW(OP)

	    if ! mpfr_set_ld WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    RESULT=$(mpfr_just_printit_dammit WW(OP))
	    dotest-debug WW(RESULT)
	}
	mbfl_location_leave
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    else dotest-skipped
    fi
}


#### setters: float128

function mpfr-set-float128-1.1 () {
    if mmux_bash_pointers_builtin_p 'mpfr_set_float128'
    then

	declare -r EXPECTED_RESULT='0.123457e3'
	declare OP RESULT

	#dotest-set-debug
	dotest-debug mpfr_SIZEOF=WW(mpfr_SIZEOF)

	mbfl_location_enter
	{
	    if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF)
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
    else dotest-skipped
    fi
}


#### setters: decimal64

function mpfr-set-decimal64-1.1 () {
    if mmux_bash_pointers_builtin_p 'mpfr_set_decimal64'
    then

	declare -r EXPECTED_RESULT='0.123457e3'
	declare OP RESULT

	#dotest-set-debug
	dotest-debug mpfr_SIZEOF=WW(mpfr_SIZEOF)

	mbfl_location_enter
	{
	    if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF)
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
    else dotest-skipped
    fi
}


#### setters: decimal128

function mpfr-set-decimal128-1.1 () {
    if mmux_bash_pointers_builtin_p 'mpfr_set_decimal128'
    then

	declare -r EXPECTED_RESULT='0.123457e3'
	declare OP RESULT

	#dotest-set-debug
	dotest-debug mpfr_SIZEOF=WW(mpfr_SIZEOF)

	mbfl_location_enter
	{
	    if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF)
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
    else dotest-skipped
    fi
}


#### setters: mpfr

function mpfr-set-1.1 () {
    declare -r EXPECTED_RESULT='0.123457e3'
    declare OP1 OP2 RESULT

    mbfl_location_enter
    {
	if mmux_libc_calloc OP1 2 WW(mpfr_SIZEOF)
	then mbfl_location_handler "mmux_libc_free WW(OP1)"
	else mbfl_location_leave_then_return_failure
	fi

	mmux_pointer_add OP2 WW(OP1) WW(mpfr_SIZEOF)

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
	if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF)
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
	if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF)
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
	if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF)
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
	if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF)
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
	if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF)
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
	if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF)
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


#### setters: mpfr_set_str

function mpfr-set-str-1.1 () {
    declare -r STR='1234567890' BASE='10' EXPECTED_RESULT='0.123457e10'
    declare OP RESULT

    dotest-unset-debug

    mbfl_location_enter
    {
	if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF)
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug WW(OP) WW(STR) WW(BASE) WW(MPFR_RNDN)

	if ! mpfr_set_str WW(OP) WW(STR) WW(BASE) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-debug WW(EXPECTED_RESULT) WW(RESULT)
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}
function mpfr-set-str-1.2 () {
    declare -r STR='-1234567890' BASE='10' EXPECTED_RESULT='-0.123457e10'
    declare OP RESULT

    dotest-unset-debug

    mbfl_location_enter
    {
	if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF)
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug WW(OP) WW(STR) WW(BASE) WW(MPFR_RNDN)

	if ! mpfr_set_str WW(OP) WW(STR) WW(BASE) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-debug WW(EXPECTED_RESULT) WW(RESULT)
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}

function mpfr-set-str-1.3 () {
    declare -r STR='1234567890' BASE='10' EXPECTED_RESULT='0.123457e10'
    declare OP RESULT

    dotest-unset-debug

    mbfl_location_enter
    {
	if mpfr_alloc_and_init OP
	then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_str WW(OP) WW(STR) WW(BASE) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-debug WW(EXPECTED_RESULT) WW(RESULT)
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}


#### setters: mpfr_set_nan

function mpfr-set-nan-1.1 () {
    declare -r EXPECTED_RESULT='@NaN@'
    declare OP RESULT

    mbfl_location_enter
    {
	if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF)
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_nan WW(OP)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}


#### setters: mpfr_set_inf

function mpfr-set-inf-1.1 () {
    declare -r EXPECTED_RESULT='+@Inf@'
    declare OP RESULT

    mbfl_location_enter
    {
	if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF)
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_inf WW(OP) 1
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}
function mpfr-set-inf-1.2 () {
    declare -r EXPECTED_RESULT='-@Inf@'
    declare OP RESULT

    mbfl_location_enter
    {
	if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF)
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_inf WW(OP) -1
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}
function mpfr-set-inf-1.3 () {
    declare -r EXPECTED_RESULT='+@Inf@'
    declare OP RESULT

    mbfl_location_enter
    {
	if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF)
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_inf WW(OP) 0
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}


#### setters: mpfr_set_zero

function mpfr-set-zero-1.1 () {
    declare -r EXPECTED_RESULT='0.000000e0'
    declare OP RESULT

    mbfl_location_enter
    {
	if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF)
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_zero WW(OP) 1
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}
function mpfr-set-zero-1.2 () {
    declare -r EXPECTED_RESULT='-0.000000e0'
    declare OP RESULT

    mbfl_location_enter
    {
	if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF)
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_zero WW(OP) -1
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}
function mpfr-set-zero-1.3 () {
    declare -r EXPECTED_RESULT='0.000000e0'
    declare OP RESULT

    mbfl_location_enter
    {
	if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF)
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_zero WW(OP) 0
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}


#### setters: mpfr_swap

function mpfr-swap-1.1 () {
    declare -r EXPECTED_RESULT1='0.456000e3' EXPECTED_RESULT2='0.123000e3'
    declare OP1 OP2 RESULT1 RESULT2

    mbfl_location_enter
    {
	if mmux_libc_calloc OP1 2 WW(mpfr_SIZEOF)
	then mbfl_location_handler "mmux_libc_free WW(OP1)"
	else mbfl_location_leave_then_return_failure
	fi

	mmux_pointer_add OP2 WW(OP1) WW(mpfr_SIZEOF)

	if mpfr_init WW(OP1)
	then mbfl_location_handler "mpfr_clear WW(OP1)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP2)
	then mbfl_location_handler "mpfr_clear WW(OP2)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_si WW(OP1) '123' WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_si WW(OP2) '456' WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_swap WW(OP1) WW(OP2)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT1=$(mpfr_just_printit_dammit WW(OP1))
	RESULT2=$(mpfr_just_printit_dammit WW(OP2))

	dotest-equal     WW(EXPECTED_RESULT1) WW(RESULT1) &&
	    dotest-equal WW(EXPECTED_RESULT2) WW(RESULT2)
    }
    mbfl_location_leave
}


#### mpfr_init_set_si

function mpfr-init-set-si-1.1 () {
    declare -r EXPECTED_RESULT='0.123000e3'
    declare OP RESULT

    mbfl_location_enter
    {
	if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF)
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init_set_si WW(OP) '123' WW(MPFR_RNDN)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))

	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}


#### mpfr_init_set_ui

function mpfr-init-set-ui-1.1 () {
    declare -r EXPECTED_RESULT='0.123000e3'
    declare OP RESULT

    mbfl_location_enter
    {
	if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF)
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init_set_ui WW(OP) '123' WW(MPFR_RNDN)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))

	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}


#### mpfr_init_set_d

function mpfr-init-set-d-1.1 () {
    declare -r EXPECTED_RESULT='0.123457e3'
    declare OP RESULT

    mbfl_location_enter
    {
	if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF)
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init_set_d WW(OP) '123.4567890' WW(MPFR_RNDN)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))

	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}


#### mpfr_init_set_ld

function mpfr-init-set-ld-1.1 () {
    if mmux_bash_pointers_builtin_p 'mpfr_init_set_ld'
    then

	declare -r EXPECTED_RESULT='0.123457e3'
	declare OP RESULT

	mbfl_location_enter
	{
	    if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF)
	    then mbfl_location_handler "mmux_libc_free WW(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if mpfr_init_set_ld WW(OP) '123.4567890' WW(MPFR_RNDN)
	    then mbfl_location_handler "mpfr_clear WW(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    RESULT=$(mpfr_just_printit_dammit WW(OP))

	    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


#### mpfr_init_set_z

function mpfr-init-set-z-1.1 () {
    if false
    then
	declare -r EXPECTED_RESULT='0.123457e3'
	declare OP RESULT

	mbfl_location_enter
	{
	    if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF)
	    then mbfl_location_handler "mmux_libc_free WW(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if mpfr_init_set_z WW(OP) '123.4567890' WW(MPFR_RNDN)
	    then mbfl_location_handler "mpfr_clear WW(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    RESULT=$(mpfr_just_printit_dammit WW(OP))

	    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


#### mpfr_init_set_q

function mpfr-init-set-q-1.1 () {
    if false
    then

	declare -r EXPECTED_RESULT='0.123457e3'
	declare OP RESULT

	mbfl_location_enter
	{
	    if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF)
	    then mbfl_location_handler "mmux_libc_free WW(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if mpfr_init_set_q WW(OP) '123.4567890' WW(MPFR_RNDN)
	    then mbfl_location_handler "mpfr_clear WW(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    RESULT=$(mpfr_just_printit_dammit WW(OP))

	    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


#### mpfr_init_set_f

function mpfr-init-set-f-1.1 () {
    if false
    then

	declare -r EXPECTED_RESULT='0.123457e3'
	declare OP RESULT

	mbfl_location_enter
	{
	    if mmux_libc_calloc OP 1 WW(mpfr_SIZEOF)
	    then mbfl_location_handler "mmux_libc_free WW(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if mpfr_init_set_f WW(OP) '123.4567890' WW(MPFR_RNDN)
	    then mbfl_location_handler "mpfr_clear WW(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    RESULT=$(mpfr_just_printit_dammit WW(OP))

	    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


#### mpfr_init_set

function mpfr-init-set-1.1 () {
    declare -r EXPECTED_RESULT='0.123457e3'
    declare OP1 OP2 RESULT

    mbfl_location_enter
    {
	if mmux_libc_calloc OP1 1 WW(mpfr_SIZEOF)
	then mbfl_location_handler "mmux_libc_free WW(OP1)"
	else mbfl_location_leave_then_return_failure
	fi

	if mmux_libc_calloc OP2 1 WW(mpfr_SIZEOF)
	then mbfl_location_handler "mmux_libc_free WW(OP2)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init_set_d WW(OP1) '123.4567890' WW(MPFR_RNDN)
	then mbfl_location_handler "mpfr_clear WW(OP1)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init_set WW(OP2) WW(OP1) WW(MPFR_RNDN)
	then mbfl_location_handler "mpfr_clear WW(OP2)"
	else mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP2))

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
