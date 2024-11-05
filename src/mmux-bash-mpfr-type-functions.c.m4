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

mmux_bash_rv_t
mmux_mpfr_ptr_parse (mpfr_ptr * p_value, char const * const s_value, char const * const who)
{
  return mmux_pointer_parse((void **)p_value, s_value, who);
}
mmux_bash_rv_t
mmux_mpfr_ptr_array_parse (mpfr_ptr ** p_value, char const * const s_value, char const * const who)
{
  return mmux_pointer_parse((void **)p_value, s_value, who);
}
mmux_bash_rv_t
mmux_mpfr_rnd_parse (mpfr_rnd_t * p_value, char const * const s_value, char const * const who)
{
  return mmux_sint_parse(p_value, s_value, who);
}
mmux_bash_rv_t
mmux_mpfr_exp_parse (mpfr_exp_t * p_value, char const * const s_value, char const * const who)
{
  if (sizeof(mpfr_exp_t) == sizeof(mmux_sint_t)) {
    return mmux_sint_parse((mmux_sint_t *)p_value, s_value, who);
  } else
  if (sizeof(mpfr_exp_t) == sizeof(mmux_slong_t)) {
    return mmux_slong_parse((mmux_slong_t *)p_value, s_value, who);
  } else
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_SLLONG]]],[[[
  if (sizeof(mpfr_exp_t) == sizeof(mmux_sllong_t)) {
    return mmux_sllong_parse((mmux_sllong_t *)p_value, s_value, who);
  } else
]]])
  if (sizeof(mpfr_exp_t) == sizeof(mmux_sintmax_t)) {
    return mmux_sintmax_parse(p_value, s_value, who);
  } else {
    return MMUX_FAILURE;
  }
}
mmux_bash_rv_t
mmux_mpfr_prec_parse (mpfr_prec_t * p_value, char const * const s_value, char const * const who)
{
  if (sizeof(mpfr_prec_t) == sizeof(mmux_sint_t)) {
    return mmux_sint_parse((mmux_sint_t *)p_value, s_value, who);
  } else
  if (sizeof(mpfr_prec_t) == sizeof(mmux_slong_t)) {
    return mmux_slong_parse((mmux_slong_t *)p_value, s_value, who);
  } else
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_SLLONG]]],[[[
  if (sizeof(mpfr_prec_t) == sizeof(mmux_sllong_t)) {
    return mmux_sllong_parse((mmux_sllong_t *)p_value, s_value, who);
  } else
]]])
  if (sizeof(mpfr_prec_t) == sizeof(mmux_sintmax_t)) {
    return mmux_sintmax_parse((mmux_sintmax_t *)p_value, s_value, who);
  } else {
    return MMUX_FAILURE;
  }
}
mmux_bash_rv_t
mmux_mpfr_flags_parse (mpfr_flags_t * p_value, char const * const s_value, char const * const who)
{
  if (sizeof(mpfr_flags_t) == sizeof(mmux_uint_t)) {
    return mmux_uint_parse((mmux_uint_t *)p_value, s_value, who);
  } else
  if (sizeof(mpfr_flags_t) == sizeof(mmux_ulong_t)) {
    return mmux_ulong_parse((mmux_ulong_t *)p_value, s_value, who);
  } else
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_ULLONG]]],[[[
  if (sizeof(mpfr_flags_t) == sizeof(mmux_ullong_t)) {
    return mmux_ullong_parse((mmux_ullong_t *)p_value, s_value, who);
  } else
]]])
  if (sizeof(mpfr_flags_t) == sizeof(mmux_uintmax_t)) {
    return mmux_uintmax_parse((mmux_uintmax_t *)p_value, s_value, who);
  } else {
    return MMUX_FAILURE;
  }
}
mmux_bash_rv_t
mmux_mpfr_free_cache_parse (mpfr_free_cache_t * p_value, char const * const s_value, char const * const who)
{
  if (sizeof(mpfr_free_cache_t) == sizeof(mmux_uint_t)) {
    return mmux_uint_parse((mmux_uint_t *)p_value, s_value, who);
  } else
  if (sizeof(mpfr_free_cache_t) == sizeof(mmux_ulong_t)) {
    return mmux_ulong_parse((mmux_ulong_t *)p_value, s_value, who);
  } else
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_ULLONG]]],[[[
  if (sizeof(mpfr_free_cache_t) == sizeof(mmux_ullong_t)) {
    return mmux_ullong_parse((mmux_ullong_t *)p_value, s_value, who);
  } else
]]])
  if (sizeof(mpfr_free_cache_t) == sizeof(mmux_uintmax_t)) {
    return mmux_uintmax_parse((mmux_uintmax_t *)p_value, s_value, who);
  } else {
    return MMUX_FAILURE;
  }
}


/** --------------------------------------------------------------------
 ** Result storers.
 ** ----------------------------------------------------------------- */

mmux_bash_rv_t
mmux_mpfr_ptr_bind_to_bash_variable (char const * variable_name, mpfr_ptr value, char const * who)
{
  return mmux_pointer_bind_to_bash_variable(variable_name, value, who);
}
mmux_bash_rv_t
mmux_mpfr_rnd_bind_to_bash_variable (char const * variable_name, mpfr_rnd_t value, char const * who)
{
  return mmux_sint_bind_to_bash_variable(variable_name, (mmux_sint_t) value, who);
}
mmux_bash_rv_t
mmux_mpfr_exp_bind_to_bash_variable (char const * variable_name, mpfr_exp_t value, char const * who)
{
  if (sizeof(mpfr_exp_t) == sizeof(mmux_sint_t)) {
    return mmux_sint_bind_to_bash_variable(variable_name, (mmux_sint_t) value, who);
  } else
  if (sizeof(mpfr_exp_t) == sizeof(mmux_slong_t)) {
    return mmux_slong_bind_to_bash_variable(variable_name, (mmux_slong_t) value, who);
  } else
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_SLLONG]]],[[[
  if (sizeof(mpfr_exp_t) == sizeof(mmux_sllong_t)) {
    return mmux_sllong_bind_to_bash_variable(variable_name, (mmux_sllong_t) value, who);
  } else
]]])
  if (sizeof(mpfr_exp_t) == sizeof(mmux_sintmax_t)) {
    return mmux_sintmax_bind_to_bash_variable(variable_name, (mmux_sintmax_t) value, who);
  } else {
    return MMUX_FAILURE;
  }
}
mmux_bash_rv_t
mmux_mpfr_prec_bind_to_bash_variable (char const * variable_name, mpfr_prec_t value, char const * who)
{
  if (sizeof(mpfr_prec_t) == sizeof(mmux_sint_t)) {
    return mmux_sint_bind_to_bash_variable(variable_name, (mmux_sint_t) value, who);
  } else
  if (sizeof(mpfr_prec_t) == sizeof(mmux_slong_t)) {
    return mmux_slong_bind_to_bash_variable(variable_name, (mmux_slong_t) value, who);
  } else
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_SLLONG]]],[[[
  if (sizeof(mpfr_prec_t) == sizeof(mmux_sllong_t)) {
    return mmux_sllong_bind_to_bash_variable(variable_name, (mmux_sllong_t) value, who);
  } else
]]])
  if (sizeof(mpfr_prec_t) == sizeof(mmux_sintmax_t)) {
    return mmux_sintmax_bind_to_bash_variable(variable_name, (mmux_sintmax_t) value, who);
  } else {
    return MMUX_FAILURE;
  }
}
mmux_bash_rv_t
mmux_mpfr_flags_bind_to_bash_variable (char const * variable_name, mpfr_flags_t value, char const * who)
{
  if (sizeof(mpfr_flags_t) == sizeof(mmux_uint_t)) {
    return mmux_uint_bind_to_bash_variable(variable_name, (mmux_uint_t) value, who);
  } else
  if (sizeof(mpfr_flags_t) == sizeof(mmux_ulong_t)) {
    return mmux_ulong_bind_to_bash_variable(variable_name, (mmux_ulong_t) value, who);
  } else
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_ULLONG]]],[[[
  if (sizeof(mpfr_flags_t) == sizeof(mmux_ullong_t)) {
    return mmux_ullong_bind_to_bash_variable(variable_name, (mmux_ullong_t) value, who);
  } else
]]])
  if (sizeof(mpfr_flags_t) == sizeof(mmux_uintmax_t)) {
    return mmux_uintmax_bind_to_bash_variable(variable_name, (mmux_uintmax_t) value, who);
  } else {
    return MMUX_FAILURE;
  }
}
mmux_bash_rv_t
mmux_mpfr_free_cache_bind_to_bash_variable (char const * variable_name, mpfr_free_cache_t value, char const * who)
{
  if (sizeof(mpfr_free_cache_t) == sizeof(mmux_uint_t)) {
    return mmux_uint_bind_to_bash_variable(variable_name, (mmux_uint_t) value, who);
  } else
  if (sizeof(mpfr_free_cache_t) == sizeof(mmux_ulong_t)) {
    return mmux_ulong_bind_to_bash_variable(variable_name, (mmux_ulong_t) value, who);
  } else
MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_TYPE_ULLONG]]],[[[
  if (sizeof(mpfr_free_cache_t) == sizeof(mmux_ullong_t)) {
    return mmux_ullong_bind_to_bash_variable(variable_name, (mmux_ullong_t) value, who);
  } else
]]])
  if (sizeof(mpfr_free_cache_t) == sizeof(mmux_uintmax_t)) {
    return mmux_uintmax_bind_to_bash_variable(variable_name, (mmux_uintmax_t) value, who);
  } else {
    return MMUX_FAILURE;
  }
}


/** --------------------------------------------------------------------
 ** Approximate comparison.
 ** ----------------------------------------------------------------- */

int
mmux_mpfr_equal_absmargin (mpfr_ptr op1, mpfr_ptr op2, mpfr_ptr margin)
{
  mpfr_t	diff, abs_diff, abs_margin;
  int		rv;

  mpfr_init(diff);
  mpfr_init(abs_diff);
  mpfr_init(abs_margin);
  {
    mpfr_sub(diff, op1, op2, MPFR_RNDN);
    mpfr_abs(abs_diff, diff, MPFR_RNDN);
    mpfr_abs(abs_margin, margin, MPFR_RNDN);
    rv = mpfr_lessequal_p(abs_diff, abs_margin);
  }
  mpfr_clear(abs_margin);
  mpfr_clear(abs_diff);
  mpfr_clear(diff);
  return rv;
}
mmux_bash_rv_t
mmux_bash_mpfr_set_absmargin_from_string (mpfr_ptr margin, char const * margin_string, char const * who)
{
  mmux_sint_t	base = 0;
  int		rv   = mpfr_set_str(margin, margin_string, base, MPFR_RNDN);

  if (0 == rv) {
    return MMUX_SUCCESS;
  } else {
    if (who) {
      fprintf(stderr, "%s: error: invalid absmargin shell value: %s='%s'\n", who, MMUX_BASH_MPFR_MARGIN_VARNAME, margin_string);
    }
    return MMUX_FAILURE;
  }
}

/* ------------------------------------------------------------------ */

int
mmux_mpfr_equal_relepsilon (mpfr_ptr op1, mpfr_ptr op2, mpfr_ptr epsilon)
{
  mpfr_t	diff, abs_diff, abs_epsilon, abs_op1, abs_op2, max_abs_op, abs_margin;
  int		rv;

  mpfr_init(diff);
  mpfr_init(abs_diff);
  mpfr_init(abs_epsilon);
  mpfr_init(abs_op1);
  mpfr_init(abs_op2);
  mpfr_init(max_abs_op);
  mpfr_init(abs_margin);
  {
    mpfr_sub(diff, op1, op2, MPFR_RNDN);
    mpfr_abs(abs_diff, diff, MPFR_RNDN);

    mpfr_abs(abs_epsilon, epsilon, MPFR_RNDN);
    mpfr_abs(abs_op1, op1, MPFR_RNDN);
    mpfr_abs(abs_op2, op2, MPFR_RNDN);

    mpfr_max(max_abs_op, abs_op1, abs_op2, MPFR_RNDN);
    mpfr_mul(abs_margin, abs_epsilon, max_abs_op, MPFR_RNDN);

    rv = mpfr_lessequal_p(abs_diff, abs_margin);
  }
  mpfr_clear(abs_margin);
  mpfr_clear(max_abs_op);
  mpfr_clear(abs_op2);
  mpfr_clear(abs_op1);
  mpfr_clear(abs_epsilon);
  mpfr_clear(abs_diff);
  mpfr_clear(diff);
  return rv;
}
mmux_bash_rv_t
mmux_bash_mpfr_set_relepsilon_from_string (mpfr_ptr epsilon, char const * epsilon_string, char const * who)
{
  mmux_sint_t	base = 0;
  int		rv   = mpfr_set_str(epsilon, epsilon_string, base, MPFR_RNDN);

  if (0 == rv) {
    return MMUX_SUCCESS;
  } else {
    if (who) {
      fprintf(stderr, "%s: error: invalid relepsilon shell value: %s='%s'\n", who, MMUX_BASH_MPFR_EPSILON_VARNAME, epsilon_string);
    }
    return MMUX_FAILURE;
  }
}

/* end of file */
