% README
% xint 1.4c
% 2021/02/20

    Source:  xint.dtx 1.4c 2021/02/20 (doc 2021/02/20)
    Author:  Jean-Francois B.
    Info:    Expandable operations on big integers, decimals, fractions
    License: LPPL 1.3c

Aim and usage
=============

It is possible to use the package both with Plain (`\input xintexpr.sty`)
or with the LaTeX macro format (`\usepackage{xintexpr}`).

The basic aim is provide *expandable* computations on (arbitrarily big)
integers, fractions, and floating point numbers (at a user chosen
precision).  The four operations and the square-root extraction achieve
so-called *correct rounding* for the given arbitrary precision.

The syntax knows dummy variables, as in this example:

    \xinteval{reduce(add(x/(x+7), x = 1000..1010))}

which expands to:

    108959959329292321880648657/9974444716475301992902544

Trigonometrical functions are available:

    \xintDigits*:=48\relax

    \xintfloateval{[-2] sind(37)}

expands to:

    0.6018150231520482799179770004414898414256377098

The [-2] at start of the `\xintfloateval` argument means to round the
result to 2 digits less than the float precision.

Release `1.4` adds support for nested structures.  For example:

    \xintthealign\xintexpr ndseq(1/(i+j), i=1..5; j=1..5)\relax

will print on the page (this is customizable, e.g. to use a `pmatrix`
environment):

    [[ 1/2, 1/3, 1/4, 1/5, 1/6  ],
     [ 1/3, 1/4, 1/5, 1/6, 1/7  ],
     [ 1/4, 1/5, 1/6, 1/7, 1/8  ],
     [ 1/5, 1/6, 1/7, 1/8, 1/9  ],
     [ 1/6, 1/7, 1/8, 1/9, 1/10 ]]

It is possible to declare "universal functions" (à la NumPy) which will
act itemwise on all leaves of such "arrays".  More features are planned
such as providing an interface to algebra of matrices in this framework.

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

