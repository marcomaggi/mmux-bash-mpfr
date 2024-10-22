#!#
#!# Part of: MMUX Bash MPFR
#!# Contents: tests for miscellaneous builtins
#!# Date: Oct 21, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/miscellaneous.test ; less tests/miscellaneous.log
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


#### MPFR inspection

function miscellaneous-mpfr_buildopt_tls_p-1.1 () {
    mpfr_buildopt_tls_p
    printf '%s: build option is set: %d\n' WW(FUNCNAME) $? >&2
    true
}
function miscellaneous-mpfr_buildopt_float128_p-1.1 () {
    mpfr_buildopt_float128_p
    printf '%s: build option is set: %d\n' WW(FUNCNAME) $? >&2
    true
}
function miscellaneous-mpfr_buildopt_decimal_p-1.1 () {
    mpfr_buildopt_decimal_p
    printf '%s: build option is set: %d\n' WW(FUNCNAME) $? >&2
    true
}
function miscellaneous-mpfr_buildopt_gmpinternals_p-1.1 () {
    mpfr_buildopt_gmpinternals_p
    printf '%s: build option is set: %d\n' WW(FUNCNAME) $? >&2
    true
}
function miscellaneous-mpfr_buildopt_sharedcache_p-1.1 () {
    mpfr_buildopt_sharedcache_p
    printf '%s: build option is set: %d\n' WW(FUNCNAME) $? >&2
    true
}

function miscellaneous-mpfr_get_patches-1.1 () {
    mpfr_get_patches >&2
}
function miscellaneous-mpfr_buildopt_tune_case-1.1 () {
    mpfr_buildopt_tune_case >&2
}


#### let's go

dotest miscellaneous-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
