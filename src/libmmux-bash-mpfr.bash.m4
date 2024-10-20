#
# Part of: MMUX Bash MPFR
# Contents: core library
# Date: Sep 15, 2024
#
# Abstract
#
#	This library  must be  sourced from an  interactive shell  or from a  script.  It  loads the
#	shared library and enables the implemented builtins.
#
#	The Bash builtin "enable" will search the shared library file in the usual places, including
#	the directories from "LD_LIBRARY_PATH".
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

#page
#### package

declare -gA MMUX_BASH_MPFR_PACKAGE=([PACKAGING_VERSION]='0'
				    [PACKAGE_NAME]='MMUX Bash MPFR'
				    [SEMANTIC_VERSION]='mmux_bash_mpfr_SEMANTIC_VERSION'
				    [INTERFACE_VERSION_CURRENT]='mmux_bash_mpfr_VERSION_INTERFACE_CURRENT'
				    [INTERFACE_VERSION_REVISION]='mmux_bash_mpfr_VERSION_INTERFACE_REVISION'
				    [INTERFACE_VERSION_AGE]='mmux_bash_mpfr_VERSION_INTERFACE_AGE'
				    [SHARED_LIBRARY]='libmmux-bash-mpfr.so'
				    [SHELL_LIBRARY]='libmmux-bash-mpfr.bash'
				    [PACKAGE_AFTER_LOADING_HOOK]='mmux_bash_mpfr_library_after_loading_hook'
				    [PACKAGE_BEFORE_UNLOADING_HOOK]='mmux_bash_mpfr_library_before_unloading_hook')

m4_include([[[mmux-bash-mpfr-builtin-definitions.bash]]])

#page
#### after loading hook: begin

function mmux_bash_mpfr_library_after_loading_hook () {
    mmux_bash_mpfr_library_init

#page
#### additional functions: printing

function mpfr_just_printit_dammit () {
    declare -i BASE=10 NDIGITS=6
    declare OPT OPTARG OPTIND OPTERR=1 MPFR_RV

    while getopts ':n:b:' OPT
    do
	case "${OPT:?}" in
	    n)
		NDIGITS=$OPTARG
		;;
	    b)
		BASE=$OPTARG
		;;
	    *)
		return 1
		;;
	esac
    done
    shift $((OPTIND-1))

    declare OP=${1:?"missing mandatory parameter MPFR_PTR in call to '$FUNCNAME'"}

    #echo $FUNCNAME BASE="$BASE" NDIGITS="$NDIGITS" OP="$OP" >&2

    if ! mpfr_nan_p "${OP:?}"
    then return 1
    else
	if (( 1 == ${MPFR_RV:?} ))
	then
	    printf '%s\n' '@NaN@'
	    return 0
	fi
    fi

    if ! mpfr_inf_p "${OP:?}"
    then return 1
    else
	if (( 1 == ${MPFR_RV:?} ))
	then
	    {
		declare SIGN

		mpfr_sgn SIGN "${OP:?}"
		case "${SIGN:?}" in
		    1)	printf -- '+%s\n' '@Inf@' ;;
		    -1)	printf -- '-%s\n' '@Inf@' ;;
		    *) printf --  '%s\n' '@Inf@' ;;
		esac
	    }
	    return 0
	fi
    fi

    {
	declare MAN EXP

	mpfr_get_str MAN EXP "${BASE:?}" "${NDIGITS:?}" "${OP:?}" "${MPFR_RNDN:?}"

	if test "${MAN:0:1}" = '-'
	then printf -- '-0.%se%s\n' "${MAN:1}" "${EXP:?}"
	else printf --  '0.%se%s\n' "${MAN:?}" "${EXP:?}"
	fi
    }
}

#page
#### compound allocation and initialisation

function mpfr_alloc_and_init () {
    declare -n mpfr_p_PTR=${1:?"missing parameter 1 result MPFR pointer variable name in call to '$FUNCNAME'"}
    declare -r mpfr_p_PREC=$2

    if mmux_libc_calloc mpfr_p_PTR 1 "${mpfr_SIZEOF:?}"
    then
	if ! {
		if test -z "${mpfr_p_PREC}" -o "${mpfr_p_PREC}" = '0'
		then mpfr_init  "${mpfr_p_PTR:?}"
		else mpfr_init2 "${mpfr_p_PTR:?}" "${mpfr_p_PREC:?}"
		fi
	    }
	then mmux_libc_free "${mpfr_p_PTR:?}"
	fi
    else return 1
    fi
}
function mpfr_clear_and_free () {
    declare -r mpfr_p_PTR=${1:?"missing parameter 1 MPFR pointer in call to '$FUNCNAME'"}

    if mpfr_clear "${mpfr_p_PTR:?}"
    then mmux_libc_free "${mpfr_p_PTR:?}"
    else return 1
    fi
}

#page
#### shell index arrays

function mpfr_alloc_shell_array () {
    declare -n mpfr_SHELL_ARRY=${1:?"missing parameter 1 shell array name in call to '$FUNCNAME'"}
    declare -i mpfr_ADIM=${2:?"missing parameter 2 shell array dimension in call to '$FUNCNAME'"}
    declare -i mpfr_IDX mpfr_JDX

    if ! mmux_libc_calloc 'mpfr_SHELL_ARRY[0]' ${mpfr_ADIM:?} ${mpfr_SIZEOF:?}
    then return 1
    fi

    for ((mpfr_IDX=0, mpfr_JDX=1; mpfr_JDX < mpfr_ADIM; ++mpfr_IDX, ++mpfr_JDX))
    do
	if ! mmux_pointer_add "mpfr_SHELL_ARRY[${mpfr_JDX:?}]" "${mpfr_SHELL_ARRY[${mpfr_IDX:?}]:?}" ${mpfr_SIZEOF:?}
	then
	    mmux_libc_free "${mpfr_SHELL_ARRY[0]:?}"
	    return 1
	fi
    done
    return 0
}
function mpfr_free_shell_array () {
    declare -n mpfr_SHELL_ARRY=${1:?"missing parameter 1 shell array name in call to '$FUNCNAME'"}

    mmux_libc_free "${mpfr_SHELL_ARRY[0]:?}"
}

function mpfr_init_shell_array () {
    declare -n mpfr_SHELL_ARRY=${1:?"missing parameter 1 shell array name in call to '$FUNCNAME'"}
    declare    mpfr_p_PREC=$2
    declare -i mpfr_ADIM=${#mpfr_SHELL_ARRY[@]}
    declare -i mpfr_IDX

    if test -z "$mpfr_p_PREC" -o  "$mpfr_p_PREC" = '0'
    then
	for ((mpfr_IDX=0; mpfr_IDX < mpfr_ADIM; ++mpfr_IDX))
	do mpfr_init "${mpfr_SHELL_ARRY[$mpfr_IDX]:?}"
	done
    else
	for ((mpfr_IDX=0; mpfr_IDX < mpfr_ADIM; ++mpfr_IDX))
	do mpfr_init2 "${mpfr_SHELL_ARRY[$mpfr_IDX]:?}" "${mpfr_p_PREC:?}"
	done
    fi
}
function mpfr_clear_shell_array () {
    declare -n mpfr_SHELL_ARRY=${1:?"missing parameter 1 shell array name in call to '$FUNCNAME'"}
    declare -i mpfr_ADIM=${#mpfr_SHELL_ARRY[@]}
    declare -i mpfr_IDX

    for ((mpfr_IDX=0; mpfr_IDX < mpfr_ADIM; ++mpfr_IDX))
    do mpfr_clear "${mpfr_SHELL_ARRY[$mpfr_IDX]:?}"
    done
}

function mpfr_alloc_and_init_shell_array () {
    declare -n mpfr_SHELL_SUBARRY=${1:?"missing parameter 1 shell array name in call to '$FUNCNAME'"}
    declare -i mpfr_ADIM=${2:?"missing parameter 2 shell array dimension in call to '$FUNCNAME'"}
    declare    mpfr_p_PREC=$3

    if mpfr_alloc_shell_array mpfr_SHELL_SUBARRY ${mpfr_ADIM:?}
    then mpfr_init_shell_array mpfr_SHELL_SUBARRY ${mpfr_p_PREC}
    else return 1
    fi
}
function mpfr_clear_and_free_shell_array () {
    declare -n mpfr_SHELL_SUBARRY=${1:?"missing parameter 1 shell array name in call to '$FUNCNAME'"}

    if mpfr_clear_shell_array mpfr_SHELL_SUBARRY
    then mpfr_free_shell_array mpfr_SHELL_SUBARRY
    else return 1
    fi
}

#page
#### raw memory arrays of pointers

function mpfr_alloc_and_init_pointers_array () {
    declare -n mpfr_POINTERS=${1:?"missing parameter 3 name of pointer to pointers array in call to '$FUNCNAME'"}
    declare -n mpfr_SHELL_ARRY=${2:?"missing parameter 1 shell array name in call to '$FUNCNAME'"}

    if ! mmux_libc_calloc 'mpfr_POINTERS' ${#mpfr_SHELL_ARRY[@]} ${mmux_pointer_SIZEOF:?}
    then return 1
    fi

    {
	declare -i mpfr_IDX

	for ((mpfr_IDX=0; mpfr_IDX < ${#mpfr_SHELL_ARRY[@]}; ++mpfr_IDX))
	do
	    if ! mmux_pointer_array_set ${mpfr_POINTERS:?} ${mpfr_IDX:?} "${mpfr_SHELL_ARRY[${mpfr_IDX:?}]:?}"
	    then
		mmux_libc_free ${mpfr_POINTERS:?}
		return 1
	    fi
	done
    }
    return 0
}

#page
#### after loading hook: end

}

#page
#### before unloading hook

function mmux_bash_mpfr_library_before_unloading_hook () {
    unset -f \
	  mpfr_just_printit_dammit				\
	  mpfr_alloc_and_init					\
	  mpfr_clear_and_free					\
	  mpfr_alloc_shell_array				\
	  mpfr_free_shell_array					\
	  mpfr_init_shell_array					\
	  mpfr_clear_shell_array				\
	  mpfr_alloc_and_init_shell_array			\
	  mpfr_clear_and_free_shell_array			\
	  mpfr_alloc_and_init_pointers_array			\
	  mmux_bash_pointers_library_after_loading_hook		\
	  mmux_bash_pointers_library_before_unloading_hook

    # FIXME  For a  perfect cleanup  we should  also unset  the global  variables defined  by the  C
    # language library initialisation builtin.  (Marco Maggi; Sep 15, 2024)
}

#page
#### let's go

mmux_package_provide_by_descriptor MMUX_BASH_MPFR_PACKAGE

### end of file
# Local Variables:
# mode: sh
# End: