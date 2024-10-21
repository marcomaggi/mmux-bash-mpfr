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
 ** Rounding builtins.
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
DEFINE_BINARY_BUILTIN([[[mpfr_copysign]]])

/* end of file */
