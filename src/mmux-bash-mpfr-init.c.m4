/*
  Part of: MMUX Bash MPFR
  Contents: implementation of initialisation and finalisation builtins
  Date: Sep 15, 2024

  Abstract

	This module implements initialisation and finalisation builtins.

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
 ** Basic initialisation and finalisation.
 ** ----------------------------------------------------------------- */

static int
mpfr_init_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_init"
{
  mpfr_ptr	ptr;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[ptr]]], [[[argv[1]]]]);

  mpfr_init(ptr);
  return MMUX_SUCCESS;

  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_init]]],
    [[[(2 == argc)]]],
    [[["mpfr_init MPFR_PTR"]]],
    [[["Initialise an already allocated MPFR number."]]])

/* ------------------------------------------------------------------ */

static int
mpfr_clear_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_clear"
{
  mpfr_ptr	ptr;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[ptr]]], [[[argv[1]]]]);

  mpfr_clear(ptr);
  return MMUX_SUCCESS;

  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_clear]]],
    [[[(2 == argc)]]],
    [[["mpfr_clear MPFR_PTR"]]],
    [[["Finalise a MPFR number."]]])

/* end of file */
