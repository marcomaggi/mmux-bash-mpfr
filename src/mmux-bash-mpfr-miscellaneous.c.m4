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


/** --------------------------------------------------------------------
 ** Miscellaneous.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mpfr_check_range]]])
{
  mpfr_ptr	op;
  mmux_sint_t	T;
  mpfr_rnd_t	rnd;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op]]],	[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[T]]],		[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_RND([[[rnd]]],	[[[argv[3]]]]);
  {
    int		rv = mpfr_check_range(op, T, rnd);
    return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BUILTIN_NAME_STR);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MPFR_OP SINT_T MPFR_RND"]]],
    [[["Computer MMUX_BASH_BUILTIN_IDENTIFIER[[[]]](OP,T,RND)."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mpfr_subnormalize]]])
{
  mpfr_ptr	op;
  mmux_sint_t	T;
  mpfr_rnd_t	rnd;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op]]],	[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[T]]],		[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_RND([[[rnd]]],	[[[argv[3]]]]);
  {
    int		rv = mpfr_subnormalize(op, T, rnd);
    return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BUILTIN_NAME_STR);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MPFR_OP SINT_T MPFR_RND"]]],
    [[["Computer MMUX_BASH_BUILTIN_IDENTIFIER[[[]]](OP,T,RND)."]]])


/* end of file */
