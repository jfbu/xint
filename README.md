% README
% xint 1.4m
% 2022/06/10

    Source:  xint.dtx 1.4m 2022/06/10 (doc 2022/06/11)
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

Direct installation of both the macro files and the documentation into a
TDS-compliant hierarchy is available via
[`xint.tds.zip`](http://mirror.ctan.org/install/macros/generic/xint.tds.zip)
and usage of `unzip`.  For example, on a macOS system, installation in
user repertory:

    unzip xint.tds.zip -d  ~/Library/texmf

Admin privileges may be needed if the target repertory requires it.

Else, one can download `xint.dtx` from
https://www.ctan.org/tex-archive/macros/generic/xint and execute
`etex xint.dtx` which will extract all macro files (those with extension
`.sty`).  One then only needs to move them to a location where `TeX` can
find them.

To build the documentation one can execute `latex` directly on
`xint.dtx` (at least three times, perhaps more, so `latexmk` is
recommended) then `dvipdfmx` or directly `pdflatex`.  The resulting
`xint.pdf` includes both the user manual and the commented source code,
with hyperlinks.

For those on Unix-like systems the recommended way is to fetch also
`Makefile` from the location above (or to rename the extracted
`Makefile.mk` into `Makefile`), then one can execute `make xint.pdf`
(user manual only), or `make sourcexint.pdf` or `make xint-all.pdf`.
These targets will require `latexmk`.

Further help can be obtained via `make help` or from the comments
in extracted files `xint.tex`,  `sourcexint.tex`, and `xint-all.tex`.

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

