#!#
#!# Part of: MMUX Bash MPFR
#!# Contents: tests for rounding builtins
#!# Date: Oct 21, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/rounding.test ; less tests/rounding.log
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


# mpfr_prec_round

function rounding-mpfr_prec_round-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_get_default_rounding_mode
    then
	declare -r INITVAL='123.456' EXPECTED_RESULT='123.5'

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free RR(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_d WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_prec_round WW(OP) 10 WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    RESULT=$(mpfr_just_printit_dammit WW(OP))

	    dotest-debug WW(EXPECTED_RESULT) WW(RESULT)
	    mmux_double_equal WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_min_prec

function rounding-mpfr_min_prec-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_get_default_rounding_mode
    then
	declare -r INITVAL='1' EXPECTED_RESULT='1'
	declare PREC

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free RR(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_min_prec PREC WW(OP)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-equal WW(EXPECTED_RESULT) WW(PREC)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_print_rnd_mode

function rounding-mpfr_print_rnd_mode-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_get_default_rounding_mode
    then
	declare RESULT

	if ! mpfr_print_rnd_mode RESULT WW(MPFR_RNDZ)
	then mbfl_location_leave_then_return_failure
	fi
	dotest-equal 'MPFR_RNDZ' WW(RESULT)
    else dotest-skipped
    fi
}


#### let's go

dotest rounding-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
