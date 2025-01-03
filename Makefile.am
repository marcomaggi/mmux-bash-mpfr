## Process this file with automake to produce Makefile.in

ACLOCAL_AMFLAGS		= -I meta/autotools
AUTOMAKE_OPTIONS	= foreign
EXTRA_DIST		= INSTALL
dist_doc_DATA		= README COPYING
AM_CFLAGS		= $(MMUX_CFLAGS)
AM_CPPFLAGS		= -I$(srcdir)/src -I$(builddir)/src
CLEANFILES		=
DISTCLEANFILES		=
BUILT_SOURCES		=

## --------------------------------------------------------------------

nodist_pkgconfig_DATA	= meta/scripts/mmux-bash-mpfr.pc

## ------------------------------------------------------------------------

MBFLPP_PROG_FLAGS	= --bash-program="$(BASH_PROGRAM)" --define=__MBFL_LIBDIR__=$(MBFL_LIBDIR)
MBFLPP_PROG_FLAGS	+= --define=__LIBMBFL_LINKER__=$(MBFL_LIBMBFL_LINKER) --add-bash
MBFLPP_PROG_ENV		= MBFL_LIBRARY_PATH=$(builddir)/src/share/mbfl; export MBFL_LIBRARY_PATH;
MBFLPP_PROG_RUN		= $(MBFLPP_PROG_ENV) $(MBFLPP) $(MBFLPP_PROG_FLAGS) $(MBFLPP_FLAGS)


#### GNU m4 macros

EXTRA_DIST		+= \
	$(top_srcdir)/src/m4/macros-for-cc.m4			\
	$(top_srcdir)/src/m4/macros-for-cc-mpfr.m4		\
	$(top_srcdir)/src/m4/macros-for-bash.m4			\
	$(top_srcdir)/src/m4/mmux-bash-mpfr-config.m4.in

MMUX_M4_FLAGS		=  $(M4FLAGS) --prefix-builtins --include=$(srcdir)/src/m4/
MMUX_M4_FLAGS		+= --include=$(builddir)/src/ --include=$(builddir)/src/m4

# These  are  used  to  preprocess C  language  files  with  extension
# ".c.m4".  Do not change the order of inclusion!!!
#
MMUX_M4_CC_MACROS	= \
	$(top_srcdir)/src/m4/macros-for-cc.m4			\
	$(top_srcdir)/src/m4/macros-for-cc-mpfr.m4

# These  are  used  to  preprocess   GNU  Bash  files  with  extension
# ".bash.m4".  Do not change the order of inclusion!!!
#
MMUX_M4_BASH_MACROS	= \
	$(top_srcdir)/src/m4/macros-for-bash.m4			\
	$(builddir)/src/m4/mmux-bash-mpfr-config.m4


#### Automake dirstamp files

MMUX_AM_DIRSTAMP_FILES	= \
	tests/$(am__dirstamp)

BUILT_SOURCES		+= $(MMUX_AM_DIRSTAMP_FILES)
DISTCLEANFILES		+= $(MMUX_AM_DIRSTAMP_FILES)

tests/$(am__dirstamp):
	@$(MKDIR_P) tests/
	@: > $(@)


#### documentation

EXTRA_DIST		+= doc/mmux-bash-mpfr.style.css
CLEANFILES		+= doc/mmux-bash-mpfr.css

AM_MAKEINFOFLAGS	= --no-split
AM_MAKEINFOHTMLFLAGS	= --split=node -c WORDS_IN_PAGE=0 --css-ref=mmux-bash-mpfr.css \
	-c PRE_BODY_CLOSE="<p>This document describes version <tt>$(PACKAGE_VERSION)</tt> of <em>$(PACKAGE_NAME)</em>.</p>"

info_TEXINFOS		= doc/mmux-bash-mpfr.texi
doc_mmux_bash_mpfr_TEXINFOS	= \
	doc/macros.texi			\
	doc/overview-linking.texi	\
	doc/gpl-3.0.texi		\
	doc/fdl-1.3.texi

## --------------------------------------------------------------------

doc/mmux-bash-mpfr.html/$(am__dirstamp): doc/$(am__dirstamp)
	@$(MKDIR_P) doc/mmux-bash-mpfr.html/
	@: > doc/mmux-bash-mpfr.html/$(am__dirstamp)

doc/mmux-bash-mpfr.html/mmux-bash-mpfr.css: \
	doc/mmux-bash-mpfr.style.css doc/mmux-bash-mpfr.html/$(am__dirstamp)
	$(INSTALL) -m 0444 "$(top_srcdir)/doc/mmux-bash-mpfr.style.css" "$(builddir)/doc/mmux-bash-mpfr.html/mmux-bash-mpfr.css"

## --------------------------------------------------------------------

html-local: doc/mmux-bash-mpfr.html/mmux-bash-mpfr.css

install-html-local:
	$(MKDIR_P) "$(DESTDIR)$(htmldir)/mmux-bash-mpfr.html/"
	$(INSTALL) -m 0444 $(builddir)/doc/mmux-bash-mpfr.html/mmux-bash-mpfr.css "$(DESTDIR)$(htmldir)/mmux-bash-mpfr.html/"


#### shell libraries

EXTRA_DIST		+= \
	src/libmmux-bash-mpfr.bash.m4				\
	$(top_srcdir)/meta/scripts/print-builtin-names.bash

MMUX_SHELL_LIBFILES	 = src/libmmux-bash-mpfr.bash

BUILT_SOURCES		+= src/mmux-bash-mpfr-builtin-definitions.bash
CLEANFILES		+= $(MMUX_SHELL_LIBFILES) src/mmux-bash-mpfr-builtin-definitions.bash
mmuxbashlib_DATA	=  $(MMUX_SHELL_LIBFILES)
mmuxbashlibdir		=  $(datadir)/bash

src/mmux-bash-mpfr-builtin-definitions.bash: $(top_srcdir)/meta/scripts/print-builtin-names.bash
	$(BASH_PROGRAM) $< >$@

src/libmmux-bash-mpfr.bash: src/mmux-bash-mpfr-builtin-definitions.bash

src/libmmux-bash-mpfr.bash: src/libmmux-bash-mpfr.bash.m4 $(MMUX_M4_BASH_MACROS)
	$(M4_PROGRAM) $(MMUX_M4_FLAGS) $(MMUX_M4_BASH_MACROS) $< >$@


#### libraries

EXTRA_DIST	+= \
	src/mmux-bash-mpfr-internals.h.m4		\
	src/mmux-bash-mpfr-arithmetic.c.m4		\
	src/mmux-bash-mpfr-assignment-builtins.c.m4	\
	src/mmux-bash-mpfr-comparison.c.m4		\
	src/mmux-bash-mpfr-conversion.c.m4		\
	src/mmux-bash-mpfr-exceptions.c.m4		\
	src/mmux-bash-mpfr-exponent.c.m4		\
	src/mmux-bash-mpfr-init.c.m4			\
	src/mmux-bash-mpfr-integers.c.m4		\
	src/mmux-bash-mpfr-library.c.m4			\
	src/mmux-bash-mpfr-memory.c.m4			\
	src/mmux-bash-mpfr-miscellaneous.c.m4		\
	src/mmux-bash-mpfr-output.c.m4			\
	src/mmux-bash-mpfr-rounding.c.m4		\
	src/mmux-bash-mpfr-sign.c.m4			\
	src/mmux-bash-mpfr-stepping.c.m4		\
	src/mmux-bash-mpfr-transcendental.c.m4		\
	src/mmux-bash-mpfr-type-functions.c.m4

MMUX_BASH_MPFR_BUILT_SOURCES	= \
	src/mmux-bash-mpfr-internals.h			\
	src/mmux-bash-mpfr-arithmetic.c			\
	src/mmux-bash-mpfr-assignment-builtins.c	\
	src/mmux-bash-mpfr-comparison.c			\
	src/mmux-bash-mpfr-conversion.c			\
	src/mmux-bash-mpfr-exceptions.c			\
	src/mmux-bash-mpfr-exponent.c			\
	src/mmux-bash-mpfr-init.c			\
	src/mmux-bash-mpfr-integers.c			\
	src/mmux-bash-mpfr-library.c			\
	src/mmux-bash-mpfr-memory.c			\
	src/mmux-bash-mpfr-miscellaneous.c		\
	src/mmux-bash-mpfr-output.c			\
	src/mmux-bash-mpfr-rounding.c			\
	src/mmux-bash-mpfr-sign.c			\
	src/mmux-bash-mpfr-stepping.c			\
	src/mmux-bash-mpfr-transcendental.c		\
	src/mmux-bash-mpfr-type-functions.c

BUILT_SOURCES	+= $(MMUX_BASH_MPFR_BUILT_SOURCES)
CLEANFILES	+= $(MMUX_BASH_MPFR_BUILT_SOURCES)
DISTCLEANFILES	+= $(MMUX_BASH_MPFR_BUILT_SOURCES)

mmux_bash_mpfr_CURRENT		= @mmux_bash_mpfr_VERSION_INTERFACE_CURRENT@
mmux_bash_mpfr_REVISION		= @mmux_bash_mpfr_VERSION_INTERFACE_REVISION@
mmux_bash_mpfr_AGE		= @mmux_bash_mpfr_VERSION_INTERFACE_AGE@
mmux_bash_mpfr_LINKER_VERSION	= -version-info $(mmux_bash_mpfr_CURRENT):$(mmux_bash_mpfr_REVISION):$(mmux_bash_mpfr_AGE)

include_HEADERS			= src/mmux-bash-mpfr.h src/mmux-bash-mpfr-config.h

lib_LTLIBRARIES			= libmmux-bash-mpfr.la
libmmux_bash_mpfr_la_CPPFLAGS	= $(AM_CPPFLAGS)
libmmux_bash_mpfr_la_CFLAGS	= $(AM_CFLAGS) $(BASH_CFLAGS) $(MPFR_CFLAGS) $(MMUX_BASH_POINTERS_CFLAGS)
libmmux_bash_mpfr_la_LDFLAGS	= $(mmux_bash_mpfr_LINKER_VERSION) $(AM_LDFLAGS)
libmmux_bash_mpfr_la_LDFLAGS	+= $(BASH_LIBS) $(MPFR_LIBS) $(MMUX_BASH_POINTERS_LIBS)
libmmux_bash_mpfr_la_SOURCES	= \
	src/mmux-bash-mpfr.h				\
	src/mmux-bash-mpfr-config.h			\
	src/mmux-bash-mpfr-internals.h			\
	src/mmux-bash-mpfr-arithmetic.c			\
	src/mmux-bash-mpfr-assignment-builtins.c	\
	src/mmux-bash-mpfr-comparison.c			\
	src/mmux-bash-mpfr-conversion.c			\
	src/mmux-bash-mpfr-exceptions.c			\
	src/mmux-bash-mpfr-exponent.c			\
	src/mmux-bash-mpfr-init.c			\
	src/mmux-bash-mpfr-integers.c			\
	src/mmux-bash-mpfr-library.c			\
	src/mmux-bash-mpfr-memory.c			\
	src/mmux-bash-mpfr-miscellaneous.c		\
	src/mmux-bash-mpfr-output.c			\
	src/mmux-bash-mpfr-rounding.c			\
	src/mmux-bash-mpfr-sign.c			\
	src/mmux-bash-mpfr-stepping.c			\
	src/mmux-bash-mpfr-transcendental.c		\
	src/mmux-bash-mpfr-type-functions.c

.PHONY: library

library: libmmux-bash-mpfr.la

src/%.c: src/%.c.m4 $(MMUX_M4_CC_MACROS)
	$(M4_PROGRAM) --prefix-builtins $(MMUX_M4_CC_MACROS) $< >$@

src/%.h: src/%.h.m4 $(MMUX_M4_CC_MACROS)
	$(M4_PROGRAM) --prefix-builtins $(MMUX_M4_CC_MACROS) $< >$@

src/%.$(OBJEXT): \
	src/mmux-bash-mpfr.h		\
	src/mmux-bash-mpfr-internals.h	\
	src/mmux-bash-mpfr-config.h


#### tests

EXTRA_DIST		+= \
	tests/test-arithmetic.bash.m4		\
	tests/test-assignment.bash.m4		\
	tests/test-comparison.bash.m4		\
	tests/test-conversion.bash.m4		\
	tests/test-exceptions.bash.m4		\
	tests/test-exponent.bash.m4		\
	tests/test-init.bash.m4			\
	tests/test-integers.bash.m4		\
	tests/test-memory.bash.m4		\
	tests/test-miscellaneous.bash.m4	\
	tests/test-packages.bash.m4		\
	tests/test-printing.bash.m4		\
	tests/test-rounding.bash.m4		\
	tests/test-sign.bash.m4			\
	tests/test-stepping.bash.m4		\
	tests/test-transcendental.bash.m4	\
	tests/test-version.bash.m4

# For some reason GNU Automake does not want "TEST_EXTENSIONS" to be
# inside a conditional; so we put it here.
TEST_EXTENSIONS		= .bash

if WANT_MBFL_TESTING_ENABLED

MMUX_CHECK_BUILT_TESTS	= \
	tests/test-arithmetic.bash		\
	tests/test-assignment.bash		\
	tests/test-comparison.bash		\
	tests/test-conversion.bash		\
	tests/test-exceptions.bash		\
	tests/test-exponent.bash		\
	tests/test-init.bash			\
	tests/test-integers.bash		\
	tests/test-memory.bash			\
	tests/test-miscellaneous.bash		\
	tests/test-packages.bash		\
	tests/test-printing.bash		\
	tests/test-rounding.bash		\
	tests/test-sign.bash			\
	tests/test-stepping.bash		\
	tests/test-transcendental.bash		\
	tests/test-version.bash

TESTS			=  $(MMUX_CHECK_BUILT_TESTS)
check_SCRIPTS		=  $(MMUX_CHECK_BUILT_TESTS)
CLEANFILES		+= $(MMUX_CHECK_BUILT_TESTS)

## --------------------------------------------------------------------

# This environment  setting is used  both to compile  ".bash.m4" files
# and to run ".bash" files.
#
MBFL_TESTS_ENV		= export MBFL_LIBRARY_PATH=$(builddir)/src:$(MBFL_LIBRARY_PATH);
# We  set TMPDIR  because  if the  "/tmp" directory  is  mounted on  a
# separate partition with "noexec"  attribute: tests for executability
# of files  will fail if  the temporary  test files are  created under
# "/tmp".
MBFL_TESTS_ENV		+= TMPDIR=$(PWD)/tmp; export TMPDIR;
MBFL_TESTS_ENV		+= testsdir=$(builddir)/tests; export testsdir;
MBFL_TESTS_ENV		+= TESTMATCH=$(TESTMATCH); export TESTMATCH;
MBFL_TESTS_ENV		+= export LD_LIBRARY_PATH=$(builddir)/.libs/:$(LD_LIBRARY_PATH);
MBFL_TESTS_COMPILE	= $(MBFL_TESTS_ENV) $(MBFLPP_PROG_RUN)
MBFL_TESTS_FLAGS	= $(MBFLPP_GENERAL_FLAGS)

MBFL_TESTS_PREREQUISITES= $(MMUX_LIBRARY) libmmux-bash-mpfr.la

tests/test-%.bash: tests/test-%.bash.m4 $(MBFL_TESTS_PREREQUISITES)
	$(MBFL_TESTS_COMPILE) $(MBFL_TESTS_FLAGS) --output=$@ $<

## ------------------------------------------------------------------------

MBFL_TESTS_RUN_VERBENV	= TESTSUCCESS=yes; export TESTSUCCESS; TESTSTART=yes; export TESTSTART;
MBFL_TESTS_RUN_ENV	= $(MBFL_TESTS_ENV)
# Read "Parallel Test Harness" in the documentation of GNU Automake to
# understand how to use this interface for "make check".
#
# We must make sure that this ends with a semicolon!!!
AM_TESTS_ENVIRONMENT	= $(MBFL_TESTS_RUN_VERBENV) $(MBFL_TESTS_RUN_ENV)
# This variable name is  composed with the template "%s_LOG_COMPILER",
# where "%s" must be the test file extension.
BASH_LOG_COMPILER	= $(BASH_PROGRAM)
AM_TEST_LOG_FLAGS	= $(MBFLFLAGS)

## --------------------------------------------------------------------

endif


#### interface to "make installcheck"

if WANT_MBFL_TESTING_ENABLED

# This  thing with  the PATH  environment  variable is  needed to  run
# distcheck successfully.   We need  to remember  that, for  some sick
# reason, the  Bash built-in "source"  will search for the  file under
# PATH's directories.
#
MBFL_ICHECK_ENV	 = PATH=$(DESTDIR)$(bindir):$$PATH; export PATH;
MBFL_ICHECK_ENV	+= TMPDIR=$(PWD)/tmp; export TMPDIR;
MBFL_ICHECK_ENV	+= testsdir=$(builddir)/tests; export testsdir;
MBFL_ICHECK_ENV	+= export MMUX_LIBRARY=$(DESTDIR)$(mmux_bashlibdir)/libmmux-bash-mpfr.bash;
MBFL_ICHECK_ENV	+= export LD_LIBRARY_PATH=$(DESTDIR)$(libdir):$(LD_LIBRARY_PATH);
MBFL_ICHECK_RUN	 = $(BASH_PROGRAM) $(MBFL_ICHECK_FLAGS)

# If a  test script executes no  test functions: its exit  code is 77,
# which signals  GNU Automake's  test harness that  the test  has been
# skipped.  This is fine when running  "make check", but will cause an
# error when  running "make installcheck";  so we intercept  that exit
# code and normalise it to 0.
#
# We  want  to support  the  case  of  a  ".test" script  being  under
# "$(srcdir)" rather than under "$(builddir)"; so we look for the file
# in both directories.
#
installcheck-local: $(TESTS)
	$(MBFL_ICHECK_ENV) RV=0					;\
	for FILE in $(TESTS)					;\
	do  echo "running: '$(builddir)/$$FILE'"		;\
	    if ! $(MBFL_ICHECK_RUN) "$(builddir)/$$FILE"	;\
	    then RV=$$?; break					;\
	    fi							;\
	done							;\
	if test "$$RV" = 77; then exit 0; else exit $$RV; fi	;

endif


#### common rules

include $(top_srcdir)/meta/automake/mmux-makefile-rules

### end of file
