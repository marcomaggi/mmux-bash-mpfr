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

DEFINE_COMPARISON_BUILTIN([[[mpfr_cmpabs]]],
			  [[[mpfr_ptr]]],
			  [[[MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR]]])
DEFINE_COMPARISON_BUILTIN([[[mpfr_cmpabs_ui]]],
			  [[[mmux_ulong_t]]],
			  [[[MMUX_BASH_PARSE_BUILTIN_ARG_ULONG]]])


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

DEFINE_PREDICATE_BUILTIN([[[mpfr_nan_p]]],	[[[not-a-number]]])
DEFINE_PREDICATE_BUILTIN([[[mpfr_inf_p]]],	[[[infinity]]])
DEFINE_PREDICATE_BUILTIN([[[mpfr_number_p]]],	[[[an ordinary number]]])
DEFINE_PREDICATE_BUILTIN([[[mpfr_zero_p]]],	[[[zero]]])
DEFINE_PREDICATE_BUILTIN([[[mpfr_regular_p]]],	[[[a regular number]]])


/** --------------------------------------------------------------------
 ** Order predicates.
 ** ----------------------------------------------------------------- */

m4_dnl $1 - the predicate function
m4_dnl $2 - argument description for the short doc
m4_define([[[DEFINE_ORDER_PREDICATE_BUILTIN]]],[[[MMUX_BASH_BUILTIN_MAIN([[[$1]]])
{
  mpfr_ptr	op1, op2;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op1]]],	[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op2]]],	[[[argv[2]]]]);
  {
    int		rv = $1(op1, op2);
    return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BUILTIN_NAME_STR);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MPFR_OP"]]],
    [[["Store 1 in MPFR_RV if the operands satisfies the comparison predicate; otherwise store 0."]]])
]]])

DEFINE_ORDER_PREDICATE_BUILTIN([[[mpfr_greater_p]]])
DEFINE_ORDER_PREDICATE_BUILTIN([[[mpfr_greaterequal_p]]])
DEFINE_ORDER_PREDICATE_BUILTIN([[[mpfr_less_p]]])
DEFINE_ORDER_PREDICATE_BUILTIN([[[mpfr_lessequal_p]]])
DEFINE_ORDER_PREDICATE_BUILTIN([[[mpfr_equal_p]]])
DEFINE_ORDER_PREDICATE_BUILTIN([[[mpfr_lessgreater_p]]])
DEFINE_ORDER_PREDICATE_BUILTIN([[[mpfr_unordered_p]]])
DEFINE_ORDER_PREDICATE_BUILTIN([[[mpfr_total_order_p]]])


/** --------------------------------------------------------------------
 ** Misc.
 ** ----------------------------------------------------------------- */

DEFINE_BINARY_BUILTIN([[[mpfr_min]]])
DEFINE_BINARY_BUILTIN([[[mpfr_max]]])


/** --------------------------------------------------------------------
 ** Approximate comparison: absolute margin criterion.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mpfr_equal_absmargin]]])
{
  mpfr_ptr	op1, op2;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op1]]],	[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op2]]],	[[[argv[2]]]]);
  {
    mpfr_t		margin;
    mmux_bash_rv_t	mmux_rv;

    mpfr_init(margin);
    {
      /* Read the margin from the  shell variable "ABSOLUTE_MARGIN_MPFR", if any.  If
	 there is no such variable: just use the default value. */
      {
	char const *	margin_string;

	mmux_rv = mmux_bash_get_shell_variable_string_value(&margin_string, MMUX_BASH_MPFR_MARGIN_VARNAME, NULL);
	if (MMUX_SUCCESS == mmux_rv) {
	  mmux_rv = mmux_bash_mpfr_set_absmargin_from_string(margin, margin_string, MMUX_BUILTIN_NAME_STR);
	  if (MMUX_SUCCESS != mmux_rv) { goto return_whatever; }
	} else {
	  mpfr_set_d(margin, MMUX_BASH_MPFR_DEFAULT_COMPARISON_ABSOLUTE_MARGIN, MPFR_RNDN);
	}
      }

      {
	int	mpfr_rv = mmux_mpfr_equal_absmargin(op1, op2, margin);
	mmux_rv = mmux_bash_mpfr_set_MPFR_RV(mpfr_rv, MMUX_BUILTIN_NAME_STR);
      }
    }
  return_whatever:
    mpfr_clear(margin);
    return mmux_rv;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MPFR_OP1 MPFR_OP2"]]],
    [[["Compare the operands with the absolute margin criterion."]]])


/** --------------------------------------------------------------------
 ** Approximate comparison: relative epsilon criterion.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mpfr_equal_relepsilon]]])
{
  mpfr_ptr	op1, op2;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op1]]],	[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op2]]],	[[[argv[2]]]]);
  {
    mpfr_t		epsilon;
    mmux_bash_rv_t	mmux_rv;

    mpfr_init(epsilon);
    {
      /* Read the  epsilon from the  shell variable "RELATIVE_EPSILON_MPFR",  if any.
	 If there is no such variable: just use the default value. */
      {
	char const *	epsilon_string;

	mmux_rv = mmux_bash_get_shell_variable_string_value(&epsilon_string, MMUX_BASH_MPFR_EPSILON_VARNAME, NULL);
	if (MMUX_SUCCESS == mmux_rv) {
	  mmux_rv = mmux_bash_mpfr_set_relepsilon_from_string(epsilon, epsilon_string, MMUX_BUILTIN_NAME_STR);
	  if (MMUX_SUCCESS != mmux_rv) { goto return_whatever; }
	} else {
	  mpfr_set_d(epsilon, MMUX_BASH_MPFR_DEFAULT_COMPARISON_RELATIVE_EPSILON, MPFR_RNDN);
	}
      }

      {
	int	mpfr_rv = mmux_mpfr_equal_relepsilon(op1, op2, epsilon);
	mmux_rv = mmux_bash_mpfr_set_MPFR_RV(mpfr_rv, MMUX_BUILTIN_NAME_STR);
      }
    }
  return_whatever:
    mpfr_clear(epsilon);
    return mmux_rv;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MPFR_OP1 MPFR_OP2"]]],
    [[["Compare the operands with the relative epsilon criterion."]]])

/* end of file */
