# Makefile for compilation of the complete xint
# documentation, packages, and installation.
# (C) 2014 Jean-Francois B.
# distributed under LPPL 1.3c or later at your convenience.

# with this file Makefile and xint.dtx in a working
# repertory run 'make' and then get further instructions.

# Tested with GNU Make 3.81 on Mac OS X Mavericks,
# with TeXLive 2014 and Pandoc 1.13.1, xint.dtx v1.1

include Makefile.mk
Makefile.mk: xint.dtx ; etex xint.dtx
