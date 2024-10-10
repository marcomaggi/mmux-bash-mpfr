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

	    declare -n ROP='OPS[0]' OP1='OPS[1]' OP2='OPS[2]'

	    if ! mpfr_set_si WW(OP1) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP2) WW(INITVAL2) WW(MPFR_RNDN)
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


# mpfr_add_si

function arithmetic-mpfr_add_si-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_add_si
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL1=123 INITVAL2=456 RESULT
	declare -r EXPECTED_RESULT=$(( WW(INITVAL1) + WW(INITVAL2) ))

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP1='OPS[1]'
	    declare OP2=WW(INITVAL2)

	    if ! mpfr_set_si WW(OP1) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_add_si WW(ROP) WW(OP1) WW(OP2) WW(MPFR_RNDN)
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


# mpfr_add_ui

function arithmetic-mpfr_add_ui-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_add_ui
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL1=123 INITVAL2=456 RESULT
	declare -r EXPECTED_RESULT=$(( WW(INITVAL1) + WW(INITVAL2) ))

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP1='OPS[1]'
	    declare OP2=WW(INITVAL2)

	    if ! mpfr_set_si WW(OP1) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_add_ui WW(ROP) WW(OP1) WW(OP2) WW(MPFR_RNDN)
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


# mpfr_add_d

function arithmetic-mpfr_add_d-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_add_d
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL1=123 INITVAL2=456 RESULT
	declare -r EXPECTED_RESULT=$(( WW(INITVAL1) + WW(INITVAL2) ))

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP1='OPS[1]'
	    declare OP2=WW(INITVAL2)

	    if ! mpfr_set_si WW(OP1) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_add_d WW(ROP) WW(OP1) WW(OP2) WW(MPFR_RNDN)
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


# mpfr_sub

function arithmetic-mpfr_sub-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_sub
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL1=99 INITVAL2=33 RESULT
	declare -r EXPECTED_RESULT=$(( WW(INITVAL1) - WW(INITVAL2) ))

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 3
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP1='OPS[1]' OP2='OPS[2]'

	    if ! mpfr_set_si WW(OP1) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP2) WW(INITVAL2) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_sub WW(ROP) WW(OP1) WW(OP2) WW(MPFR_RNDN)
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


# mpfr_sub_si

function arithmetic-mpfr_sub_si-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_sub_si
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL1=99 INITVAL2=33 RESULT
	declare -r EXPECTED_RESULT=$(( WW(INITVAL1) - WW(INITVAL2) ))

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP1='OPS[1]'
	    declare OP2=WW(INITVAL2)

	    if ! mpfr_set_si WW(OP1) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_sub_si WW(ROP) WW(OP1) WW(OP2) WW(MPFR_RNDN)
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


# mpfr_sub_ui

function arithmetic-mpfr_sub_ui-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_sub_ui
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL1=99 INITVAL2=33 RESULT
	declare -r EXPECTED_RESULT=$(( WW(INITVAL1) - WW(INITVAL2) ))

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP1='OPS[1]'
	    declare OP2=WW(INITVAL2)

	    if ! mpfr_set_si WW(OP1) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_sub_ui WW(ROP) WW(OP1) WW(OP2) WW(MPFR_RNDN)
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


# mpfr_sub_d

function arithmetic-mpfr_sub_d-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_sub_d
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL1=99 INITVAL2=33 RESULT
	declare -r EXPECTED_RESULT=$(( WW(INITVAL1) - WW(INITVAL2) ))

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP1='OPS[1]'
	    declare OP2=WW(INITVAL2)

	    if ! mpfr_set_si WW(OP1) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_sub_d WW(ROP) WW(OP1) WW(OP2) WW(MPFR_RNDN)
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


# mpfr_si_sub

function arithmetic-mpfr_si_sub-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_si_sub
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL1=99 INITVAL2=33 RESULT
	declare -r EXPECTED_RESULT=$(( WW(INITVAL1) - WW(INITVAL2) ))

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP2='OPS[1]'
	    declare OP1=WW(INITVAL1)

	    if ! mpfr_set_si WW(OP2) WW(INITVAL2) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_si_sub WW(ROP) WW(OP1) WW(OP2) WW(MPFR_RNDN)
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


# mpfr_ui_sub

function arithmetic-mpfr_ui_sub-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_ui_sub
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL1=99 INITVAL2=33 RESULT
	declare -r EXPECTED_RESULT=$(( WW(INITVAL1) - WW(INITVAL2) ))

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP2='OPS[1]'
	    declare OP1=WW(INITVAL1)

	    if ! mpfr_set_si WW(OP2) WW(INITVAL2) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_ui_sub WW(ROP) WW(OP1) WW(OP2) WW(MPFR_RNDN)
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


# mpfr_d_sub

function arithmetic-mpfr_d_sub-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_d_sub
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL1=99 INITVAL2=33 RESULT
	declare -r EXPECTED_RESULT=$(( WW(INITVAL1) - WW(INITVAL2) ))

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP2='OPS[1]'
	    declare OP1=WW(INITVAL1)

	    if ! mpfr_set_si WW(OP2) WW(INITVAL2) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_d_sub WW(ROP) WW(OP1) WW(OP2) WW(MPFR_RNDN)
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


# mpfr_mul

function arithmetic-mpfr_mul-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_mul
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL1=123 INITVAL2=456 RESULT
	declare -r EXPECTED_RESULT=$(( WW(INITVAL1) * WW(INITVAL2) ))

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 3
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP1='OPS[1]' OP2='OPS[2]'

	    if ! mpfr_set_si WW(OP1) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP2) WW(INITVAL2) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_mul WW(ROP) WW(OP1) WW(OP2) WW(MPFR_RNDN)
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


# mpfr_mul_si

function arithmetic-mpfr_mul_si-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_mul_si
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL1=123 INITVAL2=456 RESULT
	declare -r EXPECTED_RESULT=$(( WW(INITVAL1) * WW(INITVAL2) ))

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP1='OPS[1]'
	    declare OP2=WW(INITVAL2)

	    if ! mpfr_set_si WW(OP1) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_mul_si WW(ROP) WW(OP1) WW(OP2) WW(MPFR_RNDN)
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


# mpfr_mul_ui

function arithmetic-mpfr_mul_ui-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_mul_ui
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL1=123 INITVAL2=456 RESULT
	declare -r EXPECTED_RESULT=$(( WW(INITVAL1) * WW(INITVAL2) ))

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP1='OPS[1]'
	    declare OP2=WW(INITVAL2)

	    if ! mpfr_set_si WW(OP1) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_mul_ui WW(ROP) WW(OP1) WW(OP2) WW(MPFR_RNDN)
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


# mpfr_mul_2si

function arithmetic-mpfr_mul_2si-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_mul_2si
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL1=5 INITVAL2=3 RESULT
	declare -r EXPECTED_RESULT=$(( 5 * 2 * 2 * 2 ))

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP1='OPS[1]'
	    declare OP2=WW(INITVAL2)

	    if ! mpfr_set_si WW(OP1) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_mul_2si WW(ROP) WW(OP1) WW(OP2) WW(MPFR_RNDN)
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


# mpfr_mul_2ui

function arithmetic-mpfr_mul_2ui-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_mul_2ui
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL1=5 INITVAL2=3 RESULT
	declare -r EXPECTED_RESULT=$(( 5 * 2 * 2 * 2 ))

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP1='OPS[1]'
	    declare OP2=WW(INITVAL2)

	    if ! mpfr_set_si WW(OP1) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_mul_2ui WW(ROP) WW(OP1) WW(OP2) WW(MPFR_RNDN)
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


# mpfr_mul_d

function arithmetic-mpfr_mul_d-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_mul_d
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL1=123 INITVAL2=456 RESULT
	declare -r EXPECTED_RESULT=$(( WW(INITVAL1) * WW(INITVAL2) ))

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP1='OPS[1]'
	    declare OP2=WW(INITVAL2)

	    if ! mpfr_set_si WW(OP1) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_mul_d WW(ROP) WW(OP1) WW(OP2) WW(MPFR_RNDN)
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


# mpfr_div

function arithmetic-mpfr_div-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_div
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL1=99 INITVAL2=33 RESULT
	declare -r EXPECTED_RESULT=$(( WW(INITVAL1) / WW(INITVAL2) ))

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 3
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP1='OPS[1]' OP2='OPS[2]'

	    if ! mpfr_set_si WW(OP1) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP2) WW(INITVAL2) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_div WW(ROP) WW(OP1) WW(OP2) WW(MPFR_RNDN)
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


# mpfr_div_si

function arithmetic-mpfr_div_si-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_div_si
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL1=99 INITVAL2=33 RESULT
	declare -r EXPECTED_RESULT=$(( WW(INITVAL1) / WW(INITVAL2) ))

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP1='OPS[1]'
	    declare OP2=WW(INITVAL2)

	    if ! mpfr_set_si WW(OP1) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_div_si WW(ROP) WW(OP1) WW(OP2) WW(MPFR_RNDN)
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


# mpfr_div_ui

function arithmetic-mpfr_div_ui-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_div_ui
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL1=99 INITVAL2=33 RESULT
	declare -r EXPECTED_RESULT=$(( WW(INITVAL1) / WW(INITVAL2) ))

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP1='OPS[1]'
	    declare OP2=WW(INITVAL2)

	    if ! mpfr_set_si WW(OP1) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_div_ui WW(ROP) WW(OP1) WW(OP2) WW(MPFR_RNDN)
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


# mpfr_div_2si

function arithmetic-mpfr_div_2si-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_div_2si
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL1=40 INITVAL2=3 RESULT
	declare -r EXPECTED_RESULT=$(( 40 / (2 * 2 * 2) ))

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP1='OPS[1]'
	    declare OP2=WW(INITVAL2)

	    if ! mpfr_set_si WW(OP1) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_div_2si WW(ROP) WW(OP1) WW(OP2) WW(MPFR_RNDN)
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


# mpfr_div_2ui

function arithmetic-mpfr_div_2ui-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_div_2ui
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL1=40 INITVAL2=3 RESULT
	declare -r EXPECTED_RESULT=$(( 40 / (2 * 2 * 2) ))

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP1='OPS[1]'
	    declare OP2=WW(INITVAL2)

	    if ! mpfr_set_si WW(OP1) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_div_2ui WW(ROP) WW(OP1) WW(OP2) WW(MPFR_RNDN)
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


# mpfr_div_d

function arithmetic-mpfr_div_d-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_div_d
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL1=99 INITVAL2=33 RESULT
	declare -r EXPECTED_RESULT=$(( WW(INITVAL1) / WW(INITVAL2) ))

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP1='OPS[1]'
	    declare OP2=WW(INITVAL2)

	    if ! mpfr_set_si WW(OP1) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_div_d WW(ROP) WW(OP1) WW(OP2) WW(MPFR_RNDN)
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


# mpfr_si_div

function arithmetic-mpfr_si_div-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_si_div
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL1=99 INITVAL2=33 RESULT
	declare -r EXPECTED_RESULT=$(( WW(INITVAL1) / WW(INITVAL2) ))

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP2='OPS[1]'
	    declare OP1=WW(INITVAL1)

	    if ! mpfr_set_si WW(OP2) WW(INITVAL2) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_si_div WW(ROP) WW(OP1) WW(OP2) WW(MPFR_RNDN)
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


# mpfr_ui_div

function arithmetic-mpfr_ui_div-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_ui_div
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL1=99 INITVAL2=33 RESULT
	declare -r EXPECTED_RESULT=$(( WW(INITVAL1) / WW(INITVAL2) ))

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP2='OPS[1]'
	    declare OP1=WW(INITVAL1)

	    if ! mpfr_set_si WW(OP2) WW(INITVAL2) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_ui_div WW(ROP) WW(OP1) WW(OP2) WW(MPFR_RNDN)
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


# mpfr_d_div

function arithmetic-mpfr_d_div-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_d_div
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL1=99 INITVAL2=33 RESULT
	declare -r EXPECTED_RESULT=$(( WW(INITVAL1) / WW(INITVAL2) ))

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP2='OPS[1]'
	    declare OP1=WW(INITVAL1)

	    if ! mpfr_set_si WW(OP2) WW(INITVAL2) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_d_div WW(ROP) WW(OP1) WW(OP2) WW(MPFR_RNDN)
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


# mpfr_sqr

function arithmetic-mpfr_sqr-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_sqr
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL=11 RESULT
	declare -r EXPECTED_RESULT=$(( WW(INITVAL) * WW(INITVAL) ))

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP='OPS[1]'

	    if ! mpfr_set_si WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_sqr WW(ROP) WW(OP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_get_si RESULT WW(ROP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(INITVAL) WW(RESULT)
	    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_sqrt

function arithmetic-mpfr_sqrt-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_sqrt
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL=121 RESULT
	declare -r EXPECTED_RESULT=11

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP='OPS[1]'

	    if ! mpfr_set_si WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_sqrt WW(ROP) WW(OP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_get_si RESULT WW(ROP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(INITVAL) WW(RESULT)
	    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_sqrt_ui

function arithmetic-mpfr_sqrt_ui-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_sqrt_ui
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL=121 RESULT
	declare -r EXPECTED_RESULT=11
	declare ROP OP=WW(INITVAL)

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init ROP
	    then mbfl_location_handler "mpfr_clear_and_free RR(ROP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_sqrt_ui WW(ROP) WW(OP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_get_si RESULT WW(ROP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(INITVAL) WW(RESULT)
	    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_rec_sqrt

function arithmetic-mpfr_rec_sqrt-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_rec_sqrt
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL=100 RESULT
	declare -r EXPECTED_RESULT='0.100000e0'

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP='OPS[1]'

	    if ! mpfr_set_si WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_rec_sqrt WW(ROP) WW(OP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    RESULT=$(mpfr_just_printit_dammit WW(ROP))

	    dotest-debug WW(INITVAL) WW(RESULT)
	    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_cbrt

function arithmetic-mpfr_cbrt-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_cbrt
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL=2197 RESULT
	declare -r EXPECTED_RESULT=13

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP='OPS[1]'

	    if ! mpfr_set_si WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_cbrt WW(ROP) WW(OP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_get_si RESULT WW(ROP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(INITVAL) WW(RESULT)
	    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_rootn_ui

function arithmetic-mpfr_rootn_ui-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_rootn_ui
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL=$(( 13 * 13 * 13 * 13 * 13 )) RESULT
	declare -r EXPECTED_RESULT=13
	declare ROP OP=WW(INITVAL)

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP='OPS[1]'

	    if ! mpfr_set_si WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_rootn_ui WW(ROP) WW(OP) 5 WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_get_si RESULT WW(ROP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(INITVAL) WW(RESULT)
	    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_rootn_si

function arithmetic-mpfr_rootn_si-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_rootn_si
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL=$(( 13 * 13 * 13 * 13 * 13 )) RESULT
	declare -r EXPECTED_RESULT=13
	declare ROP OP=WW(INITVAL)

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP='OPS[1]'

	    if ! mpfr_set_si WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_rootn_si WW(ROP) WW(OP) 5 WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_get_si RESULT WW(ROP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(INITVAL) WW(RESULT)
	    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_neg

function arithmetic-mpfr_neg-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_neg
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL=123 RESULT
	declare -r EXPECTED_RESULT=-123

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP='OPS[1]'

	    if ! mpfr_set_si WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_neg WW(ROP) WW(OP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_get_si RESULT WW(ROP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(INITVAL) WW(RESULT)
	    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_abs

function arithmetic-mpfr_abs-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_abs
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL=-123 RESULT
	declare -r EXPECTED_RESULT=123

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP='OPS[1]'

	    if ! mpfr_set_si WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_abs WW(ROP) WW(OP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_get_si RESULT WW(ROP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(INITVAL) WW(RESULT)
	    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_dim

function arithmetic-mpfr_dim-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_dim
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL1=1234 INITVAL2=1200 RESULT
	declare -r EXPECTED_RESULT=$(( WW(INITVAL1) - WW(INITVAL2) ))

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 3
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP1='OPS[1]' OP2='OPS[2]'

	    if ! mpfr_set_si WW(OP1) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP2) WW(INITVAL2) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_dim WW(ROP) WW(OP1) WW(OP2) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_get_si RESULT WW(ROP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(INITVAL1) WW(INITVAL2) WW(RESULT)
	    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_fac_ui

function arithmetic-mpfr_fac_ui-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_fac_ui
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL=5 RESULT
	declare -r EXPECTED_RESULT=$(( 5 * 4 * 3 * 2 * 1 ))
	declare ROP OP=WW(INITVAL)

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init ROP
	    then mbfl_location_handler "mpfr_clear_and_free RR(ROP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_fac_ui WW(ROP) WW(OP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_get_si RESULT WW(ROP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(INITVAL) WW(RESULT)
	    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_fma

function arithmetic-mpfr_fma-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_fma
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL1=11 INITVAL2=22 INITVAL3=33 RESULT
	declare -r EXPECTED_RESULT=$(( ( WW(INITVAL1) * WW(INITVAL2) ) + WW(INITVAL3) ))

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 4
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP1='OPS[1]' OP2='OPS[2]' OP3='OPS[3]'

	    if ! mpfr_set_si WW(OP1) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP2) WW(INITVAL2) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP3) WW(INITVAL3) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_fma WW(ROP) WW(OP1) WW(OP2) WW(OP3) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_get_si RESULT WW(ROP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(INITVAL1) WW(INITVAL2)  WW(INITVAL3) $(mpfr_just_printit_dammit WW(ROP))
	    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_fms

function arithmetic-mpfr_fms-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_fms
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL1=11 INITVAL2=22 INITVAL3=33 RESULT
	declare -r EXPECTED_RESULT=$(( ( WW(INITVAL1) * WW(INITVAL2) ) - WW(INITVAL3) ))

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 4
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP1='OPS[1]' OP2='OPS[2]' OP3='OPS[3]'

	    if ! mpfr_set_si WW(OP1) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP2) WW(INITVAL2) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP3) WW(INITVAL3) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_fms WW(ROP) WW(OP1) WW(OP2) WW(OP3) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_get_si RESULT WW(ROP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(INITVAL1) WW(INITVAL2)  WW(INITVAL3) $(mpfr_just_printit_dammit WW(ROP))
	    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_fmma

function arithmetic-mpfr_fmma-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_fmma
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL1=11 INITVAL2=22 INITVAL3=33 INITVAL4=44 RESULT
	declare -r EXPECTED_RESULT=$(( ( WW(INITVAL1) * WW(INITVAL2) ) + ( WW(INITVAL3) * WW(INITVAL4) ) ))

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 5
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP1='OPS[1]' OP2='OPS[2]' OP3='OPS[3]' OP4='OPS[4]'

	    if ! mpfr_set_si WW(OP1) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP2) WW(INITVAL2) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP3) WW(INITVAL3) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP4) WW(INITVAL4) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_fmma WW(ROP) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_get_si RESULT WW(ROP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(INITVAL1) WW(INITVAL2) WW(INITVAL3) WW(INITVAL4) $(mpfr_just_printit_dammit WW(ROP))
	    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_fmms

function arithmetic-mpfr_fmms-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_fmms
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL1=11 INITVAL2=22 INITVAL3=33 INITVAL4=44 RESULT
	declare -r EXPECTED_RESULT=$(( ( WW(INITVAL1) * WW(INITVAL2) ) - ( WW(INITVAL3) * WW(INITVAL4) ) ))

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 5
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP1='OPS[1]' OP2='OPS[2]' OP3='OPS[3]' OP4='OPS[4]'

	    if ! mpfr_set_si WW(OP1) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP2) WW(INITVAL2) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP3) WW(INITVAL3) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP4) WW(INITVAL4) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_fmms WW(ROP) WW(OP1) WW(OP2) WW(OP3) WW(OP4) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_get_si RESULT WW(ROP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(INITVAL1) WW(INITVAL2) WW(INITVAL3) WW(INITVAL4) $(mpfr_just_printit_dammit WW(ROP))
	    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_hypot

function arithmetic-mpfr_hypot-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_hypot
    then
	mbfl_declare_index_array_varref(OPS)
	declare INITVAL1=123 INITVAL2=456 RESULT
	declare -r EXPECTED_RESULT=472.3

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) 3
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    declare -n ROP='OPS[0]' OP1='OPS[1]' OP2='OPS[2]'

	    if ! mpfr_set_si WW(OP1) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP2) WW(INITVAL2) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_hypot WW(ROP) WW(OP1) WW(OP2) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    mmux_double_set_format "%.1f"
	    if ! mpfr_get_d RESULT WW(ROP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(INITVAL1) WW(INITVAL2)  $(mpfr_just_printit_dammit WW(ROP))
	    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_sum

function arithmetic-mpfr_sum-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_sum
    then
	mbfl_declare_index_array_varref(OPS)
	declare -i DIM=5
	mbfl_declare_varref(POINTERS)

	declare -a INITVALS=(1 2 3 5 7)
	declare -r EXPECTED_RESULT=$((1 + 2 + 3 + 5 + 7))

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS) RR(DIM)
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if mpfr_alloc_and_init_pointers_array _(POINTERS) _(OPS)
	    then mbfl_location_handler "mmux_libc_free RR(POINTERS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if mpfr_alloc_and_init ROP
	    then mbfl_location_handler "mpfr_clear_and_free RR(ROP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    {
		declare -i IDX

		for ((IDX=0; IDX < ${#INITVALS[@]}; ++IDX))
		do
		    if ! mpfr_set_si ${OPS[${IDX:?}]:?} ${INITVALS[${IDX:?}]:?} RR(MPFR_RNDN)
		    then mbfl_location_leave_then_return_failure
		    fi
		done
	    }

	    if ! mpfr_sum WW(ROP) WW(POINTERS) mbfl_slots_number(OPS) RR(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_get_si RESULT WW(ROP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_dot

function arithmetic-mpfr_dot-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_dot
    then
	mbfl_declare_index_array_varref(OPS1)
	mbfl_declare_index_array_varref(OPS2)
	declare -i DIM=5
	mbfl_declare_varref(POINTERS1)
	mbfl_declare_varref(POINTERS2)

	declare -a INITVALS1=( 1  2  3  5  7)
	declare -a INITVALS2=(11 13 17 19 23)
	declare -r EXPECTED_RESULT=$(( (1 * 11) + (2 * 13) + (3 * 17) + (5 * 19) + (7 * 23) ))

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array _(OPS1) RR(DIM)
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS1)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if mpfr_alloc_and_init_shell_array _(OPS2) RR(DIM)
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array _(OPS2)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if mpfr_alloc_and_init_pointers_array _(POINTERS1) _(OPS1)
	    then mbfl_location_handler "mmux_libc_free RR(POINTERS1)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if mpfr_alloc_and_init_pointers_array _(POINTERS2) _(OPS2)
	    then mbfl_location_handler "mmux_libc_free RR(POINTERS2)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if mpfr_alloc_and_init ROP
	    then mbfl_location_handler "mpfr_clear_and_free RR(ROP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    {
		declare -i IDX

		for ((IDX=0; IDX < ${#INITVALS1[@]}; ++IDX))
		do
		    if ! mpfr_set_si ${OPS1[${IDX:?}]:?} ${INITVALS1[${IDX:?}]:?} RR(MPFR_RNDN)
		    then mbfl_location_leave_then_return_failure
		    fi
		done
	    }

	    {
		declare -i IDX

		for ((IDX=0; IDX < ${#INITVALS2[@]}; ++IDX))
		do
		    if ! mpfr_set_si ${OPS2[${IDX:?}]:?} ${INITVALS2[${IDX:?}]:?} RR(MPFR_RNDN)
		    then mbfl_location_leave_then_return_failure
		    fi
		done
	    }

	    if ! mpfr_dot WW(ROP) WW(POINTERS1) WW(POINTERS2) RR(DIM) RR(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_get_si RESULT WW(ROP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

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
