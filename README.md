% README
% xint 2.0a1
% 2026/11/01

    Source:  xint-calx.dtx 2.0a1 2026/11/01
    Author:  Jean-François B.
    Info:    Expandable operations on big integers, decimals, fractions
    License: LPPL 1.3c


Description
===========

The `calx` package and its superset the `xintexpr` package provide:

- `\calxeval`: numerical expression parser for floating-point
  computations.
- `\calxinteval`: numerical expression parser for computations
  with big integers.

Floating-point computations are supported up to 100 significant digits
of precision. A full set of trigonometric, logarithmic, and exponential
functions is implemented.

The two parsers are also available under their legacy names
`\xintfloateval` and `\xintiieval`, respectively.

Loading `xintexpr` automatically loads `calx` and provides a third
parser, `\xinteval`, which handles fractions. It also loads the legacy
macro interface packages `xintcore`, `xint`, and `xintfrac`.

All three parsers produce their results by expansion alone. They accept
comma-separated inputs and nested structures using square brackets.
Users can define custom variables and functions.

Usage
=====

The way of loading `calx` or `xintexpr` depends on whether you are using
`LaTeX` or not.

- with `LaTeX`, add `\usepackage{calx}` (or `xintexpr` if you want
  `\xinteval`) to the document preamble,
- else, do `\input calx.sty` (or `xintexpr`).


The user can employ `calx/xintexpr` with either one of `etex`, `pdftex`,
`xetex`, `luatex` (they all default to the `Plain TeX` format), or
with `optex` (i.e. `luatex` with `OpTeX` format), or with `context`
(`luametatex` engine).

Example
=======

Here is an example typical of the `xintexpr` users morning routine for
many years (`xintexpr` was first released in 2013):

    \xinteval{reduce(add(1/i^3, i=1..25))}

It expands (in two steps) to:

    2560976152652211536408111110189/2131858131361319942957376000000

Repository
==========

The repository is at https://github.com/jfbu/xint, and the issue
tracker is at https://github.com/jfbu/xint/issues.

Documentation
=============

Both the user manual and the commented source code are in `xint-calx.pdf`.

The file `CHANGES.html` is available at https://jfbu.github.io/xint.
Its source, `xintchanges.md`, is included in the CTAN upload and can
also be accessed in TeX Live using `texdoc xintchanges.md`.

Instructions for custom installation
====================================

The `xint*sty`, `calx*sty`, and `calx*tex` files are extracted via the
command `etex xint-calx.dtx`.

Other extracted files are used only for building the PDF documentation
and can be discarded.  For instructions on building this documentation,
see the extracted `xint-calx.tex`.

The recommended TeX directory structure is:

    doc/generic/xint/xintchanges.md
    doc/generic/xint/README.md
    doc/generic/xint/xint-calx.pdf
    source/generic/xint/xint-calx.dtx
    tex/generic/xint/xint*sty
    tex/generic/xint/calx*sty
    tex/generic/xint/{calxlog.tex, calxlogdata.tex}
    tex/generic/xint/{calxtrig.tex, calxtrigdata.tex}

License
=======

Copyright © 2013-2022, 2025, 2026 Jean-François B.

This Work may be distributed and/or modified under the
conditions of the LaTeX Project Public License version 1.3c.
This version of this license is in

> <http://www.latex-project.org/lppl/lppl-1-3c.txt>

and version 1.3 or later is part of all distributions of
LaTeX version 2005/12/01 or later.

This Work has the LPPL maintenance status *author-maintained*.

The Author of this Work is Jean-François B..

This Work consists of the file `xint-calx.dtx` (and its derived files
such as `xint-calx.pdf`), `README.md` and `xintchanges.md`.
