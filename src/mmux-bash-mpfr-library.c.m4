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
 ** Type printers.
 ** ----------------------------------------------------------------- */

int
mmux_bash_mpfr_print_MPFR_PTR (mpfr_ptr X)
{
  int	rv = printf("#<pointer %p>", (void *)X);
  return (0 < rv)? EXECUTION_SUCCESS : EXECUTION_FAILURE;
}
int
mmux_bash_mpfr_sprint_MPFR_PTR (char * str, size_t len, mpfr_ptr value)
{
  snprintf(str, len, "#<pointer %p>", (void *)value);
  return EXECUTION_SUCCESS;
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
