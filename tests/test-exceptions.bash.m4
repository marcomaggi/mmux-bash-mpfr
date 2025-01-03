#!#
#!# Part of: MMUX Bash MPFR
#!# Contents: tests for exceptions builtins
#!# Date: Oct 24, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/exceptions.test ; less tests/exceptions.log
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


# mpfr_set_underflow, mpfr_clear_underflow, mpfr_underflow_p

function exceptions-mpfr_set_underflow-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_set_underflow
    then
	mbfl_location_enter
	{
	    if mpfr_set_underflow
	    then mbfl_location_handler 'mpfr_clear_underflow'
	    else mbfl_location_leave_then_return_failure
	    fi

	    dotest-predicate mpfr_underflow_p
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_set_overflow, mpfr_clear_overflow, mpfr_overflow_p

function exceptions-mpfr_set_overflow-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_set_overflow
    then
	mbfl_location_enter
	{
	    if mpfr_set_overflow
	    then mbfl_location_handler 'mpfr_clear_overflow'
	    else mbfl_location_leave_then_return_failure
	    fi

	    dotest-predicate mpfr_overflow_p
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_set_divby0, mpfr_clear_divby0, mpfr_divby0_p

function exceptions-mpfr_set_divby0-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_set_divby0
    then
	mbfl_location_enter
	{
	    if mpfr_set_divby0
	    then mbfl_location_handler 'mpfr_clear_divby0'
	    else mbfl_location_leave_then_return_failure
	    fi

	    dotest-predicate mpfr_divby0_p
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_set_nanflag, mpfr_clear_nanflag, mpfr_nanflag_p

function exceptions-mpfr_set_nanflag-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_set_nanflag
    then
	mbfl_location_enter
	{
	    if mpfr_set_nanflag
	    then mbfl_location_handler 'mpfr_clear_nanflag'
	    else mbfl_location_leave_then_return_failure
	    fi

	    dotest-predicate mpfr_nanflag_p
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_set_inexflag, mpfr_clear_inexflag, mpfr_inexflag_p

function exceptions-mpfr_set_inexflag-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_set_inexflag
    then
	mbfl_location_enter
	{
	    if mpfr_set_inexflag
	    then mbfl_location_handler 'mpfr_clear_inexflag'
	    else mbfl_location_leave_then_return_failure
	    fi

	    dotest-predicate mpfr_inexflag_p
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_set_erangeflag, mpfr_clear_erangeflag, mpfr_erangeflag_p

function exceptions-mpfr_set_erangeflag-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_set_erangeflag
    then
	mbfl_location_enter
	{
	    if mpfr_set_erangeflag
	    then mbfl_location_handler 'mpfr_clear_erangeflag'
	    else mbfl_location_leave_then_return_failure
	    fi

	    dotest-predicate mpfr_erangeflag_p
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_flags_set, mpfr_flags_test

function exceptions-mpfr_flags_set-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_flags_clear
    then
	dotest-unset-debug

	mbfl_location_enter
	{
	    declare -r SET_MASK=$(( MPFR_FLAGS_NAN | MPFR_FLAGS_ERANGE ))
	    declare -r GET_MASK=WW(MPFR_FLAGS_NAN)
	    declare -r EXPECTED_FLAGS=WW(MPFR_FLAGS_NAN)
	    declare FLAGS

	    if ! mpfr_clear_flags
	    then mbfl_location_leave_then_return_failure
	    fi

	    if mpfr_flags_set WW(SET_MASK)
	    then mbfl_location_handler 'mpfr_clear_flags'
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_flags_test FLAGS WW(GET_MASK)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(EXPECTED_FLAGS) WW(FLAGS)
	    dotest-equal WW(EXPECTED_FLAGS) WW(FLAGS)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_flags_clear

function exceptions-mpfr_flags_clear-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_flags_clear
    then
	dotest-unset-debug

	mbfl_location_enter
	{
	    declare -r SET_MASK=$(( MPFR_FLAGS_NAN | MPFR_FLAGS_ERANGE ))
	    declare -r GET_MASK=WW(SET_MASK)
	    declare -r CLEAR_MASK=WW(SET_MASK)
	    declare -r EXPECTED_FLAGS=0
	    declare FLAGS

	    if mpfr_flags_set WW(SET_MASK)
	    then mbfl_location_handler 'mpfr_clear_flags'
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_flags_clear WW(CLEAR_MASK)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_flags_test FLAGS WW(GET_MASK)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(EXPECTED_FLAGS) WW(FLAGS)
	    dotest-equal WW(EXPECTED_FLAGS) WW(FLAGS)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}
function exceptions-mpfr_flags_clear-1.2 () {
    if mmux_bash_pointers_builtin_p mpfr_flags_clear
    then
	dotest-unset-debug

	mbfl_location_enter
	{
	    declare -r SET_MASK=$(( MPFR_FLAGS_NAN | MPFR_FLAGS_ERANGE ))
	    declare -r GET_MASK=WW(SET_MASK)
	    declare -r CLEAR_MASK=WW(MPFR_FLAGS_NAN)
	    declare -r EXPECTED_FLAGS=WW(MPFR_FLAGS_ERANGE)
	    declare FLAGS

	    if mpfr_flags_set WW(SET_MASK)
	    then mbfl_location_handler 'mpfr_clear_flags'
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_flags_clear WW(CLEAR_MASK)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_flags_test FLAGS WW(GET_MASK)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(EXPECTED_FLAGS) WW(FLAGS)
	    dotest-equal WW(EXPECTED_FLAGS) WW(FLAGS)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_flags_save, mpfr_flags_restore

function exceptions-mpfr_flags_save-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_flags_save
    then
	dotest-unset-debug

	mbfl_location_enter
	{
	    declare -r SET_MASK=$(( MPFR_FLAGS_NAN | MPFR_FLAGS_ERANGE ))
	    declare -r RESTORE_MASK=WW(MPFR_FLAGS_ERANGE)
	    declare -r GET_MASK=$(( MPFR_FLAGS_NAN | MPFR_FLAGS_ERANGE ))
	    declare -r EXPECTED_FLAGS=WW(MPFR_FLAGS_ERANGE)
	    declare FLAGS SAVED_FLAGS

	    if mpfr_flags_set WW(SET_MASK)
	    then mbfl_location_handler 'mpfr_clear_flags'
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_flags_save SAVED_FLAGS
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_clear_flags
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_flags_restore WW(SAVED_FLAGS) WW(RESTORE_MASK)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_flags_test FLAGS WW(GET_MASK)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(EXPECTED_FLAGS) WW(FLAGS)
	    dotest-equal WW(EXPECTED_FLAGS) WW(FLAGS)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


#### let's go

dotest exceptions-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
