/*
  Part of: MMUX Bash Mpfr
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

void
mmux_bash_mpfr_create_global_sint_variable (const char * name, int value)
{
  SHELL_VAR *	v MMUX_BASH_MPFR_UNUSED;
#undef  LEN
#define LEN	64
  char		str[LEN];
  /* NOTE I have found these "att_*"  flags in Bash's source code, file "variable.h";
     I do not know if I am using them correctly (Marco Maggi; Sep 11, 2024) */
  int		flags = att_integer;

  snprintf(str, LEN, "%d", value);
  v = bind_global_variable(name, str, flags);
}
int
mmux_bash_mpfr_set_MPFR_RV (int rv)
{
  SHELL_VAR *	v MMUX_BASH_MPFR_UNUSED;
  /* NOTE I have found these "att_*"  flags in Bash's source code, file "variable.h";
     I do not know if I am using them correctly (Marco Maggi; Sep 11, 2024) */
  int		flags = att_integer;
#undef  LEN
#define LEN	32
  char	str[LEN];

  mmux_bash_pointers_sprint_sint(str, LEN, rv);
  v = bind_variable("MPFR_RV", str, flags);
  return EXECUTION_SUCCESS;
}


/** --------------------------------------------------------------------
 ** Parsers.
 ** ----------------------------------------------------------------- */

int
mmux_bash_mpfr_parse_mpfr_rnd (mpfr_rnd_t * p_data, char const * const s_arg, char const * const caller_name)
{
  return mmux_bash_pointers_parse_sint(p_data, s_arg, caller_name);
}
int
mmux_bash_mpfr_parse_mpfr_exp (mpfr_exp_t * p_data, char const * const s_arg, char const * const caller_name)
{
  if (sizeof(mpfr_exp_t) == sizeof(signed int)) {
    return mmux_bash_pointers_parse_sint(p_data, s_arg, caller_name);
  } else
  if (sizeof(mpfr_exp_t) == sizeof(signed long)) {
    return mmux_bash_pointers_parse_slong(p_data, s_arg, caller_name);
  } else
#if ((defined HAVE_LONG_LONG_INT) && (1 == HAVE_LONG_LONG_INT))
  if (sizeof(mpfr_exp_t) == sizeof(signed long long int)) {
    return mmux_bash_pointers_parse_sllong(p_data, s_arg, caller_name);
  } else
#endif
  if (sizeof(mpfr_exp_t) == sizeof(intmax_t)) {
    return mmux_bash_pointers_parse_sintmax(p_data, s_arg, caller_name);
  } else {
    return EXECUTION_FAILURE;
  }
}


/** --------------------------------------------------------------------
 ** Library initialisation.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_DEFINE_MPFR_CONSTANT_VARIABLE]]],[[[
#if ((defined MMUX_HAVE_$1) && (1 == MMUX_HAVE_$1))
  mmux_bash_mpfr_create_global_sint_variable("$1",	$1);
#endif
]]])

static int
mmux_bash_mpfr_library_init_builtin (WORD_LIST * list MMUX_BASH_MPFR_UNUSED)
{
  {
    mmux_bash_mpfr_create_global_sint_variable("mpfr_SIZEOF_MPFR",	sizeof(__mpfr_struct));
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
  return EXECUTION_SUCCESS;
}
static char * mmux_bash_mpfr_library_init_doc[] = {
  "Initialise the library.",
  (char *)NULL
};
struct builtin mmux_bash_mpfr_library_init_struct = {
  .name		= "mmux_bash_mpfr_library_init",	/* Builtin name */
  .function	= mmux_bash_mpfr_library_init_builtin,	/* Function implementing the builtin */
  .flags	= BUILTIN_ENABLED,			/* Initial flags for builtin */
  .long_doc	= mmux_bash_mpfr_library_init_doc,	/* Array of long documentation strings. */
  .short_doc	= "mmux_bash_mpfr_library_init",	/* Usage synopsis; becomes short_doc */
  .handle	= 0					/* Reserved for internal use */
};

/* end of file */
