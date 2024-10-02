/*
  Part of: MMUX Bash MPFR
  Contents: MPFR type functions
  Date: Oct  2, 2024

  Abstract

	This module implements functions to interface MPFR specific types.

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
 ** Type parsers.
 ** ----------------------------------------------------------------- */

int
mmux_bash_mpfr_parse_mpfr_ptr (mpfr_ptr * p_value, char const * const s_value, char const * const caller_name)
{
  return mmux_bash_pointers_parse_pointer((void **)p_value, s_value, caller_name);
}
int
mmux_bash_mpfr_parse_mpfr_rnd (mpfr_rnd_t * p_value, char const * const s_value, char const * const caller_name)
{
  return mmux_bash_pointers_parse_sint(p_value, s_value, caller_name);
}
int
mmux_bash_mpfr_parse_mpfr_exp (mpfr_exp_t * p_value, char const * const s_value, char const * const caller_name)
{
  if (sizeof(mpfr_exp_t) == sizeof(mmux_libc_sint_t)) {
    return mmux_bash_pointers_parse_sint((mmux_libc_sint_t *)p_value, s_value, caller_name);
  } else
  if (sizeof(mpfr_exp_t) == sizeof(mmux_libc_slong_t)) {
    return mmux_bash_pointers_parse_slong((mmux_libc_slong_t *)p_value, s_value, caller_name);
  } else
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_SLLONG]]],[[[
  if (sizeof(mpfr_exp_t) == sizeof(mmux_libc_sllong_t)) {
    return mmux_bash_pointers_parse_sllong((mmux_libc_sllong_t *)p_value, s_value, caller_name);
  } else
]]])
  if (sizeof(mpfr_exp_t) == sizeof(mmux_libc_sintmax_t)) {
    return mmux_bash_pointers_parse_sintmax(p_value, s_value, caller_name);
  } else {
    return MMUX_FAILURE;
  }
}


/** --------------------------------------------------------------------
 ** Result storers.
 ** ----------------------------------------------------------------- */

int
mmux_bash_mpfr_store_result_in_variable_mpfr_ptr (char const * variable_name, mpfr_ptr value, char const * caller_name)
{
  return mmux_bash_pointers_store_result_in_variable_pointer(variable_name, value, caller_name);
}
int
mmux_bash_mpfr_store_result_in_variable_mpfr_rnd (char const * variable_name, mpfr_rnd_t value, char const * caller_name)
{
  return mmux_bash_pointers_store_result_in_variable_sint(variable_name, (mmux_libc_sint_t) value, caller_name);
}
int
mmux_bash_mpfr_store_result_in_variable_mpfr_exp (char const * variable_name, mpfr_exp_t value, char const * caller_name)
{
  if (sizeof(mpfr_exp_t) == sizeof(mmux_libc_sint_t)) {
    return mmux_bash_pointers_store_result_in_variable_sint(variable_name, (mmux_libc_sint_t) value, caller_name);
  } else
  if (sizeof(mpfr_exp_t) == sizeof(mmux_libc_slong_t)) {
    return mmux_bash_pointers_store_result_in_variable_slong(variable_name, (mmux_libc_slong_t) value, caller_name);
  } else
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_SLLONG]]],[[[
  if (sizeof(mpfr_exp_t) == sizeof(mmux_libc_sllong_t)) {
    return mmux_bash_pointers_store_result_in_variable_sllong(variable_name, (mmux_libc_sllong_t) value, caller_name);
  } else
]]])
  if (sizeof(mpfr_exp_t) == sizeof(mmux_libc_sintmax_t)) {
    return mmux_bash_pointers_store_result_in_variable_sint(variable_name, (mmux_libc_sintmax_t) value, caller_name);
  } else {
    return MMUX_FAILURE;
  }
}

/* end of file */
