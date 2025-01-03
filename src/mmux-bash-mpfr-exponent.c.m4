/*
  Part of: MMUX Bash MPFR
  Contents: implementation of exponent builtins
  Date: Oct 21, 2024

  Abstract

	This module implements exponent builtins.

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
 ** Exponent builtins.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mpfr_set_exp]]])
{
  mpfr_ptr	op;
  mpfr_exp_t	exp;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_MPFR_PTR([[[op]]],	[[[1]]]);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_MPFR_EXP([[[exp]]],	[[[2]]]);
  {
    int		rv = mpfr_set_exp(op,exp);
    return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MPFR_OP MPFR_EXP"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER[[[]]](OP,EXP)."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mpfr_get_exp]]])
{
  mpfr_ptr	op;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_MPFR_PTR([[[op]]],	[[[2]]]);
  {
    mpfr_exp_t		exp	= mpfr_get_exp(op);
    return mmux_mpfr_exp_bind_to_bash_variable(argv[1], exp, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MPFR_EXPVAR MPFR_OP"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER[[[]]](EXPVAR,OP)."]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_EXPONENT_GETTER]]],[[[MMUX_BASH_BUILTIN_MAIN([[[$1]]])
{
  mpfr_exp_t	exp= mpfr_get_emin();
  return mmux_mpfr_exp_bind_to_bash_variable(argv[1], exp, MMUX_BASH_BUILTIN_STRING_NAME);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MPFR_EXPVAR"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER[[[]]](EXPVAR)."]]])
]]])

DEFINE_EXPONENT_GETTER([[[mpfr_get_emin]]])
DEFINE_EXPONENT_GETTER([[[mpfr_get_emax]]])
DEFINE_EXPONENT_GETTER([[[mpfr_get_emin_min]]])
DEFINE_EXPONENT_GETTER([[[mpfr_get_emin_max]]])
DEFINE_EXPONENT_GETTER([[[mpfr_get_emax_min]]])
DEFINE_EXPONENT_GETTER([[[mpfr_get_emax_max]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_EXPONENT_SETTER]]],[[[MMUX_BASH_BUILTIN_MAIN([[[$1]]])
{
  mpfr_exp_t	exp;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_MPFR_EXP([[[exp]]],	[[[1]]]);
  {
    int		rv = $1(exp);
    return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MPFR_EXPVAR"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER[[[]]](EXPVAR)."]]])
]]])

DEFINE_EXPONENT_SETTER([[[mpfr_set_emin]]])
DEFINE_EXPONENT_SETTER([[[mpfr_set_emax]]])

/* end of file */
