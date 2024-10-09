/*
  Part of: MMUX Bash MPFR
  Contents: implementation of arithmetic builtins
  Date: Oct  9, 2024

  Abstract

	This module implements conversion builtins.

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
 ** Simple addition.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_SIMPLE_ADDER]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$4]]],[[[
static int
$1_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"$1"
{
  mpfr_ptr	rop, op1;
  mmux_$2_t	op2;
  mpfr_rnd_t	rnd;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[rop]]],	[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op1]]],	[[[argv[2]]]]);
  $3([[[op2]]],						[[[argv[3]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_RND([[[rnd]]],	[[[argv[4]]]]);
  {
    int		rv = $1(rop, op1, op2, rnd);
    return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BUILTIN_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[$1]]],
    [[[(5 == argc)]]],
    [[["$1 MPFR_ROP MPFR_OP1 OP2 MPFR_RND"]]],
    [[["Add two numbers, store the result in ROP."]]])
]]])]]])

DEFINE_SIMPLE_ADDER([[[mpfr_add_si]]],	[[[slong]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_SLONG]]])
DEFINE_SIMPLE_ADDER([[[mpfr_add_ui]]],	[[[ulong]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_ULONG]]])
DEFINE_SIMPLE_ADDER([[[mpfr_add_d]]],	[[[double]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_DOUBLE]]])

/* ------------------------------------------------------------------ */

static int
mpfr_add_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_add"
{
  mpfr_ptr		rop, op1, op2;
  mpfr_rnd_t		rnd;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[rop]]],	[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op1]]],	[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op2]]],	[[[argv[3]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_RND([[[rnd]]],	[[[argv[4]]]]);
  {
    int		rv = mpfr_add(rop, op1, op2, rnd);
    return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BUILTIN_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_add]]],
    [[[(5 == argc)]]],
    [[["mpfr_add MPFR_ROP MPFR_OP1 MPFR_OP2 MPFR_RND"]]],
    [[["Add two numbers, store the result in ROP."]]])

/* end of file */
