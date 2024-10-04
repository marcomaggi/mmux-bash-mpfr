/*
  Part of: MMUX Bash MPFR
  Contents: implementation of conversion builtins
  Date: Sep 15, 2024

  Abstract

	This module implements conversion builtins.

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
 ** Conversion to raw numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_VALUE_GETTER]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$3]]],[[[
static int
$1_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"$1"
{
  mpfr_ptr		op;
  mpfr_rnd_t		rnd;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op]]],	[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_RND([[[rnd]]],	[[[argv[3]]]]);
  {
    mmux_$2_t	value;

    value = $1(op, rnd);
    return mmux_bash_pointers_store_result_in_variable_$2(argv[1], value, MMUX_BUILTIN_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[$1]]],
    [[[(4 == argc)]]],
    [[["$1 mmux_toupper($2)VAR MPFR_OP MPFR_RND"]]],
    [[["Extract a raw value from a MPFR number, store the result in mmux_toupper($2)VAR."]]])
]]])]]])

DEFINE_VALUE_GETTER([[[mpfr_get_si]]],		[[[slong]]])
DEFINE_VALUE_GETTER([[[mpfr_get_ui]]],		[[[ulong]]])
DEFINE_VALUE_GETTER([[[mpfr_get_sj]]],		[[[sintmax]]])
DEFINE_VALUE_GETTER([[[mpfr_get_uj]]],		[[[uintmax]]])

DEFINE_VALUE_GETTER([[[mpfr_get_flt]]],		[[[float]]])
DEFINE_VALUE_GETTER([[[mpfr_get_d]]],		[[[double]]])
DEFINE_VALUE_GETTER([[[mpfr_get_ld]]],		[[[ldouble]]],		[[[MMUX_BASH_MPFR_HAVE_LDOUBLE]]])
DEFINE_VALUE_GETTER([[[mpfr_get_float128]]],	[[[float128]]],		[[[MMUX_BASH_MPFR_HAVE_FLOAT128]]])
DEFINE_VALUE_GETTER([[[mpfr_get_decimal64]]],	[[[decimal64]]],	[[[MMUX_BASH_MPFR_HAVE_DECIMAL64]]])
DEFINE_VALUE_GETTER([[[mpfr_get_decimal128]]],	[[[decimal128]]],	[[[MMUX_BASH_MPFR_HAVE_DECIMAL128]]])


/** --------------------------------------------------------------------
 ** Conversion to raw numbers with exponent.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_VALUE_GETTER_2EXP]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$3]]],[[[
static int
$1_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"$1"
{
  mpfr_ptr		op;
  mpfr_rnd_t		rnd;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op]]],	[[[argv[3]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_RND([[[rnd]]],	[[[argv[4]]]]);
  {
    mmux_slong_t	exp;
    mmux_$2_t		value;
    int			rv;

    value	= $1(&exp, op, rnd);
    rv = mmux_bash_pointers_store_result_in_variable_$2(argv[1], value, MMUX_BUILTIN_NAME);
    if (MMUX_SUCCESS != rv) {
      return rv;
    } else {
      return mmux_bash_pointers_store_result_in_variable_slong(argv[2], exp, MMUX_BUILTIN_NAME);
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[$1]]],
    [[[(5 == argc)]]],
    [[["$1 MANTISSA_VAR EXPONENT_VAR MPFR_OP MPFR_RND"]]],
    [[["Extract raw values from a MPFR number, store the resulting mantissa and exponent in the given shell variables."]]])
]]])]]])

DEFINE_VALUE_GETTER_2EXP([[[mpfr_get_d_2exp]]],		[[[double]]])
DEFINE_VALUE_GETTER_2EXP([[[mpfr_get_ld_2exp]]],	[[[ldouble]]],		[[[MMUX_BASH_MPFR_HAVE_LDOUBLE]]])

/* ------------------------------------------------------------------ */

static int
mpfr_frexp_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_frexp"
{
  mpfr_ptr		op1, op2;
  mpfr_rnd_t		rnd;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op1]]],	[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op2]]],	[[[argv[3]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_RND([[[rnd]]],	[[[argv[4]]]]);
  {
    mmux_slong_t	exp;
    int			rv, rv_mpfr;

    rv_mpfr = mpfr_frexp(&exp, op1, op2, rnd);
    rv      = mmux_bash_mpfr_set_MPFR_RV(rv_mpfr, MMUX_BUILTIN_NAME);
    if (MMUX_SUCCESS == rv) {
      return mmux_bash_mpfr_store_result_in_variable_mpfr_exp(argv[1], exp, MMUX_BUILTIN_NAME);
    } else {
      return rv;
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_frexp]]],
    [[[(5 == argc)]]],
    [[["mpfr_frexp EXPONENT_VAR MPFR_OP1 MPFR_OP2 MPFR_RND"]]],
    [[["Interface to mpfr_frexp()."]]])


/** --------------------------------------------------------------------
 ** Conversion to ASCIIZ strings.
 ** ----------------------------------------------------------------- */

static int
mpfr_get_str_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_get_str"
{
  int		base;
  size_t	ndigits;
  mpfr_ptr	op;
  mpfr_rnd_t	rnd;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[base]]],		[[[argv[3]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_USIZE([[[ndigits]]],	[[[argv[4]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op]]],	[[[argv[5]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_RND([[[rnd]]],	[[[argv[6]]]]);
  {
    mpfr_exp_t	exp = 0;
    char *	str;

    str = mpfr_get_str(NULL, &exp, base, ndigits, op, rnd);
    if (str) {
      int	rv = mmux_bash_store_string_in_variable(argv[1], str, MMUX_BUILTIN_NAME);
      mpfr_free_str(str);
      if (MMUX_SUCCESS != rv) {
	return rv;
      } else {
	return mmux_bash_mpfr_store_result_in_variable_mpfr_exp (argv[2], exp, MMUX_BUILTIN_NAME);
      }
    }
    /* If  the  generation of  a  value  for "str"  fails:  the  input arugments  are
       arong. So we go to the wrong-arguments branch below. */
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_get_str]]],
    [[[(7 == argc)]]],
    [[["mpfr_get_str MANTISSA_VAR EXPONENT_VAR BASE NDIGITS MPFR_OP MPFR_RND"]]],
    [[["Convert a MPFR number to string, store the resulting mantissa and exponent in the given shell variables."]]])

/* end of file */
