#!#
#!# Part of: MMUX Bash MPFR
#!# Contents: tests for stepping builtins
#!# Date: Oct 22, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/stepping.test ; less tests/stepping.log
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


# mpfr_nexttoward

function stepping-mpfr_nexttoward-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_nexttoward
    then
	declare EXPECTED_RESULT='2'
	declare RESULT
	declare	-a OPS

	dotest-unset-debug

	mbfl_location_enter
	{
	    declare -r INITVAL1='1' INITVAL2='3'

	    if mpfr_alloc_and_init_shell_array OPS 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array OPS"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n OP1='OPS[0]' OP2='OPS[1]'

	    if ! mpfr_set_prec WW(OP1) 1
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP1) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP2) WW(INITVAL2) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_nexttoward WW(OP1) WW(OP2)
	    then mbfl_location_leave_then_return_failure
	    fi

	    RESULT=$(mpfr_just_printit_dammit WW(OP1))

	    dotest-debug WW(EXPECTED_RESULT) WW(RESULT)
	    mmux_double_equal WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}

function stepping-mpfr_nexttoward-1.2 () {
    if mmux_bash_pointers_builtin_p mpfr_nexttoward
    then
	declare EXPECTED_RESULT='2'
	declare -a RESULT
	declare	-a OPS

	dotest-unset-debug

	mbfl_location_enter
	{
	    declare -r INITVAL1='1' INITVAL2='2'

	    if mpfr_alloc_and_init_shell_array OPS 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array OPS"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n OP1='OPS[0]' OP2='OPS[1]'

	    if ! mpfr_set_prec WW(OP1) 3
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP2) WW(INITVAL2) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP1) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi
	    RESULT[0]=$(mpfr_just_printit_dammit WW(OP1))

	    if ! mpfr_nexttoward WW(OP1) WW(OP2)
	    then mbfl_location_leave_then_return_failure
	    fi
	    RESULT[1]=$(mpfr_just_printit_dammit WW(OP1))

	    if ! mpfr_nexttoward WW(OP1) WW(OP2)
	    then mbfl_location_leave_then_return_failure
	    fi
	    RESULT[2]=$(mpfr_just_printit_dammit WW(OP1))

	    if ! mpfr_nexttoward WW(OP1) WW(OP2)
	    then mbfl_location_leave_then_return_failure
	    fi
	    RESULT[3]=$(mpfr_just_printit_dammit WW(OP1))

	    if ! mpfr_nexttoward WW(OP1) WW(OP2)
	    then mbfl_location_leave_then_return_failure
	    fi
	    RESULT[4]=$(mpfr_just_printit_dammit WW(OP1))

	    mbfl_array_dump RESULT

	    dotest-debug WW(EXPECTED_RESULT) WW(RESULT)
	    mmux_double_equal WW(EXPECTED_RESULT) WW(RESULT,4)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_nextabove

function stepping-mpfr_nextabove-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_nextabove
    then
	declare EXPECTED_RESULT='2'
	declare RESULT
	declare	OP

	dotest-unset-debug

	mbfl_location_enter
	{
	    declare -r INITVAL='1'

	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_prec WW(OP) 1
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi
	    if ! mpfr_nextabove WW(OP)
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


# mpfr_nextbelow

function stepping-mpfr_nextbelow-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_nextbelow
    then
	declare EXPECTED_RESULT='0.5'
	declare RESULT
	declare	OP

	dotest-unset-debug

	mbfl_location_enter
	{
	    declare -r INITVAL='1'

	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_prec WW(OP) 1
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi
	    if ! mpfr_nextbelow WW(OP)
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


#### let's go

dotest stepping-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
