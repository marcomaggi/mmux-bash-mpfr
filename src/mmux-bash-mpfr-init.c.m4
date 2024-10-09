/*
  Part of: MMUX Bash MPFR
  Contents: implementation of initialisation and finalisation builtins
  Date: Sep 15, 2024

  Abstract

	This module implements initialisation and finalisation builtins.

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

/* ------------------------------------------------------------------ */

static int
mpfr_init2_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_init2"
{
  mpfr_ptr	ptr;
  mpfr_prec_t	prec;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[ptr]]],	[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PREC([[[prec]]],	[[[argv[2]]]]);

  mpfr_init2(ptr, prec);
  return MMUX_SUCCESS;

  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_init2]]],
    [[[(3 == argc)]]],
    [[["mpfr_init2 MPFR_PTR MPFR_PREC"]]],
    [[["Initialise an already allocated MPFR number."]]])

/* ------------------------------------------------------------------ */

static int
mpfr_inits_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_inits"
{
  mpfr_ptr	ptr;

  for (int i=1; i<argc; ++i) {
    MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[ptr]]], [[[argv[i]]]]);
    mpfr_init(ptr);
  }
  return MMUX_SUCCESS;

  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_inits]]],
    [[[(2 <= argc)]]],
    [[["mpfr_inits MPFR_PTR0 MPFR_PTR ..."]]],
    [[["Initialise already allocated MPFR numbers."]]])

/* ------------------------------------------------------------------ */

static int
mpfr_inits2_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_inits2"
{
  mpfr_prec_t	prec;
  mpfr_ptr	ptr;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PREC([[[prec]]],	[[[argv[1]]]]);
  for (int i=2; i<argc; ++i) {
    MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[ptr]]],	[[[argv[i]]]]);
    mpfr_init2(ptr, prec);
  }
  return MMUX_SUCCESS;

  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_inits2]]],
    [[[(3 <= argc)]]],
    [[["mpfr_inits2 MPFR_PREC MPFR_PTR0 MPFR_PTR ..."]]],
    [[["Initialise already allocated MPFR numbers."]]])

/* ------------------------------------------------------------------ */

static int
mpfr_clears_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_clears"
{
  mpfr_ptr	ptr;

  for (int i=1; i<argc; ++i) {
    MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[ptr]]], [[[argv[i]]]]);
    mpfr_clear(ptr);
  }
  return MMUX_SUCCESS;

  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_clears]]],
    [[[(2 <= argc)]]],
    [[["mpfr_clears MPFR_PTR0 MPFR_PTR ..."]]],
    [[["Finalise already allocated MPFR numbers."]]])


/** --------------------------------------------------------------------
 ** Precision functions.
 ** ----------------------------------------------------------------- */

static int
mpfr_set_default_prec_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_set_default_prec"
{
  mpfr_prec_t	prec;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PREC([[[prec]]], [[[argv[1]]]]);

  mpfr_set_default_prec(prec);
  return MMUX_SUCCESS;

  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_set_default_prec]]],
    [[[(2 == argc)]]],
    [[["mpfr_set_default_prec MPFR_PREC"]]],
    [[["Configure the default MPFR numbers precision."]]])

/* ------------------------------------------------------------------ */

static int
mpfr_get_default_prec_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_get_default_prec"
{
  mpfr_prec_t	prec;

  prec = mpfr_get_default_prec();
  return mmux_mpfr_prec_bind_to_variable(argv[1], prec, MMUX_BUILTIN_NAME);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_get_default_prec]]],
    [[[(2 == argc)]]],
    [[["mpfr_get_default_prec MPFR_PREC_VAR"]]],
    [[["Store in MPFR_PREC_VAR the default MPFR numbers precision."]]])

/* ------------------------------------------------------------------ */

static int
mpfr_set_prec_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_set_prec"
{
  mpfr_ptr	op;
  mpfr_prec_t	prec;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op]]],	[[[argv[1]]]]);
  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PREC([[[prec]]],	[[[argv[2]]]]);

  mpfr_set_prec(op, prec);
  return MMUX_SUCCESS;

  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_set_prec]]],
    [[[(3 == argc)]]],
    [[["mpfr_set_prec MPFR_PTR MPFR_PREC"]]],
    [[["Set the precision of an MPFR number."]]])

/* ------------------------------------------------------------------ */

static int
mpfr_get_prec_main (int argc MMUX_BASH_MPFR_UNUSED, char const * const argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"mpfr_get_prec"
{
  mpfr_ptr	op;
  mpfr_prec_t	prec;

  MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR([[[op]]],	[[[argv[2]]]]);

  prec = mpfr_get_prec(op);
  return mmux_mpfr_prec_bind_to_variable(argv[1], prec, MMUX_BUILTIN_NAME);

  MMUX_BASH_BUILTIN_ARG_PARSER_ERROR_BRANCH;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mpfr_get_prec]]],
    [[[(3 == argc)]]],
    [[["mpfr_get_prec MPFR_PREC_VAR MPFR_PTR"]]],
    [[["Retrieve the precision of an MPFR number."]]])

/* end of file */
