m4_divert(-1)m4_dnl
#
# Part of: MMUX Bash MPFR
# Contents: macros to define builtins specialised to MPFR
# Date: Oct  2, 2024
#
# Abstract
#
#	This library  defines macros to  automatically generate C  language functions
#	for GNU Bash builtins implementation.
#
# Copyright (C) 2024 Marco Maggi <mrc.mgg@gmail.com>
#
# This is free software; you can redistribute  it and/or modify it under the terms of
# the GNU Lesser General Public License as published by the Free Software Foundation;
# either version 3.0 of the License, or (at your option) any later version.
#
# This library  is distributed in the  hope that it  will be useful, but  WITHOUT ANY
# WARRANTY; without  even the implied  warranty of  MERCHANTABILITY or FITNESS  FOR A
# PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License along with
# this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place,
# Suite 330, Boston, MA 02111-1307 USA.
#


#### parsing arguments

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR]]],[[[{
  int  mmux_retval = mmux_bash_mpfr_parse_mpfr_ptr(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_MPF_PTR]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_pointer((void **)&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_MPZ_PTR]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_pointer((void **)&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_MPQ_PTR]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_pointer((void **)&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_ASCIIZ_PTR]]],[[[{
  int  mmux_retval = mmux_bash_pointers_parse_pointer((void **)&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_EXP]]],[[[{
  int  mmux_retval = mmux_bash_mpfr_parse_mpfr_exp(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_RND]]],[[[{
  int  mmux_retval = mmux_bash_mpfr_parse_mpfr_rnd(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto argument_parse_error; }
}]]])


# let's go

# end of file
# Local Variables:
# mode: m4
# End:
m4_divert(0)m4_dnl
