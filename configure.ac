# @configure_input@
#

AC_PREREQ([2.72])
MMUX_PKG_VERSIONS([0],[1],[0],[devel.0])
AC_INIT([MMUX Bash MPFR],[MMUX_PACKAGE_VERSION],
  [mrc.mgg@gmail.com],
  [mmux-bash-mpfr],[http://github.com/marcomaggi/mmux-bash-mpfr])
MMUX_INIT
MMUX_LIBTOOL_LIBRARY_VERSIONS([mmux_bash_mpfr],1,0,0)
AC_REVISION([0.1])
AC_COPYRIGHT([Copyright (c) 2024 Marco Maggi <mrc.mgg@gmail.com>

This program is free software: you  can redistribute it and/or modify it
under the  terms of the GNU  General Public License as  published by the
Free Software Foundation,  either version 3 of the License,  or (at your
option) any later version.

This program  is distributed  in the  hope that it  will be  useful, but
WITHOUT   ANY   WARRANTY;  without   even   the   implied  warranty   of
MERCHANTABILITY  or  FITNESS FOR  A  PARTICULAR  PURPOSE.  See  the  GNU
General Public License for more details.

You should have received a copy  of the GNU General Public License along
with this program.  If not, see <http://www.gnu.org/licenses/>.
])

AC_CONFIG_SRCDIR([src/])
AC_CONFIG_MACRO_DIR([meta/autotools])
AC_CONFIG_AUX_DIR([meta/autotools])
AC_USE_SYSTEM_EXTENSIONS
AC_CANONICAL_BUILD
AC_CANONICAL_HOST
AC_CANONICAL_TARGET
AM_INIT_AUTOMAKE([1.17 foreign subdir-objects])
AM_MAINTAINER_MODE

AM_PROG_AR
AC_PROG_INSTALL
AC_PROG_LN_S
AC_PROG_MAKE_SET
AC_PROG_MKDIR_P

LT_PREREQ([2.4.7])
LT_INIT([disable-static])


#### basic system inspection

MMUX_CHECK_TARGET_OS
AX_IS_RELEASE([git-directory])

AC_LANG([C])
MMUX_LANG_C11

AM_PROG_AS
AM_PROG_CC_C_O
AC_PATH_PROG([M4_PROGRAM],[m4])
AC_PATH_PROG([BASH_PROGRAM],[/bin/bash],[/bin/bash],[:])

AC_CACHE_SAVE


#### external libraries

PKG_PREREQ([0.29])
PKG_INSTALLDIR
MMUX_CHECK_PKG_CONFIG_MACROS
PKG_CHECK_MODULES([BASH],[bash],,[AC_MSG_WARN([package GNU Bash not found])])

AC_SEARCH_LIBS(cos, m,, [AC_MSG_ERROR([Cannot find libm])])
PKG_CHECK_MODULES([MPFR],[mpfr >= 4.2])
PKG_CHECK_MODULES([MMUX_BASH_POINTERS],[mmux-bash-pointers >= 0.1.0],
   [AS_VAR_SET([mmux_bash_mpfr_MMUX_BASH_POINTERS_DATADIR],[$("$PKG_CONFIG" mmux-bash-pointers --variable=datadir)])
    AS_VAR_SET([mmux_bash_mpfr_MMUX_BASH_POINTERS_LIBRARY],[$mmux_bash_mpfr_MMUX_BASH_POINTERS_DATADIR/bash/libmmux-bash-pointers.bash])])
AC_SUBST([mmux_bash_mpfr_MMUX_BASH_POINTERS_DATADIR])
AC_SUBST([mmux_bash_mpfr_MMUX_BASH_POINTERS_LIBRARY])

MBFL_SETUP_FOR_TESTING([v3.0.0])

AC_CACHE_SAVE


#### inspecting

m4_define([MMUX_BASH_MPFR_INCLUDES],[
MMUX_CC_COMMON_INCLUDES_FOR_TESTS
#ifdef HAVE_MPFR_H
#  include <mpfr.h>
#endif
])

AC_DEFUN([MMUX_MPFR_CONSTANT_TEST],[MMUX_CC_DETERMINE_VALUEOF([$1],[$1],[MMUX_BASH_MPFR_INCLUDES])])
AC_DEFUN([MMUX_MPFR_CONSTANT_TESTS],[m4_map_args_w($1,[MMUX_MPFR_CONSTANT_TEST(],[)])])

MMUX_AUTOCONF_SAVE_SHELL_VARIABLE_WHILE_APPENDING([CFLAGS],[" $MPFR_CFLAGS"],
  [MMUX_AUTOCONF_SAVE_SHELL_VARIABLE_WHILE_APPENDING([LIBS],[" $MPFR_LIBS"],
     [AC_DEFINE([MPFR_WANT_FLOAT128],[1],[Set to 1 if we want the _FloatN functions from MPFR.])
      AC_DEFINE([MPFR_WANT_DECIMAL_FLOATS],[1],[Set to 1 if we want the _DecimalN functions from MPFR.])
      AC_CHECK_HEADERS([mpfr.h])
      MMUX_MPFR_CONSTANT_TESTS([MPFR_RNDN MPFR_RNDZ MPFR_RNDU MPFR_RNDD MPFR_RNDA MPFR_RNDF])
      MMUX_MPFR_CONSTANT_TESTS([MPFR_FLAGS_UNDERFLOW MPFR_FLAGS_OVERFLOW MPFR_FLAGS_NAN
                                MPFR_FLAGS_INEXACT MPFR_FLAGS_ERANGE MPFR_FLAGS_DIVBY0 MPFR_FLAGS_ALL])
      MMUX_MPFR_CONSTANT_TESTS([MPFR_PREC_MIN MPFR_PREC_MAX])
      AC_CHECK_FUNCS([mpfr_set_ld mpfr_set_float128 mpfr_set_decimal64 mpfr_set_decimal128])])])

MMUX_DEFINE_OMNIBUS_CONFIG_VARIABLE([MMUX_BASH_MPFR_HAVE_CC_TYPE_LDOUBLE],
  [Defined and set to 1 if support for 'long double' is enabled in MFPR.],
  [AS_IF([mmux_test_variable_is_yes([ac_cv_func_mpfr_set_ld])],
         [AS_VAR_SET([MMUX_BASH_MPFR_HAVE_CC_TYPE_LDOUBLE],[1])])])
AC_MSG_CHECKING([for MMUX Bash MPFR supporting 'long double'])
AS_IF([mmux_test_variable_is_one([MMUX_BASH_MPFR_HAVE_CC_TYPE_LDOUBLE])],
      [AC_MSG_RESULT([yes])],
      [AC_MSG_RESULT([no])])

MMUX_DEFINE_OMNIBUS_CONFIG_VARIABLE([MMUX_BASH_MPFR_HAVE_CC_TYPE_DECIMAL64],
  [Defined and set to 1 if support for '_Decimal64' is enabled in MPFR.],
  [AS_IF([mmux_test_variable_is_yes([ac_cv_func_mpfr_set_decimal64])],
         [AS_VAR_SET([MMUX_BASH_MPFR_HAVE_CC_TYPE_DECIMAL64],[1])])])
AC_MSG_CHECKING([for MMUX Bash MPFR supporting '_Decimal64'])
AS_IF([mmux_test_variable_is_one([MMUX_BASH_MPFR_HAVE_CC_TYPE_DECIMAL64])],
      [AC_MSG_RESULT([yes])],
      [AC_MSG_RESULT([no])])

MMUX_DEFINE_OMNIBUS_CONFIG_VARIABLE([MMUX_BASH_MPFR_HAVE_CC_TYPE_DECIMAL128],
  [Defined and set to 1 if support for '_Decimal128' is enabled in MPFR.],
  [AS_IF([mmux_test_variable_is_yes([ac_cv_func_mpfr_set_decimal128])],
         [AS_VAR_SET([MMUX_BASH_MPFR_HAVE_CC_TYPE_DECIMAL128],[1])])])
AC_MSG_CHECKING([for MMUX Bash MPFR supporting '_Decimal128'])
AS_IF([mmux_test_variable_is_one([MMUX_BASH_MPFR_HAVE_CC_TYPE_DECIMAL128])],
      [AC_MSG_RESULT([yes])],
      [AC_MSG_RESULT([no])])

MMUX_DEFINE_OMNIBUS_CONFIG_VARIABLE([MMUX_BASH_MPFR_HAVE_CC_TYPE_FLOAT128],
  [Defined and set to 1 if support for '_Float128' is enabled in MPFR.],
  [AS_IF([mmux_test_variable_is_yes([ac_cv_func_mpfr_set_float128])],
         [AS_VAR_SET([MMUX_BASH_MPFR_HAVE_CC_TYPE_FLOAT128],[1])])])
AC_MSG_CHECKING([for MMUX Bash MPFR supporting '_Float128'])
AS_IF([mmux_test_variable_is_one([MMUX_BASH_MPFR_HAVE_CC_TYPE_FLOAT128])],
      [AC_MSG_RESULT([yes])],
      [AC_MSG_RESULT([no])])

AC_CACHE_SAVE


#### finish

AC_CONFIG_HEADERS([config.h])
AC_CONFIG_FILES([Makefile]
  [src/m4/mmux-bash-mpfr-config.m4]
  [src/mmux-bash-mpfr-config.h]
  [doc/mmux-version.texi]
  [meta/scripts/mmux-bash-mpfr.pc]
  [meta/slackware/slack-desc])
MMUX_OUTPUT
AC_OUTPUT

### end of file
