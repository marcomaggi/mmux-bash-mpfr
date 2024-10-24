/*
  Part of: MMUX Bash MPFR
  Contents: implementation of exceptions builtins
  Date: Oct 22, 2024

  Abstract

	This module implements exceptions builtins.

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
 ** Exponent builtins.
 ** ----------------------------------------------------------------- */

m4_define([[[DEFINE_VOID_VOID_BUILTIN]]],[[[MMUX_BASH_BUILTIN_MAIN([[[$1]]])
{
  $1();
  return MMUX_SUCCESS;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(1 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER()."]]])
]]])

/* ------------------------------------------------------------------ */

m4_define([[[DEFINE_INT_VOID_BUILTIN]]],[[[MMUX_BASH_BUILTIN_MAIN([[[$1]]])
{
  int	rv = $1();
  return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BUILTIN_NAME_STR);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(1 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER()."]]])
]]])

/* ------------------------------------------------------------------ */

DEFINE_VOID_VOID_BUILTIN([[[mpfr_clear_underflow]]])
DEFINE_VOID_VOID_BUILTIN([[[mpfr_clear_overflow]]])
DEFINE_VOID_VOID_BUILTIN([[[mpfr_clear_divby0]]])
DEFINE_VOID_VOID_BUILTIN([[[mpfr_clear_nanflag]]])
DEFINE_VOID_VOID_BUILTIN([[[mpfr_clear_inexflag]]])
DEFINE_VOID_VOID_BUILTIN([[[mpfr_clear_erangeflag]]])

DEFINE_VOID_VOID_BUILTIN([[[mpfr_clear_flags]]])

DEFINE_VOID_VOID_BUILTIN([[[mpfr_set_underflow]]])
DEFINE_VOID_VOID_BUILTIN([[[mpfr_set_overflow]]])
DEFINE_VOID_VOID_BUILTIN([[[mpfr_set_divby0]]])
DEFINE_VOID_VOID_BUILTIN([[[mpfr_set_nanflag]]])
DEFINE_VOID_VOID_BUILTIN([[[mpfr_set_inexflag]]])
DEFINE_VOID_VOID_BUILTIN([[[mpfr_set_erangeflag]]])

DEFINE_INT_VOID_BUILTIN([[[mpfr_underflow_p]]])
DEFINE_INT_VOID_BUILTIN([[[mpfr_overflow_p]]])
DEFINE_INT_VOID_BUILTIN([[[mpfr_divby0_p]]])
DEFINE_INT_VOID_BUILTIN([[[mpfr_nanflag_p]]])
DEFINE_INT_VOID_BUILTIN([[[mpfr_inexflag_p]]])
DEFINE_INT_VOID_BUILTIN([[[mpfr_erangeflag_p]]])

/* end of file */
