/*
  Part of: MMUX Bash MPFR
  Contents: library functions
  Date: Sep 15, 2024

  Abstract

	This module implements library initialisation and version numbers inspection.

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

mmux_bash_rv_t
mmux_bash_mpfr_set_MPFR_RV (int value, char const * const caller_name)
{
  return mmux_sint_bind_to_bash_variable("MPFR_RV", value, caller_name);
}

mmux_bash_rv_t
mpfr_just_printit_dammit (mpfr_ptr op)
{
  if (mpfr_nan_p(op)) {
    printf("@NaN@\n");
    return MMUX_SUCCESS;
  } else if (mpfr_inf_p(op)) {
    int		sg = mpfr_sgn(op);

    if (+1 == sg) {
      printf("+@Inf@\n");
    } else if (-1 == sg) {
      printf("-@Inf@\n");
    } else {
      printf("@Inf@\n");
    }
    return MMUX_SUCCESS;
  } else {

    int		base	= 10;
    size_t	ndigits = 6;
    mpfr_exp_t	exp = 0;
    char *	str;

    str = mpfr_get_str(NULL, &exp, base, ndigits, op, MPFR_RNDN);
    if (str) {
      if ('-' == str[0]) {
	printf("-0.%se%ld\n", str+1, (mmux_slong_t)exp);
      } else {
	printf("+0.%se%ld\n", str, (mmux_slong_t)exp);
      }
      mpfr_free_str(str);
      return MMUX_SUCCESS;
    }
    return MMUX_FAILURE;
  }
}


/** --------------------------------------------------------------------
 ** Library initialisation.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_DEFINE_MPFR_CONSTANT_VARIABLE]]],[[[
#if ((defined MMUX_HAVE_$1) && (1 == MMUX_HAVE_$1))
  mmux_bash_create_global_sint_variable("$1",	$1,	MMUX_BUILTIN_NAME_STR);
#endif
]]])

m4_define([[[MMUX_DEFINE_MPFR_PREC_CONSTANT_VARIABLE]]],[[[{
  mmux_mpfr_prec_bind_to_bash_variable("$1", $1, MMUX_BUILTIN_NAME_STR);
}]]])

MMUX_BASH_BUILTIN_MAIN([[[mmux_bash_mpfr_library_init]]])
{
  {
    mmux_string_bind_to_bash_global_variable("MPFR_VERSION",		MPFR_VERSION_STRING,	MMUX_BUILTIN_NAME_STR);
    mmux_bash_create_global_sint_variable("MPFR_VERSION_MAJOR",		MPFR_VERSION_MAJOR,	MMUX_BUILTIN_NAME_STR);
    mmux_bash_create_global_sint_variable("MPFR_VERSION_MINOR",		MPFR_VERSION_MINOR,	MMUX_BUILTIN_NAME_STR);
    mmux_bash_create_global_sint_variable("MPFR_VERSION_PATCHLEVEL",	MPFR_VERSION_PATCHLEVEL,MMUX_BUILTIN_NAME_STR);
  }
  {
    mmux_bash_create_global_sint_variable("mpfr_SIZEOF",	sizeof(__mpfr_struct),	MMUX_BUILTIN_NAME_STR);
    mmux_bash_create_global_sint_variable("mpfr_rnd_SIZEOF",	sizeof(mpfr_rnd_t),	MMUX_BUILTIN_NAME_STR);
    mmux_bash_create_global_sint_variable("mpfr_exp_SIZEOF",	sizeof(mpfr_exp_t),	MMUX_BUILTIN_NAME_STR);
    mmux_bash_create_global_sint_variable("mpfr_prec_SIZEOF",	sizeof(mpfr_prec_t),	MMUX_BUILTIN_NAME_STR);
    MMUX_DEFINE_MPFR_PREC_CONSTANT_VARIABLE([[[MPFR_PREC_MIN]]])
    MMUX_DEFINE_MPFR_PREC_CONSTANT_VARIABLE([[[MPFR_PREC_MAX]]])
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
  {
    MMUX_DEFINE_MPFR_CONSTANT_VARIABLE([[[MPFR_FLAGS_UNDERFLOW]]])
    MMUX_DEFINE_MPFR_CONSTANT_VARIABLE([[[MPFR_FLAGS_OVERFLOW]]])
    MMUX_DEFINE_MPFR_CONSTANT_VARIABLE([[[MPFR_FLAGS_NAN]]])
    MMUX_DEFINE_MPFR_CONSTANT_VARIABLE([[[MPFR_FLAGS_INEXACT]]])
    MMUX_DEFINE_MPFR_CONSTANT_VARIABLE([[[MPFR_FLAGS_ERANGE]]])
    MMUX_DEFINE_MPFR_CONSTANT_VARIABLE([[[MPFR_FLAGS_DIVBY0]]])
    MMUX_DEFINE_MPFR_CONSTANT_VARIABLE([[[MPFR_FLAGS_ALL]]])
  }
  {
    MMUX_DEFINE_MPFR_CONSTANT_VARIABLE([[[MPFR_FREE_LOCAL_CACHE]]])
    MMUX_DEFINE_MPFR_CONSTANT_VARIABLE([[[MPFR_FREE_GLOBAL_CACHE]]])
  }
  return MMUX_SUCCESS;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mmux_bash_mpfr_library_init]]],
    [[[(1 == argc)]]],
    [[["mmux_bash_mpfr_library_init"]]],
    [[["Initialise the library."]]])

/* end of file */
