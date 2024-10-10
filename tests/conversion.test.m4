#!#
#!# Part of: MMUX Bash MPFR
#!# Contents: tests for conversion functions
#!# Date: Sep 15, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/conversion.test ; less tests/conversion.log
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


# mpfr_get_si

function conversion-mpfr_get_si-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_get_si
    then
	declare -r	INITVAL='123'
	declare	ROP OP

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(OP) WW(INITVAL) WW(MPFR_RNDN)

	    if ! mpfr_set_si WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_get_si ROP WW(OP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(INITVAL) WW(ROP)
	    dotest-equal WW(INITVAL) WW(ROP)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_get_ui

function conversion-mpfr_get_ui-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_get_ui
    then
	declare -r	INITVAL='123'
	declare	ROP OP

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(OP) WW(INITVAL) WW(MPFR_RNDN)

	    if ! mpfr_set_ui WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_get_ui ROP WW(OP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(INITVAL) WW(ROP)
	    dotest-equal WW(INITVAL) WW(ROP)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_get_sj

function conversion-mpfr_get_sj-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_get_sj
    then
	declare -r	INITVAL='123'
	declare	ROP OP

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(OP) WW(INITVAL) WW(MPFR_RNDN)

	    if ! mpfr_set_si WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_get_sj ROP WW(OP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(INITVAL) WW(ROP)
	    dotest-equal WW(INITVAL) WW(ROP)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_get_uj

function conversion-mpfr_get_uj-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_get_uj
    then
	declare -r	INITVAL='123'
	declare	ROP OP

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(OP) WW(INITVAL) WW(MPFR_RNDN)

	    if ! mpfr_set_si WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_get_uj ROP WW(OP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug WW(INITVAL) WW(ROP)
	    dotest-equal WW(INITVAL) WW(ROP)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_get_flt

function conversion-mpfr_get_flt-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_get_flt
    then
	declare -r	INITVAL='1.23'
	declare	ROP OP

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_flt WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    mmux_float_set_format "%.2f"
	    if ! mpfr_get_flt ROP WW(OP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-equal WW(INITVAL) WW(ROP)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_get_d

function conversion-mpfr_get_d-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_get_d
    then
	declare -r	INITVAL='1.23'
	declare	ROP OP

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_set_d WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    mmux_double_set_format "%.2f"
	    if ! mpfr_get_d ROP WW(OP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-equal WW(INITVAL) WW(ROP)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_get_ld

function conversion-mpfr_get_ld-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_get_ld
    then
	declare -r	INITVAL='1.230000'
	declare	ROP OP

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug OP=WW(OP) INITVAL=WW(INITVAL) RND=WW(MPFR_RNDN)

	    if ! mpfr_set_ld WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug OP=$(mpfr_just_printit_dammit WW(OP))

	    mmux_ldouble_set_format "%f"
	    if ! mpfr_get_ld ROP WW(OP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug INITVAL=WW(INITVAL) ROP=WW(ROP)
	    dotest-equal WW(INITVAL) WW(ROP)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_get_float128

function conversion-mpfr_get_float128-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_get_float128
    then
	declare -r	INITVAL='1.230000'
	declare	ROP OP

	dotest-set-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug OP=WW(OP) INITVAL=WW(INITVAL) RND=WW(MPFR_RNDN)

	    if ! mpfr_set_float128 WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug OP=$(mpfr_just_printit_dammit WW(OP))

	    mmux_float128_set_format "%f"
	    if ! mpfr_get_float128 ROP WW(OP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug INITVAL=WW(INITVAL) ROP=WW(ROP)
	    dotest-equal WW(INITVAL) WW(ROP)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_get_decimal64

function conversion-mpfr_get_decimal64-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_get_decimal64
    then
	declare -r	INITVAL='1.230000'
	declare	ROP OP

	dotest-set-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug OP=WW(OP) INITVAL=WW(INITVAL) RND=WW(MPFR_RNDN)

	    if ! mpfr_set_decimal64 WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug OP=$(mpfr_just_printit_dammit WW(OP))

	    mmux_decimal64_set_format "%f"
	    if ! mpfr_get_decimal64 ROP WW(OP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug INITVAL=WW(INITVAL) ROP=WW(ROP)
	    dotest-equal WW(INITVAL) WW(ROP)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_get_decimal128

function conversion-mpfr_get_decimal128-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_get_decimal128
    then
	declare -r	INITVAL='1.230000'
	declare	ROP OP

	dotest-set-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug OP=WW(OP) INITVAL=WW(INITVAL) RND=WW(MPFR_RNDN)

	    if ! mpfr_set_decimal128 WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug OP=$(mpfr_just_printit_dammit WW(OP))

	    mmux_decimal128_set_format "%f"
	    if ! mpfr_get_decimal128 ROP WW(OP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug INITVAL=WW(INITVAL) ROP=WW(ROP)
	    dotest-equal WW(INITVAL) WW(ROP)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_get_z

function conversion-mpfr_get_z-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_get_z && gmp_exists
    then
	declare -r	INITVAL='1.230000'
	declare	ROP OP

	dotest-set-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug OP=WW(OP) INITVAL=WW(INITVAL) RND=WW(MPFR_RNDN)

	    if ! mpfr_set_double WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug OP=$(mpfr_just_printit_dammit WW(OP))

	    if ! mpfr_get_z ROP WW(OP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-equal WW(INITVAL) $(mpz_just_printit_dammit WW(ROP))
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_get_q

function conversion-mpfr_get_q-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_get_q && gmp_exists
    then
	declare -r	INITVAL='1.230000'
	declare	ROP OP

	dotest-set-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug OP=WW(OP) INITVAL=WW(INITVAL) RND=WW(MPFR_RNDN)

	    if ! mpfr_set_double WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug OP=$(mpfr_just_printit_dammit WW(OP))

	    if ! mpfr_get_q ROP WW(OP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-equal WW(INITVAL) $(mpq_just_printit_dammit WW(ROP))
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_get_f

function conversion-mpfr_get_f-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_get_f && gmp_exists
    then
	declare -r	INITVAL='1.230000'
	declare	ROP OP

	dotest-set-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug OP=WW(OP) INITVAL=WW(INITVAL) RND=WW(MPFR_RNDN)

	    if ! mpfr_set_double WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug OP=$(mpfr_just_printit_dammit WW(OP))

	    if ! mpfr_get_f ROP WW(OP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-equal WW(INITVAL) $(mpf_just_printit_dammit WW(ROP))
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_get_d_2exp

function conversion-mpfr_get_d_2exp-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_get_d_2exp
    then
	declare -r	INITVAL='1.23' EXPECTED_MAN='0.615000' EXPECTED_EXP='1'
	declare	MAN EXP OP

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug OP=WW(OP) INITVAL=WW(INITVAL) RND=WW(MPFR_RNDN)

	    if ! mpfr_set_d WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    mmux_double_set_format "%f"
	    if ! mpfr_get_d_2exp MAN EXP WW(OP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug MAN=WW(MAN) EXP=WW(EXP) INITVAL=WW(INITVAL)
	    dotest-equal     WW(EXPECTED_MAN) WW(MAN) &&
		dotest-equal WW(EXPECTED_EXP) WW(EXP)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_get_ld_2exp

function conversion-mpfr_get_ld_2exp-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_get_ld_2exp
    then
	declare -r	INITVAL='1.23' EXPECTED_MAN='0.615000' EXPECTED_EXP='1'
	declare	MAN EXP OP

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug OP=WW(OP) INITVAL=WW(INITVAL) RND=WW(MPFR_RNDN)

	    if ! mpfr_set_ld WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    mmux_ldouble_set_format "%f"
	    if ! mpfr_get_ld_2exp MAN EXP WW(OP) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug MAN=WW(MAN) EXP=WW(EXP) INITVAL=WW(INITVAL)
	    dotest-equal     WW(EXPECTED_MAN) WW(MAN) &&
		dotest-equal WW(EXPECTED_EXP) WW(EXP)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_get_z_2exp

function conversion-mpfr_get_z_2exp-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_get_z_2exp && gmp_exists
    then
	declare -r	INITVAL='1.23' EXPECTED_EXP='1'
	declare	ROP OP EXP

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init OP
	    then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if mpz_alloc_and_init ROP
	    then mbfl_location_handler "mpz_clear_and_free WW(ROP)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug OP=WW(OP) INITVAL=WW(INITVAL) RND=WW(MPFR_RNDN)

	    if ! mpfr_set_d WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_get_z_2exp EXP WW(ROP) WW(OP)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-equal WW(EXPECTED_EXP) WW(EXP)
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


# mpfr_frexp

function conversion-mpfr_frexp-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_frexp
    then
	declare -r	INITVAL='1.23' EXPECTED_EXP='1' EXPECTED_Y='0.615000e0'
	declare	X Y EXP

	dotest-unset-debug

	mbfl_location_enter
	{
	    if mpfr_alloc_and_init X
	    then mbfl_location_handler "mpfr_clear_and_free WW(X)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    if mpfr_alloc_and_init Y
	    then mbfl_location_handler "mpfr_clear_and_free WW(Y)"
	    else mbfl_location_leave_then_return_failure
	    fi

	    dotest-debug X=WW(X) Y=WW(Y) INITVAL=WW(INITVAL)

	    if ! mpfr_set_d WW(X) WW(INITVAL) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    if ! mpfr_frexp EXP WW(Y) WW(X) WW(MPFR_RNDN)
	    then mbfl_location_leave_then_return_failure
	    fi

	    dotest-equal     WW(EXPECTED_EXP) WW(EXP) &&
		dotest-equal WW(EXPECTED_Y) $(mpfr_just_printit_dammit WW(Y))
	}
	mbfl_location_leave
    else dotest-skipped
    fi
}


#### mpfr-get-str

function conversion-mpfr_get_str-1.1 () {
    # We print an uninitialised but unset number.
    declare -r EXPECTED_MAN_RESULT='12300000000000000' EXPECTED_EXP_RESULT='1'
    declare MPFR_OP MAN_RESULT EXP_RESULT
    declare -ri BASE=10 NDIGITS=0

    #dotest-set-debug
    dotest-debug mpfr_SIZEOF=$mpfr_SIZEOF

    mbfl_location_enter
    {
	if mmux_libc_calloc MPFR_OP 1 $mpfr_SIZEOF
	then mbfl_location_handler "mmux_libc_free $MPFR_OP"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug OP=$MPFR_OP

	if mpfr_init $MPFR_OP
	then mbfl_location_handler "mpfr_clear $MPFR_OP"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_d $MPFR_OP '1.23' $MPFR_RNDN
	then mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_get_str MAN_RESULT EXP_RESULT $BASE $NDIGITS $MPFR_OP $MPFR_RNDN
	then mbfl_location_leave_then_return_failure
	fi
    }
    mbfl_location_leave
    dotest-equal QQ(EXPECTED_MAN_RESULT) QQ(MAN_RESULT) &&
	dotest-equal QQ(EXPECTED_EXP_RESULT) QQ(EXP_RESULT)
}


# mpfr_get_str_ndigits

function conversion-mpfr_get_str_ndigits-1.1 () {
    declare -r EXPECTED_SIZE='4'
    declare -ri BASE=10 PREC=7
    declare SIZE

    if ! mpfr_get_str_ndigits SIZE WW(BASE) WW(PREC)
    then return_failure
    fi

    dotest-equal WW(EXPECTED_SIZE) WW(SIZE)
}


# mpfr_fits_sshort_p

function conversion-mpfr_fits_sshort_p-1.1 () {
    declare -r	INITVAL=WW(mmux_sshort_MAX)
    declare	ROP OP

    mbfl_location_enter
    {
	if mpfr_alloc_and_init OP
	then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_si WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	#mpfr_just_printit_dammit WW(OP) >&2
	if ! mpfr_fits_sshort_p WW(OP) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	if (( 1 == WW(MPFR_RV) ))
	then return 0
	else return 1
	fi
    }
    mbfl_location_leave
}
function conversion-mpfr_fits_sshort_p-1.2 () {
    declare -r	INITVAL=WW(mmux_sshort_MIN)
    declare	ROP OP

    mbfl_location_enter
    {
	if mpfr_alloc_and_init OP
	then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_si WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_fits_sshort_p WW(OP) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	if (( 1 == WW(MPFR_RV) ))
	then return 0
	else return 1
	fi
    }
    mbfl_location_leave
}
function conversion-mpfr_fits_sshort_p-1.3 () {
    declare -r	INITVAL=WW(mmux_sint_MAX)
    declare	ROP OP

    dotest-set-debug

    mbfl_location_enter
    {
	if mpfr_alloc_and_init OP
	then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_si WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	#mpfr_just_printit_dammit WW(OP) >&2
	if ! mpfr_fits_sshort_p WW(OP) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	dotest-debug MPFR_RV=WW(MPFR_RV)

	# In this test the number does NOT fit!
	if (( 1 == WW(MPFR_RV) ))
	then return 1
	else return 0
	fi
    }
    mbfl_location_leave
}


# mpfr_fits_ushort_p

function conversion-mpfr_fits_ushort_p-1.1 () {
    declare -r	INITVAL=WW(mmux_ushort_MAX)
    declare	ROP OP

    mbfl_location_enter
    {
	if mpfr_alloc_and_init OP
	then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_si WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	#mpfr_just_printit_dammit WW(OP) >&2
	if ! mpfr_fits_ushort_p WW(OP) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	if (( 1 == WW(MPFR_RV) ))
	then return 0
	else return 1
	fi
    }
    mbfl_location_leave
}
function conversion-mpfr_fits_ushort_p-1.2 () {
    declare -r	INITVAL=WW(mmux_ushort_MIN)
    declare	ROP OP

    mbfl_location_enter
    {
	if mpfr_alloc_and_init OP
	then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_si WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_fits_ushort_p WW(OP) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	if (( 1 == WW(MPFR_RV) ))
	then return 0
	else return 1
	fi
    }
    mbfl_location_leave
}


# mpfr_fits_sint_p

function conversion-mpfr_fits_sint_p-1.1 () {
    declare -r	INITVAL=WW(mmux_sint_MAX)
    declare	ROP OP

    mbfl_location_enter
    {
	if mpfr_alloc_and_init OP
	then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_si WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	#mpfr_just_printit_dammit WW(OP) >&2
	if ! mpfr_fits_sint_p WW(OP) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	if (( 1 == WW(MPFR_RV) ))
	then return 0
	else return 1
	fi
    }
    mbfl_location_leave
}
function conversion-mpfr_fits_sint_p-1.2 () {
    declare -r	INITVAL=WW(mmux_sint_MIN)
    declare	ROP OP

    mbfl_location_enter
    {
	if mpfr_alloc_and_init OP
	then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_si WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_fits_sint_p WW(OP) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	if (( 1 == WW(MPFR_RV) ))
	then return 0
	else return 1
	fi
    }
    mbfl_location_leave
}


# mpfr_fits_uint_p

function conversion-mpfr_fits_uint_p-1.1 () {
    declare -r	INITVAL=WW(mmux_uint_MAX)
    declare	ROP OP

    mbfl_location_enter
    {
	if mpfr_alloc_and_init OP
	then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_si WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	#mpfr_just_printit_dammit WW(OP) >&2
	if ! mpfr_fits_uint_p WW(OP) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	if (( 1 == WW(MPFR_RV) ))
	then return 0
	else return 1
	fi
    }
    mbfl_location_leave
}
function conversion-mpfr_fits_uint_p-1.2 () {
    declare -r	INITVAL=WW(mmux_uint_MIN)
    declare	ROP OP

    mbfl_location_enter
    {
	if mpfr_alloc_and_init OP
	then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_si WW(OP) WW(INITVAL) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_fits_uint_p WW(OP) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	if (( 1 == WW(MPFR_RV) ))
	then return 0
	else return 1
	fi
    }
    mbfl_location_leave
}


# mpfr_fits_slong_p

function conversion-mpfr_fits_slong_p-1.1 () {
    declare -r	INITVAL=WW(mmux_slong_MAX)
    declare	ROP OP

    mbfl_location_enter
    {
	if mpfr_alloc_and_init OP
	then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_si WW(OP) WW(INITVAL) WW(MPFR_RNDD)
	then mbfl_location_leave_then_return_failure
	fi

	#mpfr_just_printit_dammit WW(OP) >&2
	if ! mpfr_fits_slong_p WW(OP) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	if (( 1 == WW(MPFR_RV) ))
	then return 0
	else return 1
	fi
    }
    mbfl_location_leave
}
function conversion-mpfr_fits_slong_p-1.2 () {
    declare -r	INITVAL=WW(mmux_slong_MIN)
    declare	ROP OP

    mbfl_location_enter
    {
	if mpfr_alloc_and_init OP
	then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_si WW(OP) WW(INITVAL) WW(MPFR_RNDU)
	then mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_fits_slong_p WW(OP) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	if (( 1 == WW(MPFR_RV) ))
	then return 0
	else return 1
	fi
    }
    mbfl_location_leave
}


# mpfr_fits_ulong_p

function conversion-mpfr_fits_ulong_p-1.1 () {
    declare -r	INITVAL=WW(mmux_ulong_MAX)
    declare	ROP OP

    mbfl_location_enter
    {
	if mpfr_alloc_and_init OP
	then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_ui WW(OP) WW(INITVAL) WW(MPFR_RNDD)
	then mbfl_location_leave_then_return_failure
	fi

	#mpfr_just_printit_dammit WW(OP) >&2
	if ! mpfr_fits_ulong_p WW(OP) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	if (( 1 == WW(MPFR_RV) ))
	then return 0
	else return 1
	fi
    }
    mbfl_location_leave
}
function conversion-mpfr_fits_ulong_p-1.2 () {
    declare -r	INITVAL=WW(mmux_ulong_MIN)
    declare	ROP OP

    mbfl_location_enter
    {
	if mpfr_alloc_and_init OP
	then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_ui WW(OP) WW(INITVAL) WW(MPFR_RNDU)
	then mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_fits_ulong_p WW(OP) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	if (( 1 == WW(MPFR_RV) ))
	then return 0
	else return 1
	fi
    }
    mbfl_location_leave
}


# mpfr_fits_intmax_p

function conversion-mpfr_fits_intmax_p-1.1 () {
    declare -r	INITVAL=WW(mmux_sintmax_MAX)
    declare	ROP OP

    mbfl_location_enter
    {
	if mpfr_alloc_and_init OP
	then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_sj WW(OP) WW(INITVAL) WW(MPFR_RNDD)
	then mbfl_location_leave_then_return_failure
	fi

	#mpfr_just_printit_dammit WW(OP) >&2
	if ! mpfr_fits_intmax_p WW(OP) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	if (( 1 == WW(MPFR_RV) ))
	then return 0
	else return 1
	fi
    }
    mbfl_location_leave
}
function conversion-mpfr_fits_intmax_p-1.2 () {
    declare -r	INITVAL=WW(mmux_sintmax_MIN)
    declare	ROP OP

    mbfl_location_enter
    {
	if mpfr_alloc_and_init OP
	then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_sj WW(OP) WW(INITVAL) WW(MPFR_RNDU)
	then mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_fits_intmax_p WW(OP) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	if (( 1 == WW(MPFR_RV) ))
	then return 0
	else return 1
	fi
    }
    mbfl_location_leave
}


# mpfr_fits_uintmax_p

function conversion-mpfr_fits_uintmax_p-1.1 () {
    declare -r	INITVAL=WW(mmux_uintmax_MAX)
    declare	ROP OP

    mbfl_location_enter
    {
	if mpfr_alloc_and_init OP
	then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_uj WW(OP) WW(INITVAL) WW(MPFR_RNDD)
	then mbfl_location_leave_then_return_failure
	fi

	#mpfr_just_printit_dammit WW(OP) >&2
	if ! mpfr_fits_uintmax_p WW(OP) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	if (( 1 == WW(MPFR_RV) ))
	then return 0
	else return 1
	fi
    }
    mbfl_location_leave
}
function conversion-mpfr_fits_uintmax_p-1.2 () {
    declare -r	INITVAL=WW(mmux_uintmax_MIN)
    declare	ROP OP

    mbfl_location_enter
    {
	if mpfr_alloc_and_init OP
	then mbfl_location_handler "mpfr_clear_and_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_uj WW(OP) WW(INITVAL) WW(MPFR_RNDU)
	then mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_fits_uintmax_p WW(OP) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	if (( 1 == WW(MPFR_RV) ))
	then return 0
	else return 1
	fi
    }
    mbfl_location_leave
}


#### let's go

dotest conversion-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
