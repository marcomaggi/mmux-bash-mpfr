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

m4_dnl $1 - builtin name
m4_dnl $2 - type of the result
m4_dnl $3 - parser macro
m4_dnl $4 - C preprocessor symbol for conditional definition
m4_define([[[DEFINE_SIMPLE_ADDER]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$4]]],[[[
static int
$1_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"$1"
{
  mpfr_ptr	rop, op1;
  $2		op2;
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

DEFINE_SIMPLE_ADDER([[[mpfr_add_si]]],	[[[mmux_slong_t]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_SLONG]]])
DEFINE_SIMPLE_ADDER([[[mpfr_add_ui]]],	[[[mmux_ulong_t]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_ULONG]]])
DEFINE_SIMPLE_ADDER([[[mpfr_add_d]]],	[[[mmux_double_t]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_DOUBLE]]])
DEFINE_SIMPLE_ADDER([[[mpfr_add_z]]],	[[[mpz_ptr]]],		[[[MMUX_BASH_PARSE_BUILTIN_ARG_MPZ_PTR]]])
DEFINE_SIMPLE_ADDER([[[mpfr_add_q]]],	[[[mpq_ptr]]],		[[[MMUX_BASH_PARSE_BUILTIN_ARG_MPQ_PTR]]])

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


/** --------------------------------------------------------------------
 ** Simple multiplication.
 ** ----------------------------------------------------------------- */

m4_dnl $1 - builtin name
m4_dnl $2 - type of the result
m4_dnl $3 - parser macro
m4_dnl $4 - C preprocessor symbol for conditional definition
m4_define([[[DEFINE_SIMPLE_MULER]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$4]]],[[[
static int
$1_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"$1"
{
  mpfr_ptr	rop, op1;
  $2		op2;
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
    [[["Multiply two numbers, store the result in ROP."]]])
]]])]]])

DEFINE_SIMPLE_MULER([[[mpfr_mul_si]]],	[[[mmux_slong_t]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_SLONG]]])
DEFINE_SIMPLE_MULER([[[mpfr_mul_ui]]],	[[[mmux_ulong_t]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_ULONG]]])
DEFINE_SIMPLE_MULER([[[mpfr_mul_d]]],	[[[mmux_double_t]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_DOUBLE]]])
DEFINE_SIMPLE_MULER([[[mpfr_mul_z]]],	[[[mpz_ptr]]],		[[[MMUX_BASH_PARSE_BUILTIN_ARG_MPZ_PTR]]])
DEFINE_SIMPLE_MULER([[[mpfr_mul_q]]],	[[[mpq_ptr]]],		[[[MMUX_BASH_PARSE_BUILTIN_ARG_MPQ_PTR]]])

/* ------------------------------------------------------------------ */

static int
mpfr_mul_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_mul"
{
  mpfr_ptr		rop, op1, op2;
  mpfr_rnd_t		rnd;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[rop]]],	[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op1]]],	[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op2]]],	[[[argv[3]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_RND([[[rnd]]],	[[[argv[4]]]]);
  {
    int		rv = mpfr_mul(rop, op1, op2, rnd);
    return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BUILTIN_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_mul]]],
    [[[(5 == argc)]]],
    [[["mpfr_mul MPFR_ROP MPFR_OP1 MPFR_OP2 MPFR_RND"]]],
    [[["Multiply two numbers, store the result in ROP."]]])


/** --------------------------------------------------------------------
 ** Simple subtraction.
 ** ----------------------------------------------------------------- */

m4_dnl $1 - builtin name
m4_dnl $2 - type of the result
m4_dnl $3 - parser macro
m4_dnl $4 - C preprocessor symbol for conditional definition
m4_define([[[DEFINE_SIMPLE_SUBER]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$4]]],[[[
static int
$1_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"$1"
{
  mpfr_ptr	rop, op1;
  $2		op2;
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
    [[["Subtract two numbers, store the result in ROP."]]])
]]])]]])

DEFINE_SIMPLE_SUBER([[[mpfr_sub_si]]],	[[[mmux_slong_t]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_SLONG]]])
DEFINE_SIMPLE_SUBER([[[mpfr_sub_ui]]],	[[[mmux_ulong_t]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_ULONG]]])
DEFINE_SIMPLE_SUBER([[[mpfr_sub_d]]],	[[[mmux_double_t]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_DOUBLE]]])
DEFINE_SIMPLE_SUBER([[[mpfr_sub_z]]],	[[[mpz_ptr]]],		[[[MMUX_BASH_PARSE_BUILTIN_ARG_MPZ_PTR]]])
DEFINE_SIMPLE_SUBER([[[mpfr_sub_q]]],	[[[mpq_ptr]]],		[[[MMUX_BASH_PARSE_BUILTIN_ARG_MPQ_PTR]]])

/* ------------------------------------------------------------------ */

m4_dnl $1 - builtin name
m4_dnl $2 - type of the result
m4_dnl $3 - parser macro
m4_dnl $4 - C preprocessor symbol for conditional definition
m4_define([[[DEFINE_SIMPLE_REV_SUBER]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$4]]],[[[
static int
$1_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"$1"
{
  mpfr_ptr	rop, op2;
  $2		op1;
  mpfr_rnd_t	rnd;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[rop]]],	[[[argv[1]]]]);
  $3([[[op1]]],						[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op2]]],	[[[argv[3]]]]);
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
    [[["Subtract two numbers, store the result in ROP."]]])
]]])]]])

DEFINE_SIMPLE_REV_SUBER([[[mpfr_si_sub]]],	[[[mmux_slong_t]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_SLONG]]])
DEFINE_SIMPLE_REV_SUBER([[[mpfr_ui_sub]]],	[[[mmux_ulong_t]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_ULONG]]])
DEFINE_SIMPLE_REV_SUBER([[[mpfr_d_sub]]],	[[[mmux_double_t]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_DOUBLE]]])

/* ------------------------------------------------------------------ */

static int
mpfr_sub_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_sub"
{
  mpfr_ptr		rop, op1, op2;
  mpfr_rnd_t		rnd;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[rop]]],	[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op1]]],	[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op2]]],	[[[argv[3]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_RND([[[rnd]]],	[[[argv[4]]]]);
  {
    int		rv = mpfr_sub(rop, op1, op2, rnd);
    return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BUILTIN_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_sub]]],
    [[[(5 == argc)]]],
    [[["mpfr_sub MPFR_ROP MPFR_OP1 MPFR_OP2 MPFR_RND"]]],
    [[["Subtract two numbers, store the result in ROP."]]])


/** --------------------------------------------------------------------
 ** Simple division.
 ** ----------------------------------------------------------------- */

m4_dnl $1 - builtin name
m4_dnl $2 - type of the result
m4_dnl $3 - parser macro
m4_dnl $4 - C preprocessor symbol for conditional definition
m4_define([[[DEFINE_SIMPLE_DIVER]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$4]]],[[[
static int
$1_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"$1"
{
  mpfr_ptr	rop, op1;
  $2		op2;
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
    [[["Divide two numbers, store the result in ROP."]]])
]]])]]])

DEFINE_SIMPLE_DIVER([[[mpfr_div_si]]],	[[[mmux_slong_t]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_SLONG]]])
DEFINE_SIMPLE_DIVER([[[mpfr_div_ui]]],	[[[mmux_ulong_t]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_ULONG]]])
DEFINE_SIMPLE_DIVER([[[mpfr_div_d]]],	[[[mmux_double_t]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_DOUBLE]]])
DEFINE_SIMPLE_DIVER([[[mpfr_div_z]]],	[[[mpz_ptr]]],		[[[MMUX_BASH_PARSE_BUILTIN_ARG_MPZ_PTR]]])
DEFINE_SIMPLE_DIVER([[[mpfr_div_q]]],	[[[mpq_ptr]]],		[[[MMUX_BASH_PARSE_BUILTIN_ARG_MPQ_PTR]]])

/* ------------------------------------------------------------------ */

m4_dnl $1 - builtin name
m4_dnl $2 - type of the result
m4_dnl $3 - parser macro
m4_dnl $4 - C preprocessor symbol for conditional definition
m4_define([[[DEFINE_SIMPLE_REV_DIVER]]],[[[MMUX_BASH_CONDITIONAL_CODE([[[$4]]],[[[
static int
$1_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"$1"
{
  mpfr_ptr	rop, op2;
  $2		op1;
  mpfr_rnd_t	rnd;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[rop]]],	[[[argv[1]]]]);
  $3([[[op1]]],						[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op2]]],	[[[argv[3]]]]);
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
    [[["Divide two numbers, store the result in ROP."]]])
]]])]]])

DEFINE_SIMPLE_REV_DIVER([[[mpfr_si_div]]],	[[[mmux_slong_t]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_SLONG]]])
DEFINE_SIMPLE_REV_DIVER([[[mpfr_ui_div]]],	[[[mmux_ulong_t]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_ULONG]]])
DEFINE_SIMPLE_REV_DIVER([[[mpfr_d_div]]],	[[[mmux_double_t]]],	[[[MMUX_BASH_PARSE_BUILTIN_ARG_DOUBLE]]])

/* ------------------------------------------------------------------ */

static int
mpfr_div_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_div"
{
  mpfr_ptr		rop, op1, op2;
  mpfr_rnd_t		rnd;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[rop]]],	[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op1]]],	[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op2]]],	[[[argv[3]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_RND([[[rnd]]],	[[[argv[4]]]]);
  {
    int		rv = mpfr_div(rop, op1, op2, rnd);
    return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BUILTIN_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_div]]],
    [[[(5 == argc)]]],
    [[["mpfr_div MPFR_ROP MPFR_OP1 MPFR_OP2 MPFR_RND"]]],
    [[["Divide two numbers, store the result in ROP."]]])


/** --------------------------------------------------------------------
 ** Powers and roots.
 ** ----------------------------------------------------------------- */

static int
mpfr_sqr_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_sqr"
{
  mpfr_ptr		rop, op;
  mpfr_rnd_t		rnd;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[rop]]],	[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op]]],	[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_RND([[[rnd]]],	[[[argv[3]]]]);
  {
    int		rv = mpfr_sqr(rop, op, rnd);
    return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BUILTIN_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_sqr]]],
    [[[(4 == argc)]]],
    [[["mpfr_sqr MPFR_ROP MPFR_OP MPFR_RND"]]],
    [[["Square a number, store the result in ROP."]]])

/* ------------------------------------------------------------------ */

static int
mpfr_sqrt_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_sqrt"
{
  mpfr_ptr		rop, op;
  mpfr_rnd_t		rnd;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[rop]]],	[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op]]],	[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_RND([[[rnd]]],	[[[argv[3]]]]);
  {
    int		rv = mpfr_sqrt(rop, op, rnd);
    return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BUILTIN_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_sqrt]]],
    [[[(4 == argc)]]],
    [[["mpfr_sqrt MPFR_ROP MPFR_OP MPFR_RND"]]],
    [[["Compute the square root of a number, store the result in ROP."]]])

/* ------------------------------------------------------------------ */

static int
mpfr_sqrt_ui_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_sqrt_ui"
{
  mpfr_ptr	rop;
  mmux_ulong_t	op;
  mpfr_rnd_t	rnd;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[rop]]],	[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_ULONG([[[op]]],		[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_RND([[[rnd]]],	[[[argv[3]]]]);
  {
    int		rv = mpfr_sqrt_ui(rop, op, rnd);
    return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BUILTIN_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_sqrt_ui]]],
    [[[(4 == argc)]]],
    [[["mpfr_sqrt_ui MPFR_ROP ULONG MPFR_RND"]]],
    [[["Compute the square root of a number, store the result in ROP."]]])

/* ------------------------------------------------------------------ */

static int
mpfr_rec_sqrt_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_rec_sqrt"
{
  mpfr_ptr		rop, op;
  mpfr_rnd_t		rnd;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[rop]]],	[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op]]],	[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_RND([[[rnd]]],	[[[argv[3]]]]);
  {
    int		rv = mpfr_rec_sqrt(rop, op, rnd);
    return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BUILTIN_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_rec_sqrt]]],
    [[[(4 == argc)]]],
    [[["mpfr_rec_sqrt MPFR_ROP MPFR_OP MPFR_RND"]]],
    [[["Compute the reqciprocal square root of a number, store the result in ROP."]]])

/* ------------------------------------------------------------------ */

static int
mpfr_cbrt_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_cbrt"
{
  mpfr_ptr		rop, op;
  mpfr_rnd_t		rnd;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[rop]]],	[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op]]],	[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_RND([[[rnd]]],	[[[argv[3]]]]);
  {
    int		rv = mpfr_cbrt(rop, op, rnd);
    return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BUILTIN_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_cbrt]]],
    [[[(4 == argc)]]],
    [[["mpfr_cbrt MPFR_ROP MPFR_OP MPFR_RND"]]],
    [[["Compute the cubic root of a number, store the result in ROP."]]])

/* ------------------------------------------------------------------ */

static int
mpfr_rootn_ui_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_rootn_ui"
{
  mpfr_ptr		rop, op;
  mmux_ulong_t		N;
  mpfr_rnd_t		rnd;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[rop]]],	[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op]]],	[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_ULONG([[[N]]],		[[[argv[3]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_RND([[[rnd]]],	[[[argv[4]]]]);
  {
    int		rv = mpfr_rootn_ui(rop, op, N, rnd);
    return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BUILTIN_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_rootn_ui]]],
    [[[(5 == argc)]]],
    [[["mpfr_rootn_ui MPFR_ROP MPFR_OP ULONG_N MPFR_RND"]]],
    [[["Compute the Nth root of a number, store the result in ROP."]]])

/* ------------------------------------------------------------------ */

static int
mpfr_rootn_si_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_rootn_si"
{
  mpfr_ptr		rop, op;
  mmux_slong_t		N;
  mpfr_rnd_t		rnd;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[rop]]],	[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op]]],	[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_SLONG([[[N]]],		[[[argv[3]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_RND([[[rnd]]],	[[[argv[4]]]]);
  {
    int		rv = mpfr_rootn_si(rop, op, N, rnd);
    return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BUILTIN_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_rootn_si]]],
    [[[(5 == argc)]]],
    [[["mpfr_rootn_si MPFR_ROP MPFR_OP SLONG_N MPFR_RND"]]],
    [[["Compute the Nth root of a number, store the result in ROP."]]])


/** --------------------------------------------------------------------
 ** Miscellaneous.
 ** ----------------------------------------------------------------- */

static int
mpfr_neg_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_neg"
{
  mpfr_ptr		rop, op;
  mpfr_rnd_t		rnd;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[rop]]],	[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op]]],	[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_RND([[[rnd]]],	[[[argv[3]]]]);
  {
    int		rv = mpfr_neg(rop, op, rnd);
    return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BUILTIN_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_neg]]],
    [[[(4 == argc)]]],
    [[["mpfr_neg MPFR_ROP MPFR_OP MPFR_RND"]]],
    [[["Negate a number, store the result in ROP."]]])

/* ------------------------------------------------------------------ */

static int
mpfr_abs_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_abs"
{
  mpfr_ptr		rop, op;
  mpfr_rnd_t		rnd;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[rop]]],	[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op]]],	[[[argv[2]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_RND([[[rnd]]],	[[[argv[3]]]]);
  {
    int		rv = mpfr_abs(rop, op, rnd);
    return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BUILTIN_NAME);
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_abs]]],
    [[[(4 == argc)]]],
    [[["mpfr_abs MPFR_ROP MPFR_OP MPFR_RND"]]],
    [[["Compute the absolute value of a number, store the result in ROP."]]])


/* end of file */
