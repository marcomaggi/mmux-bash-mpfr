#!#
#!# Part of: MMUX Bash MPFR
#!# Contents: tests for sign builtins
#!# Date: Oct 21, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/sign.test ; less tests/sign.log
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


# mpfr_copysign

function sign-mpfr_copysign-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_copysign
    then
	declare -r EXPECTED_RESULT='-1'
	declare RESULT
	declare	-a OPS

	dotest-unset-debug

	mbfl_location_enter
	{
	    declare -r INITVAL1='1' INITVAL2='-3'

	    if mpfr_alloc_and_init_shell_array OPS 3
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array OPS"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP1='OPS[1]' OP2='OPS[2]'

	    if ! mpfr_set_si WW(OP1) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP2) WW(INITVAL2) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(ROP) WW(OP1) WW(OP2) WW(MPFR_RNDN)
	    if ! mpfr_copysign WW(ROP) WW(OP1) WW(OP2) WW(MPFR_RNDN)
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


# mpfr_signbit

function sign-mpfr_signbit-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_signbit
    then
	declare EXPECTED_EXP='0'
	declare -i MPFR_RV
	declare	OP

	dotest-unset-debug

	mbfl_location_enter
	{
	    declare -r INITVAL='123'

	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free RR(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_signbit WW(OP)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if (( 0 == MPFR_RV ))
	    then true
	    else false
	    fi
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_setsign

function sign-mpfr_setsign-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_setsign
    then
	declare EXPECTED_RESULT='-0.123000e3'
	declare RESULT
	declare	-a OPS

	dotest-unset-debug

	mbfl_location_enter
	{
	    declare -r INITVAL='123'

	    if mpfr_alloc_and_init_shell_array OPS 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array OPS"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP='OPS[1]'

	    if ! mpfr_set_si WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_setsign WW(ROP) WW(OP) -1 WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    RESULT=$(mpfr_just_printit_dammit WW(ROP))
	    dotest-debug WW(EXPECTED_RESULT) WW(RESULT)
	    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


#### let's go

dotest sign-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
