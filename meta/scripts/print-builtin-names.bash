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

		      mpfr_nan_p
		      mpfr_inf_p
		      mpfr_zero_p
		      mpfr_number_p
		      mpfr_regular_p
		      mpfr_sgn
		      mpfr_dump)


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
