/*
  Part of: MMUX Bash MPFR
  Contents: implementation of memory builtins
  Date: Oct 24, 2024

  Abstract

	This module implements memory builtins.

  Copyright (C) 2024 Marco Maggi <mrc.mgg@gmail.com>

  This program is free  software: you can redistribute it and/or  modify it under the
  terms  of  the  GNU General  Public  License  as  published  by the  Free  Software
  Foundation, either version 3 of the License, or (at your option) any later version.

  This program  is distributed in the  hope that it  will be useful, but  WITHOUT ANY
  WARRANTY; without  even the implied  warranty of  MERCHANTABILITY or FITNESS  FOR A
  PARTICULAR PURPOSE.  See the GNU General Public License for more details.

  You should have received  a copy of the GNU General Public  License along with this
  program.  If not, see <http://www.gnu.org/licenses/>.
*/


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#include "mmux-bash-mpfr-internals.h"


/** --------------------------------------------------------------------
 ** Memory builtins.
 ** ----------------------------------------------------------------- */

DEFINE_VOID_VOID_BUILTIN([[[mpfr_free_cache]]])
DEFINE_VOID_VOID_BUILTIN([[[mpfr_free_pool]]])
DEFINE_INT_VOID_BUILTIN([[[mpfr_mp_memory_cleanup]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mpfr_free_cache2]]])
{
  mpfr_free_cache_t	way;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_FREE_CACHE([[[way]]],	[[[argv[1]]]]);
  {
    mpfr_free_cache2(way);
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MPFR_FREE_CACHE"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER[[[]]](MPFR_FREE_CACHE)."]]])

/* end of file */
