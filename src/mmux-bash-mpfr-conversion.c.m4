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
 ** Conversion to/from ASCIIZ strings.
 ** ----------------------------------------------------------------- */

static int
mpfr_get_str_main (int argc MMUX_BASH_MPFR_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_get_str"
{
#undef  LEN
#define LEN	4096
  char		str[LEN];
  mpfr_exp_t	exp;
  int		base;
  mpfr_ptr	op;
  size_t	ndigits;
  mpfr_rnd_t	rnd;
  int		rv;

  if (0) { fprintf(stderr, "%s: argc=%d, MANTISSA_VAR=%s, EXPONENT_VAR=%s\n", __func__, argc, argv[1], argv[2]); }

  rv = mmux_bash_pointers_parse_sint(&base, argv[3], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_pointers_parse_usize(&ndigits, argv[4], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_pointers_parse_pointer((void **)&op, argv[5], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_mpfr_parse_mpfr_rnd(&rnd, argv[6], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  mpfr_get_str(str, &exp, base, ndigits, op, rnd);
  {
    SHELL_VAR *	v MMUX_BASH_POINTERS_UNUSED;
    /* NOTE I  do not  know what FLAGS  is for,  but setting it  to zero  seems fine.
       (Marco Maggi; Sep 9, 2024) */
    int		flags = 0;

    v = bind_variable(argv[1], str, flags);
  }
  {
#undef  LEN
#define LEN	1024
    char	strexp[LEN];
    SHELL_VAR *	v MMUX_BASH_POINTERS_UNUSED;
    /* NOTE I  do not  know what FLAGS  is for,  but setting it  to zero  seems fine.
       (Marco Maggi; Sep 9, 2024) */
    int		flags = 0;

    mmux_bash_pointers_sprint_sintmax(strexp, LEN, (intmax_t)exp);
    v = bind_variable(argv[2], strexp, flags);
  }
  return EXECUTION_SUCCESS;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_get_str]]],
    [[[(7 == argc)]]],
    [[["mpfr_get_str MANTISSA_VAR EXPPONENT_VAR BASE NDIGITS MPFR_OP MPFR_RND"]]],
    [[["Convert a MPFR number to string, store the resulting mantissa and exponent in the given shell variables."]]])

/* end of file */
