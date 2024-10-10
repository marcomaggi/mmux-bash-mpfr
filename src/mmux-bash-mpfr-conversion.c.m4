/*
  Part of: MMUX Bash MPFR
  Contents: implementation of conversion builtins
  Date: Sep 15, 2024

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
    return mmux_$2_bind_to_variable(argv[1], value, MMUX_BUILTIN_NAME);
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
DEFINE_VALUE_GETTER([[[mpfr_get_ld]]],		[[[ldouble]]],		[[[MMUX_BASH_MPFR_HAVE_CC_TYPE_LDOUBLE]]])
DEFINE_VALUE_GETTER([[[mpfr_get_float128]]],	[[[float128]]],		[[[MMUX_BASH_MPFR_HAVE_CC_TYPE_FLOAT128]]])
DEFINE_VALUE_GETTER([[[mpfr_get_decimal64]]],	[[[decimal64]]],	[[[MMUX_BASH_MPFR_HAVE_CC_TYPE_DECIMAL64]]])
DEFINE_VALUE_GETTER([[[mpfr_get_decimal128]]],	[[[decimal128]]],	[[[MMUX_BASH_MPFR_HAVE_CC_TYPE_DECIMAL128]]])


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
    rv = mmux_$2_bind_to_variable(argv[1], value, MMUX_BUILTIN_NAME);
    if (MMUX_SUCCESS != rv) {
      return rv;
    } else {
      return mmux_slong_bind_to_variable(argv[2], exp, MMUX_BUILTIN_NAME);
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
DEFINE_VALUE_GETTER_2EXP([[[mpfr_get_ld_2exp]]],	[[[ldouble]]],		[[[MMUX_BASH_MPFR_HAVE_CC_TYPE_LDOUBLE]]])

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
      return mmux_mpfr_exp_bind_to_variable(argv[1], exp, MMUX_BUILTIN_NAME);
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
	return mmux_mpfr_exp_bind_to_variable (argv[2], exp, MMUX_BUILTIN_NAME);
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


/** --------------------------------------------------------------------
 ** Predicates for getters.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_PREDICATE_FOR_GETTERS]]],[[[
static int
mpfr_fits_$1_p_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_fits_$1_p"
{
  mpfr_ptr	op;
  mpfr_rnd_t	rnd;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op]]],	[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_RND([[[rnd]]],	[[[argv[2]]]]);
  {
    int		rv = mpfr_fits_$1_p(op, rnd);
    return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BUILTIN_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_fits_$1_p]]],
    [[[(3 == argc)]]],
    [[["mpfr_fits_$1_p MPFR_ROP MPFR_RND"]]],
    [[["Interface to the C function mpfr_fits_$1_p."]]])
]]])

DEFINE_PREDICATE_FOR_GETTERS([[[sshort]]])
DEFINE_PREDICATE_FOR_GETTERS([[[ushort]]])
DEFINE_PREDICATE_FOR_GETTERS([[[sint]]])
DEFINE_PREDICATE_FOR_GETTERS([[[uint]]])
DEFINE_PREDICATE_FOR_GETTERS([[[slong]]])
DEFINE_PREDICATE_FOR_GETTERS([[[ulong]]])
DEFINE_PREDICATE_FOR_GETTERS([[[intmax]]])
DEFINE_PREDICATE_FOR_GETTERS([[[uintmax]]])


/** --------------------------------------------------------------------
 ** Other getters.
 ** ----------------------------------------------------------------- */

static int
mpfr_get_z_2exp_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_get_z_2exp"
{
  mpz_ptr	rop;
  mpfr_ptr	op;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPZ_PTR([[[rop]]],	[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op]]],	[[[argv[3]]]]);
  {
    mpfr_exp_t	exp = mpfr_get_z_2exp(rop, op);
    return mmux_mpfr_exp_bind_to_variable(argv[1], exp, MMUX_BUILTIN_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_get_z_2exp]]],
    [[[(4 == argc)]]],
    [[["mpfr_get_z_2exp EXPONENT_VAR MPZ_ROP MPFR_OP"]]],
    [[["Interface to the C function mpfr_get_z_2exp."]]])

/* ------------------------------------------------------------------ */

static int
mpfr_get_z_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_get_z"
{
  mpz_ptr	rop;
  mpfr_ptr	op;
  mpfr_rnd_t	rnd;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPZ_PTR([[[rop]]],	[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op]]],	[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_RND([[[rnd]]],	[[[argv[3]]]]);
  {
    int		rv = mpfr_get_z(rop, op, rnd);
    return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BUILTIN_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_get_z]]],
    [[[(4 == argc)]]],
    [[["mpfr_get_z MPZ_ROP MPFR_PTR MPFR_RND"]]],
    [[["Interface to the C function mpfr_get_z."]]])

/* ------------------------------------------------------------------ */

static int
mpfr_get_q_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_get_q"
{
  mpq_ptr	rop;
  mpfr_ptr	op;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPZ_PTR([[[rop]]],	[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op]]],	[[[argv[2]]]]);
  {
    mpfr_get_q(rop, op);
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_get_q]]],
    [[[(3 == argc)]]],
    [[["mpfr_get_q MPQ_ROP MPFR_OP"]]],
    [[["Interface to the C function mpfr_get_q."]]])

/* ------------------------------------------------------------------ */

static int
mpfr_get_f_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_get_f"
{
  mpf_ptr	rop;
  mpfr_ptr	op;
  mpfr_rnd_t	rnd;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPF_PTR([[[rop]]],	[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op]]],	[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_RND([[[rnd]]],	[[[argv[3]]]]);
  {
    int		rv = mpfr_get_f(rop, op, rnd);
    return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BUILTIN_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_get_f]]],
    [[[(4 == argc)]]],
    [[["mpfr_get_f MPZ_ROP MPFR_PTR MPFR_RND"]]],
    [[["Interface to the C function mpfr_get_f."]]])

/* ------------------------------------------------------------------ */

static int
mpfr_get_str_ndigits_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_get_str_ndigits"
{
  mmux_sint_t	B;
  mpfr_prec_t	prec;

  MMUX_BASH_PARSE_BUILTIN_ARG_SINT([[[B]]],		[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PREC([[[prec]]],	[[[argv[3]]]]);
  {
    mmux_ssize_t	rv = mpfr_get_str_ndigits(B, prec);
    return mmux_ssize_bind_to_variable(argv[1], rv, MMUX_BUILTIN_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_get_str_ndigits]]],
    [[[(4 == argc)]]],
    [[["mpfr_get_str_ndigits B PREC"]]],
    [[["Interface to the C function mpfr_get_str_ndigits."]]])

/* end of file */
