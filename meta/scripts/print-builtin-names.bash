#!/bin/bash
#
# Part of: MMUX Bash MPFR
# Contents: meta script
# Date: Oct 20, 2024
#
# Abstract
#
#	Run this script to output a list of builtin names.
#
# Copyright (C) 2024 Marco Maggi <mrc.mgg@gmail.com>
#
# This program is free software: you can redistribute it and/or modify it under the terms of the GNU
# General Public  License as  published by  the Free Software  Foundation, either  version 3  of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that  it will be useful, but WITHOUT ANY WARRANTY; without
# even the  implied warranty of MERCHANTABILITY  or FITNESS FOR  A PARTICULAR PURPOSE.  See  the GNU
# General Public License for more details.
#
# You should  have received a copy  of the GNU General  Public License along with  this program.  If
# not, see <http://www.gnu.org/licenses/>.
#

declare -ga BUILTINS=(mmux_bash_mpfr_library_init

		      mpfr_init
		      mpfr_clear
		      mpfr_init2
		      mpfr_inits
		      mpfr_inits2
		      mpfr_clears
		      mpfr_set_default_prec
		      mpfr_get_default_prec
		      mpfr_get_prec
		      mpfr_set_prec
		      mpfr_set_si
		      mpfr_set_ui
		      mpfr_set_sj
		      mpfr_set_uj
		      mpfr_set_flt
		      mpfr_set_d
		      mpfr_set_ld
		      mpfr_set_float128
		      mpfr_set_decimal64
		      mpfr_set_decimal128
		      mpfr_set
		      mpfr_set_z
		      mpfr_set_q
		      mpfr_set_f
		      mpfr_set_si_2exp
		      mpfr_set_ui_2exp
		      mpfr_set_sj_2exp
		      mpfr_set_uj_2exp
		      mpfr_set_z_2exp
		      mpfr_init_set_si
		      mpfr_init_set_ui
		      mpfr_init_set_d
		      mpfr_init_set_ld
		      mpfr_init_set_z
		      mpfr_init_set_q
		      mpfr_init_set_f
		      mpfr_init_set
		      mpfr_set_str
		      mpfr_strtofr
		      mpfr_set_nan
		      mpfr_set_inf
		      mpfr_set_zero
		      mpfr_swap

		      mpfr_get_si
		      mpfr_get_ui
		      mpfr_get_sj
		      mpfr_get_uj
		      mpfr_get_flt
		      mpfr_get_d
		      mpfr_get_ld
		      mpfr_get_float128
		      mpfr_get_decimal64
		      mpfr_get_decimal128
		      mpfr_get_d_2exp
		      mpfr_get_ld_2exp
		      mpfr_frexp
		      mpfr_get_str
		      mpfr_fits_sshort_p
		      mpfr_fits_ushort_p
		      mpfr_fits_sint_p
		      mpfr_fits_uint_p
		      mpfr_fits_slong_p
		      mpfr_fits_ulong_p
		      mpfr_fits_intmax_p
		      mpfr_fits_uintmax_p
		      mpfr_get_z_2exp
		      mpfr_get_z
		      mpfr_get_q
		      mpfr_get_f
		      mpfr_get_str_ndigits

		      mpfr_add
		      mpfr_add_si
		      mpfr_add_ui
		      mpfr_add_d
		      mpfr_add_z
		      mpfr_add_q
		      mpfr_mul
		      mpfr_mul_si
		      mpfr_mul_ui
		      mpfr_mul_2si
		      mpfr_mul_2ui
		      mpfr_mul_d
		      mpfr_mul_z
		      mpfr_mul_q
		      mpfr_sub
		      mpfr_sub_si
		      mpfr_sub_ui
		      mpfr_sub_d
		      mpfr_sub_z
		      mpfr_sub_q
		      mpfr_si_sub
		      mpfr_ui_sub
		      mpfr_d_sub
		      mpfr_div
		      mpfr_div_si
		      mpfr_div_ui
		      mpfr_div_2si
		      mpfr_div_2ui
		      mpfr_div_d
		      mpfr_div_z
		      mpfr_div_q
		      mpfr_si_div
		      mpfr_ui_div
		      mpfr_d_div
		      mpfr_sqr
		      mpfr_sqrt
		      mpfr_sqrt_ui
		      mpfr_rec_sqrt
		      mpfr_cbrt
		      mpfr_rootn_ui
		      mpfr_rootn_si
		      mpfr_neg
		      mpfr_abs
		      mpfr_dim
		      mpfr_fac_ui
		      mpfr_fma
		      mpfr_fms
		      mpfr_fmma
		      mpfr_fmms
		      mpfr_hypot
		      mpfr_sum
		      mpfr_dot

		      mpfr_cmp
		      mpfr_cmp_si
		      mpfr_cmp_ui
		      mpfr_cmp_d
		      mpfr_cmp_ld
		      mpfr_cmp_z
		      mpfr_cmp_q
		      mpfr_cmp_f
		      mpfr_cmp_si_2exp
		      mpfr_cmp_ui_2exp
		      mpfr_cmpabs
		      mpfr_cmpabs_ui
		      mpfr_nan_p
		      mpfr_inf_p
		      mpfr_zero_p
		      mpfr_number_p
		      mpfr_regular_p
		      mpfr_greater_p
		      mpfr_greaterequal_p
		      mpfr_less_p
		      mpfr_lessequal_p
		      mpfr_equal_p
		      mpfr_lessgreater_p
		      mpfr_unordered_p
		      mpfr_total_order_p
		      mpfr_equal_absmargin
		      mpfr_equal_relepsilon
		      mpfr_min
		      mpfr_max

		      mpfr_log
		      mpfr_log2
		      mpfr_log10
		      mpfr_log1p
		      mpfr_log2p1
		      mpfr_log10p1
		      mpfr_exp
		      mpfr_exp2
		      mpfr_exp10
		      mpfr_expm1
		      mpfr_exp2m1
		      mpfr_exp10m1
		      mpfr_pow
		      mpfr_powr
		      mpfr_sin
		      mpfr_cos
		      mpfr_tan
		      mpfr_sinpi
		      mpfr_cospi
		      mpfr_tanpi
		      mpfr_sin_cos
		      mpfr_sec
		      mpfr_csc
		      mpfr_cot
		      mpfr_asin
		      mpfr_acos
		      mpfr_atan
		      mpfr_asinpi
		      mpfr_acospi
		      mpfr_atanpi
		      mpfr_atan2
		      mpfr_sinh
		      mpfr_cosh
		      mpfr_tanh
		      mpfr_sinh_cosh
		      mpfr_sech
		      mpfr_csch
		      mpfr_coth
		      mpfr_asinh
		      mpfr_acosh
		      mpfr_atanh
		      mpfr_eint
		      mpfr_li2
		      mpfr_gamma
		      mpfr_gamma_inc
		      mpfr_lngamma
		      mpfr_digamma
		      mpfr_beta
		      mpfr_zeta
		      mpfr_erf
		      mpfr_erfc
		      mpfr_j0
		      mpfr_j1
		      mpfr_y0
		      mpfr_y1
		      mpfr_agm
		      mpfr_ai
		      mpfr_const_log2
		      mpfr_const_pi
		      mpfr_const_euler
		      mpfr_const_catalan

		      mpfr_rint
		      mpfr_ceil
		      mpfr_floor
		      mpfr_round
		      mpfr_roundeven
		      mpfr_trunc
		      mpfr_rint_ceil
		      mpfr_rint_floor
		      mpfr_rint_round
		      mpfr_rint_roundeven
		      mpfr_rint_trunc
		      mpfr_frac
		      mpfr_modf
		      mpfr_fmod
		      mpfr_fmod_ui
		      mpfr_remainder
		      mpfr_fmodquo
		      mpfr_remquo
		      mpfr_integer_p

		      mpfr_dump

		      mpfr_get_default_rounding_mode
		      mpfr_set_default_rounding_mode
		      mpfr_prec_round
		      mpfr_can_round
		      mpfr_min_prec
		      mpfr_print_rnd_mode

		      mpfr_sgn
		      mpfr_copysign
		      mpfr_signbit
		      mpfr_setsign

		      mpfr_nexttoward
		      mpfr_nextabove
		      mpfr_nextbelow

		      mpfr_buildopt_tls_p
		      mpfr_buildopt_float128_p
		      mpfr_buildopt_decimal_p
		      mpfr_buildopt_gmpinternals_p
		      mpfr_buildopt_sharedcache_p
		      mpfr_get_patches
		      mpfr_buildopt_tune_case
		      mpfr_check_range
		      mpfr_subnormalize

		      mpfr_set_exp
		      mpfr_get_exp
		      mpfr_set_emin
		      mpfr_set_emax
		      mpfr_get_emin
		      mpfr_get_emax
		      mpfr_get_emin_min
		      mpfr_get_emin_max
		      mpfr_get_emax_min
		      mpfr_get_emax_max

		      mpfr_clear_underflow
		      mpfr_clear_overflow
		      mpfr_clear_divby0
		      mpfr_clear_nanflag
		      mpfr_clear_inexflag
		      mpfr_clear_erangeflag
		      mpfr_clear_flags
		      mpfr_set_underflow
		      mpfr_set_overflow
		      mpfr_set_divby0
		      mpfr_set_nanflag
		      mpfr_set_inexflag
		      mpfr_set_erangeflag
		      mpfr_underflow_p
		      mpfr_overflow_p
		      mpfr_divby0_p
		      mpfr_nanflag_p
		      mpfr_inexflag_p
		      mpfr_erangeflag_p
		      mpfr_flags_clear
		      mpfr_flags_set
		      mpfr_flags_test
		      mpfr_flags_save
		      mpfr_flags_restore

		      mpfr_free_cache
		      mpfr_free_pool
		      mpfr_mp_memory_cleanup
		      mpfr_free_cache2)

### ------------------------------------------------------------------------

declare -i IDX=

function print_builtin_name () {
    declare NAME=${1:?"missing parameter 1 name of bulitin in call to '$FUNCNAME'"}

    printf 'MMUX_BASH_MPFR_PACKAGE[BUILTIN_%d]=%s\n' ${IDX:?} "${NAME:?}"
    let ++IDX
}

declare NAME

for NAME in "${BUILTINS[@]}"
do
    print_builtin_name "$NAME"
done


### end of file
# Local Variables:
# mode: sh
# End:
