#!#
#!# Part of: MMUX Bash MPFR
#!# Contents: tests for setter builtins
#!# Date: Sep 15, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/setters.test ; less tests/setters.log
#!#
#!#	that will select these tests.
#!#
#!# Copyright (c) 2024 Marco Maggi
#!# <mrc.mgg@gmail.com>
#!#
#!# The author hereby  grants permission to use,  copy, modify, distribute, and  license this software
#!# and its documentation  for any purpose, provided  that existing copyright notices  are retained in
#!# all copies and that this notice is  included verbatim in any distributions.  No written agreement,
#!# license,  or royalty  fee is  required for  any  of the  authorized uses.   Modifications to  this
#!# software may  be copyrighted by their  authors and need  not follow the licensing  terms described
#!# here, provided that the new terms are clearly indicated  on the first page of each file where they
#!# apply.
#!#
#!# IN NO EVENT SHALL THE AUTHOR OR DISTRIBUTORS BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, SPECIAL,
#!# INCIDENTAL, OR CONSEQUENTIAL DAMAGES  ARISING OUT OF THE USE OF  THIS SOFTWARE, ITS DOCUMENTATION,
#!# OR ANY  DERIVATIVES THEREOF,  EVEN IF  THE AUTHOR  HAVE BEEN  ADVISED OF  THE POSSIBILITY  OF SUCH
#!# DAMAGE.
#!#
#!# THE AUTHOR AND  DISTRIBUTORS SPECIFICALLY DISCLAIM ANY WARRANTIES, INCLUDING,  BUT NOT LIMITED TO,
#!# THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT.
#!# THIS  SOFTWARE IS  PROVIDED  ON AN  \"AS  IS\" BASIS,  AND  THE AUTHOR  AND  DISTRIBUTORS HAVE  NO
#!# OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
#!#


#### macros

MBFL_DEFINE_QQ_MACRO
MBFL_DEFINE_UNDERSCORE_MACRO_FOR_SLOTS


#### setup

mbfl_embed_library(__LIBMBFL_LINKER__)
mbfl_linker_source_library_by_stem(core)
mbfl_linker_source_library_by_stem(tests)

source WW(MMUX_LIBRARY)


#### setters: slong

function mpfr-set-slong-1.1 () {
    declare -r EXPECTED_RESULT='0.123000e3'
    declare OP RESULT

    dotest-unset-debug
    dotest-debug mpfr_SIZEOF_MPFR=WW(mpfr_SIZEOF_MPFR)

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug OP=WW(OP)

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_si WW(OP) '123' WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-debug WW(RESULT)
    }
    mbfl_location_leave
    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
}
function mpfr-set-slong-1.2 () {
    declare -r EXPECTED_RESULT='-0.123000e3'
    declare OP RESULT

    dotest-unset-debug
    dotest-debug mpfr_SIZEOF_MPFR=WW(mpfr_SIZEOF_MPFR)

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug OP=WW(OP)

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_si WW(OP) '-123' WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-debug WW(RESULT)
    }
    mbfl_location_leave
    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
}


#### setters: ulong

function mpfr-set-ulong-1.1 () {
    declare -r EXPECTED_RESULT='0.123000e3'
    declare OP RESULT

    dotest-unset-debug
    dotest-debug mpfr_SIZEOF_MPFR=WW(mpfr_SIZEOF_MPFR)

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug OP=WW(OP)

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_ui WW(OP) '123' WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-debug WW(RESULT)
    }
    mbfl_location_leave
    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
}


#### setters: sintmax

function mpfr-set-sintmax-1.1 () {
    declare -r EXPECTED_RESULT='0.123000e3'
    declare OP RESULT

    dotest-unset-debug
    dotest-debug mpfr_SIZEOF_MPFR=WW(mpfr_SIZEOF_MPFR)

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug OP=WW(OP)

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_sj WW(OP) '123' WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-debug WW(RESULT)
    }
    mbfl_location_leave
    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
}
function mpfr-set-sintmax-1.2 () {
    declare -r EXPECTED_RESULT='-0.123000e3'
    declare OP RESULT

    dotest-unset-debug
    dotest-debug mpfr_SIZEOF_MPFR=WW(mpfr_SIZEOF_MPFR)

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug OP=WW(OP)

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_sj WW(OP) '-123' WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-debug WW(RESULT)
    }
    mbfl_location_leave
    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
}


#### setters: uintmax

function mpfr-set-uintmax-1.1 () {
    declare -r EXPECTED_RESULT='0.123000e3'
    declare OP RESULT

    dotest-unset-debug
    dotest-debug mpfr_SIZEOF_MPFR=WW(mpfr_SIZEOF_MPFR)

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug OP=WW(OP)

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_uj WW(OP) '123' WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-debug WW(RESULT)
    }
    mbfl_location_leave
    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
}


#### setters: float

function mpfr-set-float-1.1 () {
    declare -r EXPECTED_RESULT='0.123457e3'
    declare OP RESULT

    #dotest-set-debug
    dotest-debug mpfr_SIZEOF_MPFR=WW(mpfr_SIZEOF_MPFR)

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug OP=WW(OP)

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_flt WW(OP) '123.4567890' WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-debug WW(RESULT)
    }
    mbfl_location_leave
    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
}


#### setters: double

function mpfr-set-double-1.1 () {
    declare -r EXPECTED_RESULT='0.123457e3'
    declare OP RESULT

    #dotest-set-debug
    dotest-debug mpfr_SIZEOF_MPFR=WW(mpfr_SIZEOF_MPFR)

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug OP=WW(OP)

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_d WW(OP) '123.4567890' WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-debug WW(RESULT)
    }
    mbfl_location_leave
    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
}


#### setters: ldouble

if mmux_bash_pointers_builtin_p 'mpfr_set_ld'
then

function mpfr-set-ldouble-1.1 () {
    declare -r EXPECTED_RESULT='0.123000e3'
    declare OP RESULT

    dotest-unset-debug
    dotest-debug mpfr_SIZEOF_MPFR=WW(mpfr_SIZEOF_MPFR)

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug OP=WW(OP)

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_ld WW(OP) WW(mmux_libc_MAX_LDOUBLE) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-debug WW(RESULT)
    }
    mbfl_location_leave
    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
}

fi


#### setters: float128

if mmux_bash_pointers_builtin_p 'mpfr_set_float128'
then

function mpfr-set-float128-1.1 () {
    declare -r EXPECTED_RESULT='0.123457e3'
    declare OP RESULT

    #dotest-set-debug
    dotest-debug mpfr_SIZEOF_MPFR=WW(mpfr_SIZEOF_MPFR)

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug OP=WW(OP)

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_float128 WW(OP) '123.4567890' WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-debug WW(RESULT)
    }
    mbfl_location_leave
    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
}

fi


#### setters: decimal64

if mmux_bash_pointers_builtin_p 'mpfr_set_decimal64'
then

function mpfr-set-decimal64-1.1 () {
    declare -r EXPECTED_RESULT='0.123457e3'
    declare OP RESULT

    #dotest-set-debug
    dotest-debug mpfr_SIZEOF_MPFR=WW(mpfr_SIZEOF_MPFR)

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug OP=WW(OP)

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_decimal64 WW(OP) '123.4567890' WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-debug WW(RESULT)
    }
    mbfl_location_leave
    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
}

fi


#### setters: decimal128

if mmux_bash_pointers_builtin_p 'mpfr_set_decimal128'
then

function mpfr-set-decimal128-1.1 () {
    declare -r EXPECTED_RESULT='0.123457e3'
    declare OP RESULT

    #dotest-set-debug
    dotest-debug mpfr_SIZEOF_MPFR=WW(mpfr_SIZEOF_MPFR)

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug OP=WW(OP)

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_decimal128 WW(OP) '123.4567890' WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-debug WW(RESULT)
    }
    mbfl_location_leave
    dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
}

fi


#### setters: mpfr

function mpfr-set-1.1 () {
    declare -r EXPECTED_RESULT='0.123457e3'
    declare OP1 OP2 RESULT

    mbfl_location_enter
    {
	if mmux_libc_calloc OP1 WW(mpfr_SIZEOF_MPFR) 2
	then mbfl_location_handler "mmux_libc_free WW(OP1)"
	else mbfl_location_leave_then_return_failure
	fi

	mmux_pointer_add OP2 WW(OP1) WW(mpfr_SIZEOF_MPFR)

	if mpfr_init WW(OP1)
	then mbfl_location_handler "mpfr_clear WW(OP1)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP2)
	then mbfl_location_handler "mpfr_clear WW(OP2)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_d WW(OP1) '123.4567890' WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set WW(OP2) WW(OP1) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP2))
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}


#### setters: mpfr_set_si_2exp

### $ octave --eval 'format long ; 123 * 2^45'
# =>  4327677766926336
# 98765432109876543210
function mpfr-set-si-2exp-1.1 () {
    declare -r MANT='123' EXP='45' EXPECTED_RESULT='0.432768e16'
    declare OP RESULT

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_si_2exp WW(OP) WW(MANT) WW(EXP) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}
function mpfr-set-si-2exp-1.2 () {
    declare -r MANT='-123' EXP='45' EXPECTED_RESULT='-0.432768e16'
    declare OP RESULT

    dotest-unset-debug

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug WW(OP) WW(MANT) WW(EXP) WW(MPFR_RNDN)
	if ! mpfr_set_si_2exp WW(OP) WW(MANT) WW(EXP) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}


#### setters: mpfr_set_ui_2exp

### $ octave --eval 'format long ; 123 * 2^45'
# =>  4327677766926336
# 98765432109876543210
function mpfr-set-ui-2exp-1.1 () {
    declare -r MANT='123' EXP='45' EXPECTED_RESULT='0.432768e16'
    declare OP RESULT

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_ui_2exp WW(OP) WW(MANT) WW(EXP) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}


#### setters: mpfr_set_sj_2exp

### $ octave --eval 'format long ; 123 * 2^45'
# =>  4327677766926336
# 98765432109876543210
function mpfr-set-sj-2exp-1.1 () {
    declare -r MANT='123' EXP='45' EXPECTED_RESULT='0.432768e16'
    declare OP RESULT

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_sj_2exp WW(OP) WW(MANT) WW(EXP) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}
function mpfr-set-sj-2exp-1.2 () {
    declare -r MANT='-123' EXP='45' EXPECTED_RESULT='-0.432768e16'
    declare OP RESULT

    dotest-unset-debug

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug WW(OP) WW(MANT) WW(EXP) WW(MPFR_RNDN)
	if ! mpfr_set_sj_2exp WW(OP) WW(MANT) WW(EXP) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}


#### setters: mpfr_set_uj_2exp

### $ octave --eval 'format long ; 123 * 2^45'
# =>  4327677766926336
# 98765432109876543210
function mpfr-set-uj-2exp-1.1 () {
    declare -r MANT='123' EXP='45' EXPECTED_RESULT='0.432768e16'
    declare OP RESULT

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_uj_2exp WW(OP) WW(MANT) WW(EXP) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}


#### setters: mpfr_set_str

function mpfr-set-str-1.1 () {
    declare -r STR='1234567890' BASE='10' EXPECTED_RESULT='0.123457e10'
    declare OP RESULT

    dotest-unset-debug

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug WW(OP) WW(STR) WW(BASE) WW(MPFR_RNDN)

	if ! mpfr_set_str WW(OP) WW(STR) WW(BASE) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-debug WW(EXPECTED_RESULT) WW(RESULT)
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}
function mpfr-set-str-1.2 () {
    declare -r STR='-1234567890' BASE='10' EXPECTED_RESULT='-0.123457e10'
    declare OP RESULT

    dotest-unset-debug

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	dotest-debug WW(OP) WW(STR) WW(BASE) WW(MPFR_RNDN)

	if ! mpfr_set_str WW(OP) WW(STR) WW(BASE) WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-debug WW(EXPECTED_RESULT) WW(RESULT)
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}


#### setters: mpfr_set_nan

function mpfr-set-nan-1.1 () {
    declare -r EXPECTED_RESULT='@NaN@'
    declare OP RESULT

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_nan WW(OP)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}


#### setters: mpfr_set_inf

function mpfr-set-inf-1.1 () {
    declare -r EXPECTED_RESULT='+@Inf@'
    declare OP RESULT

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_inf WW(OP) 1
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}
function mpfr-set-inf-1.2 () {
    declare -r EXPECTED_RESULT='-@Inf@'
    declare OP RESULT

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_inf WW(OP) -1
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}
function mpfr-set-inf-1.3 () {
    declare -r EXPECTED_RESULT='+@Inf@'
    declare OP RESULT

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_inf WW(OP) 0
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}


#### setters: mpfr_set_zero

function mpfr-set-zero-1.1 () {
    declare -r EXPECTED_RESULT='0.000000e0'
    declare OP RESULT

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_zero WW(OP) 1
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}
function mpfr-set-zero-1.2 () {
    declare -r EXPECTED_RESULT='-0.000000e0'
    declare OP RESULT

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_zero WW(OP) -1
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}
function mpfr-set-zero-1.3 () {
    declare -r EXPECTED_RESULT='0.000000e0'
    declare OP RESULT

    mbfl_location_enter
    {
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
	then mbfl_location_handler "mmux_libc_free WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP)
	then mbfl_location_handler "mpfr_clear WW(OP)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_zero WW(OP) 0
	then mbfl_location_leave_then_return_failure
	fi

	RESULT=$(mpfr_just_printit_dammit WW(OP))
	dotest-equal WW(EXPECTED_RESULT) WW(RESULT)
    }
    mbfl_location_leave
}


#### setters: mpfr_swap

function mpfr-swap-1.1 () {
    declare -r EXPECTED_RESULT1='0.456000e3' EXPECTED_RESULT2='0.123000e3'
    declare OP1 OP2 RESULT1 RESULT2

    mbfl_location_enter
    {
	if mmux_libc_calloc OP1 WW(mpfr_SIZEOF_MPFR) 2
	then mbfl_location_handler "mmux_libc_free WW(OP1)"
	else mbfl_location_leave_then_return_failure
	fi

	mmux_pointer_add OP2 WW(OP1) WW(mpfr_SIZEOF_MPFR)

	if mpfr_init WW(OP1)
	then mbfl_location_handler "mpfr_clear WW(OP1)"
	else mbfl_location_leave_then_return_failure
	fi

	if mpfr_init WW(OP2)
	then mbfl_location_handler "mpfr_clear WW(OP2)"
	else mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_si WW(OP1) '123' WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_set_si WW(OP2) '456' WW(MPFR_RNDN)
	then mbfl_location_leave_then_return_failure
	fi

	if ! mpfr_swap WW(OP1) WW(OP2)
	then mbfl_location_leave_then_return_failure
	fi

	RESULT1=$(mpfr_just_printit_dammit WW(OP1))
	RESULT2=$(mpfr_just_printit_dammit WW(OP2))

	dotest-equal     WW(EXPECTED_RESULT1) WW(RESULT1) &&
	    dotest-equal WW(EXPECTED_RESULT2) WW(RESULT2)
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
