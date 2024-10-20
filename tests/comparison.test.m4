#!#
#!# Part of: MMUX Bash MPFR
#!# Contents: tests for comparison builtins
#!# Date: Oct 10, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/comparison.test ; less tests/comparison.log
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


# mpfr_cmp

function comparison-mpfr_cmp-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_cmp
    then
	declare -r INITVAL1='123' INITVAL2='456'
	declare	OPS

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array OPS 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array RR(OPS)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OPS,0) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OPS,1) WW(INITVAL2) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_cmp WW(OPS,0) WW(OPS,1)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(MPFR_RV)

	    if (( 0 > RR(MPFR_RV) ))
	    then return_success
	    else return_failure
	    fi
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_cmp_si

function comparison-mpfr_cmp_si-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_cmp_si
    then
	declare -r INITVAL1='123' INITVAL2='-456'
	declare	OP

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free RR(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_cmp_si WW(OP) WW(INITVAL2)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(MPFR_RV)

	    if (( 0 < RR(MPFR_RV) ))
	    then return_success
	    else return_failure
	    fi
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_cmp_ui

function comparison-mpfr_cmp_ui-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_cmp_ui
    then
	declare -r INITVAL1='123' INITVAL2='456'
	declare	OP

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free RR(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_cmp_ui WW(OP) WW(INITVAL2)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(MPFR_RV)

	    if (( 0 > RR(MPFR_RV) ))
	    then return_success
	    else return_failure
	    fi
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_cmp_d

function comparison-mpfr_cmp_d-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_cmp_d
    then
	declare -r INITVAL1='123' INITVAL2='456.789'
	declare	OP

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free RR(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_cmp_d WW(OP) WW(INITVAL2)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(MPFR_RV)

	    if (( 0 > RR(MPFR_RV) ))
	    then return_success
	    else return_failure
	    fi
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_cmp_ld

function comparison-mpfr_cmp_ld-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_cmp_ld
    then
	declare -r INITVAL1='123' INITVAL2='456.789'
	declare	OP

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free RR(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_cmp_ld WW(OP) WW(INITVAL2)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(MPFR_RV)

	    if (( 0 > RR(MPFR_RV) ))
	    then return_success
	    else return_failure
	    fi
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_cmp_z

function comparison-mpfr_cmp_z-1.1 () {
    if gmp_exists && mmux_bash_pointers_builtin_p mpfr_cmp_z
    then
	declare -r INITVAL1='123' INITVAL2='456'
	declare	OP OPZ

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free RR(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if mpfz_alloc_and_init OPZ
	    then mbfl_location_handler "mpz_clear_and_free RR(OPZ)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpz_set_si WW(OPZ) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_cmp_z WW(OP) WW(OPZ)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(MPFR_RV)

	    if (( 0 > RR(MPFR_RV) ))
	    then return_success
	    else return_failure
	    fi
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_nan_p

function comparison-mpfr_nan_p-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_nan_p
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

	    if ! mpfr_set_si WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_nan_p WW(OP)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if (( 0 == RR(MPFR_RV) ))
	    then return_success
	    else return_failure
	    fi
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}
function comparison-mpfr_nan_p-1.2 () {
    if mmux_bash_pointers_builtin_p mpfr_nan_p
    then
	declare	OP

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free RR(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_nan_p WW(OP)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if (( 1 == RR(MPFR_RV) ))
	    then return_success
	    else return_failure
	    fi
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


#### mpfr_cmp_si_2exp

function comparison-mpfr_cmp_si_2exp-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_cmp_si_2exp
    then
	# 800 = 100 * 2^3
	declare -r INITVAL1='800' INITVAL2='100' EXPON='3'
	declare	OP

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free RR(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_cmp_si_2exp WW(OP) WW(INITVAL2) WW(EXPON)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(MPFR_RV)

	    if (( 0 == RR(MPFR_RV) ))
	    then return_success
	    else return_failure
	    fi
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


#### mpfr_cmp_ui_2exp

function comparison-mpfr_cmp_ui_2exp-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_cmp_ui_2exp
    then
	# 800 = 100 * 2^3
	declare -r INITVAL1='800' INITVAL2='100' EXPON='3'
	declare	OP

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free RR(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OP) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_cmp_ui_2exp WW(OP) WW(INITVAL2) WW(EXPON)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(MPFR_RV)

	    if (( 0 == RR(MPFR_RV) ))
	    then return_success
	    else return_failure
	    fi
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_inf_p

function comparison-mpfr_inf_p-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_inf_p
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

	    if ! mpfr_set_inf WW(OP) +1
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_inf_p WW(OP)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if (( 1 == RR(MPFR_RV) ))
	    then return_success
	    else return_failure
	    fi
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}
function comparison-mpfr_inf_p-1.2 () {
    if mmux_bash_pointers_builtin_p mpfr_inf_p
    then
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

	    if ! mpfr_inf_p WW(OP)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if (( 0 == RR(MPFR_RV) ))
	    then return_success
	    else return_failure
	    fi
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_zero_p

function comparison-mpfr_zero_p-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_zero_p
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

	    if ! mpfr_set_si WW(OP) 0 WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_zero_p WW(OP)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if (( 1 == RR(MPFR_RV) ))
	    then return_success
	    else return_failure
	    fi
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}
function comparison-mpfr_zero_p-1.2 () {
    if mmux_bash_pointers_builtin_p mpfr_zero_p
    then
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

	    if ! mpfr_zero_p WW(OP)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if (( 0 == RR(MPFR_RV) ))
	    then return_success
	    else return_failure
	    fi
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_number_p

function comparison-mpfr_number_p-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_number_p
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

	    if ! mpfr_number_p WW(OP)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if (( 1 == RR(MPFR_RV) ))
	    then return_success
	    else return_failure
	    fi
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}
function comparison-mpfr_number_p-1.2 () {
    if mmux_bash_pointers_builtin_p mpfr_number_p
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

	    if ! mpfr_number_p WW(OP)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if (( 0 == RR(MPFR_RV) ))
	    then return_success
	    else return_failure
	    fi
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}
function comparison-mpfr_number_p-1.3 () {
    if mmux_bash_pointers_builtin_p mpfr_number_p
    then
	declare	OP

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free RR(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_inf WW(OP) +1
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_number_p WW(OP)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if (( 0 == RR(MPFR_RV) ))
	    then return_success
	    else return_failure
	    fi
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}
function comparison-mpfr_number_p-1.4 () {
    if mmux_bash_pointers_builtin_p mpfr_number_p
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

	    if ! mpfr_set_si WW(OP) '0' WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_number_p WW(OP)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if (( 1 == RR(MPFR_RV) ))
	    then return_success
	    else return_failure
	    fi
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_regular_p

function comparison-mpfr_regular_p-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_regular_p
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

	    if ! mpfr_regular_p WW(OP)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if (( 1 == RR(MPFR_RV) ))
	    then return_success
	    else return_failure
	    fi
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}
function comparison-mpfr_regular_p-1.2 () {
    if mmux_bash_pointers_builtin_p mpfr_regular_p
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

	    if ! mpfr_regular_p WW(OP)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if (( 0 == RR(MPFR_RV) ))
	    then return_success
	    else return_failure
	    fi
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}
function comparison-mpfr_regular_p-1.3 () {
    if mmux_bash_pointers_builtin_p mpfr_regular_p
    then
	declare	OP

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free RR(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_inf WW(OP) +1
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_regular_p WW(OP)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if (( 0 == RR(MPFR_RV) ))
	    then return_success
	    else return_failure
	    fi
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}
function comparison-mpfr_regular_p-1.4 () {
    if mmux_bash_pointers_builtin_p mpfr_regular_p
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

	    if ! mpfr_set_si WW(OP) '0' WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_regular_p WW(OP)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if (( 0 == RR(MPFR_RV) ))
	    then return_success
	    else return_failure
	    fi
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_sgn

function comparison-mpfr_sgn-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_sgn
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

	    if ! mpfr_set_si WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_sgn WW(OP)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(MPFR_RV)

	    if (( 0 < RR(MPFR_RV) ))
	    then return_success
	    else return_failure
	    fi
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}
function comparison-mpfr_sgn-1.2 () {
    if mmux_bash_pointers_builtin_p mpfr_sgn
    then
	declare -r INITVAL='-123'
	declare	OP

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

	    if ! mpfr_sgn WW(OP)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if (( 0 > RR(MPFR_RV) ))
	    then return_success
	    else return_failure
	    fi
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}
function comparison-mpfr_sgn-1.3 () {
    if mmux_bash_pointers_builtin_p mpfr_sgn
    then
	declare -r INITVAL='0'
	declare	OP

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

	    if ! mpfr_sgn WW(OP)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if (( 0 == RR(MPFR_RV) ))
	    then return_success
	    else return_failure
	    fi
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}



#### let's go

dotest comparison-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
