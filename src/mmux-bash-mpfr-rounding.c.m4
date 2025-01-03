/*
  Part of: MMUX Bash MPFR
  Contents: implementation of rounding builtins
  Date: Oct 21, 2024

  Abstract

	This module implements rounding builtins.

  Copyright (C) 2024, 2025 Marco Maggi <mrc.mgg@gmail.com>

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
 ** Rounding builtins.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mpfr_set_default_rounding_mode]]])
{
  mpfr_rnd_t	rnd;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_MPFR_RND([[[rnd]]],	[[[1]]]);
  {
    mpfr_set_default_rounding_mode(rnd);
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MPFR_RND"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER[[[]]](RND)."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mpfr_get_default_rounding_mode]]])
{
  mpfr_rnd_t	rnd = mpfr_get_default_rounding_mode();
  return mmux_mpfr_rnd_bind_to_bash_variable(argv[1], rnd, MMUX_BASH_BUILTIN_STRING_NAME);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MPFR_RNDVAR"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER[[[]]](RNDVAR)."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mpfr_prec_round]]])
{
  mpfr_ptr	op;
  mpfr_prec_t	prec;
  mpfr_rnd_t	rnd;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_MPFR_PTR([[[op]]],	[[[1]]]);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_MPFR_PREC([[[prec]]],	[[[2]]]);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_MPFR_RND([[[rnd]]],	[[[3]]]);
  {
    int		rv = mpfr_prec_round(op, prec, rnd);
    return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MPFR_RND"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER[[[]]](RND)."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mpfr_can_round]]])
{
  mpfr_ptr	B;
  mpfr_exp_t	err;
  mpfr_rnd_t	rnd1, rnd2;
  mpfr_prec_t	prec;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_MPFR_PTR([[[B]]],	[[[1]]]);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_MPFR_EXP([[[err]]],	[[[2]]]);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_MPFR_RND([[[rnd1]]],	[[[3]]]);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_MPFR_RND([[[rnd2]]],	[[[4]]]);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_MPFR_PREC([[[prec]]],	[[[5]]]);
  {
    int		rv = mpfr_can_round(B, err, rnd1, rnd2, prec);
    return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(6 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MPFR_B MPFR_EXP MPFR_RND1 MPFR_RND2 MPFR_PREC"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER[[[]]](B,EXP,RND1,RND2,PREC)."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mpfr_min_prec]]])
{
  mpfr_ptr	op;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_MPFR_PTR([[[op]]],	[[[2]]]);
  {
    mpfr_prec_t		prec = mpfr_min_prec(op);
    return mmux_mpfr_prec_bind_to_bash_variable(argv[1], prec, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MPFR_PRECVAR MPFR_OP"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER[[[]]](PRECVAR,OP)."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mpfr_print_rnd_mode]]])
{
  mpfr_rnd_t	rnd;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_MPFR_RND([[[rnd]]],	[[[2]]]);
  {
    char const * const	s_rnd = mpfr_print_rnd_mode(rnd);

    return mmux_string_bind_to_bash_variable(argv[1], s_rnd, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER STRVAR MPFR_RND"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER[[[]]](STRVAR,RND)."]]])

/* end of file */
