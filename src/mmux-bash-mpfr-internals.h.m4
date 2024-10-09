/*
  Part of: MMUX Bash Mpfr
  Contents: private header file
  Date: Sep 15, 2024

  Abstract

	This header file is for internal definitions.  It must be included by all the
	source files in this package.

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

#ifndef MMUX_BASH_MPFR_INTERNALS_H
#define MMUX_BASH_MPFR_INTERNALS_H 1


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#ifdef HAVE_CONFIG_H
#  include <config.h>
#endif

#ifdef HAVE_ERRNO_H
#  include <errno.h>
#endif

#ifdef HAVE_STDIO_H
#  include <stdio.h>
#endif

#include <mmux-bash-pointers.h>
#include <mmux-bash-mpfr.h>


/** --------------------------------------------------------------------
 ** Type availability preprocessor macros.
 ** ----------------------------------------------------------------- */

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_LDOUBLE]]],[[[
MMUX_BASH_CONDITIONAL_CODE([[[HAVE_MPFR_SET_LD]]],[[[
#undef  MMUX_HAVE_CC_TYPE_LDOUBLE
#define MMUX_HAVE_CC_TYPE_LDOUBLE		1
]]])]]])

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_FLOAT128]]],[[[
MMUX_BASH_CONDITIONAL_CODE([[[HAVE_MPFR_SET_FLOAT128]]],[[[
#undef  MMUX_HAVE_CC_TYPE_FLOAT128
#define MMUX_HAVE_CC_TYPE_FLOAT128		1
]]])]]])

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_DECIMAL64]]],[[[
MMUX_BASH_CONDITIONAL_CODE([[[HAVE_MPFR_SET_DECIMAL64]]],[[[
#undef  MMUX_HAVE_CC_TYPE_DECIMAL64
#define MMUX_HAVE_CC_TYPE_DECIMAL64		1
]]])]]])

MMUX_BASH_CONDITIONAL_CODE([[[MMUX_HAVE_CC_TYPE_DECIMAL128]]],[[[
MMUX_BASH_CONDITIONAL_CODE([[[HAVE_MPFR_SET_DECIMAL128]]],[[[
#undef  MMUX_HAVE_CC_TYPE_DECIMAL128
#define MMUX_HAVE_CC_TYPE_DECIMAL128		1
]]])]]])


/** --------------------------------------------------------------------
 ** Constants and variables.
 ** ----------------------------------------------------------------- */



/** --------------------------------------------------------------------
 ** Function prototypes.
 ** ----------------------------------------------------------------- */


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#ifdef __cplusplus
} // extern "C"
#endif

#endif /* MMUX_BASH_MPFR_INTERNALS_H */

/* end of file */
