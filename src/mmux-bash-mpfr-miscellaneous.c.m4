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
 ** Miscellaneous builtins.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mpfr_nexttoward]]])
{
  mpfr_ptr	op1, op2;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op1]]],	[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op2]]],	[[[argv[2]]]]);
  {
    mpfr_nexttoward(op1, op2);
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MPFR_OP1 MPFR_OP2"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER(OP1,OP2)."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mpfr_nextabove]]])
{
  mpfr_ptr	op;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op]]],	[[[argv[1]]]]);
  {
    mpfr_nextabove(op);
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MPFR_OP"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER(OP)."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mpfr_nextbelow]]])
{
  mpfr_ptr	op;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op]]],	[[[argv[1]]]]);
  {
    mpfr_nextbelow(op);
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MPFR_OP"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER(OP)."]]])

/* ------------------------------------------------------------------ */

DEFINE_BINARY_BUILTIN([[[mpfr_min]]])
DEFINE_BINARY_BUILTIN([[[mpfr_max]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mpfr_set_exp]]])
{
  mpfr_ptr	op;
  mpfr_exp_t	exp;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op]]],	[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_EXP([[[exp]]],	[[[argv[2]]]]);
  {
    int		rv = mpfr_set_exp(op,exp);
    return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BUILTIN_NAME_STR);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MPFR_OP MPFR_EXP"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER(OP,EXP)."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mpfr_get_exp]]])
{
  mpfr_ptr	op;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op]]],	[[[argv[2]]]]);
  {
    mpfr_exp_t		exp	= mpfr_get_exp(op);
    return mmux_mpfr_exp_bind_to_variable(argv[1], exp, MMUX_BUILTIN_NAME_STR);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MPFR_EXPVAR MPFR_OP"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER(EXPVAR,OP)."]]])

/* ------------------------------------------------------------------ */

DEFINE_PREDICATE_BUILTIN([[[mpfr_signbit]]])
DEFINE_BINARY_BUILTIN([[[mpfr_copysign]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mpfr_setsign]]])
{
  mpfr_ptr	rop, op;
  mmux_sint_t	sign;
  mpfr_rnd_t	rnd;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[rop]]],	[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op]]],	[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[sign]]],		[[[argv[3]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_RND([[[rnd]]],	[[[argv[4]]]]);
  {
    int		rv = mpfr_setsign(rop, op, sign, rnd);
    return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BUILTIN_NAME_STR);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(5 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MPFR_ROP MPFR_OP SINT_SIGN MPFR_RND"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER(ROP,OP,SIGN,RND)."]]])


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

/* end of file */
