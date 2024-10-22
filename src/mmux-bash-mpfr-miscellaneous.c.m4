/*
  Part of: MMUX Bash MPFR
  Contents: implementation of misc builtins
  Date: Oct 21, 2024

  Abstract

	This module implements misc builtins.

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
 ** MPFR inspection.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_NULLARY_PREDICATE]]],[[[MMUX_BASH_BUILTIN_MAIN([[[$1]]])
{
  return ($1())? MMUX_SUCCESS : MMUX_FAILURE;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(1 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER."]]])
]]])

DEFINE_NULLARY_PREDICATE([[[mpfr_buildopt_tls_p]]])
DEFINE_NULLARY_PREDICATE([[[mpfr_buildopt_float128_p]]])
DEFINE_NULLARY_PREDICATE([[[mpfr_buildopt_decimal_p]]])
DEFINE_NULLARY_PREDICATE([[[mpfr_buildopt_gmpinternals_p]]])
DEFINE_NULLARY_PREDICATE([[[mpfr_buildopt_sharedcache_p]]])

MMUX_BASH_BUILTIN_MAIN([[[mpfr_get_patches]]])
{
  int	rv = printf("%s\n", mpfr_get_patches());
  return (rv >= 0)? MMUX_SUCCESS : MMUX_FAILURE;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(1 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER."]]])

MMUX_BASH_BUILTIN_MAIN([[[mpfr_buildopt_tune_case]]])
{
  int	rv = printf("%s\n", mpfr_buildopt_tune_case());
  return (rv >= 0)? MMUX_SUCCESS : MMUX_FAILURE;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(1 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER."]]])

/* end of file */
