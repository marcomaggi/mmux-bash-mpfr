/*
  Part of: MMUX Bash MPFR
  Contents: MPFR type functions
  Date: Oct  2, 2024

  Abstract

	This module implements functions to interface MPFR specific types.

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
 ** Type parsers.
 ** ----------------------------------------------------------------- */

int
mmux_mpfr_ptr_parse (mpfr_ptr * p_value, char const * const s_value, char const * const caller_name)
{
  return mmux_pointer_parse((void **)p_value, s_value, caller_name);
}
int
mmux_mpfr_rnd_parse (mpfr_rnd_t * p_value, char const * const s_value, char const * const caller_name)
{
  return mmux_sint_parse(p_value, s_value, caller_name);
}
int
mmux_mpfr_exp_parse (mpfr_exp_t * p_value, char const * const s_value, char const * const caller_name)
{
  if (sizeof(mpfr_exp_t) == sizeof(mmux_sint_t)) {
    return mmux_sint_parse((mmux_sint_t *)p_value, s_value, caller_name);
  } else
  if (sizeof(mpfr_exp_t) == sizeof(mmux_slong_t)) {
    return mmux_slong_parse((mmux_slong_t *)p_value, s_value, caller_name);
  } else
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_SLLONG]]],[[[
  if (sizeof(mpfr_exp_t) == sizeof(mmux_sllong_t)) {
    return mmux_sllong_parse((mmux_sllong_t *)p_value, s_value, caller_name);
  } else
]]])
  if (sizeof(mpfr_exp_t) == sizeof(mmux_sintmax_t)) {
    return mmux_sintmax_parse(p_value, s_value, caller_name);
  } else {
    return MMUX_FAILURE;
  }
}
int
mmux_mpfr_prec_parse (mpfr_prec_t * p_value, char const * const s_value, char const * const caller_name)
{
  if (sizeof(mpfr_prec_t) == sizeof(mmux_sint_t)) {
    return mmux_sint_parse((mmux_sint_t *)p_value, s_value, caller_name);
  } else
  if (sizeof(mpfr_prec_t) == sizeof(mmux_slong_t)) {
    return mmux_slong_parse((mmux_slong_t *)p_value, s_value, caller_name);
  } else
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_SLLONG]]],[[[
  if (sizeof(mpfr_prec_t) == sizeof(mmux_sllong_t)) {
    return mmux_sllong_parse((mmux_sllong_t *)p_value, s_value, caller_name);
  } else
]]])
  if (sizeof(mpfr_prec_t) == sizeof(mmux_sintmax_t)) {
    return mmux_sintmax_parse(p_value, s_value, caller_name);
  } else {
    return MMUX_FAILURE;
  }
}


/** --------------------------------------------------------------------
 ** Result storers.
 ** ----------------------------------------------------------------- */

int
mmux_mpfr_ptr_bind_to_variable (char const * variable_name, mpfr_ptr value, char const * caller_name)
{
  return mmux_pointer_bind_to_variable(variable_name, value, caller_name);
}
int
mmux_mpfr_rnd_bind_to_variable (char const * variable_name, mpfr_rnd_t value, char const * caller_name)
{
  return mmux_sint_bind_to_variable(variable_name, (mmux_sint_t) value, caller_name);
}
int
mmux_mpfr_exp_bind_to_variable (char const * variable_name, mpfr_exp_t value, char const * caller_name)
{
  if (sizeof(mpfr_exp_t) == sizeof(mmux_sint_t)) {
    return mmux_sint_bind_to_variable(variable_name, (mmux_sint_t) value, caller_name);
  } else
  if (sizeof(mpfr_exp_t) == sizeof(mmux_slong_t)) {
    return mmux_slong_bind_to_variable(variable_name, (mmux_slong_t) value, caller_name);
  } else
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_SLLONG]]],[[[
  if (sizeof(mpfr_exp_t) == sizeof(mmux_sllong_t)) {
    return mmux_sllong_bind_to_variable(variable_name, (mmux_sllong_t) value, caller_name);
  } else
]]])
  if (sizeof(mpfr_exp_t) == sizeof(mmux_sintmax_t)) {
    return mmux_sint_bind_to_variable(variable_name, (mmux_sintmax_t) value, caller_name);
  } else {
    return MMUX_FAILURE;
  }
}
int
mmux_mpfr_prec_bind_to_variable (char const * variable_name, mpfr_prec_t value, char const * caller_name)
{
  if (sizeof(mpfr_prec_t) == sizeof(mmux_sint_t)) {
    return mmux_sint_bind_to_variable(variable_name, (mmux_sint_t) value, caller_name);
  } else
  if (sizeof(mpfr_prec_t) == sizeof(mmux_slong_t)) {
    return mmux_slong_bind_to_variable(variable_name, (mmux_slong_t) value, caller_name);
  } else
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_SLLONG]]],[[[
  if (sizeof(mpfr_prec_t) == sizeof(mmux_sllong_t)) {
    return mmux_sllong_bind_to_variable(variable_name, (mmux_sllong_t) value, caller_name);
  } else
]]])
  if (sizeof(mpfr_prec_t) == sizeof(mmux_sintmax_t)) {
    return mmux_sint_bind_to_variable(variable_name, (mmux_sintmax_t) value, caller_name);
  } else {
    return MMUX_FAILURE;
  }
}

/* end of file */
