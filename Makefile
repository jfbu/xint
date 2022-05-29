# Makefile for building and installing xint
# (C) 2014-2022 Jean-Francois B.
# distributed under LPPL 1.3c.

# Tested with GNU Make 3.81 on Mac OS X Mavericks,
# with TeXLive 2014 and Pandoc 1.13.1, xint.dtx v1.1

Makefile.mk: xint.dtx ; etex xint.dtx

# For some reason I would like Makefile.mk to be always
# recreated if xint.dtx is newer, *before* being included
# here via include, but my brief attempt (2015/09/16) did
# not succeed.

include Makefile.mk

