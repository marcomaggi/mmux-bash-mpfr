/*
  Part of: MMUX Bash MPFR
  Contents: implementation of exceptions builtins
  Date: Oct 22, 2024

  Abstract

	This module implements exceptions builtins.

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
 ** Exceptions builtins.
 ** ----------------------------------------------------------------- */

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

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mpfr_flags_clear]]])
{
  mpfr_flags_t	mask;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_MPFR_FLAGS([[[mask]]],	[[[1]]]);
  {
    MMUX_BASH_BUILTIN_IDENTIFIER[[[]]](mask);
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MPFR_FLAGS_MASK"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER[[[]]](MASK)."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mpfr_flags_set]]])
{
  mpfr_flags_t	mask;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_MPFR_FLAGS([[[mask]]],	[[[1]]]);
  {
    MMUX_BASH_BUILTIN_IDENTIFIER[[[]]](mask);
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MPFR_FLAGS_MASK"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER[[[]]](MASK)."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mpfr_flags_test]]])
{
  mpfr_flags_t	mask;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_MPFR_FLAGS([[[mask]]],	[[[2]]]);
  {
    mpfr_flags_t	rv = MMUX_BASH_BUILTIN_IDENTIFIER[[[]]](mask);
    return mmux_mpfr_flags_bind_to_bash_variable(argv[1], rv, MMUX_BASH_BUILTIN_STRING_NAME);
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MPFR_FLAGSVAR MPFR_FLAGS_MASK"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER[[[]]](FLAGSVAR,MASK)."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mpfr_flags_save]]])
{
  mpfr_flags_t	rv = MMUX_BASH_BUILTIN_IDENTIFIER[[[]]]();
  return mmux_mpfr_flags_bind_to_bash_variable(argv[1], rv, MMUX_BASH_BUILTIN_STRING_NAME);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(2 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MPFR_FLAGSVAR"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER[[[]]](FLAGSVAR)."]]])

/* ------------------------------------------------------------------ */

MMUX_BASH_BUILTIN_MAIN([[[mpfr_flags_restore]]])
{
  mpfr_flags_t	flags, mask;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_MPFR_FLAGS([[[flags]]],	[[[1]]]);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_MPFR_FLAGS([[[mask]]],		[[[2]]]);
  {
    MMUX_BASH_BUILTIN_IDENTIFIER[[[]]](flags,mask);
    return MMUX_SUCCESS;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(3 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MPFR_FLAGSVAR MPFR_FLAGS_MASK"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER[[[]]](FLAGSVAR,MASK)."]]])

/* end of file */
