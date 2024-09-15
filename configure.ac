# @configure_input@
#

AC_PREREQ([2.69])
MMUX_PKG_VERSIONS([0],[1],[0],[devel.1])
AC_INIT([MMUX Bash MPFR],[MMUX_PACKAGE_VERSION],
  [mrc.mgg@gmail.com],
  [mmux-bash-mpfr],[http://github.com/marcomaggi/mmux-bash-mpfr])
MMUX_INIT
MMUX_LIBTOOL_LIBRARY_VERSIONS([mmux_bash_mpfr],1,0,0)
AC_REVISION([0.1])
AC_COPYRIGHT([Copyright (c) 2024 Marco Maggi <mrc.mgg@gmail.com>

This program is free software: you  can redistribute it and/or modify it
under the terms of the GNU Lesser General Public License as published by
the Free  Software Foundation, either version  3 of the License,  or (at
your option) any later version.

This program  is distributed  in the  hope that it  will be  useful, but
WITHOUT   ANY   WARRANTY;  without   even   the   implied  warranty   of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser
General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
])
AC_CONFIG_SRCDIR([src/])
AC_CONFIG_MACRO_DIR([meta/autotools])
AC_CONFIG_AUX_DIR([meta/autotools])
AC_CANONICAL_BUILD
AC_CANONICAL_HOST
AC_CANONICAL_TARGET
AM_INIT_AUTOMAKE([1.16 foreign subdir-objects])
AM_MAINTAINER_MODE

AM_PROG_AR
AC_PROG_INSTALL
AC_PROG_LN_S
AC_PROG_MAKE_SET
AC_PROG_MKDIR_P

LT_PREREQ([2.4])
LT_INIT


#### basic system inspection

MMUX_CHECK_TARGET_OS
AX_IS_RELEASE([git-directory])

AC_LANG([C])
MMUX_LANG_C11

AM_PROG_AS
AM_PROG_CC_C_O
AC_HEADER_STDC
AC_HEADER_SYS_WAIT
AC_CHECK_HEADERS([assert.h stdint.h strings.h errno.h stddef.h math.h])

AC_PATH_PROG([M4_PROGRAM],[m4])
AC_PATH_PROG([BASH_PROGRAM],[/bin/bash],[/bin/bash],[:])

AC_ARG_ENABLE([mbfl],
  [AS_HELP_STRING([--enable-mbfl],[enable using MBFL for testing (default: yes)])],
  [AS_VAR_SET([MMUX_ENABLED_MBFL],[$enableval])],
  [AS_VAR_SET([MMUX_ENABLED_MBFL],[yes])])

if test "x$MMUX_ENABLED_MBFL" = 'xyes'
then
  MBFL_SETUP(v3.0.0)
fi
AM_CONDITIONAL([MMUX_TESTING_ENABLED],[test "x$MMUX_ENABLED_MBFL" = 'xyes'])

AC_CACHE_SAVE


#### check for C language types

AC_TYPE_LONG_LONG_INT
AC_TYPE_UNSIGNED_LONG_LONG_INT
AC_TYPE_LONG_DOUBLE


#### checks for library functions

dnl AC_FUNC_MALLOC
dnl AC_FUNC_MEMCMP

dnl AC_CACHE_SAVE


#### external libraries

PKG_PREREQ([0.29])
PKG_INSTALLDIR
MMUX_CHECK_PKG_CONFIG_MACROS
PKG_CHECK_MODULES([BASH],[bash],,[AC_MSG_WARN([package GNU Bash not found])])

AC_SEARCH_LIBS(cos, m,, [AC_MSG_ERROR([Cannot find libm])])

PKG_CHECK_MODULES([MPFR],[mpfr >= 4.2])

PKG_CHECK_MODULES([MMUX_BASH_POINTERS],[mmux-bash-pointers >= 0.1.0],
   [AS_VAR_SET([MMUX_BASH_POINTERS_DATADIR],[$("$PKG_CONFIG" mmux-bash-pointers --variable=datadir)])
    AS_VAR_SET([MMUX_BASH_POINTERS_LIBRARY],[$MMUX_BASH_POINTERS_DATADIR/bash/libmmux-bash-pointers.bash])])
AC_SUBST([MMUX_BASH_POINTERS_LIBRARY])

AC_CACHE_SAVE


#### inspecting

m4_define([MMUX_INCLUDES],[
AC_INCLUDES_DEFAULT
#ifdef HAVE_MPFR_H
#  include <mpfr.h>
#endif
])

AC_DEFUN([MMUX_VALUEOF_TEST],
  [AC_CACHE_CHECK([the value of '$2'],
     [mmux_cv_valueof_$1],
     [AC_COMPUTE_INT([mmux_cv_valueof_$1],
        [$2],
        [#include <mpfr.h>],
        [AS_VAR_SET([mmux_cv_valueof_$1],[no])])])
    if test "x$mmux_cv_valueof_$1" = "xno"
    then AS_VAR_SET([MMUX_HAVE_$1],[0])
    else AS_VAR_SET([MMUX_HAVE_$1],[1])
    fi
    AC_DEFINE_UNQUOTED([MMUX_HAVE_$1],[$MMUX_HAVE_$1],[The value $1 is defined.])])

AC_DEFUN([MMUX_MPFR_CONSTANT_TEST],[MMUX_VALUEOF_TEST([$1],[$1])])
AC_DEFUN([MMUX_MPFR_CONSTANT_TESTS],[m4_map_args_w($1,[MMUX_MPFR_CONSTANT_TEST(],[)])])

MMUX_MPFR_CONSTANT_TESTS([MPFR_RNDN MPFR_RNDZ MPFR_RNDU MPFR_RNDD MPFR_RNDA MPFR_RNDF MPFR_RNDNA])

AC_CACHE_SAVE


#### finish

AC_CONFIG_HEADERS([config.h])
AC_CONFIG_FILES([Makefile]
  [src/libmmux-bash-mpfr.bash]
  [meta/scripts/mmux-bash-mpfr.pc]
  [meta/slackware/slack-desc])
MMUX_OUTPUT
AC_OUTPUT

### end of file
