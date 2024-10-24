#!#
#!# Part of: MMUX Bash MPFR
#!# Contents: tests for integers builtins
#!# Date: Oct 21, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/integers.test ; less tests/integers.log
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


# mpfr_rint

function integers-mpfr_rint-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_rint
    then
	declare EXPECTED_RESULT='123'
	declare RESULT
	declare	-a OPS

	dotest-unset-debug

	mbfl_location_enter
	{
	    declare -r INITVAL='123.456'

	    if mpfr_alloc_and_init_shell_array OPS 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array OPS"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP='OPS[1]'

	    if ! mpfr_set_d WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_rint WW(ROP) WW(OP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    RESULT=$(mpfr_just_printit_dammit WW(ROP))

	    dotest-debug WW(EXPECTED_RESULT) WW(RESULT)
	    mmux_double_equal WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_ceil

function integers-mpfr_ceil-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_ceil
    then
	declare EXPECTED_RESULT='124'
	declare RESULT
	declare	-a OPS

	dotest-unset-debug

	mbfl_location_enter
	{
	    declare -r INITVAL='123.456'

	    if mpfr_alloc_and_init_shell_array OPS 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array OPS"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP='OPS[1]'

	    if ! mpfr_set_d WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_ceil WW(ROP) WW(OP)
	    then mbfl_location_leave_then_return_failure
	    fi

	    RESULT=$(mpfr_just_printit_dammit WW(ROP))

	    dotest-debug WW(EXPECTED_RESULT) WW(RESULT)
	    mmux_double_equal WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_floor

function integers-mpfr_floor-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_floor
    then
	declare EXPECTED_RESULT='123'
	declare RESULT
	declare	-a OPS

	dotest-unset-debug

	mbfl_location_enter
	{
	    declare -r INITVAL='123.456'

	    if mpfr_alloc_and_init_shell_array OPS 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array OPS"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP='OPS[1]'

	    if ! mpfr_set_d WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_floor WW(ROP) WW(OP)
	    then mbfl_location_leave_then_return_failure
	    fi

	    RESULT=$(mpfr_just_printit_dammit WW(ROP))

	    dotest-debug WW(EXPECTED_RESULT) WW(RESULT)
	    mmux_double_equal WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_round

function integers-mpfr_round-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_round
    then
	declare EXPECTED_RESULT='123'
	declare RESULT
	declare	-a OPS

	dotest-unset-debug

	mbfl_location_enter
	{
	    declare -r INITVAL='123.456'

	    if mpfr_alloc_and_init_shell_array OPS 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array OPS"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP='OPS[1]'

	    if ! mpfr_set_d WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_round WW(ROP) WW(OP)
	    then mbfl_location_leave_then_return_failure
	    fi

	    RESULT=$(mpfr_just_printit_dammit WW(ROP))

	    dotest-debug WW(EXPECTED_RESULT) WW(RESULT)
	    mmux_double_equal WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_roundeven

function integers-mpfr_roundeven-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_roundeven
    then
	declare EXPECTED_RESULT='123'
	declare RESULT
	declare	-a OPS

	dotest-unset-debug

	mbfl_location_enter
	{
	    declare -r INITVAL='123.456'

	    if mpfr_alloc_and_init_shell_array OPS 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array OPS"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP='OPS[1]'

	    if ! mpfr_set_d WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_roundeven WW(ROP) WW(OP)
	    then mbfl_location_leave_then_return_failure
	    fi

	    RESULT=$(mpfr_just_printit_dammit WW(ROP))

	    dotest-debug WW(EXPECTED_RESULT) WW(RESULT)
	    mmux_double_equal WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_trunc

function integers-mpfr_trunc-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_trunc
    then
	declare EXPECTED_RESULT='123'
	declare RESULT
	declare	-a OPS

	dotest-unset-debug

	mbfl_location_enter
	{
	    declare -r INITVAL='123.456'

	    if mpfr_alloc_and_init_shell_array OPS 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array OPS"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP='OPS[1]'

	    if ! mpfr_set_d WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_trunc WW(ROP) WW(OP)
	    then mbfl_location_leave_then_return_failure
	    fi

	    RESULT=$(mpfr_just_printit_dammit WW(ROP))

	    dotest-debug WW(EXPECTED_RESULT) WW(RESULT)
	    mmux_double_equal WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_fmodquo

function integers-mpfr_fmodquo-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_fmodquo
    then
	declare EXPECTED_RESULT='3'
	declare RESULT Q
	declare	-a OPS

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array OPS 3
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array OPS"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n R='OPS[0]' X='OPS[1]' Y='OPS[2]'

	    if ! mpfr_set_d WW(X) '123' WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_d WW(Y)   '6' WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_fmodquo WW(R) Q WW(X) WW(Y) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    RESULT=$(mpfr_just_printit_dammit WW(R))

	    dotest-debug WW(EXPECTED_RESULT) WW(RESULT) WW(Q)
	    mmux_double_equal WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_integer_p

function integers-mpfr_integer_p-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_integer_p
    then
	declare -r INITVAL='123'
	declare	OP

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free RR(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP) '123' WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_integer_p WW(OP)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if (( 1 == RR(MPFR_RV) ))
	    then true
	    else false
	    fi
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}
function integers-mpfr_integer_p-1.2 () {
    if mmux_bash_pointers_builtin_p mpfr_integer_p
    then
	declare	OP

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free RR(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_nan WW(OP)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_integer_p WW(OP)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if (( 0 == RR(MPFR_RV) ))
	    then true
	    else false
	    fi
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


#### let's go

dotest integers-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
