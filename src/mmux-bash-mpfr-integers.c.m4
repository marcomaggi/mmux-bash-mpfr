/*
  Part of: MMUX Bash MPFR
  Contents: implementation of integers builtins
  Date: Oct 21, 2024

  Abstract

	This module implements integers builtins.

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
 ** Rounding builtins.
 ** ----------------------------------------------------------------- */

DEFINE_UNARY_BUILTIN([[[mpfr_rint]]])
DEFINE_UNARY_BUILTIN_NORND([[[mpfr_ceil]]])
DEFINE_UNARY_BUILTIN_NORND([[[mpfr_floor]]])
DEFINE_UNARY_BUILTIN_NORND([[[mpfr_round]]])
DEFINE_UNARY_BUILTIN_NORND([[[mpfr_roundeven]]])
DEFINE_UNARY_BUILTIN_NORND([[[mpfr_trunc]]])

DEFINE_UNARY_BUILTIN([[[mpfr_rint_ceil]]])
DEFINE_UNARY_BUILTIN([[[mpfr_rint_floor]]])
DEFINE_UNARY_BUILTIN([[[mpfr_rint_round]]])
DEFINE_UNARY_BUILTIN([[[mpfr_rint_roundeven]]])
DEFINE_UNARY_BUILTIN([[[mpfr_rint_trunc]]])

DEFINE_UNARY_BUILTIN([[[mpfr_frac]]])

DEFINE_BINARY_BUILTIN([[[mpfr_modf]]])
DEFINE_BINARY_BUILTIN([[[mpfr_fmod]]])
DEFINE_BINARY_UI_BUILTIN([[[mpfr_fmod_ui]]])
DEFINE_BINARY_BUILTIN([[[mpfr_remainder]]])

m4_dnl $1 - function/builtin identifier
m4_define([[[DEFINE_MODQUO_BUILTIN]]],[[[MMUX_BASH_BUILTIN_MAIN([[[$1]]])
{
  mpfr_ptr	R, X, Y;
  mmux_slong_t	Q;
  mpfr_rnd_t	rnd;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[R]]],		[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[X]]],		[[[argv[3]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[Y]]],		[[[argv[4]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_RND([[[rnd]]],	[[[argv[5]]]]);
  {
    int			rv = $1(R, &Q, X, Y, rnd);
    mmux_bash_rv_t	mmux_rv;

    mmux_rv = mmux_sint_bind_to_variable(argv[2], Q, MMUX_BUILTIN_NAME_STR);
    if (MMUX_SUCCESS == mmux_rv) {
      return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BUILTIN_NAME_STR);
    } else {
      return mmux_rv;
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(6 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MPFR_ROP MPFR_OP"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER(ROP,OP)."]]])
]]])

DEFINE_MODQUO_BUILTIN([[[mpfr_fmodquo]]])
DEFINE_MODQUO_BUILTIN([[[mpfr_remquo]]])

DEFINE_PREDICATE_BUILTIN([[[mpfr_integer_p]]],	[[[an integer number]]])

/* end of file */
