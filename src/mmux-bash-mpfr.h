/*
  Part of: MMUX Bash Mpfr
  Contents: public header file
  Date: Sep 15, 2024

  Abstract

	This is the public  header file of the library, defining  the public API.  It
	must be included in all the code that uses the library.

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

#ifndef MMUX_BASH_MPFR_H
#define MMUX_BASH_MPFR_H 1


/** --------------------------------------------------------------------
 ** Preliminary definitions.
 ** ----------------------------------------------------------------- */

#ifdef __cplusplus
extern "C" {
#endif

/* The macro  MMUX_BASH_MPFR_UNUSED indicates that  a function, function  argument or
   variable may potentially be unused. Usage examples:

   static int unused_function (char arg) MMUX_BASH_MPFR_UNUSED;
   int foo (char unused_argument MMUX_BASH_MPFR_UNUSED);
   int unused_variable MMUX_BASH_MPFR_UNUSED;
*/
#ifdef __GNUC__
#  define MMUX_BASH_MPFR_UNUSED		__attribute__((__unused__))
#else
#  define MMUX_BASH_MPFR_UNUSED		/* empty */
#endif

#ifndef __GNUC__
#  define __attribute__(...)	/* empty */
#endif

#ifndef __GNUC__
#  define __builtin_expect(...)	/* empty */
#endif

#if defined _WIN32 || defined __CYGWIN__
#  ifdef BUILDING_DLL
#    ifdef __GNUC__
#      define mmux_bash_mpfr_decl		__attribute__((__dllexport__)) extern
#    else
#      define mmux_bash_mpfr_decl		__declspec(dllexport) extern
#    endif
#  else
#    ifdef __GNUC__
#      define mmux_bash_mpfr_decl		__attribute__((__dllimport__)) extern
#    else
#      define mmux_bash_mpfr_decl		__declspec(dllimport) extern
#    endif
#  endif
#  define mmux_bash_mpfr_private_decl	extern
#else
#  if __GNUC__ >= 4
#    define mmux_bash_mpfr_decl		__attribute__((__visibility__("default"))) extern
#    define mmux_bash_mpfr_private_decl	__attribute__((__visibility__("hidden")))  extern
#  else
#    define mmux_bash_mpfr_decl		extern
#    define mmux_bash_mpfr_private_decl	extern
#  endif
#endif


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#include <stdint.h>
#include <inttypes.h>
#include <mpfr.h>


/** --------------------------------------------------------------------
 ** Constants and preprocessor macros.
 ** ----------------------------------------------------------------- */



/** --------------------------------------------------------------------
 ** Version functions.
 ** ----------------------------------------------------------------- */

mmux_bash_mpfr_decl char const *mmux_bash_mpfr_version_string			(void);
mmux_bash_mpfr_decl int		mmux_bash_mpfr_version_interface_current	(void);
mmux_bash_mpfr_decl int		mmux_bash_mpfr_version_interface_revision	(void);
mmux_bash_mpfr_decl int		mmux_bash_mpfr_version_interface_age		(void);


/** --------------------------------------------------------------------
 ** Misc functions.
 ** ----------------------------------------------------------------- */

mmux_bash_mpfr_decl int	mmux_bash_mpfr_parse_mpfr_rnd (mpfr_rnd_t * p_data, char const * const s_arg, char const * const caller_name);
mmux_bash_mpfr_decl int mmux_bash_mpfr_parse_mpfr_exp (mpfr_exp_t * p_data, char const * const s_arg, char const * const caller_name);
mmux_bash_mpfr_decl int mmux_bash_mpfr_set_MPFR_RV (int rv);


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#ifdef __cplusplus
} // extern "C"
#endif

#endif /* MMUX_BASH_MPFR_H */

/* end of file */
