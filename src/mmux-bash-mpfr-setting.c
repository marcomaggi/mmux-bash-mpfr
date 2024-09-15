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

static int
mpfr_set_d_main (int argc MMUX_BASH_MPFR_UNUSED,  char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_set_d"
{
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_set_d]]],
    [[[(4 == argc)]]],
    [[["mpfr_set_d MPFR_PTR DOUBLE MPFR_RND"]]],
    [[["Set an already initialised MPFR number to the given DOUBLE."]]])

/* end of file */
