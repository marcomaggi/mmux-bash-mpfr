#!#
#!# Part of: MMUX Bash MPFR
#!# Contents: tests for exponent builtins
#!# Date: Oct 21, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/exponent.test ; less tests/exponent.log
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

MBFL_DEFINE_SPECIAL_MACROS
MBFL_DEFINE_UNDERSCORE_MACRO


#### setup

mbfl_embed_library(__LIBMBFL_LINKER__)
mbfl_linker_source_library_by_stem(core)
mbfl_linker_source_library_by_stem(tests)
mbfl_linker_source_library_by_stem(mmux-bash-packages)
mbfl_linker_source_library_by_stem(mmux-bash-pointers)
mbfl_linker_source_library_by_stem(mmux-bash-mpfr)

alias gmp_exists='false'


# mpfr_set_exp

function exponent-mpfr_set_exp-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_set_exp
    then
	declare -r EXPECTED_RESULT='2'
	declare RESULT
	declare	OP

	dotest-unset-debug

	mbfl_location_enter
	{
	    declare -r INITVAL='1'

	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free RR(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_exp WW(OP) 2
	    then mbfl_location_leave_then_return_failure
	    fi

	    RESULT=$(mpfr_just_printit_dammit WW(OP))

	    dotest-debug WW(EXPECTED_RESULT) WW(RESULT)
	    dotest-equal-according-to mmux_double_equal WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_get_exp

function exponent-mpfr_get_exp-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_get_exp
    then
	declare EXPECTED_EXP='1'
	declare EXP
	declare	OP

	dotest-unset-debug

	mbfl_location_enter
	{
	    declare -r INITVAL='1'

	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free RR(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_get_exp EXP WW(OP)
	    then mbfl_location_leave_then_return_failure
	    fi

	    RESULT=$(mpfr_just_printit_dammit WW(OP))

	    dotest-debug WW(EXPECTED_EXP) WW(EXP)
	    dotest-equal WW(EXPECTED_EXP) WW(EXP)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_get_emin

function exponent-mpfr_get_emin-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_get_emin
    then
	declare -r EXPECTED_EXP=10
	declare EXP

	if ! mpfr_get_emin EXP
	then return_failure
	fi
	mmux_string_is_sint WW(EXP)
    else dotest-skipped
    fi
}


# mpfr_get_emax

function exponent-mpfr_get_emax-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_get_emax
    then
	declare -r EXPECTED_EXP=10
	declare EXP

	if ! mpfr_get_emax EXP
	then return_failure
	fi
	mmux_string_is_sint WW(EXP)
    else dotest-skipped
    fi
}


# mpfr_get_emin_min

function exponent-mpfr_get_emin_min-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_get_emin_min
    then
	declare -r EXPECTED_EXP=10
	declare EXP

	if ! mpfr_get_emin_min EXP
	then return_failure
	fi
	mmux_string_is_sint WW(EXP)
    else dotest-skipped
    fi
}


# mpfr_get_emin_max

function exponent-mpfr_get_emin_max-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_get_emin_max
    then
	declare -r EXPECTED_EXP=10
	declare EXP

	if ! mpfr_get_emin_max EXP
	then return_failure
	fi
	mmux_string_is_sint WW(EXP)
    else dotest-skipped
    fi
}


# mpfr_get_emax_min

function exponent-mpfr_get_emax_min-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_get_emax_min
    then
	declare -r EXPECTED_EXP=10
	declare EXP

	if ! mpfr_get_emax_min EXP
	then return_failure
	fi
	mmux_string_is_sint WW(EXP)
    else dotest-skipped
    fi
}


# mpfr_get_emax_max

function exponent-mpfr_get_emax_max-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_get_emax_max
    then
	declare -r EXPECTED_EXP=10
	declare EXP

	if ! mpfr_get_emax_max EXP
	then return_failure
	fi
	mmux_string_is_sint WW(EXP)
    else dotest-skipped
    fi
}


#### let's go

dotest exponent-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
