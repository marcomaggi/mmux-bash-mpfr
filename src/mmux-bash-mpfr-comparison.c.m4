/*
  Part of: MMUX Bash MPFR
  Contents: implementation of comparison builtins
  Date: Oct  3, 2024

  Abstract

	This module implements comparison builtins.

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
 ** Ternary functions.
 ** ----------------------------------------------------------------- */

m4_dnl $1 - function identifier
m4_dnl $2 - second operand type
m4_dnl $3 - second operand parser macro
m4_dnl $4 - C preprocessor symbol for conditional code
m4_define([[[DEFINE_COMPARISON_BUILTIN]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$4]]],[[[MMUX_BASH_BUILTIN_MAIN([[[$1]]])
{
  mpfr_ptr	op1;
  $2		 op2;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op1]]],	[[[argv[1]]]]);
  $3([[[op2]]],						[[[argv[2]]]]);
  {
    int		rv = $1(op1, op2);
    return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BUILTIN_NAME_STR);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MPFR_OP1 OP2"]]],
    [[["Compare the operands, store a ternary result in MPFR_RV."]]])
]]])]]])

DEFINE_COMPARISON_BUILTIN([[[mpfr_cmp]]],
			  [[[mpfr_ptr]]],
			  [[[MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR]]])
DEFINE_COMPARISON_BUILTIN([[[mpfr_cmp_si]]],
			  [[[mmux_slong_t]]],
			  [[[MMUX_BASH_PARSE_BUILTIN_ARG_SLONG]]])
DEFINE_COMPARISON_BUILTIN([[[mpfr_cmp_ui]]],
			  [[[mmux_ulong_t]]],
			  [[[MMUX_BASH_PARSE_BUILTIN_ARG_ULONG]]])
DEFINE_COMPARISON_BUILTIN([[[mpfr_cmp_d]]],
			  [[[mmux_double_t]]],
			  [[[MMUX_BASH_PARSE_BUILTIN_ARG_DOUBLE]]])
DEFINE_COMPARISON_BUILTIN([[[mpfr_cmp_ld]]],
			  [[[mmux_ldouble_t]]],
			  [[[MMUX_BASH_PARSE_BUILTIN_ARG_LDOUBLE]]],
			  [[[MMUX_HAVE_CC_TYPE_LDOUBLE]]])
DEFINE_COMPARISON_BUILTIN([[[mpfr_cmp_z]]],
			  [[[mpz_ptr]]],
			  [[[MMUX_BASH_PARSE_BUILTIN_ARG_MPZ_PTR]]])
DEFINE_COMPARISON_BUILTIN([[[mpfr_cmp_q]]],
			  [[[mpq_ptr]]],
			  [[[MMUX_BASH_PARSE_BUILTIN_ARG_MPQ_PTR]]])
DEFINE_COMPARISON_BUILTIN([[[mpfr_cmp_f]]],
			  [[[mpf_ptr]]],
			  [[[MMUX_BASH_PARSE_BUILTIN_ARG_MPF_PTR]]])


/** --------------------------------------------------------------------
 ** Ternary functions 2exp.
 ** ----------------------------------------------------------------- */

m4_dnl $1 - function identifier
m4_dnl $2 - second operand type
m4_dnl $3 - second operand parser macro
m4_dnl $4 - C preprocessor symbol for conditional code
m4_define([[[DEFINE_COMPARISON_BUILTIN]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$4]]],[[[MMUX_BASH_BUILTIN_MAIN([[[$1]]])
{
  mpfr_ptr	op1;
  $2		op2;
  mpfr_exp_t	expon;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op1]]],	[[[argv[1]]]]);
  $3([[[op2]]],						[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_EXP([[[expon]]],	[[[argv[3]]]]);
  {
    int		rv = $1(op1, op2, expon);
    return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BUILTIN_NAME_STR);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(4 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MPFR_OP1 OP2 EXPON"]]],
    [[["Compare OP1 with OP2*2^EXPON, store a ternary result in MPFR_RV."]]])
]]])]]])

DEFINE_COMPARISON_BUILTIN([[[mpfr_cmp_si_2exp]]],
			  [[[mmux_slong_t]]],
			  [[[MMUX_BASH_PARSE_BUILTIN_ARG_SLONG]]])
DEFINE_COMPARISON_BUILTIN([[[mpfr_cmp_ui_2exp]]],
			  [[[mmux_ulong_t]]],
			  [[[MMUX_BASH_PARSE_BUILTIN_ARG_ULONG]]])


/** --------------------------------------------------------------------
 ** Predicates.
 ** ----------------------------------------------------------------- */

m4_dnl $1 - the predicate function
m4_dnl $2 - argument description for the short doc
m4_define([[[DEFINE_PREDICATE_BUILTIN]]],[[[MMUX_BASH_BUILTIN_MAIN([[[$1]]])
{
  mpfr_ptr	op;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op]]],	[[[argv[1]]]]);
  {
    int		rv = $1(op);
    /* This is true if the predicate is satisfied. */
    rv = (rv)? 1 : 0;
    return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BUILTIN_NAME_STR);
  }
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

MMUX_BASH_BUILTIN_MAIN([[[mpfr_sgn]]])
{
  mpfr_ptr	op;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op]]],	[[[argv[1]]]]);
  {
    int	rv = mpfr_sgn(op);
    return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BUILTIN_NAME_STR);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_sgn]]],
    [[[(2 == argc)]]],
    [[["mpfr_sgn MPFR_OP"]]],
    [[["Store in MPFR_RV +1, 0, -1 depending on the sign of MPFR_OP."]]])

/* end of file */
