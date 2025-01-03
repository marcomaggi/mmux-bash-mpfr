/*
  Part of: MMUX Bash MPFR
  Contents: implementation of output builtins
  Date: Sep 15, 2024

  Abstract

	This module implements output builtins.

  Copyright (C) 2024, 2025 Marco Maggi <mrc.mgg@gmail.com>

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
 ** Output to/from ASCIIZ strings.
 ** ----------------------------------------------------------------- */

MMUX_BASH_BUILTIN_MAIN([[[mpfr_dump]]])
{
  mpfr_ptr	op;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_MPFR_PTR([[[op]]],	[[[1]]]);
  mpfr_dump(op);
  return MMUX_SUCCESS;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_dump]]],
    [[[(2 == argc)]]],
    [[["mpfr_dump MPFR_OP"]]],
    [[["Print to stdout a string representation of the numbe."]]])

/* end of file */
