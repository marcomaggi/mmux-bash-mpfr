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
mmux_package_require_by_descriptor MMUX_BASH_PACKAGES_PACKAGE 0
mmux_package_require_by_descriptor MMUX_BASH_POINTERS_PACKAGE 0

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

# When actually  printing number's string  representation: let's try to  return the return  value of
# "printf".
#
function mpfr_just_printit_dammit () {
    declare -i BASE=10 NDIGITS=6 MPFR_RV
    declare  PRINTF_FLAGS

    {
	declare OPTNAME OPTARG OPTIND=1 OPTERR=0

	while getopts ':n:b:v:' OPTNAME
	do
	    case WW(OPTNAME) in
		n)
		    if test '--' = QQ(OPTARG)
		    then
			printf '%s: option "-n" requires an argument, but the end-of-options marker was found: "--"\n' WW(FUNCNAME) >&2
			return 1
		    elif mpfr_p_string_is_ndigits_argument QQ(OPTARG)
		    then NDIGITS=RR(OPTARG)
		    else
			printf '%s: invalid ndigits argument, expected non-negative exact integer got: "%s"\n' \
			       WW(FUNCNAME) WW(OPTARG) >&2
			return 1
		    fi
		    NDIGITS=RR(OPTARG)
		    ;;
		b)
		    if test '--' = QQ(OPTARG)
		    then
			printf '%s: option "-b" requires an argument, but the end-of-options marker was found: "--"\n' WW(FUNCNAME) >&2
			return 1
		    elif mpfr_p_string_is_base_argument QQ(OPTARG)
		    then BASE=RR(OPTARG)
		    else
			printf '%s: invalid base argument, expected exact integer in the range [-36, -2] U [+2, +36] got: "%s"\n' \
			       WW(FUNCNAME) WW(OPTARG) >&2
			return 1
		    fi
		    ;;
		v)
		    if test '--' = QQ(OPTARG)
		    then
			printf '%s: option "-v" requires an argument, but the end-of-options marker was found: "--"\n' WW(FUNCNAME) >&2
			return 1
		    elif mpfr_p_string_is_variable_name QQ(OPTARG)
		    then PRINTF_FLAGS="-v RR(OPTARG)"
		    else
			printf '%s: invalid variable name argument: "%s"\n' WW(FUNCNAME) WW(OPTARG) >&2
			return 1
		    fi
		    ;;
		*)
		    # We requested  silent mode of "getopts"  by both starting the  OPTSTRING with a
		    # colon and setting OPTERR to zero.  So we expect the name of the invalid option
		    # to be in OPTARG.
		    #
		    # Notice that we end  up here also when an option requiring  an argument is used
		    # without an argument,  specifically when there are no more  arguments after the
		    # option on the command line, as in:
		    #
		    #    mpfr_just_printit_dammit -b
		    #
		    case WW(OPTARG) in
			b|n|v)
			    printf '%s: option "-%s" requires an argument, but there are no more arguments on the command line\n' \
				   WW(FUNCNAME) WW(OPTARG) >&2
			    ;;
			*)
			    printf '%s: invalid option, should be one among "-b", "-n", "v" got: ""\n' WW(FUNCNAME) WW(OPTARG) >&2
			    ;;
		    esac
		    return 1
		    ;;
	    esac
	done
	shift $((OPTIND-1))
    }

    if test -z QQ(1)
    then
	printf '%s: expected pointer to MPFR number as argument, but none was found\n' WW(FUNCNAME) >&2
	return 1
    elif ! mmux_string_is_pointer WW(1)
    then
	printf '%s: expected raw memory pointer as argument, got: "%s" found\n' WW(FUNCNAME) WW(1) >&2
	return 1
    fi
    declare OP=PP(1,MPFR_PTR)

    #echo $FUNCNAME BASE="$BASE" NDIGITS="$NDIGITS" OP="$OP" >&2

    if ! mpfr_nan_p WW(OP)
    then return 1
    elif (( 1 == MPFR_RV ))
    then printf $PRINTF_FLAGS -- '%s' '@NaN@'
    elif ! mpfr_inf_p WW(OP)
    then return 1
    elif (( 1 == MPFR_RV ))
    then
	{
	    declare SIGN

	    mpfr_sgn WW(OP)
	    case WW(MPFR_RV) in
		1)	printf $PRINTF_FLAGS -- '+@Inf@' ;;
		-1)	printf $PRINTF_FLAGS -- '-@Inf@' ;;
		*)	printf $PRINTF_FLAGS --  '@Inf@' ;;
	    esac
	}
    else
	{
	    declare MAN EXP ECHAR

	    if mpfr_get_str MAN EXP WW(BASE) WW(NDIGITS) WW(OP) WW(MPFR_RNDN)
	    then
		if (( 0 < BASE ))
		then ECHAR='e'
		else ECHAR='E'
		fi
		if   test "${MAN:0:1}" = '-'
		then printf $PRINTF_FLAGS -- '-0.%s%s%s' "${MAN:1}" WW(ECHAR) WW(EXP)
		elif test "${MAN:0:1}" = '+'
		then printf $PRINTF_FLAGS -- '+0.%s%s%s' "${MAN:1}" WW(ECHAR) WW(EXP)
		else printf $PRINTF_FLAGS --  '0.%s%s%s' WW(MAN)    WW(ECHAR) WW(EXP)
		fi
	    else return $?
	    fi
	}
    fi
}

function mpfr_p_string_is_base_argument () {
    declare STRING=$1

    if test -z QQ(STRING)
    then return 1
    elif ! mpfr_p_string_is_exact_integer_number WW(STRING)
    then return 1
    elif (( (2 <= STRING && STRING <= 36) || (-36 <= STRING && STRING <= -2) ))
    then return 0
    else return 1
    fi
}
function mpfr_p_string_is_ndigits_argument () {
    declare STRING=$1

    if test -z QQ(STRING)
    then return 1
    elif ! mpfr_p_string_is_exact_integer_number WW(STRING)
    then return 1
    elif (( 0 <= STRING ))
    then return 0
    else return 1
    fi
}
function mpfr_p_string_is_exact_integer_number () {
    declare -r STRING=$1 REX='^[+-]?[0-9]+$'
    # Let's make it local.
    declare -a BASH_REMATCH

    [[ WW(STRING) =~ $REX ]]
}
function mpfr_p_string_is_variable_name () {
    declare -r STRING=$1 REX='^[a-zA-Z_][a-zA-Z0-9_]+$'
    # Let's make it local.
    declare -a BASH_REMATCH

    if test -z QQ(STRING)
    then return 1
    else [[ WW(STRING) =~ $REX ]]
    fi
}

#page
#### compound allocation and initialisation

function mpfr_alloc_and_init () {
    declare -n mpfr_p_PTR=PP(1,MPFR_PTR)
    declare -r mpfr_p_PREC=$2

    if mmux_libc_calloc mpfr_p_PTR 1 WW(mpfr_SIZEOF)
    then
	if ! {
		if test -z QQ(mpfr_p_PREC) -o QQ(mpfr_p_PREC) = '0'
		then mpfr_init  WW(mpfr_p_PTR)
		else mpfr_init2 WW(mpfr_p_PTR) WW(mpfr_p_PREC)
		fi
	    }
	then mmux_libc_free WW(mpfr_p_PTR)
	fi
    else return 1
    fi
}
function mpfr_clear_and_free () {
    declare -r mpfr_p_PTR=PP(1,MPFR_PTR)

    if mpfr_clear WW(mpfr_p_PTR)
    then mmux_libc_free WW(mpfr_p_PTR)
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
	do mpfr_init2 "${mpfr_SHELL_ARRY[$mpfr_IDX]:?}" WW(mpfr_p_PREC)
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
	  mmux_bash_mpfr_library_after_loading_hook		\
	  mmux_bash_mpfr_library_before_unloading_hook		\
	  \
	  mpfr_p_string_is_base_argument			\
	  mpfr_p_string_is_ndigits_argument			\
	  mpfr_p_string_is_exact_integer_number			\
	  mpfr_p_string_is_variable_name

    unset -v \
	  MPFR_VERSION						\
	  MPFR_VERSION_MAJOR					\
	  MPFR_VERSION_MINOR					\
	  MPFR_VERSION_PATCHLEVEL				\
	  mpfr_SIZEOF						\
	  mpfr_rnd_SIZEOF					\
	  mpfr_exp_SIZEOF					\
	  mpfr_prec_SIZEOF					\
	  MPFR_PREC_MIN						\
	  MPFR_PREC_MAX						\
	  MPFR_RNDN						\
	  MPFR_RNDZ						\
	  MPFR_RNDU						\
	  MPFR_RNDD						\
	  MPFR_RNDA						\
	  MPFR_RNDF						\
	  MPFR_RNDNA						\
	  MPFR_FLAGS_UNDERFLOW					\
	  MPFR_FLAGS_OVERFLOW					\
	  MPFR_FLAGS_NAN					\
	  MPFR_FLAGS_INEXACT					\
	  MPFR_FLAGS_ERANGE					\
	  MPFR_FLAGS_DIVBY0					\
	  MPFR_FLAGS_ALL					\
	  MPFR_FREE_LOCAL_CACHE					\
	  MPFR_FREE_GLOBAL_CACHE
}

#page
#### let's go

mmux_package_provide_by_descriptor MMUX_BASH_MPFR_PACKAGE

### end of file
# Local Variables:
# mode: sh
# End:
