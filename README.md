% README
% xint 1.4n
% 2025/09/05

    Source:  xint.dtx 1.4n 2025/09/05 (doc 2025/09/05)
    Author:  Jean-François B.
    Info:    Expandable operations on big integers, decimals, fractions
    License: LPPL 1.3c


Description
===========

The main functionality is `\xintfloateval` which parses expressions
involving floating point numbers, functions, variables and other syntax
elements.

The precision defaults to `16` decimal digits.  The logarithm,
exponential, direct and inverse trigonometric functions are supported up
to `62` digits.  The four basic operations and square-root extraction
are implemented with correct rounding up to thousands of digits (roughly
up to a maximum of 26000 digits for the output).

A variant `\xinteval` computes with fractions.  And `\xintiieval`
handles only (arbitarily large) integers.

All three parsers obtain their result purely expandably.  They handle
comma separated inputs and nested structures using square brackets.  The
user can declare custom variables and functions.

Usage
=====

The way of loading `xintexpr` depends on whether you are using
`LaTeX` or not.

- with `LaTeX`, add `\usepackage{xintexpr}` to the document preamble,
- else, do `\input xintexpr.sty` and compile with either one of `etex`,
  `pdftex`, `xetex`, `luatex` (they all default to the `Plain TeX`
  format), or with `optex` (i.e. `luatex` with `OpTeX` format),
  or with `context` (`luametatex` engine).

Example
=======

Here is an example typical of the `xintexpr` users morning routine since
many years (`xintexpr` was first released in 2013):

    \xinteval{reduce(add(1/i^3, i=1..25))}

It expands (in two steps) to:

    2560976152652211536408111110189/2131858131361319942957376000000

Repository
==========

It is at https://github.com/jfbu/xint and the issue tracker
is at https://github.com/jfbu/xint/issues.

Documentation
=============

Both the user manual and the commented source code are in `xint.pdf`,
which one can also find at https://jfbu.github.io/xint.

A file `CHANGES.html` is provided at https://jfbu.github.io/xint.  Its
source `xintchanges.md` is part of the CTAN upload, and you
can access it in TeXLive using `texdoc xintchanges.md`.

License
=======

Copyright © 2013-2022, 2025 Jean-François B.

This Work may be distributed and/or modified under the
conditions of the LaTeX Project Public License version 1.3c.
This version of this license is in

> <http://www.latex-project.org/lppl/lppl-1-3c.txt>

and version 1.3 or later is part of all distributions of
LaTeX version 2005/12/01 or later.

This Work has the LPPL maintenance status *author-maintained*.

The Author of this Work is Jean-François B..

This Work consists of the file `xint.dtx` and `README.md` and their
derived files such as `xint.pdf`.
