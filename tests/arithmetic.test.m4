#!#
#!# Part of: MMUX Bash MPFR
#!# Contents: tests for arithmetic functions
#!# Date: Oct  9, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/arithmetic.test ; less tests/arithmetic.log
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

alias gmp_exists='false'


# mpfr_add

function arithmetic-mpfr_add-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_add
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL1=123 INITVAL2=456 RESULT
	declare -r EXPECTED_RESULT=$(( WW(INITVAL1) + WW(INITVAL2) ))

	dotest-unset-debug
	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 3
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP1='OPS[1]' OP2='OPS[02]'

	    #dotest-debug WW(OP) WW(INITVAL) WW(MPFR_RNDN)

	    if ! mpfr_set_si WW(OP1) '123' WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP2) '456' WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_add WW(ROP) WW(OP1) WW(OP2) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_get_si RESULT WW(ROP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(INITVAL1) WW(INITVAL2)  $(mpfr_just_printit_dammit WW(ROP))
	    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


#### let's go

dotest arithmetic-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
