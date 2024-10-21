/*
  Part of: MMUX Bash MPFR
  Contents: implementation of rounding builtins
  Date: Oct 21, 2024

  Abstract

	This module implements rounding builtins.

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
 ** Rounding builtins.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mpfr_set_default_rounding_mode]]])
{
  mpfr_rnd_t	rnd;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_RND([[[rnd]]],	[[[argv[1]]]]);
  {
    mpfr_set_default_rounding_mode(rnd);
    return MMUX_SUCCESS;
  }
  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MPFR_RND"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER(RND)."]]])

MMUX_BASH_BUILTIN_MAIN([[[mpfr_get_default_rounding_mode]]])
{
  mpfr_rnd_t	rnd = mpfr_get_default_rounding_mode();
  return mmux_mpfr_rnd_bind_to_variable(argv[1], rnd, MMUX_BUILTIN_NAME_STR);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MPFR_RNDVAR"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER(RNDVAR)."]]])

/* end of file */
