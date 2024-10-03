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


#### just printing

function mpfr-just-printit-dammit-1.1 () {
    declare -r EXPECTED_RESULT='0.123457e3'
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
	if mmux_libc_calloc OP WW(mpfr_SIZEOF_MPFR) 1
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
