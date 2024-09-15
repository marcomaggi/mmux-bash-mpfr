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

MMUX_BASH_DEFINE_MPFR_SETTER([[[mpfr_set_si]]],		[[[sint]]],	[[[SINT]]],	[[[signed int]]])
MMUX_BASH_DEFINE_MPFR_SETTER([[[mpfr_set_ui]]],		[[[uint]]],	[[[UINT]]],	[[[unsigned int]]])



MMUX_BASH_DEFINE_MPFR_SETTER([[[mpfr_set_d]]],		[[[double]]],	[[[DOUBLE]]],	[[[double]]])

/* ------------------------------------------------------------------ */

int
mfpr_set_main (int argc MMUX_BASH_MPFR_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mfpr_set"
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

/* end of file */
