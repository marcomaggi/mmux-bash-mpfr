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
# This program is free  software: you can redistribute it and/or  modify it under the
# terms  of  the  GNU General  Public  License  as  published  by the  Free  Software
# Foundation, either version 3 of the License, or (at your option) any later version.
#
# This program  is distributed in the  hope that it  will be useful, but  WITHOUT ANY
# WARRANTY; without  even the implied  warranty of  MERCHANTABILITY or FITNESS  FOR A
# PARTICULAR PURPOSE.  See the GNU General Public License for more details.
#
# You should have received  a copy of the GNU General Public  License along with this
# program.  If not, see <http://www.gnu.org/licenses/>.
#


#### parsing arguments

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR]]],[[[{
  int  mmux_retval = mmux_mpfr_ptr_parse(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto mmux_error_parsing_builtin_argument; }
}]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PTR_ARRAY]]],[[[{
  int  mmux_retval = mmux_mpfr_ptr_array_parse(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto mmux_error_parsing_builtin_argument; }
}]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_MPF_PTR]]],[[[{
  int  mmux_retval = mmux_pointer_parse((void **)&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto mmux_error_parsing_builtin_argument; }
}]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_MPZ_PTR]]],[[[{
  int  mmux_retval = mmux_pointer_parse((void **)&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto mmux_error_parsing_builtin_argument; }
}]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_MPQ_PTR]]],[[[{
  int  mmux_retval = mmux_pointer_parse((void **)&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto mmux_error_parsing_builtin_argument; }
}]]])

# --------------------------------------------------------------------

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_EXP]]],[[[{
  int  mmux_retval = mmux_mpfr_exp_parse(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto mmux_error_parsing_builtin_argument; }
}]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_RND]]],[[[{
  int  mmux_retval = mmux_mpfr_rnd_parse(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto mmux_error_parsing_builtin_argument; }
}]]])

# $1 - name of the target variable
# $2 - expression evaluating to the string to parse
m4_define([[[MMUX_BASH_PARSE_BUILTIN_ARG_MPFR_PREC]]],[[[{
  int  mmux_retval = mmux_mpfr_prec_parse(&$1, $2, MMUX_BUILTIN_NAME);
  if (MMUX_SUCCESS != mmux_retval) { goto mmux_error_parsing_builtin_argument; }
}]]])


# let's go

# end of file
# Local Variables:
# mode: m4
# End:
m4_divert(0)m4_dnl
