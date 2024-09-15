/*
  Part of: MMUX Bash MPFR
  Contents: implementation of setting builtins
  Date: Sep 15, 2024

  Abstract

	This module implements setting builtins.

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
 ** Basic setting.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_MPFR_SETTER]]],[[[
static int
$1_main (int argc MMUX_BASH_MPFR_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"$1"
{
  $4		value;
  mpfr_ptr	rop;
  mpfr_rnd_t	rnd;
  int		rv;

  rv = mmux_bash_pointers_parse_pointer((void **)&rop, argv[1], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_pointers_parse_$2(&value, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_mpfr_parse_mpfr_rnd(&rnd, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = $1(rop, value, rnd);
  return mmux_bash_mpfr_set_MPFR_RV(rv);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[$1]]],
    [[[(4 == argc)]]],
    [[["$1 MPFR_ROP $3 MPFR_RND"]]],
    [[["Set an already initialised MPFR number to the given $3."]]])
]]])

MMUX_BASH_DEFINE_MPFR_SETTER([[[mpfr_set_si]]],		[[[slong]]],	[[[SLONG]]],	[[[signed long int]]])
MMUX_BASH_DEFINE_MPFR_SETTER([[[mpfr_set_ui]]],		[[[ulong]]],	[[[ULONG]]],	[[[unsigned long int]]])
MMUX_BASH_DEFINE_MPFR_SETTER([[[mpfr_set_sj]]],		[[[sintmax]]],	[[[SINTMAX]]],	[[[intmax_t]]])
MMUX_BASH_DEFINE_MPFR_SETTER([[[mpfr_set_uj]]],		[[[uintmax]]],	[[[UINTMAX]]],	[[[uintmax_t]]])
MMUX_BASH_DEFINE_MPFR_SETTER([[[mpfr_set_flt]]],	[[[float]]],	[[[FLOAT]]],	[[[float]]])
MMUX_BASH_DEFINE_MPFR_SETTER([[[mpfr_set_d]]],		[[[double]]],	[[[DOUBLE]]],	[[[double]]])
#if ((defined HAVE_LONG_double) && (1 == HAVE_LONG_DOUBLE))
MMUX_BASH_DEFINE_MPFR_SETTER([[[mpfr_set_ld]]],		[[[ldouble]]],	[[[LDOUBLE]]],	[[[long double]]])
#endif

/* ------------------------------------------------------------------ */

int
mpfr_set_main (int argc MMUX_BASH_MPFR_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_set"
{
  mpfr_ptr	rop, op;
  mpfr_rnd_t	rnd;
  int		rv;

  rv = mmux_bash_pointers_parse_pointer((void **)&rop, argv[1], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_pointers_parse_pointer((void **)&op, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_mpfr_parse_mpfr_rnd(&rnd, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mpfr_set(rop, op, rnd);
  return mmux_bash_mpfr_set_MPFR_RV(rv);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_set]]],
    [[[(4 == argc)]]],
    [[["mpfr_set MPFR_ROP MPFR_OP MPFR_RND"]]],
    [[["Set an already initialised MPFR number to the given MPFR number."]]])

/* ------------------------------------------------------------------ */

int
mpfr_set_z_main (int argc MMUX_BASH_MPFR_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_set_z"
{
  mpfr_ptr	rop;
  mpz_ptr	op;
  mpfr_rnd_t	rnd;
  int		rv;

  rv = mmux_bash_pointers_parse_pointer((void **)&rop, argv[1], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_pointers_parse_pointer((void **)&op, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_mpfr_parse_mpfr_rnd(&rnd, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mpfr_set_z(rop, op, rnd);
  return mmux_bash_mpfr_set_MPFR_RV(rv);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_set_z]]],
    [[[(4 == argc)]]],
    [[["mpfr_set_z MPFR_ROP GMP_MPZ MPFR_RND"]]],
    [[["Set an already initialised MPFR number to the given GMP number."]]])

/* ------------------------------------------------------------------ */

int
mpfr_set_q_main (int argc MMUX_BASH_MPFR_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_set_q"
{
  mpfr_ptr	rop;
  mpq_ptr	op;
  mpfr_rnd_t	rnd;
  int		rv;

  rv = mmux_bash_pointers_parse_pointer((void **)&rop, argv[1], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_pointers_parse_pointer((void **)&op, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_mpfr_parse_mpfr_rnd(&rnd, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mpfr_set_q(rop, op, rnd);
  return mmux_bash_mpfr_set_MPFR_RV(rv);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_set_q]]],
    [[[(4 == argc)]]],
    [[["mpfr_set_q MPFR_ROP GMP_MPQ MPFR_RND"]]],
    [[["Set an already initialised MPFR number to the given GMP number."]]])

/* ------------------------------------------------------------------ */

int
mpfr_set_f_main (int argc MMUX_BASH_MPFR_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_set_f"
{
  mpfr_ptr	rop;
  mpf_ptr	op;
  mpfr_rnd_t	rnd;
  int		rv;

  rv = mmux_bash_pointers_parse_pointer((void **)&rop, argv[1], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_pointers_parse_pointer((void **)&op, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_mpfr_parse_mpfr_rnd(&rnd, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mpfr_set_f(rop, op, rnd);
  return mmux_bash_mpfr_set_MPFR_RV(rv);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_set_f]]],
    [[[(4 == argc)]]],
    [[["mpfr_set_f MPFR_ROP GMP_MPF MPFR_RND"]]],
    [[["Set an already initialised MPFR number to the given GMP number."]]])


/** --------------------------------------------------------------------
 ** 2exp setting.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_BASH_DEFINE_MPFR_2EXP_SETTER]]],[[[
static int
$1_main (int argc MMUX_BASH_MPFR_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"$1"
{
  $4		value;
  mpfr_ptr	rop;
  $5		exp;
  mpfr_rnd_t	rnd;
  int		rv;

  rv = mmux_bash_pointers_parse_pointer((void **)&rop, argv[1], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_pointers_parse_$2(&value, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = $6(&exp, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_mpfr_parse_mpfr_rnd(&rnd, argv[4], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = $1(rop, value, exp, rnd);
  return mmux_bash_mpfr_set_MPFR_RV(rv);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[$1]]],
    [[[(5 == argc)]]],
    [[["$1 MPFR_ROP $3 MPFR_RND"]]],
    [[["Set an already initialised MPFR number to the given $3."]]])
]]])

MMUX_BASH_DEFINE_MPFR_2EXP_SETTER([[[mpfr_set_si_2exp]]],
    [[[slong]]],	[[[SLONG]]],	[[[signed long int]]],
    [[[mpfr_exp_t]]],	[[[mmux_bash_mpfr_parse_mpfr_exp]]])

MMUX_BASH_DEFINE_MPFR_2EXP_SETTER([[[mpfr_set_ui_2exp]]],
    [[[ulong]]],	[[[ULONG]]],	[[[unsigned long int]]],
    [[[mpfr_exp_t]]],	[[[mmux_bash_mpfr_parse_mpfr_exp]]])

MMUX_BASH_DEFINE_MPFR_2EXP_SETTER([[[mpfr_set_sj_2exp]]],
    [[[sintmax]]],	[[[SINTMAX]]],	[[[intmax_t]]],
    [[[intmax_t]]],	[[[mmux_bash_pointers_parse_sintmax]]])

MMUX_BASH_DEFINE_MPFR_2EXP_SETTER([[[mpfr_set_uj_2exp]]],
    [[[uintmax]]],	[[[UINTMAX]]],	[[[uintmax_t]]],
    [[[intmax_t]]],	[[[mmux_bash_pointers_parse_sintmax]]])

/* ------------------------------------------------------------------ */

static int
mpfr_set_z_2exp_main (int argc MMUX_BASH_MPFR_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_set_z_2exp"
{
  mpz_ptr	value;
  mpfr_ptr	rop;
  mpfr_exp_t	exp;
  mpfr_rnd_t	rnd;
  int		rv;

  rv = mmux_bash_pointers_parse_pointer((void **)&rop, argv[1], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_pointers_parse_pointer((void **)&value, argv[2], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_mpfr_parse_mpfr_exp(&exp, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_mpfr_parse_mpfr_rnd(&rnd, argv[4], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mpfr_set_z_2exp(rop, value, exp, rnd);
  return mmux_bash_mpfr_set_MPFR_RV(rv);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_set_z_2exp]]],
    [[[(5 == argc)]]],
    [[["mpfr_set_z_2exp MPFR_ROP GMP_MPZ MPFR_RND"]]],
    [[["Set an already initialised MPFR number to the given GMP_MPZ."]]])


/* end of file */
