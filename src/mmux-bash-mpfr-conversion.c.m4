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
      int	rv_mantissa = mmux_bash_store_string_in_variable               (argv[1], str, MMUX_BUILTIN_NAME);
      int	rv_exponent = mmux_bash_mpfr_store_result_in_variable_mpfr_exp (argv[2], exp, MMUX_BUILTIN_NAME);
      mpfr_free_str(str);
      if ((MMUX_SUCCESS == rv_mantissa) && (MMUX_SUCCESS == rv_exponent)) {
	return MMUX_SUCCESS;
      } else {
	return MMUX_FAILURE;
      }
    }
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_get_str]]],
    [[[(7 == argc)]]],
    [[["mpfr_get_str MANTISSA_VAR EXPONENT_VAR BASE NDIGITS MPFR_OP MPFR_RND"]]],
    [[["Convert a MPFR number to string, store the resulting mantissa and exponent in the given shell variables."]]])

/* end of file */
