% README
% xint 1.4
% 2020/01/31

    Source:  xint.dtx 1.4 2020/01/31 (doc 2020/01/31)
    Author:  Jean-Francois B.
    Info:    Expandable operations on big integers, decimals, fractions
    License: LPPL 1.3c

Aim and usage
=============

The basic aim is provide *expandable* computations on integers,
fractions, and floating point numbers.  For example, with fractions:

    \xinteval{reduce(37189719/183618963+11390170/17310720)^17}

The result has `462` characters (forward slash included.)
One can also work with dummy variables:

    \xinteval{mul(add(x(x+1)(x+2), x=y..y+15), y=171286,98762,9296)}

and do computations with floating point numbers at an adjustable
precision (default `16`).

    \xintDigits:=48;\xintfloateval{123_456_789^10_000.5}
    expands to 1.56866129625858270633170234772583710433908855336e80919

Release `1.4` adds support for nested structures:

    \xintthealign\xintexpr ndseq(1/(i+j), i=1..5; j=1..5)\relax

will print on the page

    [[ 1/2, 1/3, 1/4, 1/5, 1/6  ],
     [ 1/3, 1/4, 1/5, 1/6, 1/7  ],
     [ 1/4, 1/5, 1/6, 1/7, 1/8  ],
     [ 1/5, 1/6, 1/7, 1/8, 1/9  ],
     [ 1/6, 1/7, 1/8, 1/9, 1/10 ]]

The four operations and the square-root extraction achieve so-called
*correct rounding* in the given arbitrary precision.

Trigonometric functions (direct and inverse) are available up to a
maximal precision of about `58` digits. Logarithms and exponentials are
currently evaluated only with `8` or `9` digits precision.

It is possible to use the package both with Plain (`\input xintexpr.sty`)
or with the LaTeX macro format (`\usepackage{xintexpr}`).

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

Attention, release `1.4` requires the `\expanded` primitive available
in all major TeX engines since TeXLive 2019.

License
=======

Copyright (C) 2013-2020 by Jean-Francois B.

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

