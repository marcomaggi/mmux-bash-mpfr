#!#
#!# Part of: MMUX Bash MPFR
#!# Contents: tests for printing builtins and functions
#!# Date: Oct  3, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/printing.test ; less tests/printing.log
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


#### just printing

function mpfr-just-printit-dammit-1.1 () {
    declare -r EXPECTED_RESULT='0.123457e3'
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

	if ! mpfr_set_d WW(OP) '123.4567890' WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-debug WW(EXPECTED_RESULT) WW(RESULT)
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}
function mpfr-just-printit-dammit-1.2 () {
    declare -r EXPECTED_RESULT='-0.123457e3'
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

	if ! mpfr_set_d WW(OP) '-123.4567890' WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-debug WW(EXPECTED_RESULT) WW(RESULT)
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
