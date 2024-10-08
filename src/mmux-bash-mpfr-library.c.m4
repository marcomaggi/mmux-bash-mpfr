/*
  Part of: MMUX Bash MPFR
  Contents: library functions
  Date: Sep 15, 2024

  Abstract

	This module implements library initialisation and version numbers inspection.

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
 ** Version functions.
 ** ----------------------------------------------------------------- */

char const *
mmux_bash_mpfr_version_string (void)
{
  return mmux_bash_mpfr_VERSION_INTERFACE_STRING;
}
int
mmux_bash_mpfr_version_interface_current (void)
{
  return mmux_bash_mpfr_VERSION_INTERFACE_CURRENT;
}
int
mmux_bash_mpfr_version_interface_revision (void)
{
  return mmux_bash_mpfr_VERSION_INTERFACE_REVISION;
}
int
mmux_bash_mpfr_version_interface_age (void)
{
  return mmux_bash_mpfr_VERSION_INTERFACE_AGE;
}


/** --------------------------------------------------------------------
 ** Helpers.
 ** ----------------------------------------------------------------- */

int
mmux_bash_mpfr_set_MPFR_RV (int value, char const * const caller_name)
{
  return mmux_sint_bind_to_variable("MPFR_RV", value, caller_name);
}


/** --------------------------------------------------------------------
 ** Library initialisation.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_DEFINE_MPFR_CONSTANT_VARIABLE]]],[[[
#if ((defined MMUX_HAVE_$1) && (1 == MMUX_HAVE_$1))
  mmux_bash_create_global_sint_variable("$1",	$1,	MMUX_BUILTIN_NAME);
#endif
]]])

static int
mmux_bash_mpfr_library_init_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[] MMUX_BASH_MPFR_UNUSED)
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mmux_bash_mpfr_library_init"
{
  {
    mmux_bash_create_global_sint_variable("mpfr_SIZEOF",	sizeof(__mpfr_struct),	MMUX_BUILTIN_NAME);
    mmux_bash_create_global_sint_variable("mpfr_rnd_SIZEOF",	sizeof(mpfr_rnd_t),	MMUX_BUILTIN_NAME);
    mmux_bash_create_global_sint_variable("mpfr_exp_SIZEOF",	sizeof(mpfr_exp_t),	MMUX_BUILTIN_NAME);
    mmux_bash_create_global_sint_variable("mpfr_prec_SIZEOF",	sizeof(mpfr_prec_t),	MMUX_BUILTIN_NAME);
  }
  {
    MMUX_DEFINE_MPFR_CONSTANT_VARIABLE([[[MPFR_RNDN]]]);
    MMUX_DEFINE_MPFR_CONSTANT_VARIABLE([[[MPFR_RNDZ]]]);
    MMUX_DEFINE_MPFR_CONSTANT_VARIABLE([[[MPFR_RNDU]]]);
    MMUX_DEFINE_MPFR_CONSTANT_VARIABLE([[[MPFR_RNDD]]]);
    MMUX_DEFINE_MPFR_CONSTANT_VARIABLE([[[MPFR_RNDA]]]);
    MMUX_DEFINE_MPFR_CONSTANT_VARIABLE([[[MPFR_RNDF]]]);
    MMUX_DEFINE_MPFR_CONSTANT_VARIABLE([[[MPFR_RNDNA]]]);
  }
  return MMUX_SUCCESS;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_bash_mpfr_library_init]]],
    [[[(1 == argc)]]],
    [[["mmux_bash_mpfr_library_init"]]],
    [[["Initialise the library."]]])

/* end of file */
