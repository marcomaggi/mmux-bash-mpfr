/*
  Part of: MMUX Bash MPFR
  Contents: implementation of transcendental builtins
  Date: Oct 20, 2024

  Abstract

	This module implements transcendental builtins.

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
 ** Trancendental functions functions.
 ** ----------------------------------------------------------------- */

DEFINE_UNARY_BUILTIN([[[mpfr_log]]])
DEFINE_UNARY_UI_BUILTIN([[[mpfr_log_ui]]])
DEFINE_UNARY_BUILTIN([[[mpfr_log2]]])
DEFINE_UNARY_BUILTIN([[[mpfr_log10]]])
DEFINE_UNARY_BUILTIN([[[mpfr_log1p]]])
DEFINE_UNARY_BUILTIN([[[mpfr_log2p1]]])
DEFINE_UNARY_BUILTIN([[[mpfr_log10p1]]])

DEFINE_UNARY_BUILTIN([[[mpfr_exp]]])
DEFINE_UNARY_BUILTIN([[[mpfr_exp2]]])
DEFINE_UNARY_BUILTIN([[[mpfr_exp10]]])
DEFINE_UNARY_BUILTIN([[[mpfr_expm1]]])
DEFINE_UNARY_BUILTIN([[[mpfr_exp2m1]]])
DEFINE_UNARY_BUILTIN([[[mpfr_exp10m1]]])

DEFINE_BINARY_BUILTIN([[[mpfr_pow]]])
DEFINE_BINARY_BUILTIN([[[mpfr_powr]]])
DEFINE_BINARY_SI_BUILTIN([[[mpfr_pow_si]]])
DEFINE_BINARY_UI_BUILTIN([[[mpfr_pow_ui]]])
DEFINE_BINARY_SJ_BUILTIN([[[mpfr_pow_sj]]])
DEFINE_BINARY_UJ_BUILTIN([[[mpfr_pow_uj]]])
DEFINE_BINARY_Z_BUILTIN([[[mpfr_pow_z]]])
DEFINE_UI_BINARY_UI_BUILTIN([[[mpfr_ui_pow_ui]]])
DEFINE_UI_BINARY_BUILTIN([[[mpfr_ui_pow]]])

DEFINE_BINARY_SI_BUILTIN([[[mpfr_compound_si]]])

DEFINE_UNARY_BUILTIN([[[mpfr_sin]]])
DEFINE_UNARY_BUILTIN([[[mpfr_cos]]])
DEFINE_UNARY_BUILTIN([[[mpfr_tan]]])

DEFINE_UNARY_BUILTIN([[[mpfr_sinpi]]])
DEFINE_UNARY_BUILTIN([[[mpfr_cospi]]])
DEFINE_UNARY_BUILTIN([[[mpfr_tanpi]]])
DEFINE_BINARY_BUILTIN([[[mpfr_sin_cos]]]) m4_dnl Ha! Ha! Ha! It's the same!

DEFINE_UNARY_BUILTIN([[[mpfr_sec]]])
DEFINE_UNARY_BUILTIN([[[mpfr_csc]]])
DEFINE_UNARY_BUILTIN([[[mpfr_cot]]])

DEFINE_UNARY_BUILTIN([[[mpfr_asin]]])
DEFINE_UNARY_BUILTIN([[[mpfr_acos]]])
DEFINE_UNARY_BUILTIN([[[mpfr_atan]]])

DEFINE_BINARY_UI_BUILTIN([[[mpfr_acosu]]])
DEFINE_BINARY_UI_BUILTIN([[[mpfr_asinu]]])
DEFINE_BINARY_UI_BUILTIN([[[mpfr_atanu]]])

DEFINE_UNARY_BUILTIN([[[mpfr_asinpi]]])
DEFINE_UNARY_BUILTIN([[[mpfr_acospi]]])
DEFINE_UNARY_BUILTIN([[[mpfr_atanpi]]])

DEFINE_BINARY_BUILTIN([[[mpfr_atan2]]])
DEFINE_TERNARY_UI_BUILTIN([[[mpfr_atan2u]]])
DEFINE_BINARY_BUILTIN([[[mpfr_atan2pi]]])

DEFINE_UNARY_BUILTIN([[[mpfr_sinh]]])
DEFINE_UNARY_BUILTIN([[[mpfr_cosh]]])
DEFINE_UNARY_BUILTIN([[[mpfr_tanh]]])
DEFINE_BINARY_BUILTIN([[[mpfr_sinh_cosh]]]) m4_dnl Ha! Ha! Ha! It's the same!

DEFINE_UNARY_BUILTIN([[[mpfr_sech]]])
DEFINE_UNARY_BUILTIN([[[mpfr_csch]]])
DEFINE_UNARY_BUILTIN([[[mpfr_coth]]])

DEFINE_UNARY_BUILTIN([[[mpfr_asinh]]])
DEFINE_UNARY_BUILTIN([[[mpfr_acosh]]])
DEFINE_UNARY_BUILTIN([[[mpfr_atanh]]])

DEFINE_UNARY_BUILTIN([[[mpfr_eint]]])
DEFINE_UNARY_BUILTIN([[[mpfr_li2]]])
DEFINE_UNARY_BUILTIN([[[mpfr_gamma]]])
DEFINE_BINARY_BUILTIN([[[mpfr_gamma_inc]]])
DEFINE_UNARY_BUILTIN([[[mpfr_lngamma]]])
DEFINE_UNARY_BUILTIN([[[mpfr_digamma]]])
DEFINE_BINARY_BUILTIN([[[mpfr_beta]]])
DEFINE_UNARY_BUILTIN([[[mpfr_zeta]]])
DEFINE_UNARY_UI_BUILTIN([[[mpfr_zeta_ui]]])
DEFINE_UNARY_BUILTIN([[[mpfr_erf]]])
DEFINE_UNARY_BUILTIN([[[mpfr_erfc]]])
DEFINE_UNARY_BUILTIN([[[mpfr_j0]]])
DEFINE_UNARY_BUILTIN([[[mpfr_j1]]])
DEFINE_SI_BINARY_BUILTIN([[[mpfr_jn]]])
DEFINE_UNARY_BUILTIN([[[mpfr_y0]]])
DEFINE_UNARY_BUILTIN([[[mpfr_y1]]])
DEFINE_SI_BINARY_BUILTIN([[[mpfr_yn]]])
DEFINE_BINARY_BUILTIN([[[mpfr_agm]]])
DEFINE_UNARY_BUILTIN([[[mpfr_ai]]])

DEFINE_NULLARY_BUILTIN([[[mpfr_const_log2]]])
DEFINE_NULLARY_BUILTIN([[[mpfr_const_pi]]])
DEFINE_NULLARY_BUILTIN([[[mpfr_const_euler]]])
DEFINE_NULLARY_BUILTIN([[[mpfr_const_catalan]]])

MMUX_BASH_BUILTIN_MAIN([[[mpfr_lgamma]]])
{
  mpfr_ptr	rop, op;
  mpfr_rnd_t	rnd;
  mmux_sint_t	sign;

  MMUX_BASH_PARSE_BUILTIN_ARGNUM_MPFR_PTR([[[rop]]],	[[[1]]]);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_MPFR_PTR([[[op]]],	[[[3]]]);
  MMUX_BASH_PARSE_BUILTIN_ARGNUM_MPFR_RND([[[rnd]]],	[[[4]]]);
  {
    int		rv      = mpfr_lgamma(rop, &sign, op, rnd);
    int		mmux_rv = mmux_sint_bind_to_bash_variable(argv[2], sign, MMUX_BASH_BUILTIN_STRING_NAME);

    if (MMUX_SUCCESS == mmux_rv) {
      return mmux_bash_mpfr_set_MPFR_RV(rv, MMUX_BASH_BUILTIN_STRING_NAME);
    } else {
      return mmux_rv;
    }
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[MMUX_BASH_BUILTIN_IDENTIFIER]]],
    [[[(5 == argc)]]],
    [[["MMUX_BASH_BUILTIN_IDENTIFIER MPFR_ROP SINTVAR MPFR_OP MPFR_RND"]]],
    [[["Compute MMUX_BASH_BUILTIN_IDENTIFIER[[[]]](ROP,SINTVAR,OP,RND)."]]])

/* end of file */
