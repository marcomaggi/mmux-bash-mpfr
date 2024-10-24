#!#
#!# Part of: MMUX Bash MPFR
#!# Contents: tests for transcendental builtins
#!# Date: Oct 20, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/transcendental.test ; less tests/transcendental.log
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


# mpfr_log

function transcendental-mpfr_log-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_log
    then
	declare -r INITVAL='1' EXPECTED_RESULT='0'
	declare	-a OPS
	declare RESULT

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array OPS 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array OPS; dotest-debug exiting location"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OPS,1) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_log WW(OPS,0) WW(OPS,1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    RESULT=$(mpfr_just_printit_dammit WW(OPS,0))

	    dotest-debug WW(EXPECTED_RESULT) WW(RESULT)
	    mmux_double_equal WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_log_ui

function transcendental-mpfr_log_ui-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_log_ui
    then
	declare -r INITVAL='123'
	declare	OP
	declare RESULT EXPECTED_RESULT

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free RR(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_log_ui WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    RESULT=$(mpfr_just_printit_dammit -n 10 WW(OP))
	    mmux_double_log EXPECTED_RESULT WW(INITVAL)
	    mmux_double_reformat EXPECTED_RESULT '%f' WW(EXPECTED_RESULT)

	    dotest-debug WW(EXPECTED_RESULT) WW(RESULT)
	    mmux_double_equal_absmargin WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_log2

function transcendental-mpfr_log2-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_log2
    then
	declare -r INITVAL='1'
	declare	-a OPS
	declare RESULT EXPECTED_RESULT

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array OPS 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array OPS"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OPS,1) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_log2 WW(OPS,0) WW(OPS,1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    RESULT=$(mpfr_just_printit_dammit WW(OPS,0))
	    mmux_double_log2 EXPECTED_RESULT WW(INITVAL)

	    dotest-debug WW(EXPECTED_RESULT) WW(RESULT)
	    mmux_double_equal_absmargin WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_log10

function transcendental-mpfr_log10-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_log10
    then
	declare -r INITVAL='1'
	declare	-a OPS
	declare RESULT EXPECTED_RESULT

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array OPS 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array OPS"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OPS,1) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_log10 WW(OPS,0) WW(OPS,1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    RESULT=$(mpfr_just_printit_dammit WW(OPS,0))
	    mmux_double_log10 EXPECTED_RESULT WW(INITVAL)

	    dotest-debug WW(EXPECTED_RESULT) WW(RESULT)
	    mmux_double_equal_absmargin WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_log1p

function transcendental-mpfr_log1p-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_log1p
    then
	declare -r INITVAL='1'
	declare	-a OPS
	declare RESULT EXPECTED_RESULT

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array OPS 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array OPS"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OPS,1) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_log1p WW(OPS,0) WW(OPS,1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    RESULT=$(mpfr_just_printit_dammit WW(OPS,0))
	    mmux_double_log1p EXPECTED_RESULT WW(INITVAL)

	    dotest-debug WW(EXPECTED_RESULT) WW(RESULT)
	    mmux_double_equal_absmargin WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_log2p1

function transcendental-mpfr_log2p1-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_log2p1
    then
	declare -r INITVAL='1'
	declare	-a OPS
	declare RESULT EXPECTED_RESULT

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array OPS 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array OPS"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OPS,1) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_log2p1 WW(OPS,0) WW(OPS,1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    RESULT=$(mpfr_just_printit_dammit WW(OPS,0))
	    mmux_double_log2 EXPECTED_RESULT $(( 1 + WW(INITVAL) ))

	    dotest-debug WW(EXPECTED_RESULT) WW(RESULT)
	    mmux_double_equal_absmargin WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_log10p1

function transcendental-mpfr_log10p1-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_log10p1
    then
	declare -r INITVAL='1'
	declare	-a OPS
	declare RESULT EXPECTED_RESULT

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array OPS 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array OPS"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_si WW(OPS,1) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_log10p1 WW(OPS,0) WW(OPS,1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    RESULT=$(mpfr_just_printit_dammit WW(OPS,0))
	    mmux_double_log10 EXPECTED_RESULT $(( 1 + WW(INITVAL) ))

	    dotest-debug WW(EXPECTED_RESULT) WW(RESULT)
	    mmux_double_equal_absmargin WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_exp

function transcendental-mpfr_exp-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_exp
    then
	declare -r INITVAL='1.23'
	declare	-a OPS
	declare RESULT EXPECTED_RESULT

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array OPS 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array OPS"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_d WW(OPS,1) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_exp WW(OPS,0) WW(OPS,1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    RESULT=$(mpfr_just_printit_dammit WW(OPS,0))

	    mmux_double_exp EXPECTED_RESULT WW(INITVAL)
	    mmux_double_reformat EXPECTED_RESULT '%f' WW(EXPECTED_RESULT)

	    dotest-debug WW(EXPECTED_RESULT) WW(RESULT)
	    mmux_double_equal_absmargin WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_exp2

function transcendental-mpfr_exp2-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_exp2
    then
	declare -r INITVAL='1.23'
	declare	-a OPS
	declare RESULT EXPECTED_RESULT

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array OPS 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array OPS"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_d WW(OPS,1) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_exp2 WW(OPS,0) WW(OPS,1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    RESULT=$(mpfr_just_printit_dammit WW(OPS,0))

	    mmux_double_exp2 EXPECTED_RESULT WW(INITVAL)
	    mmux_double_reformat EXPECTED_RESULT '%f' WW(EXPECTED_RESULT)

	    dotest-debug WW(EXPECTED_RESULT) WW(RESULT)
	    mmux_double_equal_absmargin WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_exp10

function transcendental-mpfr_exp10-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_exp10
    then
	declare -r INITVAL='1.23'
	declare	-a OPS
	declare RESULT EXPECTED_RESULT

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array OPS 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array OPS"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_d WW(OPS,1) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_exp10 WW(OPS,0) WW(OPS,1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    RESULT=$(mpfr_just_printit_dammit -n 10 WW(OPS,0))

	    mmux_double_exp10 EXPECTED_RESULT WW(INITVAL)
	    mmux_double_reformat EXPECTED_RESULT '%f' WW(EXPECTED_RESULT)

	    dotest-debug WW(EXPECTED_RESULT) WW(RESULT)
	    mmux_double_equal_absmargin WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_expm1

function transcendental-mpfr_expm1-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_expm1
    then
	declare -r INITVAL='1.23'
	declare	-a OPS
	declare RESULT EXPECTED_RESULT

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array OPS 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array OPS"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_d WW(OPS,1) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_expm1 WW(OPS,0) WW(OPS,1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    RESULT=$(mpfr_just_printit_dammit -n 10 WW(OPS,0))

	    mmux_double_expm1 EXPECTED_RESULT WW(INITVAL)
	    mmux_double_reformat EXPECTED_RESULT '%f' WW(EXPECTED_RESULT)

	    dotest-debug WW(EXPECTED_RESULT) WW(RESULT)
	    mmux_double_equal_absmargin WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_exp2m1

function transcendental-mpfr_exp2m1-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_exp2m1
    then
	declare -r INITVAL='1.23'
	declare	-a OPS
	declare RESULT EXPECTED_RESULT

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array OPS 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array OPS"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_d WW(OPS,1) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_exp2m1 WW(OPS,0) WW(OPS,1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    RESULT=$(mpfr_just_printit_dammit -n 10 WW(OPS,0))

	    mmux_double_exp2 EXPECTED_RESULT WW(INITVAL)
	    mmux_double_sub  EXPECTED_RESULT WW(EXPECTED_RESULT) 1
	    mmux_double_reformat EXPECTED_RESULT '%f' WW(EXPECTED_RESULT)

	    dotest-debug WW(EXPECTED_RESULT) WW(RESULT)
	    mmux_double_equal_absmargin WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_exp10m1

function transcendental-mpfr_exp10m1-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_exp10m1
    then
	declare -r INITVAL='1.23'
	declare	-a OPS
	declare RESULT EXPECTED_RESULT

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array OPS 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array OPS"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_d WW(OPS,1) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_exp10m1 WW(OPS,0) WW(OPS,1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    RESULT=$(mpfr_just_printit_dammit -n 10 WW(OPS,0))

	    mmux_double_exp10 EXPECTED_RESULT WW(INITVAL)
	    mmux_double_sub   EXPECTED_RESULT WW(EXPECTED_RESULT) 1
	    mmux_double_reformat EXPECTED_RESULT '%f' WW(EXPECTED_RESULT)

	    dotest-debug WW(EXPECTED_RESULT) WW(RESULT)
	    mmux_double_equal_absmargin WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_pow

function transcendental-mpfr_pow-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_pow
    then
	declare -r INITVAL1='1.23' INITVAL2='4.56'
	declare	-a OPS
	declare RESULT EXPECTED_RESULT

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array OPS 3
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array OPS"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_d WW(OPS,1) WW(INITVAL1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_d WW(OPS,2) WW(INITVAL2) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_pow WW(OPS,0) WW(OPS,1) WW(OPS,2) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    RESULT=$(mpfr_just_printit_dammit -n 10 WW(OPS,0))

	    mmux_double_pow EXPECTED_RESULT WW(INITVAL1) WW(INITVAL2)
	    mmux_double_reformat EXPECTED_RESULT '%f' WW(EXPECTED_RESULT)

	    dotest-debug WW(EXPECTED_RESULT) WW(RESULT)
	    mmux_double_equal_absmargin WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_sin

function transcendental-mpfr_sin-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_sin
    then
	declare -r INITVAL='1.23'
	declare	-a OPS
	declare RESULT EXPECTED_RESULT

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array OPS 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array OPS"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_d WW(OPS,1) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_sin WW(OPS,0) WW(OPS,1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    RESULT=$(mpfr_just_printit_dammit -n 10 WW(OPS,0))

	    mmux_double_sin EXPECTED_RESULT WW(INITVAL)
	    mmux_double_reformat EXPECTED_RESULT '%f' WW(EXPECTED_RESULT)

	    dotest-debug WW(EXPECTED_RESULT) WW(RESULT)
	    mmux_double_equal_absmargin WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_cos

function transcendental-mpfr_cos-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_cos
    then
	declare -r INITVAL='1.23'
	declare	-a OPS
	declare RESULT EXPECTED_RESULT

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array OPS 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array OPS"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_d WW(OPS,1) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_cos WW(OPS,0) WW(OPS,1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    RESULT=$(mpfr_just_printit_dammit -n 10 WW(OPS,0))

	    mmux_double_cos EXPECTED_RESULT WW(INITVAL)
	    mmux_double_reformat EXPECTED_RESULT '%f' WW(EXPECTED_RESULT)

	    dotest-debug WW(EXPECTED_RESULT) WW(RESULT)
	    mmux_double_equal_absmargin WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_y0

function transcendental-mpfr_y0-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_y0
    then
	declare -r INITVAL='1.23'
	declare	-a OPS
	declare RESULT EXPECTED_RESULT

	mmux_double_y0 EXPECTED_RESULT WW(INITVAL)
	mmux_double_reformat EXPECTED_RESULT '%f' WW(EXPECTED_RESULT)
	declare -r EXPECTED_RESULT

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init_shell_array OPS 2
	    then mbfl_location_handler "mpfr_clear_and_free_shell_array OPS"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_d WW(OPS,1) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_y0 WW(OPS,0) WW(OPS,1) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    RESULT=$(mpfr_just_printit_dammit WW(OPS,0))

	    dotest-debug WW(EXPECTED_RESULT) WW(RESULT)
	    mmux_double_equal WW(EXPECTED_RESULT) WW(RESULT)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


#### let's go

dotest transcendental-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
