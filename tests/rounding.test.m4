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

MBFL_DEFINE_QQ_MACRO
MBFL_DEFINE_UNDERSCORE_MACRO_FOR_SLOTS


#### setup

mbfl_embed_library(__LIBMBFL_LINKER__)
mbfl_linker_source_library_by_stem(core)
mbfl_linker_source_library_by_stem(tests)
mbfl_linker_source_library_by_stem(mmux-bash-packages)
mbfl_linker_source_library_by_stem(mmux-bash-pointers)
mbfl_linker_source_library_by_stem(mmux-bash-mpfr)

alias gmp_exists='false'


# mpfr_get_default_rounding_mode
# mpfr_set_default_rounding_mode

function rounding-mpfr_get_default_rounding_mode-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_get_default_rounding_mode
    then
	declare -r EXPECTED_RESULT=RR(MPFR_RNDN)
	declare RND

	dotest-unset-debug

	mbfl_location_enter
	{
	    if ! mpfr_get_default_rounding_mode RND
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(EXPECTED_RESULT) WW(RND)
	    dotest-equal WW(EXPECTED_RESULT) WW(RND)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}

function rounding-mpfr_get_default_rounding_mode-1.2 () {
    if mmux_bash_pointers_builtin_p mpfr_get_default_rounding_mode
    then
	declare -r EXPECTED_RESULT=RR(MPFR_RNDZ)
	declare RND

	dotest-unset-debug

	mbfl_location_enter
	{
	    if ! mpfr_set_default_rounding_mode WW(MPFR_RNDZ)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_get_default_rounding_mode RND
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(EXPECTED_RESULT) WW(RND)
	    dotest-equal WW(EXPECTED_RESULT) WW(RND)
	}
	mbfl_location_leave
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
