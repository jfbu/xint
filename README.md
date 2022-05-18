% README
% xint 1.4k
% 2022/05/18

    Source:  xint.dtx 1.4k 2022/05/18 (doc 2022/05/18)
    Author:  Jean-Francois B.
    Info:    Expandable operations on big integers, decimals, fractions
    License: LPPL 1.3c


Description
===========

It is possible to use the package both with Plain (`\input xintexpr.sty`)
or with the LaTeX macro format (`\usepackage{xintexpr}`).

The basic aim is provide *expandable* computations on (arbitrarily big)
integers, fractions, and floating point numbers (at a user chosen
precision).  The four operations and the square-root extraction achieve
the *correct rounding* for the given arbitrary precision.  Exponential
(natural and to the base ten), logarithm (also to the base 10),
fractional powers, direct and inverse trigonometrical functions are
available up to 62 digits of precision.  The syntax supports dummy
variables (to generate sequences of values) and nested structures.
Support for user-declared functions and variables is implemented.

Usage on the command line
=========================

One can use `xintexpr` as an interactive calculator on the command line.
See the [xintsession](http://ctan.org/pkg/xintsession) package.

    >>> 2^100;
    @_1     1267650600228229401496703205376
    >>> cos(1);
    @_2     0.5403023058681397
    >>> &fp=32
    (/usr/local/texlive/2021/texmf-dist/tex/generic/xint/xintlog.sty)
    (/usr/local/texlive/2021/texmf-dist/tex/generic/xint/xinttrig.sty)
    fp mode (log and trig reloaded at Digits=32)
    >>> cos(1);
    @_3     0.54030230586813971740093660744298
    >>> 3^1000;
    @_4     1.3220708194808066368904552597521e477
    >>> &exact
    exact mode (floating point evaluations use 32 digits)
    >>> 3^1000;
    @_5     132207081948080663689045525975... (trimmed for this README)

Installation
============

`xint` is included in [TeXLive](http://tug.org/texlive/) (hence
[MacTeX](http://tug.org/mactex/) also) and in
[MikTeX](http://www.miktex.org/). Thus, use the package manager to
update your distribution.

Alternatives:

- download
   [`xint.tds.zip`](http://mirror.ctan.org/install/macros/generic/xint.tds.zip)
   and install in a suitable TDS-compliant repertory via `unzip`. "admin"
   privilges might be needed, as well as a file database rebuild (`texhash`).
   For example, on macos x, installation into user home folder (no `sudo`,
   and no `texhash` as it is recommended to not have a ls-R file there)

        unzip xint.tds.zip -d  ~/Library/texmf

- all files can be extracted using `etex xint.dtx`, or `make` if the
  `Makefile` included in the CTAN upload is present; see the file `INSTALL`,
  if present, else read the help in extracted file `Makefile.mk`.

Documentation
=============

`README.md`: this file

`CHANGES.html`: change log as relevant to end users
  (`texdoc --list xint`)

`xint.pdf`: user manual

`sourcexint.pdf`: commented source code
   (`texdoc --list xint` or `texdoc sourcexint`)

Requirements
============

Since release `1.4`, `xintexpr` requires the `\expanded` primitive. This
is a functionality of all major TeX engines since TeXLive 2019.

License
=======

Copyright (C) 2013-2022 by Jean-Francois B.

This Work may be distributed and/or modified under the
conditions of the LaTeX Project Public License version 1.3c.
This version of this license is in

> <http://www.latex-project.org/lppl/lppl-1-3c.txt>

and version 1.3 or later is part of all distributions of
LaTeX version 2005/12/01 or later.

This Work has the LPPL maintenance status `author-maintained`.

The Author of this Work is `Jean-Francois B.`.

This Work consists of the files `Makefile`, `INSTALL`, and `xint.dtx`
and its extracted and derived files inclusive of the documentation
files `xint.pdf`, `sourcexint.pdf` and `CHANGES.html`.

See `xint.pdf` for contact information.

