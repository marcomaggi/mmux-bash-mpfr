#!#
#!# Part of: MMUX Bash MPFR
#!# Contents: tests for memory builtins
#!# Date: Oct 24, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/memory.test ; less tests/memory.log
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


# mpfr_free_cache

function memory-mpfr_free_cache-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_free_cache
    then
	mpfr_free_cache
    else dotest-skipped
    fi
}


# mpfr_free_pool

function memory-mpfr_free_pool-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_free_pool
    then
	mpfr_free_pool
    else dotest-skipped
    fi
}


# mpfr_mp_memory_cleanup

function memory-mpfr_mp_memory_cleanup-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_mp_memory_cleanup
    then
	mpfr_mp_memory_cleanup
    else dotest-skipped
    fi
}


# mpfr_free_cache2

function memory-mpfr_free_cache2-1.1 () {
    if mmux_bash_pointers_builtin_p mpfr_free_cache2
    then
	mpfr_free_cache2 WW(MPFR_FREE_LOCAL_CACHE)
    else dotest-skipped
    fi
}
function memory-mpfr_free_cache2-1.2 () {
    if mmux_bash_pointers_builtin_p mpfr_free_cache2
    then
	mpfr_free_cache2 WW(MPFR_FREE_GLOBAL_CACHE)
    else dotest-skipped
    fi
}


#### let's go

dotest memory-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
