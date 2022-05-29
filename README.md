% README
% xint 1.4l
% 2022/05/29

    Source:  xint.dtx 1.4l 2022/05/29 (doc 2022/05/29)
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

Here is an example of everyday typical calculation by `xintexpr` users:

    \xinteval{reduce(add(1/i^3, i=1..25))}

It expands to:

    2560976152652211536408111110189/2131858131361319942957376000000

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

The simplest alternative is to download
[`xint.tds.zip`](http://mirror.ctan.org/install/macros/generic/xint.tds.zip)
and install the `xint` package files and documentation in a suitable
TDS-compliant repertory via `unzip`.  For example, on a macOS system,
installation in user repertory:

    unzip xint.tds.zip -d  ~/Library/texmf

Admin privileges may be needed when moving the files into the TeX
installation.

Else, one can download `xint.dtx` and optionally `Makefile` from
https://www.ctan.org/tex-archive/macros/generic/xint and proceed from
there.  The package files are extracted automatically from
`etex xint.dtx`.  So if one does not need to build the documentation,
one only has to move the files with extension `.sty` to one's working
repertory and start using them.

Here are various options to build the documentation, from the more
automated to the more manual:

- (with `Makefile`) run `make help` or `make helpless` (on Unix-like
  systems) for extracting package files and receiving further
  instructions, or directly `make xint.pdf` to both extract package
  files and build the user documentation in the current repertory.
  The commented source code will be obtained from `make sourcexint.pdf`.
  This process requires `latexmk`.  The `CHANGES.html` target requires
  `pandoc`.

- (without `Makefile`) run `etex xint.dtx` then rename the extracted
  `Makefile.mk` to `Makefile` and proceed as in the previous item.

- (with no `make`) run `latexmk` on `xint.dtx`.  This will both extract
  package files and build a `dvi` combining the user documentation and
  the commented source code.  Finish with `dvipdfmx xint.dvi`.

- (with no `make`) execute `etex xint.dtx` to extract files then run
  `latexmk` on `xint.tex` and `sourcexint.tex`, or perhaps on
  `xint-all.tex` to combine user manual and source code in one `pdf`.

- (with no `make` and no `latexmk`) proceed as in one of the previous
  two items but with `latex` sufficiently many times in place of
  `latexmk`.  Finish with `dvipdfmx`, or use `pdflatex` initially.

Documentation
=============

`README.md`: this file

`CHANGES.html`: change log as relevant to end users
  (`texdoc --list xint`)

`xint.pdf`: user manual

`sourcexint.pdf`: commented source code
   (`texdoc --list xint` or `texdoc sourcexint`)

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

This Work consists of the files `xint.dtx` and `Makefile` and
extracted files inclusive of the macro files `xint*sty` as
well as derived documentation files such as `xint.pdf`,
`sourcexint.pdf` and `CHANGES.html`

See `xint.pdf` for contact information.

