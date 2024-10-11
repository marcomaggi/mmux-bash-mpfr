/*
  Part of: MMUX Bash MPFR
  Contents: implementation of assignment builtins
  Date: Sep 15, 2024

  Abstract

	This module implements assignment builtins.

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
 ** Basic setting.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_MPFR_SETTER]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$5]]],[[[
MMUX_BASH_BUILTIN_MAIN([[[$1]]])
{
  mpfr_ptr	rop;
  $2		op;
  mpfr_rnd_t	rnd;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[rop]]],	[[[argv[1]]]]);
  $4([[[op]]],						[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_RND([[[rnd]]],	[[[argv[3]]]]);
  {
    int		rv = $1(rop, op, rnd);
    return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BUILTIN_NAME_STR);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[$1]]],
    [[[(4 == argc)]]],
    [[["$1 MPFR_ROP $3 MPFR_RND"]]],
    [[["Set an already initialised number MPFR_ROP to the given operand $3."]]])
]]])]]])

MMUX_BASH_DEFINE_MPFR_SETTER([[[mpfr_set_si]]], [[[mmux_slong_t]]],  [[[SLONG]]],   [[[MMUX_BASH_PARSE_BUILTIN_ARG_SLONG]]])
MMUX_BASH_DEFINE_MPFR_SETTER([[[mpfr_set_ui]]],	[[[mmux_ulong_t]]],  [[[ULONG]]],   [[[MMUX_BASH_PARSE_BUILTIN_ARG_ULONG]]])
MMUX_BASH_DEFINE_MPFR_SETTER([[[mpfr_set_sj]]], [[[mmux_sintmax_t]]],[[[SINTMAX]]], [[[MMUX_BASH_PARSE_BUILTIN_ARG_SINTMAX]]])
MMUX_BASH_DEFINE_MPFR_SETTER([[[mpfr_set_uj]]],	[[[mmux_uintmax_t]]],[[[UINTMAX]]], [[[MMUX_BASH_PARSE_BUILTIN_ARG_UINTMAX]]])
MMUX_BASH_DEFINE_MPFR_SETTER([[[mpfr_set_flt]]],[[[mmux_float_t]]],  [[[FLOAT]]],   [[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT]]])
MMUX_BASH_DEFINE_MPFR_SETTER([[[mpfr_set_d]]],	[[[mmux_double_t]]], [[[DOUBLE]]],  [[[MMUX_BASH_PARSE_BUILTIN_ARG_DOUBLE]]])
MMUX_BASH_DEFINE_MPFR_SETTER([[[mpfr_set_ld]]],	[[[mmux_ldouble_t]]],[[[LDOUBLE]]], [[[MMUX_BASH_PARSE_BUILTIN_ARG_LDOUBLE]]],
			     [[[MMUX_BASH_MPFR_HAVE_CC_TYPE_LDOUBLE]]])

MMUX_BASH_DEFINE_MPFR_SETTER([[[mpfr_set_float128]]],   [[[mmux_float128_t]]],  [[[FLOAT128]]],
			     [[[MMUX_BASH_PARSE_BUILTIN_ARG_FLOAT128]]], [[[MMUX_BASH_MPFR_HAVE_CC_TYPE_FLOAT128]]])

MMUX_BASH_DEFINE_MPFR_SETTER([[[mpfr_set_decimal64]]],	[[[mmux_decimal64_t]]], [[[DECIMAL64]]],
			     [[[MMUX_BASH_PARSE_BUILTIN_ARG_DECIMAL64]]], [[[MMUX_BASH_MPFR_HAVE_CC_TYPE_DECIMAL64]]])

MMUX_BASH_DEFINE_MPFR_SETTER([[[mpfr_set_decimal128]]],	[[[mmux_decimal128_t]]],[[[DECIMAL128]]],
			     [[[MMUX_BASH_PARSE_BUILTIN_ARG_DECIMAL128]]], [[[MMUX_BASH_MPFR_HAVE_CC_TYPE_DECIMAL128]]])

MMUX_BASH_DEFINE_MPFR_SETTER([[[mpfr_set_z]]],	[[[mpz_ptr]]],	[[[MPZ_PTR]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_MPZ_PTR]]])
MMUX_BASH_DEFINE_MPFR_SETTER([[[mpfr_set_q]]],	[[[mpq_ptr]]],	[[[MPQ_PTR]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_MPQ_PTR]]])
MMUX_BASH_DEFINE_MPFR_SETTER([[[mpfr_set_f]]],	[[[mpf_ptr]]],	[[[MPF_PTR]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_MPF_PTR]]])
MMUX_BASH_DEFINE_MPFR_SETTER([[[mpfr_set]]],	[[[mpfr_ptr]]],	[[[MPFR_PTR]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR]]])


/** --------------------------------------------------------------------
 ** 2exp setting.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_MPFR_2EXP_SETTER]]],[[[MMUX_BASH_BUILTIN_MAIN([[[$1]]])
{
  mpfr_ptr	rop;
  $2		mant;
  mpfr_exp_t	exp;
  mpfr_rnd_t	rnd;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[rop]]],	[[[argv[1]]]]);
  $4([[[mant]]],					[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_EXP([[[exp]]],	[[[argv[3]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_RND([[[rnd]]],	[[[argv[3]]]]);
  {
    int		rv = $1(rop, mant, exp, rnd);
    return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BUILTIN_NAME_STR);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[$1]]],
    [[[(5 == argc)]]],
    [[["$1 MPFR_ROP $3 MPFR_RND"]]],
    [[["Set an already initialised MPFR number to the given $3."]]])
]]])

MMUX_BASH_DEFINE_MPFR_2EXP_SETTER([[[mpfr_set_si_2exp]]], [[[mmux_slong_t]]],  [[[SLONG]]],  [[[MMUX_BASH_PARSE_BUILTIN_ARG_SLONG]]])
MMUX_BASH_DEFINE_MPFR_2EXP_SETTER([[[mpfr_set_ui_2exp]]], [[[mmux_ulong_t]]],  [[[ULONG]]],  [[[MMUX_BASH_PARSE_BUILTIN_ARG_ULONG]]])
MMUX_BASH_DEFINE_MPFR_2EXP_SETTER([[[mpfr_set_sj_2exp]]], [[[mmux_sintmax_t]]],[[[SINTMAX]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_SINTMAX]]])
MMUX_BASH_DEFINE_MPFR_2EXP_SETTER([[[mpfr_set_uj_2exp]]], [[[mmux_uintmax_t]]],[[[UINTMAX]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_UINTMAX]]])
MMUX_BASH_DEFINE_MPFR_2EXP_SETTER([[[mpfr_set_z_2exp]]],  [[[mpz_ptr]]],            [[[MPZ_PTR]]],[[[MMUX_BASH_PARSE_BUILTIN_ARG_MPZ_PTR]]])


/** --------------------------------------------------------------------
 ** Initialisation and assignment.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_MPFR_INIT_AND_SET]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$5]]],[[[
MMUX_BASH_BUILTIN_MAIN([[[$1]]])
{
  mpfr_ptr	rop;
  $2		op;
  mpfr_rnd_t	rnd;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[rop]]],	[[[argv[1]]]]);
  $4([[[op]]],						[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_RND([[[rnd]]],	[[[argv[3]]]]);
  {
    int		rv = $1(rop, op, rnd);
    return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BUILTIN_NAME_STR);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[$1]]],
    [[[(4 == argc)]]],
    [[["$1 MPFR_ROP $3 MPFR_RND"]]],
    [[["Initialise then set a MPFR number to the given operand $3."]]])
]]])]]])

DEFINE_MPFR_INIT_AND_SET([[[mpfr_init_set_si]]],[[[mmux_slong_t]]],  [[[SLONG]]],   [[[MMUX_BASH_PARSE_BUILTIN_ARG_SLONG]]])
DEFINE_MPFR_INIT_AND_SET([[[mpfr_init_set_ui]]],[[[mmux_ulong_t]]],  [[[ULONG]]],	 [[[MMUX_BASH_PARSE_BUILTIN_ARG_ULONG]]])
DEFINE_MPFR_INIT_AND_SET([[[mpfr_init_set_d]]],	[[[mmux_double_t]]], [[[DOUBLE]]],  [[[MMUX_BASH_PARSE_BUILTIN_ARG_DOUBLE]]])
DEFINE_MPFR_INIT_AND_SET([[[mpfr_init_set_ld]]],[[[mmux_ldouble_t]]],[[[LDOUBLE]]], [[[MMUX_BASH_PARSE_BUILTIN_ARG_LDOUBLE]]],
			 [[[MMUX_BASH_MPFR_HAVE_CC_TYPE_LDOUBLE]]])

DEFINE_MPFR_INIT_AND_SET([[[mpfr_init_set_z]]],	[[[mpz_ptr]]],	[[[MPZ_PTR]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_MPZ_PTR]]])
DEFINE_MPFR_INIT_AND_SET([[[mpfr_init_set_q]]],	[[[mpq_ptr]]],	[[[MPQ_PTR]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_MPQ_PTR]]])
DEFINE_MPFR_INIT_AND_SET([[[mpfr_init_set_f]]],	[[[mpf_ptr]]],	[[[MPF_PTR]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_MPF_PTR]]])
DEFINE_MPFR_INIT_AND_SET([[[mpfr_init_set]]],	[[[mpfr_ptr]]],	[[[MPFR_PTR]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR]]])


/** --------------------------------------------------------------------
 ** Miscellaneous setters.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mpfr_set_str]]])
{
  mpfr_ptr	rop;
  char const *	str;
  int		base;
  mpfr_rnd_t	rnd;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[rop]]],	[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR([[[str]]],	[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[base]]],		[[[argv[3]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_RND([[[rnd]]],	[[[argv[4]]]]);
  {
      int	rv = mpfr_set_str(rop, str, base, rnd);
      return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BUILTIN_NAME_STR);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_set_str]]],
    [[[(5 == argc)]]],
    [[["mpfr_set_str MPFR_ROP STRING BASE MPFR_RND"]]],
    [[["Set an already initialised MPFR number to the given string."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mpfr_strtofr]]])
{
  return MMUX_FAILURE;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_strtofr]]],
    [[[(6 == argc)]]],
    [[["mpfr_strtofr MPFR_ROP NPTR ENDPTR BASE MPFR_RND"]]],
    [[["Set an already initialised MPFR number to the given string."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mpfr_set_nan]]])
{
  mpfr_ptr	op;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op]]],	[[[argv[1]]]]);
  mpfr_set_nan(op);
  return MMUX_SUCCESS;
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_set_nan]]],
    [[[(2 == argc)]]],
    [[["mpfr_set_nan MPFR_OP"]]],
    [[["Set to not-a-number a MPFR number."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mpfr_set_inf]]])
{
  mpfr_ptr	op;
  int		sign;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op]]],	[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[sign]]],		[[[argv[2]]]]);

  mpfr_set_inf(op, sign);
  return MMUX_SUCCESS;
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_set_inf]]],
    [[[(3 == argc)]]],
    [[["mpfr_set_inf MPFR_OP SIGN"]]],
    [[["Set to not-a-number a MPFR number."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mpfr_set_zero]]])
{
  mpfr_ptr	op;
  int		sign;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op]]],	[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[sign]]],		[[[argv[2]]]]);

  mpfr_set_zero(op, sign);
  return MMUX_SUCCESS;
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_set_zero]]],
    [[[(3 == argc)]]],
    [[["mpfr_set_zero MPFR_OP SIGN"]]],
    [[["Set to zero a MPFR number."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mpfr_swap]]])
{
  mpfr_ptr	op1, op2;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op1]]],	[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op2]]],	[[[argv[2]]]]);

  mpfr_swap(op1, op2);
  return MMUX_SUCCESS;

  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_swap]]],
    [[[(3 == argc)]]],
    [[["mpfr_swap MPFR_OP1 MPFR_OP2"]]],
    [[["Swap values between two already initialised MPFR numbers."]]])

/* end of file */
