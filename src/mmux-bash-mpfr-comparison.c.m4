/*
  Part of: MMUX Bash MPFR
  Contents: implementation of comparison builtins
  Date: Oct  3, 2024

  Abstract

	This module implements comparison builtins.

  Copyright (C) 2024 Marco Maggi <mrc.mgg@gmail.com>

  This program is free  software: you can redistribute it and/or  modify it under the
  terms of the  GNU Lesser General Public  License as published by  the Free Software
  Foundation, either version 3 of the License, or (at your option) any later version.

  This program  is distributed in the  hope that it  will be useful, but  WITHOUT ANY
  WARRANTY; without  even the implied  warranty of  MERCHANTABILITY or FITNESS  FOR A
  PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public License along with
  this program.  If not, see <http://www.gnu.org/licenses/>.
*/


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#include "mmux-bash-mpfr-internals.h"


/** --------------------------------------------------------------------
 ** Predicates.
 ** ----------------------------------------------------------------- */

m4_dnl $1 - the predicate function
m4_dnl $2 - argument description for the short doc
m4_define([[[DEFINE_PREDICATE_BUILTIN]]],[[[
static int
$1_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"$1"
{
  mpfr_ptr	op;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op]]],	[[[argv[1]]]]);
  return ($1(op))? MMUX_SUCCESS : MMUX_FAILURE;
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[$1]]],
    [[[(2 == argc)]]],
    [[["$1 MPFR_OP"]]],
    [[["Return true if OP is a representation of $2; otherwise return false."]]])
]]])

DEFINE_PREDICATE_BUILTIN([[[mpfr_nan_p]]],	[[[not-a-number]]])
DEFINE_PREDICATE_BUILTIN([[[mpfr_inf_p]]],	[[[infinity]]])
DEFINE_PREDICATE_BUILTIN([[[mpfr_number_p]]],	[[[an ordinary number]]])
DEFINE_PREDICATE_BUILTIN([[[mpfr_zero_p]]],	[[[zero]]])
DEFINE_PREDICATE_BUILTIN([[[mpfr_regular_p]]],	[[[a regular number]]])


/** --------------------------------------------------------------------
 ** Misc.
 ** ----------------------------------------------------------------- */

static int
mpfr_sgn_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_sgn"
{
  mpfr_ptr	op;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op]]],	[[[argv[2]]]]);
  {
    int	rv = mpfr_sgn(op);
    return mmux_bash_pointers_store_result_in_variable_sint(argv[1], rv, MMUX_BUILTIN_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_sgn]]],
    [[[(3 == argc)]]],
    [[["mpfr_sgn SIGNVAR MPFR_OP"]]],
    [[["Store in SIGNVAR +1, 0, -1 depending on the sign of MPFR_OP."]]])

/* end of file */