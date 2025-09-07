% CHANGE LOG
% xint 1.4o
% 2025/09/06

    Source:  xint.dtx 1.4o 2025/09/06
    Author:  Jean-François B.
    Info:    Expandable operations on big integers, decimals, fractions
    License: LPPL 1.3c


`1.4o (2025/09/06)`
----

The feature about allowing Babel-active characters in expressions
was working only with `\xintiieval` due to a too hastily finalized
`1.4n`.  This hotfix release makes it work also for `\xinteval`,
`\xintexpr`, and cousins.

`1.4n (2025/09/05)`
----

### Improvements and new features

 - **xintexpr**: Babel-active characters with `pdflatex` (such as for
   the example `!` with French) are automagically taken care of by
   `\xintfloateval`, `\xinteval` and `\xintiieval`: there is no need to
   use for example `\string!`, or to turn off locally the language-triggered
   activation of some characters.

 - **xintexpr**: the three
   parsers support, in addition to `"` for hexadecimal, the `'` prefix
   for octal numbers.  Also implemented: the `0x`, `0o` and `0b`
   prefixes for hexadecimal, octal, and binary.  In `\xinteval` and
   `\xintfloateval` such inputs may have a fractional part.  Package
   **xintbinhex** is automatically imported.

 - **xintexpr**: `\xintiieval` admits an optional argument `[h]`, `[o]`,
   or `[b]` for conversion of the output (or outputs) to respectively
   hexadecimal, octal or binary.

 - **xintbinhex**: now handles octal in addition to the binary, decimal,
   and hexadecimal radices.  The input sizes for conversions between the
   non-decimal bases are now limited only by TeX main memory.  The
   maximal sizes for conversion to and from decimal are increased.  This
   is explained (additionally to the effect of TeX memory parameters in
   TeXLive having increased since last release) by some internal
   refactoring using `\expanded`. This engine primitive was not yet
   available at the last previous update to the package (`1.2n`
   `2017/08/06`).

 - **xintcfrac**: now imports automatically **xinttools**, which is
   required for two of the **xintcfrac** macros.
   
 - **xinttools**: an extraneous comma at the end of the list argument
   for `\xintForpair`, `\xintForthree`, and `\xintForfour` is now
   silently ignored, rather than causing a crash.  Regarding `\xintFor`,
   such a final comma keeps being interpreted as formerly: it triggers
   an extra iteration using an empty parameter in the substitution text.

 - Compatibility with `OpTeX`.

 - Compatibility (at least partial, not fully tested nor maintained)
   with  `ConTeXt mkxl`.  Older `ConTeXt`'s are not supported.

 - As anyhow **xintexpr** will probably be the customary entry point,
   and as it imports most other packages of the bundle, it was decided
   to migrate to **xintkernel** all \newcount`'s needed by the
   various packages, as well as some macro definitions, even though some
   are unneeded for users of only **xinttools**, **xintbinhex**, or
   **xint**.

### Packaging

With this release, the documentation file `xint.pdf` includes again the
commented source code, in addition to the user manual.  It benefits from
hyperlinking going back and forth between user documentation and source
code, as did already in 2022 `xint-all.pdf`, which however needed to be
built from sources, and has now been renamed to `xint.pdf` and is the
distributed documentation.  There is no more a file `sourcexint.pdf` but
it can be built from sources under the new name `xintsource.pdf`.  Brief
build instructions are at start of `xint.dtx`.

The CTAN upload has `xintchanges.md` (accessible via `texdoc` if with a
`TeXLive` install) as replacement for `CHANGES.html`.  One can find the
latter at the repository front page.  The CTAN upload does not include
anymore a commodity `Makefile`, as `Makefile.mk` extracted from
`xint.dtx` is enough (use `-f` option of `make`).

### Repository

The package has a [web site](https://jfbu.github.io/xint/) which
serves as a (minimalistic) front page to its
[github repository](https://github.com/jfbu/xint).  The repository is
not destined to hold intermediate development versions, but only to
archive the new and old CTAN uploads since the package initial release
in 2013.  Use it to report [issues](https://github.com/jfbu/xint/issues)
(please ping `@jfbu` in your ticket else I may not notice).


`1.4m (2022/06/10)`
----

### Removed

 - **xintexpr**: `\xintdefefunc` et al., deprecated at `1.4` have been removed.

 - **xintexpr**: `\thexintexpr` et al., deprecated at `1.4b` have been
   removed.  Use `\xinttheexpr` et al.

 - **xintlog**: `\poormanloghack` which was a no-op since `1.4e` has been removed.

 - **xintfrac**: `\xintFrac`, `\xintFwOver`, `\xintSignedFrac`,
   `\xintSignedFwOver` now raise errors.  They were deprecated at `1.4g`,
   check the documentation for the new names `\xintTeXFrac` et al.
 
### Breaking changes

 - **xintexpr**: `\xinttheboolexpr` now outputs `true` or `false` (to
   match TeX conventions) and not the `True` or `False` employed since
   `1.4` (inside expressions `true`, `false`, `True` and `False` are
   all recognized keywords anyhow).

 - The `\pdfstrcmp/\strcmp` engine primitive is required.  With `LuaTeX`
   it is emulated via `Lua` code basically copied over from `LaTeX3`.
   Not sure if this is breaking as the package already requires the
   `\expanded` primitive.  Only used so far by (as expected)
   `\xintiiCmp`, and macros which will end up calling it.

### Bug fixes

 - Compatibility with `miniltx` under Plain TeX.  Becoming aware of the
   incompatibilty motivated a release `1.4m`.  With some hesitation I
   decided to not revert the removals and breaking changes listed above
   and which had been already acted in preparation of an hypothetic
   future `1.5`.

 - **xintexpr**: with `\input xintexpr.sty\relax` in `(pdf)eTeX` plus
   `miniltx` (naturally, if `miniltx` was already loaded), and with
   versions up to `1.4k` the `xinttrig` and `xintlog` aborted their own
   `xintexpr`-triggered input erroneously thinking the latter had not
   yet been loaded, and emitted only a very discrete message to the log
   file.  With `1.4l` it became worse as `\input xintexpr\relax`
   auto-repeated itself about six times until `TeX` called it quits.

### Improvements

 - Documentation: most macros are hyperlinked in the source code to the
   code line of their definitions.  Furthermore, from the place of the
   definition the main macros will link to either their descriptions in
   the user manual (in `xint-all.pdf`) or in the implementation part
   (`sourcexint.pdf`).  Conversely inside `xint-all.pdf` the macro
   descriptions are linked towards their implementation.  You may notice
   some time lag with some pdf viewers on opening the heavily
   hyperlinked `sourcexint.pdf` compared to previous releases.

 - Not sure if that counts as an improvement, but I have shortened the
   wording of the expandable error messages, which had been last modified
   at `1.4g`.

`1.4l (2022/05/29)`
----

### Bug fixes

 - **xintkernel**: ever since `1.4`, loading anyone of the `xint*sty`
   packages left the catcode of the character of ascii code `1` to
   the internal custom value `3`.

 - **xintfrac**: the `\xintPFloat` checks for an output being an integer
   in decimal notation or a number with a one-digit trimmed mantissa
   could fail if `\xintPFloatMinTrimmed` (added at `1.4k`) was large
   enough, e.g. equal to the target precision.  Then, the outputs always
   kept trailing zeros, as expected in general but not for those special
   cases.

 - **xintlog**, **xinttrig**: since `1.4e` the message emitted if
   `\usepackage{xintlog}` or `\usepackage{xinttrig}` was encountered in
   place of the correct `\usepackage{xintexpr}` was wrong.  It advised
   to use `\input xintexpr.sty\relax`, which would have failed with
   LaTeX.  The warning is corrected and now the macro file in place of
   aborting will (be it with or without LaTeX) trigger the loading of
   `xintexpr` (hence of itself after it).


 - The possibility to run `latex` directly on `xint.dtx` had been broken
   since `1.4i`.

### New features

 - **xintfrac**: `\xintRawBraced` as a public alias to an **xintfrac**
   entry point to its core input handler.  Experimental additions
   `\xintSignBit` and `\xintFloatBraced`.  Deprecate `\xintTeXfromSci`
   in favor of new name `\xintTeXFromSci`, and remove its `\expanded`
   wrapper (so it is not f-expandable anymore).  Add
   `\xintTeXFromScifracmacro`.

 - **xintfrac**, **xintexpr**: `\xintFracToSci` and `\xintFracToDecimal`
   now behave like all other **xintfrac** macros in terms of allowed
   arguments and f-expandability and have been moved back to
   **xintfrac**. 

### Documentation

 - Renewed random shuffling of large parts of the documentation has
   greatly improved it.

 - Simpler build flow to produce a `pdf` containing both user manual and
   source code.  Removal of dependency on `grep` binary for such builds or
   the one of `sourcexint.pdf`.  Fix of various obsoleted comments in
   extracted files involved in the documentation build process.

`1.4k (2022/05/18)`
----

### Breaking changes

 - **xintfrac**: the longstanding (but documented as undecided and
   unstable) way of `\xintFloat` to output the zero value was `0.e0` and
   it has now been modified into `0.0e0`.  Now customizable via
   `\xintFloatZero`.
   
 - **xintfrac**/**xintexpr**: the behaviour of `\xintPFloat` (hence of
   `\xintfloateval`) has again changed: when the output is an integer
   (not using scientific notation) it does not get postfixed by `.0`.
   This applies in particular for the zero value, now printed `0`.
   Similarly, in the case of scientific notation with a single-digit
   (trimmed) mantissa, no `.0` is used.

   Customizable via
   `\xintPFloatIntSuffix`, `\xintPFloatLengthOneSuffix`, and
   `\xintPFloatZero`.

   Also, `\xintPFloat` trims trailing zeros from the full significand
   only if there are, by default, at least `4` of them, see
   `\xintPFloatMinTrimmed`.
   
 - **xintfrac**/**xintexpr**: macro definition of `\xintFracToSci`
   migrated from the former to the latter (see `1.4l` for update).
   
 - **xintexpr**: `\xintexpr{Safe,Restore}Catcodes` pairs now behave like
   a "last in first out" stack.  Check the `pdf` documentation for
   details.

### Bug fixes

 - **xintexpr**: the `\xintexpr{Safe,Restore}Catcodes` were documented
   at user level, but also used by the package `\xintdefvar` or
   `\xintdeffunc`.  This could result in some bad interaction due to the
   somewhat strange (but documented) behaviour of nested
   `\xintexpr{Safe,Restore}Catcodes` (which has now been modified).

 - **xintexpr**: ever since `1.4`, `\xintdefufunc` (but not
   `\xintdeffunc`) forgot to reset the catcodes to their status prior to
   the sanitization done by the macro at the start of its execution.

### New features

 - **xintfrac**: `\xintPFloatZero`, `\xintPFloatIntSuffix`,
   `\xintPFloatLengthOneSuffix`, `\xintPFloatNoSciEmax`,
   `\xintPFloatNoSciEmin` and `\xintPFloatMinTrimmed` customize the
   output of `\xintPFloat`, hence also of `\xintfloateval` (and of
   `\xinteval` when scientific notation was used in the expression).
   Also added `\xintFloatZero`.
 
 - **xintfrac**: `\xintFloatToDecimal`.

 - **xintexpr**: `\xintFracToDecimal`, an alternative to the default
   `\xintFracToSci` configuration of `\xintexprPrintOne`.
 
 - **xintexpr**: long awaited syntax `\xintieval[D]{...}` and
   `\xintfloateval[Q]{...}` now implemented.  The legacy syntax with
   `\xintieval{[D]...}` and `\xintfloateval{[Q]...}` is kept for
   backwards compatibility.

`1.4j (2021/07/13)`
----

### Bug fixes

 - **xinttools**: a brace removal bug affected the venerable `\xintSeq`
   if producing a single number (e.g. `\xintSeq{10}{10}` expanded to
   `10` not `{10}`).  Thanks to Christophe Poulain for report.

`1.4i (2021/06/11)`
----

### New features

 - **xintexpr**: the concept of simultaneous assignments is extended: in
   case of more variables than values the extraneous variables do not
   cause an error message but are simply set to the `nil` value; in case
   of more values than variables, the last variable is defined to be the
   ople concatenating all the extra values.

 - **xintexpr**: built-in functions usable with arbitrarily many
   arguments such as `max()`, `gcd()`, or `len()` are now again usable
   with a single numeric argument: since `1.4` a lone argument had to be
   a `nutple` (which was automatically unpacked).  It can now again be a
   number.

### Bug fixes

 - **xintexpr**: simultaneous assignments via `\xintdefvar` to 10 or
   more variables was broken if the right hand side was an ople (of
   length at least 10, as it had prior to this release to match the
   number of variables).

 - **xintexpr**: the mechanism which allows to define variables with
   names already in use for pre-existing functions was broken for some
   built-in functions: those handling syntax with dummy variables
   (currently `subs()`, `subsm()`, `subsn()`, `seq()`, `add()`, `mul()`,
   `ndseq()`, `ndmap()`, `ndfillraw()`) and the so-called "pseudo"
   functions (currently `bool()`, `togl()`, `protect()`, `qint()`,
   `qfrac()`, `qfloat()`, `qraw()`, `random()`, `qrand()`, `rbit()`).
   For example the function `seq()` was broken if the user had defined a
   variable `seq`.

`1.4h (2021/05/27)`
----

### Bug fixes

 - **xintexpr**: the recent `1.4g` introduced a bug breaking input of
   the type `<operator><space token><macro>`.

 - **xintexpr**: since `1.4` (`2020/01/31`) the `omit` and `abort`
   keywords were broken if used inside a substitution, itself nested in
   a `seq()` or similar construct.

 - **xintexpr**: since `1.4c` the `\xintthespaceseparated` (added at
   `1.4a`) inserted two, not one, spaces at one specific location near
   the end of its output.  A bit cosmetic problem, fixed nevertheless.

`1.4g (2021/05/25)`
----

### Breaking changes

 - **xintexpr**: the parsing of power operators `**` and `^` now
   proceeds in a right associative way: `2^3^4==2^(3^4)`.

 - **xintexpr**: single-character operators `&`, `|`, and `=`
   (deprecated since `1.1`) have been removed.  Use `&&`, `||` and `==`
   respectively.

### Deprecated

 - **xintfrac**: old typesetting macros dating back to `1.03` and `1.04`
   releases `\xintFrac`, `\xintSignedFrac`, `\xintFwOver`,
   `\xintSignedFwOver` are deprecated. Please use the new names
   `\xintTeXFrac`, `\xintTeXsignedFrac`, `\xintTeXOver`,
   `\xintTeXsignedOver`.  The old names will emit warnings.

### New features

 - Messages written to the terminal and log file during the handling of
   recovery from exceptions use a new mechanism; when in interactive
   mode, the user is prompted only once, not thrice, to enter `<return>`
   for recovery and continued processing.

 - **xintfrac**: `\xintTeXfromSci` (added about 7 or 8 years too late)
   to help typesetting values output by `\xintfloateval` in a more
   useful way than `\xintTeXFrac` (formerly `\xintFrac`).

### Bug fixes

 - **xintexpr**: with **xintbinhex** loaded, `"` is recognized as prefix
   for hexadecimal input; but a bug (present ever since this support for
   hexadecimal input was added) caused syntax such as `"\macro` to break
   the parser.  Also, leading zeros such as in `"0000A` where not properly
   trimmed since `1.2m`.

 - **xintexpr**: authorize `x! == y` without parentheses.  Formerly the
   parser mis-interpreted `!` as first character of the `!=`
   not-equal-to comparison operator, subsequently causing breakage when
   finding the second `=`.

 - **xintexpr**: various error situations were badly handled.
   - `\xinteval{1/0}` did not recover gracefully due to
     longstanding bug in **xintfrac**.
   - `\xintfloateval{1/0}` did not recover gracefully either... due to some
     other reason.
   - recovery from encountering an unknown variable name was
     broken since `1.4`; also, with an unknown function name if in
     `\xintfloatexpr`.
   - `\xinteval{_4}` caused an infinite loop (with underscore `_` having
     its normal catcode).  This was unexpected, as the `_` is documented
     to be ignored if in-between digits (and is ignored if last after
     some digits).  It will be now ignored also if encountered upfront.
     A similar problem existed with variable names starting with a `_`
     (of normal catcode), which however are clearly not legal.  The
     (normal catcode) `_` will then be ignored as well if encountered in
     front of a variable or function name (but not inside of course).
   - ``\xinteval{\catcode`@}`` crashed (one had to use an added `\the`
     or `\number`).
   - illegal ``\xinteval{/3}`` was not intercepted and ultimately
     caused low-level errors (same with `^`).

   Surely, further situations remain where bad input will crash parser.
   
`1.4f (2021/05/10)`
----

### Breaking changes

 - **xintexpr**: `\xintieval{[-D]...}`, which rounds to a multiple of
   `1eD` for `D` positive now *does not insert the trailing zeros* (as
   done at `1.4e`) *nor a scientific part* `eD` (as prior to `1.4e`).
   The use case envisioned is for the quantized value to be used with an
   appropriate unit, for example `k` for `D=3` or `M` for `D=6`
   etc... Sorry for the very long process which was needed to reach this
   final decision.

 - **xintexpr**: for Digits beyond the officially supported range for
   accurate math functions, i.e. for `D>62`, computations were still
   done and printed with full number of digits, but the extra digits
   were meaningless; they now operate on and output mantissas limited to
   `min(D,64)` digits.
 
 - **xintexpr**: for powers `a^b` with Digits at most `8`, the number
   `a` is now float-rounded to Digits before computation, as is done for
   `Digits>8`; previously `9` significant digits were kept.

 - **xintexpr**: further changes in the computation of powers, see the
   bug fixes below.

 - **xintexpr**: the `float_()` function got renamed into `float_dgt()`.
 
### Bug fixes

 - **xintexpr**: the documentation said `float_()` function had been
   renamed `float_dgt()` but actually that was not yet the case.

 - **xintexpr**: powers `a^b` (with exponent `b` neither integer nor
   half-integer) stopped being accurate regarding the last digits for
   `|b|` about `1000` and beyond.  Except for `0.8<a<1.25` for which
   accuracy was maintained up to about `|b|=10^7`.  Fixed via keeping
   the same suitable number of extra digits for internal computations of
   logarithms, independently of whether `a` is close to `1` or not.

 - **xintexpr**: powers `a^b` in `\xinteval` with `|b|` an integer at
   least `10000` were paradoxically computed with less accuracy than in
   `\xintfloateval`... although they were documented to be handled
   exactly the same in the two parsers.

 - **xintexpr**: powers `a^b` for Digits at most `8` unconditionally
   used `log10()/pow10()` approach but due to the limited accuracy of
   the poorman logarithm (`9` fractional digits) this was inaccurate
   already for `b` about `100`.  So, the handling is now as for Digits at
   least `9`, i.e. integer and half-integer exponents are handled via
   the legacy `\xintFloatPower/\xintFloatSqrt` allowing arbitrarily big
   exponents.  It is advised to split big powers with non integer non
   half integer exponents into a product; this is not done internally
   to avoid costly overhead for possibly rare use cases.

 - **xintexpr**: the invalid input `(-1)^2.5` triggered an undefined
   control sequence error if Digits was at most `8`.

`1.4e (2021/05/05)`
----

### Breaking changes

 - **xintlog**: `\poormanloghack` now a no-op.

 - **xinttrig**: loading the package does not define left-over variables
   holding the values of the inverse factorials used in the sine and
   cosine series.
 
 - **xintexpr**: the output format of `\xinteval`, which uses
   `\xintFracToSci,` has changed.  In particular, if the number has a
   power of ten part, it is not output with an integer mantissa, but
   with a scientific mantissa `d.d...` with always at least one digit
   after the decimal mark (possibly `0`) and trailing zeros are trimmed
   out.  This is the same output format as used for `\xintfloateval`,
   apart of course from the fact that the mantissa lengths are not
   limited.
   
 - **xintexpr**: the output format of `\xintfloateval`, which uses
   `\xintPFloat`, changed.  The `\xintfloatexprPrintOne` macro has
   changed its signature to `[#1]{#2}` i.e. its first argument
   will be within brackets not braces.

 - **xintexpr**: when using `\xintieval{[D]...}` optional `[D]` with a
   negative `D`, which triggers quantization to a positive power of ten,
   the output (if not the zero value) will be an integer with `N=abs(D)`
   explicit trailing zeros, not an integer mantissa followed by `eN`.

 - **xintexpr**: `\xinteval` will not compute powers `a^N` exactly if
   `N` in absolute value is at least the (rounded) quotient of `10000`
   by the number of digits of `a`; it will then use the
   logarithm/exponential (in base 10) approach, according to the
   prevailing Digits setting (at `1.4f` this got modified again and integer
   exponents large enough to trigger floating point evaluation are handled
   exactly as in `\xintfloateval`, i.e. using the legacy **xintfrac**
   `\xintFloatPower`,
   not the logarithm/exponential approach which loses accuracy for exponents
   of the order of `100000000` and beyond).

 - **xintexpr**: `\xintdeffloatvar` now always rounds the assigned value
   to the target precision.  Formerly, inputs actually involving no
   float operations, such as for example a sub-expression `\xintexpr1/20!\relax`
   (in
   contrast to `1/20!`), or an explicit single number having more digits
   than the precision, got stored "as is" in the defined variable,
   without pre-rounding to the Digits precision.

 - **xintfrac**:`\xintPFloat` and `\xintFracToSci` have both been
   modified.  The macro `\xintFracToSciE` does not exist anymore, as
   `\xintFracToSci` in the case of scientific exponents hands over the
   process to `\xintPFloat` (without the rounding to Digits, of course).

### New features

 - **xintlog**: now working up to `62` digits. The legacy faster
   `poormanlog`-based macros are kept for computations with Digits up to
   `8`.  Fractional powers are now available both in `xinteval` and
   `xintfloateval`, per default.

 - **xinttrig**: now working up to `62` digits and with increased
   accuracy.  Special faster (or not as slow if you prefer) mode at `8`
   digits or less.

 - **xintexpr**: the constraints on the `\xintexprPrintOne` replacement
   macro, which defaults to `\xintFracToSci`, have been much simplified.

 - **xintexpr**: `\xintiexprPrintOne` (defaults to `\xintDecToString`)

 - **xintfrac**: `\xintPFloatE` may be redefined as a macro which
   fetches the scientific exponent as a mandatory argument delimited
   with a dot, and outputs a suitable formatted result (f-expandably),
   also delimited with a dot which will be removed by internal
   processing.  The default however simply expands to the letter `e`.
 
 - **xintfrac**: `\xintDecToStringREZ` is like `\xintDecToString` but
   starts by removing trailing zeroes.

### Bug fixes

 - **xintfrac**, **xintexpr**: it was not possible to use
   `\xinttheDigits` in the right hand side of an `\xintDigits`
   assignment.  For example: `\xintDigits*:=\numexpr\xinttheDigits+4;`.
   This is now allowed, and the same applies to the macro interface,
   for example `\xintSetDigits*{\xinttheDigits+4}`.


`1.4d (2021/03/29)`
----

### Breaking changes

 - `quo()` and `rem()` in `\xintiiexpr/\xintiieval` renamed to
   `iquo()` and `irem()`.

 - The output of `gcd()` and `lcm()` as applied to fractions is now
   always in lowest terms.

 - The log message to report a variable creation (if `\xintverbosetrue`)
   does not use (double) quotes anymore around the name.  By the way,
   quotes were never used for function names.

### Bug fixes

 - Ever since `1.3` the `quo()` and `rem()` functions in `\xintexpr`
   (not the ones in `\xintiiexpr`) were broken as their (officially
   deprecated) support macros had been removed!  They had somewhat
   useless definitions anyway.  They have now been officially removed
   from the syntax.  Their siblings in `\xintiieval` were renamed to
   `iquo()` and `irem()`.

 - Sadly, `gcd()` was broken in `\xintexpr` since `1.4`, if the first
   argument vanished.  And `gcd()` was broken in `\xintiiexpr` since
   `1.3d` if *any* argument vanished.  I did have a unit test! (which
   obviously was too limited ...)

   Further, the `\xintGCDof` and `\xintLCMof` **xintfrac** macros were
   added at `1.4` but did not behave like other **xintfrac** macros with
   respect to parsing their arguments: e.g. `\xintGCDof{2}{03}` gave an
   unexpected non-numeric result.

 - The `first()` and `last()` functions, if used as arguments to
   numerical functions such as `sqr()` inside an `\xintdeffunc`
   caused the defined function to be broken.

`1.4c (2021/02/20)`
----

### Bug fixes

 - Fix `1.4` regression which broke syntax `varname(...)` which supposedly
   is allowed and inserts a tacit multiplication.

`1.4b (2020/02/25)`
----

All changes regard the **xintexpr** module.

### Future

 - `&`, `|`, (as Boolean operators) and `=` (as equality test) have long
   been deprecated in favour of `&&`, `||` and `==`.  They will be
   removed at next major release.

 - At next major release the power operators `**` and `^` will turn from
   left to right associative.  I.e. `2**2**3` will give `256`, not `64`.
   This is to match with Python and l3fp.

 - `\thexintexpr` et al. (introduced at `1.2h` but not documented
   anymore for some time) will be removed at next major release.  The
   original `\xinttheexpr` et al. have always been so much better names.
   Besides, since `1.4`, `\xintexpr` can be used directly in typesetting
   flow.

### New features

 - Function `zip()` is modeled on Python's function of the same name.
 
 - Function `flat()` removes all nesting to produce a "one-dimensional"
   list having the exact same leaves (some possibly empty) as the
   original (in the same order).
 
 - Chaining of comparison operators (e.g. `x<y<z`) as in Python (but all
   comparisons are done even if one is found false) and l3fp.

 - It was possible since `1.4`'s `\xintFracToSciE` to configure the
   separator between mantissas and exponents in the output of
   `\xinteval` but strangely there was no way to customize the output of
   `\xintfloateval`.  The added `\xintPFloatE` fixes this.

### Bug fixes

 - `\xintieval{[D]...}` with a negative `D` (a feature added at `1.4a`)
   used erroneously a catcode 12 `e` in output, which moreover remained
   immuned to the `\xintFracToSciE` setting.

`1.4a (2020/02/19)`
----

All changes regard the **xintexpr** module.

### Breaking changes

 - The macros implementing customization of
   `\xintthealign` have modified meanings and names.

### New features

 - `\xintthespaceseparated` (serves to provide
   suitable input to PS-Tricks `\listplot`).

 - The optional argument `[D]` to `\xintieval/\xintiexpr`
   can be negative, with the same meaning as the non-negative case, i.e.
   rounding to an integer multiple of `10^(-D)`.

    The same applies to the functions `trunc()` and `round()`.  And to
   the `\xintTrunc`, `\xintRound`, `\xintiTrunc`, and `\xintiRound` macros
   of **xintfrac**.

### Bug fixes

 - Usage of `round()` and `trunc()` within `\xintdeffunc`
   got broken at `1.4`.

 - `add()` and `mul()` were supposedly accepting the
   `omit`, `abort` and `break()` keywords since `1.4` but this was
   broken.
   

`1.4 (2020/01/31)`
----

### Breaking changes

Please note that this list may still be incomplete.  If not otherly
specified all items regard the **xintexpr** module.

 - The `\expanded` primitive (TeXLive 2019) is **required**.  This does
   not affect the macro layer **xintcore**, **xint**, **xintfrac**,
   **xinttools** (yet).

 - Formerly square brackets `[...]` were, on their own, not different
   from parentheses (and thus disappeared from the output), but they are
   now a genuine constructor of nested lists.  For example `\xinteval{1,
   [2, [3, 4]], 5}` produces `1, [2, [3, 4]], 5` (recall this is free
   bloatware).

 - The output of `\xinteval` has changed (besides containing brackets).
   It does not use anymore the so-called *raw* **xintfrac** format,
   i.e. things such as `A/B[N]` (which can still be used in input but
   are discouraged in **xintexpr** context), but scientific notation
   `AeN/B`.  As formerly, the denominator is printed only if `B>1` and
   the scientific part is dropped if the exponent vanishes.  In this way
   the output of `\xinteval` can be pasted to alternative software.

 - The output format of `\xinthe\xintboolexpr` also has changed.  It uses
   `True` and `False` (which are accepted on input), and this can
   easily be configured otherwise (also `true` and `false` are accepted
   on input).

 - The "broadcasting" (as it turned out, à la `NumPy`) of scalar
   operations on one-dimensional "lists", e.g `3*[1,3,5,7]+10` acting
   itemwise is **dropped**.  It is hoped to implement such operations
   again in stronger form in future releases.  Pre-existing alternative
   syntax is available, also to produce the bracketed (cf. next item)
   `[13,19,25,31]` which will be the output in future.

 - The `divmod()` function now produces on output such a bracketed
   pair, but simultaneous assignment such as `\xintdefvar xq, xr =
   divmod(a,b);` will work transparently.
   
 - The syntax for using conditionals in function declarations has
   changed.  Now, one *must* use the `?` and `??` short-circuit boolean
   branching operators whereas in the past it was explained that the
   syntax had to use the `if()` and `ifsgn()` functions.

 - Macros `\xintGCD`, `\xintLCM`, `\xintGCDof` and `\xintLCMof` formerly
   provided by **xintgcd** got moved to **xintfrac** (which is not
   loaded by **xintgcd**).  Moreover, they were extended to handle
   general fractions on input but this also means that their output is
   now obiding by the raw **xintfrac** format.  The integer only
   `\xintiiGCD`, `\xintiiLCM` also got moved out of **xintgcd**, but to
   **xint** which is now loaded automatically by **xintgcd**.  The few
   remaining macros of **xintgcd** at least do not need other imports as
   **xintgcd** now loads also automatically **xinttools** which is a
   dependency for two of them.
   
### Improvements and new features

Please note that this list is currently incomplete.  For more
information look at the user manual and the documented source code
`sourcexint.pdf`.

Unless otherwise specified all changes commented upon here regard
**xintexpr**.  Important: all the new syntax is to be considered
experimental.  The author may change some names in future release, or
even the interface (whether to use semi-colons or colons etc...).
 
 - The `\csname` encapsulation technique used since **xintexpr** initial
   release (`1.07 2013/05/25`) to move around possibly large data during
   expansion-only operations is replaced with methods based on the
   `\expanded` engine primitive.  The latter is available in all major
   engines since TeXLive 2019.

    Formerly, and with default memory settings, one would typically
   saturate the string pool memory after about of the order of 50,000
   independent floating point evaluations of expressions of average
   complexity on 16-digits numbers.

    There is thus no string pool memory impact at all but one can
   now hit TeX's main memory limit (which typically stands at 5,000,000
   words) from defining large variables or generating on the fly large
   data.  TeX distributions have a configuration file allowing to enlarge
   TeX memory parameters and regenerate the (eTeX based) formats.

 - The package supports input and output of arbitrarily *nested lists*,
   a.k.a. *oples* or *nlists*, with `[...]` as the constructor of
   *bracketed lists*, a.k.a *nut-ples*.  Operations on these objects (as
   briefly surveyed in later items) are inspired from syntax and
   functionalities of `NumPy`'s *ndarrays*.  Our *oples* (hence also
   their packaged form *nut-ples*) may have *leaves* at varying depths
   rather than obeying an N-dimensional hyperrectangular shape.  But the
   syntax does provide specific constructors for *ndlists*
   (i.e. hyperrectangular *oples* or *nut-ples*).

     In a (distant?) future, perhaps **xintexpr** itself or a
   third-party package will provide an interface, say `\xintstorearray`,
   `\xintgetarray`, to store (which can not be expandable) and retrieve
   (which can be expandable and thus be embedded inside expressions
   parsed by `\xintexpr`, `\xintiiexpr` or `\xintfloatexpr`) such
   *ndlists* from TeX memory.  This is why the package does not use the
   word *ndarray* and reserves it for such memory stored objects.

 - The `*` serves as *unpacking* operator on *nut-ples*, i.e. reversing
   the `[]` bracketing of an *ople*.

 - *oples* have no exact equivalent in `Python`. For example
   **xintexpr** allows `foo(Var1, x)` if `foo` is a function of 4
   variables and `Var1` is a variable producing a length 3 *ople*, or
   `foo(Var2)` if `Var2` is a variable producing a length 4 *ople*.
   Python would require here to use explicitly the `*`-unpacking notation
   on some "packed" objects.

    Variable and function values may be *oples* (even *nil*), but in
   function declarations variables must stand for *one-ples*, i.e. either
   *numbers* or *nut-ples* (as there is no non-ambiguous way to split
   e.g. 5 arguments into two separate *oples*).

 - Simultaneous assignment to at least two variables via `\xintdefvar`
   et al. automatically unpacks the assigned value if it is a *one-ple*.
   If this value was in fact a *number*, low-level errors will result
   shortly afterwards as no check is done if the unpacking was illicit.
   (update: this last remark does not apply since the `1.4i` extension to
   the concept of simultaneous assignments)
   
 - The `NumPy` concept and syntax for nested slicing and item selection
   are implemented.  Currently *stepping* and the *Ellipsis object* are
   not yet available.  Only so-called basic slicing is currently
   supported.  (The author has not yet read the section of `NumPy`
   documentation on so-called *advanced indexing*).

 - The *broadcasting* of scalar operations, such as itemwise addition or
   multiplication of *nut-ples* of the same shape is **not yet implemented**.

 - Slicing and indexing apply also at top level to the *oples* with
   behaviour conforming to intuitive expectations (see user manual); if
   it turns out the *ople* is in fact a *nut-ple*, the top-level
   slicing/indexing switches to the `Python/NumPy` conventions, i.e. it
   operates inside the brackets for slicing and removes brackets if
   indexing.

 - The syntax `ndseq(expression in x, y, ..., x = values; y = values;
   ...)` constructs a (bracketed) *ndlist* by evaluation the expression
   on all possible Cartesian n-uples, where the first variable indexes
   the first axis, the second the next, etc...

 - The `ndmap(foo, values1; values2; ...; valuesN)` syntax constructs a
   (bracketed) *ndlist* by evaluating the function `foo` on all elements
   of the cartesian product of the given (one-dimensional) value lists.

 - The two concepts of `\xintdeffunc` (for recursive definitions) and
   `\xintdefefunc` (for functions which expand immediately in other
   function declarations) have been merged. The `\xintdefefunc` et al.
   are deprecated and kept as aliases for `\xintdeffunc` et al.

 - `\xintdefufunc` allows to define so-called *universal functions*,
   i.e. functions `foo` such that `foo(myople)` will apply itemwise at
   arbitrary depth in the nested structure. The function `foo` is
   allowed to produce from a scalar an *ople*...

 - The variables in function declarations can now be multi-letter words.

 - The last positional variable in a function declaration can be prefixed
   with a `*` meaning exactly as in Python (*variadic* function
   argument) that it stands for a one-dimensional *nut-ple* receiving all
   remaining arguments from the function call beyond the first
   positional ones.  It is thus an optional argument, but syntax for
   named optional arguments with default values is not yet implemented.

 - Dummy variables used in constructors can also be multi-letter words,
   if they have been declared as such.

 - In variable and function declarations, if the expression contains
   inner semi-colons, it is not needed anymore to brace them to avoid
   mis-interpretation as the final semi-colon which is mandated by the
   syntax to serve as expression terminator.

 - `subsm(expression, var1 = value1; var2 = value2; ...)` provides a leaner
   syntax for multiple substitutions; they must be independent, though.

 - `subsn(expression, var1 = value1; var2 = value2; ...)` provides a
   leaner syntax for nested substitutions, i.e., each `valueJ` may be an
   expression using the dummy variables `varK` with `K>J`.  And finally
   of course the evaluated expression can refer to all variables.

 - `\xintthealign\xintexpr...\relax` (or with `\xintfloatexpr` or
   `\xintiiexpr` or `\xintboolexpr`...) will use a TeX alignment to
   display *oples*. The output (for regular N-dimensional lists) looks
   very similar to what `Python/NumPy` produces in interactive session.
   This is entirely configurable and can also be set-up to be used for
   writing into external files.

    Attention that `\xintthealign` only works if followed by `\xintexpr`
   et al., not by `\xinteval{}`.

 - It is now possible to use `\xintexpr...\relax` directly for
   typesetting.  The syntax `\xinteval{...}` or
   `\xintthe\xintexpr...\relax` is needed only if one wants the
   expansion to give the explicit digits, but `\xintexpr...\relax` by
   itself will typeset as would have the other ones.  Further it can be
   used in so-called moving arguments, because when output to an
   external file it uses only characters with standard catcodes (and
   produces the same protected and re-tokenizable result it would in an
   `\edef`.)

    As formerly, `\xintexpr...\relax` is the preferred way to include an
   expression into another one. Using `\xinteval` is a waste because it
   forces the outer parser to re-digest all the digits (or now also the
   square brackets).

 - The output format of `\xintfloateval` with scientific notation has
   not changed (apart from possible presence of bracketed lists), but
   the author hesitates because the *prettifying* it does by default is
   not really adapted to display of arrays (see `\xintthealign`).
   Anyway, this is configurable by the user.  It is possible to
   specify whether to use `e` or `E`.

 - Function declarations are able to parse a much wider part of the
   syntax, but some severe limitations remain.  Refer to the user manual for
   related information.

 - We have made an effort on some error messages, and when working
   interactively in a shell it may even be sometimes possible to insert
   for example a correct variable or function name in place of the not
   recognized one.  But don't expect miracles when trying to intervene
   in the midst of a purely expandable expansion...

### Bug fixes

Bugs? Those identified in `1.3f` were almost features.  As per `1.4` the
code base of **xintexpr** received multiple successive core refactorings
and added numerous new features, and our test suite although
significantly enlarged is not yet extensive enough.  Please report bugs
by mail.

### TODO

 - The long delayed overhaul of how floating point numbers are handled
   is delayed again.  It has remained basically identical to its initial
   provisory version from `1.07 2013/05/25` (which was based upon what
   was originally only a set of expandable macros for computations with
   big integers), and suffers from the author lack of knowledge of the
   notion of "data type" in modern programming.  Indeed, he never took a
   CS class, and disables JavaScript in his browser (or allows only
   select non-tracking scripts, a rare beast in modern days).

 - Prior to integrating all of `NumPy`, it is envisioned to start with
   matrix algebra first.


`1.3f (2019/09/10)`
----

### Improvements and new features

 - **xintfrac**: `\xintDigits = P;` syntax (i.e. without a colon) is now
   accepted in addition to `\xintDigits := P;`.

     Document that the ending semi-colon can not be an active character
   and that it has always been allowed to use in its place a
   non-expanding token e.g. `\xintDigits := 32\relax`.

     Add `\xintSetDigits`.

 - **xintexpr**: add starred variants `\xintDigits*` and `\xintSetDigits*`
   which execute `\xintreloadxinttrig`.

     Revert 1.3e ban on usage of `\xinteval` et al. inside expressions by
   `\xintdeffunc`.  And make them usable also inside macro definitions via
   `\xintNewExpr`.

### Bug fixes

 - **xintexpr**: fix bug preventing usage of `\xintdefefunc` to define a
   function without variables.

     Fix some issue with `\xintfloatexpr[D]..\relax` if used inside an
   expression parsed by `\xintdeffunc` et al.


`1.3e (2019/04/05)`
----

### Breaking changes

 - (_reverted at 1.3f_) When defining functions, sub-expressions can only
   use the `\xint(float)expr...\relax` syntax. One can not use there the
   `\xint(float)eval` wrappers.

### Improvements and new features

 - The **xinttrig** library is automatically loaded by **xintexpr**. It
   provides direct and inverse trigonometrical functions using either
   degrees or radians with a precision of up to (a bit less than) 60
   digits. It is for the most part implemented using high level user
   interface, but will probably get some optimizations in future (and
   perhaps extension to more digits).

 - The **xintlog** library is automatically loaded by **xintexpr**. It
   uses [poormanlog](http://ctan.org/pkg/poormanlog) to provide
   logarithms and exponentials with almost 9 digits of precision.
   Extended precision is for a future release.

 - **xintexpr**: `\xintdefefunc`, `\xintdeffloatefunc`, `\xintdefiiefunc`
   define functions which are not protected against expansion in the
   definition of other functions; refer to `xint.pdf` for the related
   explanations.

   Notice that whole area of `\xintdef(e)func`, `\xintNewExpr`,
   `\xintNewFunction` is complex and to be considered still as work in
   progress as it has a number of shortcomings.

 - **xintexpr**: `inv()`, `ilog10()`, `sfloat()`, behaviour of
   `qfloat()` slightly modified.

 - **xintexpr**: `\xintensuredummy`, `\xintrestorelettervar`.

 - The optional argument of `\xintfloatexpr` or `\xintfloateval` (it
   must be at start of braced argument) can be negative; it then means
   to trim (and round) from the output at float precision that many
   least significant digits.

### Bug fixes

 - Some bugfixes related to user functions with no variables at all;
   they were dysfunctional.

`1.3d (2019/01/06)`
----

### Breaking changes

 - **xintexpr**: the `gcd()` and `lcm()` functions formerly converted
   their arguments to integers via `\xintNum`. They now handle general
   input with no such modification.

 - **xintexpr**: former `\xinteval`, `\xintieval`, `\xintiieval`, and
   `\xintfloateval` renamed to `\xintexpro`, `\xintiexpro`,
   `\xintiiexpro`, and `\xintfloatexpro`.

### Improvements and new features

 - **xintexpr**: the `gcd()` and `lcm()` multi-arguments functions have
   been refactored to handle general fractions. The dependency on
   **xintgcd** is removed.

 - **xintexpr**: three-way branching `\xintifsgnexpr`,
   `\xintifsgnfloatexpr`, `\xintifsgniiexpr` conditional macros.

 - **xintexpr**: `\xintunassignexprfunc`, `\xintunassigniiexprfunc`,
   `\xintunassignfloatexprfunc` to "undefine" functions.

 - **xintexpr**: `\xintunassignvar` really makes the (multi-letter) variable
   unknown (formerly, it only gave it value zero),

 - **xintexpr**: functions `isone()` and `isint()`.

 - **xintexpr**: `\xinteval`, `\xintieval`, `\xintiieval`, and
   `\xintfloateval` as synonyms to `\xinttheexpr...\relax` etc..., but
   with the (comma-separated) expression as a usual braced macro
   argument.

### Bug fixes

 - **xintcore**, **xintexpr** : division in `\xintiiexpr` was broken for
   a zero dividend and a one-digit divisor (e.g. ``0//7``) since `1.2p`
   due to a bug in `\xintiiDivMod` for such arguments. The bug was
   signaled (thanks to Kpym for report) and fixed shortly after `1.3c`
   release but I then completely forgot to upload a bugfix release to
   CTAN at that time, apologies for that.

`1.3c (2018/06/17)`
----

### Improvements and new features

 - **xintexpr**: with `\xintglobaldefstrue`, `\xintdefvar`,
   `\xintdeffunc`, `\xintNewExpr` et al. make definitions with global
   scope.

 - **xintexpr**: `qraw()` for fast input of (very many) comma separated
    numbers (in suitable raw format).

 - **xintexpr**: the colon in the `:=` part of the syntax for
   `\xintdefvar` and variants is now optional; and if present it may be
   an active character or have any (reasonable) catcode.
   
 - **xintexpr**: `\xintdefvar`, `\xintdeffunc` and their variants try to
   set the catcode of the semi-colon which delimits their arguments; of
   course this will not work if that catcode is already frozen.

 - `\xintUniformDeviate` is better documented and `sourcexint.pdf` is better
   hyperlinked and includes indices for the macros defined by each package.

### Bug fixes

 - **xintfrac**: since `1.3` release, it loaded **xintgcd** in
   contradiction to what the documentation says (hence also **xintexpr**
   loaded **xintgcd** automatically). There is no actual dependency so
   the loading is removed for now.

`1.3b (2018/05/18)`
----

### Improvements and new features

All additions related to randomness are marked as work-in-progress. They
require an engine providing the `\(pdf)uniformdeviate` primitive.

 - **xintkernel**: `\xintUniformDeviate`.

 - **xint**: `\xintRandomDigits`, `\xintXRandomDigits`, `\xintiiRandRange`,
   `\xintiiRandRangeAtoB`.

 - **xintfrac**: support macros (not public, mainly because internal
   format for floats is surely not final) for `random()` and `qrand()`.

 - **xintexpr**: `random()`, `qrand()`, and `randrange(A[, B])`.

 - **xintexpr**: when a function `foo()` is declared via `\xintdeffunc`
   (et al.) to be parameter-less, it can be used as `foo()`; formerly
   `foo(nil)` syntax was required.

 - The usual provision of user manual "improvements".


`1.3a (2018/03/07)`
----

### Removed

 - **xintcore**, **xint**, **xintfrac**: removal of the internal macros
   which were used at `1.2o` to add a deprecation mechanism; all
   deprecated macros have been removed at `1.3` so there was no reason
   to keep the code used for deprecating them.

### Improvements and new features

 - **xintexpr**: new conditionals `ifone()` and `ifint()`.

 - **xintfrac**: `\xintREZ` is faster on inputs having one hundred
   digits or more.

 - Added to the user manual mention of macros such as `\xintDivFloor`,
   `\xintMod`, `\xintModTrunc`, which had been left out so far.

### Bug fixes

 - **xintexpr**: the mechanism for adjunction to the expression parsers
   of user defined functions was refactored and improved at previous
   release `1.3`: in particular recursive definitions became possible.
   But an oversight made these recursive functions quite inefficient (to
   remain polite.) This release fixes the problem.


`1.3 (2018/03/01)`
----

### Breaking changes

 - **xintcore**, **xint**, **xintfrac**: all macros deprecated at `1.2o`
   got removed.

 - **xintfrac**: addition and subtraction of `a/b` and `c/d` now use the
   l.c.m. of the denominators. Similarly the macro supporting the modulo
   operator `/:` uses a l.c.m. for the denominator of the result.

 - **xintexpr**: the addition, subtraction, modulo `/:`, and the
   `mod()` and `divmod()` functions produce generally smaller denominators
   (see previous item).

 - **xintexpr**: formerly, the internal macros which are internally
   associated to user-declared functions were using comma separated
   parameter texts. They now do not use such commas (their meanings,
   which may again change in future, are written for information to the
   log under `\xintverbosetrue`).

### Improvements and new features

 - **xintexpr**: user-defined functions may now be of a recursive
   nature. This was made possible by a refactoring of the `\xintNewExpr`
   mechanism. It became both leaner and more extensive than formerly.

 - **xintfrac**: new macros `\xintPIrr` and `\xintDecToString`. The
   latter is a backport of a `polexpr 0.4` utility, and it is to be
   considered unstable.

 - **xintexpr**: new function `preduce()` associated with `\xintPIrr`.


`1.2q (2018/02/06)`
----

### Improvements and new features

 - **xintexpr**: tacit multiplication extended to cases such as `3!4!5!`
   or `(1+2)3`.

### Bug fixes

 - **xintcore**: sadly, refactoring at `1.2l` of subtraction left an
   extra character in an inner macro causing breakage in some rare
   circumstances. This should not have escaped our test suite!


`1.2p (2017/12/05)`
----

### Breaking changes

 - **xintgcd**: `\xintBezout{a}{b}`'s output consists of `{u}{v}{d}`
   with `u*a+v*b==d`, with `d` the GCD. Formerly it was
   `{a}{b}{u}{v}{d}`, and with `u*a-v*b==d`.

 - **xintgcd**: `\xintBezout{0}{0}` expands to `{0}{0}{0}`. Formerly
   (since `1.2l`) it raised `InvalidOperation`.
 
 - **xintcore**: `\xintiiMod` is now associated with floored division.
   The former meaning (associated with truncated division) is available
   as `\xintiiModTrunc`.
 
 - **xintfrac**: `\xintMod` is now associated with floored division. The
   former meaning is available as `\xintModTrunc`.

 - **xintexpr**: the ``//`` operator and its associated modulo ``'mod'``
   (or ``/:``) now correspond to floored division, like the Python
   language `//`, `%`, and `divmod(x, y)`. Formerly they had been
   associated to truncated division. This is breaking change for
   operands of opposite signs.

### Improvements and new features

 - **xinttools**: `\xintListWithSep`, which had remained unchanged since
   its introduction at `1.04 (2013/04/25)`, was rewritten for increased
   speed.

 - **xintexpr**: `\xintdefvar`'s syntax is extended to allow
   simultaneous assignments. Examples:
   `\xintdefvar x1, x2, x3 := 1, 3**10, 3**20;` or
   `\xintdefiivar A, B := B, A 'mod' B;`
   for already defined variables `A` and `B`.

 - **xintexpr**: added `divmod()` to the built-in functions. It is
   associated with floored division, like the Python language `divmod()`.
   Related support macros added to **xintcore**, and **xintfrac**.

### Bug fixes

 - **xintgcd**: `\xintBezout{6}{3}` (for example) expanded to
   `{6}{3}{-0}{-1}{3}`, but the `-0` should have been `0`.

 - **xintgcd**: it still used macro `\xintiAbs` although the latter had
   been deprecated from **xintcore**.

 - **xintexpr**: in float expressions the `//` and `/:` (aka `'mod'`)
   operators did not round their operands to the float precision prior
   to computing with them, contrarily to other infix arithmetic
   operators and to the `mod(f,g)` function; thus, `mod(f,g)` and
   `f 'mod' g` were not completely equivalent.

 - various documentation fixes; in particular, the partial dependency of
   **xintcfrac** on **xinttools** had not been mentioned.


`1.2o (2017/08/29)`
----

### Breaking changes

 - **xint**: `\xintAND`, `\xintOR`, ... and similar Boolean logic macros do
   not apply anymore `\xintNum` (or `\xintRaw` if **xintfrac** is loaded), to
   their arguments (often, from internal usage of `\xintSgn`), but only
   f-expand them (using e.g. `\xintiiSgn`). This is kept un-modified even if
   loading **xintfrac**.

### Deprecated

Deprecated macros raise an error but, generally, then expand as in former
releases. They will all get removed at some future release.

 - **xintcore**: `\xintiOpp`, `\xintiAbs`, `\xintiAdd`, `\xintiSub`,
   `\xintiMul`, `\xintiDivision`, `\xintiQuo`, `\xintiRem`, `\xintiDivRound`,
   `\xintiDivTrunc`, `\xintiMod`, `\xintiSqr`, `\xintiPow`, and `\xintiFac`
   are deprecated. Only the `ii`-named variants get defined.

 - **xintcore**: `\xintCmp` and `\xintSgn` are deprecated from **xintcore**
   (which only defines `\xintiiCmp` and `\xintiiSgn`) as they actually belong
   to **xintfrac**.

 - **xintcore**: `\xintiiFDg`, resp. `\xintiiLDg`, are renamed `\xintFDg`,
   resp. `\xintLDg`. Former denominations are deprecated.

 - **xint**: `\xintMON`, `\xintMMON`, `\xintiMax`,
   `\xintiMin`, `\xintiMaxof`, `\xintiMinof`, `\xintiSquareRoot`,
   `\xintiSqrt`, `\xintiSqrtR`, `\xintiBinomial`, and `\xintiPFactorial` are
   deprecated. Only `ii`-named variants get defined.

 - **xint**: `\xintEq`, `\xintGeq`, `\xintGt`, `\xintLt`, `\xintGtorEq`,
   `\xintLtorEq`, `\xintIsZero`, `\xintIsNotZero`, `\xintIsOne`,
   `\xintOdd`, `\xintEven`, `\xintifSgn`,
   `\xintifCmp`, `\xintifEq`, `\xintifGt`, `\xintifLt`, `\xintifZero`,
   `\xintifNotZero`, `\xintifOne`, `\xintifOdd`, are deprecated. These macros
   belong to **xintfrac**. Package **xint** defines only the `ii`-named
   variants.

 - **xint**: `\xintNeq` was renamed to `\xintNotEq` which however is only
   provided by **xintfrac**. Package **xint** defines `\xintiiNotEq`, and
   `\xintNeq` is deprecated.

 - **xint**: `\xintNot` was renamed to `\xintNOT`, former denomination is
   deprecated. See also item about Boolean logic macros in the *Incompatible
   Changes* section.


`1.2n (2017/08/06)`
----

### Breaking changes

 - **xintbinhex** does not load package **xintcore** anymore, but only
   **xintkernel**.

### Improvements and new features

 - **xintbinhex** has only **xintkernel** as dependency.

 - Macros of **xintbinhex** have been improved for speed and increased maximal
   sizes of allowable inputs.
 

`1.2m (2017/07/31)`
----

### Breaking changes

 - **xintbinhex**: the length of the input is now limited. The maximum
   size depends on the macro and ranges from about `4000` to about
   `19900` digits.

 - **xintbinhex**: `\xintCHexToBin` is now the variant of
   `\xintHexToBin` which does not remove leading binary zeroes: `N`
   hex-digits give on output exactly `4N` binary digits.

### Improvements and new features

 - **xintbinhex**: all macros have been rewritten using techniques from
   the 1.2 release (they had remained unmodified since `1.08` of
   `2013/06/07`.) The new macros are faster but limited to a few
   thousand digits. The `1.08` routines could handle tens of thousands
   of digits, but not in a reasonable time.

### Bug fixes

 - user manual: the `Changes` section wrongly stated at `1.2l` that the
   macros of **xintbinhex** had been made robust against non terminated
   input such as ``\number\mathcode`\-``. Unfortunately the author fell
   into the trap of believing his own documentation and he forgot to
   actually implement the change. Now done.

 - user manual: the PDF bookmarks were messed up.

 - **xint**, **xintfrac**: `\xintGeq`, `\xintMax`, `\xintMin`, suffered
   from some extra overhead. This was caused by use of some auxiliaries
   from the very early days which got redefined at some stage. This is
   fixed here with some additional efficiency improvements and pruning
   of old code.
   

`1.2l (2017/07/26)`
----

### Removed

 - `\xintiiSumExpr`, `\xintiiPrdExpr` (**xint**) and `\xintSumExpr`,
   `\xintPrdExpr` (**xintfrac**). They had not been formally deprecated,
   but had been left un-documented since `1.09d (2013/10/22)`.

 - internal macro `\xint_gob_til_xint_relax` removed.

### Improvements and new features

 - the underscore character `_` is accepted by the **xintexpr** parsers
   as a digit separator (the space character already could be used for
   improved readability of big numbers). It is not allowed as *first*
   character of a number, as it would then be mis-interpreted as the
   start of a possible variable name.

 - some refactoring in **xintcore** auxiliary routines and in
   `\xintiiSub` and `\xintiiCmp` for some small efficiency gains.

 - code comments in **xintcore** are better formatted, but remain
   sparse.

 - **xintcore**, **xint**, **xintfrac**, ... : some macros were not
   robust against arguments whose expansion looks forward for some
   termination (e.g. ``\number\mathcode`\-``), and particularly, most
   were fragile against inputs using non-terminated ``\numexpr`` (such
   as `\xintiiAdd{\the\numexpr1}{2}` or `\xintRaw{\numexpr1}`). This was
   not a bug per se, as the user manual did not claim such inputs were
   legal, but it was slightly inconvenient. Most macros (particularly
   those of **xintfrac**) have now been made robust against such inputs.
   Some macros from **xintcore** primarily destined to internal usage
   still accept only properly terminated arguments such as
   ``\the\mathcode`\-<space>`` or ``\the\numexpr1\relax``.

     The situation with expressions is unchanged: syntax such as
   `\xintexpr \numexpr1+2\relax` is illegal as the ending `\relax` token
   will get swallowed by the `\numexpr`; but it is needed by the
   ``xintexpr``-ession parser, hence the parser will expand forward and
   presumably end with in an "illegal token" error, or provoke some
   low-level TeX error (N.B.: a closing brace `}` for example can not
   terminate an ``xintexpr``-ession, the parser must find a `\relax`
   token at some point). Thus there must be in this example a second
   `\relax`.

 - experimental code for error conditions; there is no complete user
   interface yet, it is done in preparation for next major release and
   is completely unstable and undocumented.
 
### Bug fixes

 - **xintbinhex**: since `1.2 (2015/10/10)`, `\xintHexToDec` was
   broken due to an undefined macro (it was in `xint.sty`, but the
   module by itself is supposedly dependent only upon `xintcore.sty`).

 - **xintgcd**: macro `\xintBezout` produced partially wrong output if
   one of its two arguments was zero.

 - **xintfrac**: the manual said one could use directly `\numexpr`
   compatible expressions in arithmetic macros (without even a
   `\numexpr` encapsulation) if they were expressed with up to 8 tokens.
   There was a bug if these 8 tokens evaluated to zero. The bug has been
   fixed, and up to 9 tokens are now accepted. But it is simpler to use
   `\the\numexpr` prefix and not to worry about the token count... The
   ending `\relax` is now un-needed.


`1.2k (2017/01/06)`
----

### Breaking changes

 - macro `\xintFloat` which rounds its input to a floating point number
   does _not_ print anymore `10.0...0eN` to signal an upwards rounding
   to the next power of ten. The mantissa has in all cases except the
   zero input exactly one digit before the decimal mark.

 - some floating point computations may differ in the least significant
   digits, due to a change in the rounding algorithm applied to macro
   arguments expressed as fractions and to an improvement in precision
   regarding half-integer powers in expressions. See next.

### Improvements and new features

 - the initial rounding to the target precision `P` which is applied by
   the floating point macros from **xintfrac** to their arguments
   achieves the _exact (aka correct) rounding_ even for inputs which are
   fractions with more than `P+2` digits in their numerators and
   denominators (`>1`.) Hence the computed values depend only on the
   arguments as rational numbers and not upon their representatives.
   This is not relevant to _expressions_ (**xintexpr**), because the
   `\xintfloatexpr` parser sees there `/` as an operator and does not
   (apart from special constructs) get to manipulate fractions as such.

 - `\xintnewdummy` is public interface to a `1.2e` macro which serves to
   declare any given catcode 11 character as a dummy variable for
   expressions (**xintexpr**). This is useful for Unicode engines (the
   Latin letters being already all pre-declared as dummy variables.)

 - added `\xintiSqrtR`, there was only `\xintiiSqrtR` alongside
   `\xintiSqrt` and `\xintiiSqrt` (**xint**).

 - added non public `\xintLastItem:f:csv` to **xinttools** for faster
   `last()` function, and improved `\xintNewExpr` compatibility. Also
   `\xintFirstItem:f:csv`.

### Bug fixes

 - the `1.2f` half-integer powers computed within `\xintfloatexpr` had a
   silly rounding to the target precision just _before_ the final
   square-root extraction, thus possibly losing some precision. The
   `1.2k` implementation keeps guard digits for this final square root
   extraction. As for integer exponents, it is guaranteed that the
   computed value differs from the exact one by less than `0.52 ulp`
   (for inputs having at most `\xinttheDigits` digits.)
   
 - more regressions from `1.2i` were fixed: `\xintLen` (**xint**,
   **xintfrac**) and `\xintDouble` (**xintcore**) had forgotten that
   their argument was allowed to be negative. A regression test suite is
   now in place and is being slowly expanded to cover more macros.

 - `\xintiiSquareRoot{0}` now produces `{1}{1}`, which fits better the
   general documented behaviour of this macro than `11`.


`1.2j (2016/12/22)`
----

### Improvements and new features

 - **xinttools** and **xintexpr**:

    1. slightly improves the speed of `\xintTrim`.

    2. speed gains for the handlers of comma separated lists
       implementing Python-like slicing and item extraction. Relevant
       non (user) documented macros better documented in
       `sourcexint.pdf`.

 - significant documentations tweaks (inclusive of suppressing things!),
   and among them two beautiful hyperlinked tables with both horizontal
   and vertical rules which bring the documentation of the **xintexpr**
   syntax to a kind of awe-inspiring perfection... except that
   implementation of some math functions is still lacking.
   
### Bug fixes

 - fix two `1.2i` regressions caused by undefined macros (`\xintNthElt`
   in certain branches and `[list][N]` item extraction in certain
   cases.) The test files existed but were not executed prior to
   release. Automation in progress.


`1.2i (2016/12/13)`
----

### Breaking changes

 - `\xintDecSplit` second argument must have no sign (former code
   replaced it with its absolute value, a sign now may cause an error.)

### Removed

 - deprecated macros `\xintifTrue`, `\xintifTrueFalse`, `\xintQuo`,
   `\xintRem`, `\xintquo`, `\xintrem`.

### Improvements and new features

 - **xintkernel**: `\xintLength` is faster. New macros:

    - `\xintLastItem` to fetch the last item from its argument,

    - `\romannumeral\xintgobble` for gobbling many (up to 531440)
      upstream braced items or tokens.

    - `\romannumeral\xintreplicate` which is copied over from the expl3
      `\prg_replicate:nn` with some minor changes.

 - **xinttools**: general token list handling routines `\xintKeep`,
   `\xintTrim` and `\xintNthElt` are faster; but the novel `\xintTrim`
   can only remove up to a maximum of 531440 items.


     Also, `\xintFor` partially improves on some issues which are
   reported upon in the documentation.

 - some old macros have been rewritten entirely or partially using
   techniques which **xint** started using in release `1.2`:

    - **xintcore**: `\xintDouble`, `\xintHalf`, `\xintInc`, `\xintDec`,
      `\xintiiLDg`, `\xintDSR` (originally from **xint**), a novel
      `\xintDSRr`.

    - **xint**: `\xintDSH`, `\xintDSx`, `\xintDecSplit`, `\xintiiE`.

    - **xintfrac**: as a result of the above `\xintTrunc`, `\xintRound`
      and `\xintXTrunc` got faster. But the main improvement for them is
      with decimal inputs which formerly had not been treated separately
      from the general fraction case. Also, `\xintXTrunc` does not
      anymore create a dependency of **xintfrac** on **xinttools**.

 - the documentation has again been (slightly) re-organized; it has a
   new sub-section on the Miller-Rabin primality test, to illustrate
   some use of `\xintNewFunction` for recursive definitions.

 - the documentation has dropped the LaTeX "command" terminology (which
   had been used initially in 2013 for some forgotten reasons and should
   have been removed long ago) and uses only the more apt "macro", as
   after all, all of **xint** is about expansion of macros (plus the use
   of `\numexpr`).

### Bug fixes

 - `\xintDecSplitL` and `\xintDecSplitR` from **xint** produced their
   output in a spurious brace pair (bug introduced in `1.2f`).


`1.2h (2016/11/20)`
----

### Improvements and new features

 - new macro `\xintNewFunction` in **xintexpr** which allows to extend
   the parser syntax with functions in situations where `\xintdeffunc`
   is not usable (typically, because dummy variables are used over a not
   yet determined range of values because it depends on the variables).

 - after three years of strict obedience to `xint` prefix, now
   `\thexintexpr`, `\thexintiexpr`, `\thexintfloatexpr`, and
   `\thexintiiexpr` are provided as synonyms to `\xinttheexpr`, etc...

### Bug fixes

 - the `(cond)?{foo}{bar}` operator from **xintexpr** mis-behaved in
   certain circumstances (such as an empty `foo`).

 - the **xintexpr** `1.2f` `binomial` function (which uses
   `\xintiiBinomial` from **xint.sty** or `\xintFloatBinomial` from
   **xintfrac.sty**) deliberately raised an error for `binomial(x,y)`
   with `y<0` or `x<y`. This was unfortunate, and it now simply
   evaluates to zero in such cases.

 - similarly the `pfactorial` function was very strict and
   `pfactorial(x,y)` deliberately raised an out-of-range error if not
   used with non-negative integers with `x` less than `y`. It now avoids
   doing that and allows negative arguments.

 - the `add` and `mul` from **xintexpr**, which work with dummy
   variables since `1.1`, raised an error since `1.2c 2015/11/16` when
   the dummy variable was given an empty range (or list) of values,
   rather than producing respectively `0` and `1` as formerly.


`1.2g (2016/03/19)`
----

### Breaking changes

 - inside expressions, list item selector `[L][n]` counts starting at
   zero, not at one. This is more coherent with `[L][a:b]` which was
   already exactly like in Python since its introduction. A function
   len(L) replaces earlier `[L][0]`.

 - former `iter` keyword now called `iterr`. Indeed it matched with
   `rrseq`, the new `iter` (which was somehow missing from `1.1`) is the
   one matching `rseq`. Allows to iterate more easily with a "list"
   variable.

### Improvements and new features

 - in **xintexpr.sty**: list selectors `[L][n]` and `[L][a:b]` are more
   efficient: the earlier `1.1` routines did back and forth conversions
   from comma separated values to braced tokens, the `1.2g` routines use
   macros from **xinttools.sty** handling directly the encountered lists
   of comma separated values.

 - in **xinttools.sty**: slight improvements in the efficiency of the
   `\xintNthElt`, `\xintKeep`, `\xintTrim` routines and new routines
   handling directly comma separated values. The latter are not included
   in the user manual (they are not `\long`, they don't make efforts to
   preserve some braces, do not worry about spaces, all those worries
   being irrelevant to the use in expressions for list selectors).

 - a slight speed improvement to `\xintFloatSqrt` in its quest of
   correct rounding.

 - float multiplication and division handle more swiftly operands
   (non-fractional) with few digits, when the float precision is large.

 - the syntax of expressions is described in a devoted chapter of the
   documentation; an example shows how to implement (expandably) the
   Brent-Salamin algorithm for computation of Pi using `iter` in a float
   expression.


`1.2f (2016/03/12)`
----

### Breaking changes

 - no more `\xintFac` macro but `\xintiFac/\xintiiFac/\xintFloatFac`.

### Improvements and new features

 - functions `binomial`, `pfactorial` and `factorial` in both integer
   and float versions.

 - macros `\xintiiBinomial`, `\xintiiPFactorial`
   (**xint.sty**) and `\xintFloatBinomial`, `\xintFloatPFactorial`
   (**xintfrac.sty**). Improvements to `\xintFloatFac`.

 - faster implementation and increased accuracy of float power macros.
   Half-integer exponents are now accepted inside float expressions.

 - faster implementation of both integral and float square root macros.

 - the float square root achieves
   *correct* (aka *exact*) rounding in arbitrary precision.

 - modified behaviour for the `\xintPFloat` macro, used by
   `\xintthefloatexpr` to prettify its output. It now opts for decimal
   notation if and only if scientific notation would use an exponent between
   `-5` and `5` inclusive. The zero value is printed `0.` with a dot.

 - the float macros for addition, subtraction, multiplication, division now
   first round their two operands to P, not P+2, significant places before
   doing the actual computation (P being the target precision). The same
   applies to the power macros and to the square root macro.

 - the documentation offers a more precise (and accurate) discussion of
   floating point issues.

 - various under-the-hood code improvements; the floatexpr operations are
   chained in a faster way, from skipping some unneeded parsing on results of
   earlier computations. The absence of a real inner data structure for floats
   (incorporating their precisions, for one) is however still a bit hair
   raising: currently the lengths of the mantissas of the operands are computed
   again by each float macro or expression operation.

 - (TeXperts only) the macros defined (internally) from `\xintdeffunc` et al.
   constructs do not incorporate an initial `\romannumeral` anymore.

 - renewed desperate efforts at improving the documentation by random
   shuffling of sections and well thought additions; cuts were considered and
   even performed.

### Bug fixes

 - squaring macro `\xintSqr` from **xintfrac.sty** was broken due to a
   misspelled sub-macro name. Dates back to `1.1` release of `2014/10/28`
   `:-((`.

 - `1.2c`'s fix to the subtraction bug from `1.2` introduced another bug,
   which in some cases could create leading zeroes in the output, or even
   worse. This could invalidate other routines using subtractions, like
   `\xintiiSquareRoot`.

 - the comparison operators were not recognized by `\xintNewIIExpr` and
   `\xintdefiifunc` constructs.


`1.2e (2015/11/22)`
----

### Improvements and new features

 - macro `\xintunassignvar`.

 - slight modifications of the logged messages in case of `\xintverbosetrue`.

 - a space in  `\xintdeffunc f(x)<space>:= expression ;` is now accepted.

 - documentation enhancements: the _Quick Sort_ section with its included
   code samples has been entirely re-written;  the _Commands of the xintexpr
   package_ section has been extended and reviewed entirely.

### Bug fixes

 - in **xintfrac**: the `\xintFloatFac` from release `1.2` parsed its
   argument only through `\numexpr` but it should have used `\xintNum`.

 - in **xintexpr**: release `1.2d` had broken the recognition of
   sub-expressions immediately after variable names (with tacit
   multiplication).

 - in **xintexpr**: contrarily to what `1.2d` documentation said, tacit
   multiplication was not yet always done with enhanced precedence. Now
   yes.


`1.2d (2015/11/18)`
----

### Improvements and new features

 - the function definitions done by `\xintdeffunc` et al., as well as
   the macro declarations by `\xintNewExpr` et al. now have only local
   scope.

 - tacit multiplication applies to more cases, for example (x+y)z, and
   always ties more than standard * infix operator, e.g. x/2y is like
   x/(2*y).

 - some documentation enhancements, particularly in the chapter on
   xintexpr.sty, and also in the code source comments.

### Bug fixes

 - in **xintcore**: release `1.2c` had inadvertently broken the
   `\xintiiDivRound` macro.


`1.2c (2015/11/16)`
----

### Improvements and new features

 - macros `\xintdeffunc`, `\xintdefiifunc`, `\xintdeffloatfunc` and
   boolean `\ifxintverbose`.

 - on-going code improvements and documentation enhancements, but
   stopped in order to issue this bugfix release.

### Bug fixes

 - in **xintcore**: recent release `1.2` introduced a bug in the
   subtraction (happened when 00000001 was found under certain
   circumstances at certain mod 8 locations).


`1.2b (2015/10/29)`
----

### Bug fixes

 - in **xintcore**: recent release `1.2` introduced a bug in the division
   macros, causing a crash when the divisor started with 99999999 (it was
   attempted to use with 1+99999999 a subroutine expecting only 8-digits
   numbers).

`1.2a (2015/10/19)`
----

### Improvements and new features

 - added `\xintKeepUnbraced`, `\xintTrimUnbraced` (**xinttools**) and fixed
   documentation of `\xintKeep` and `\xintTrim` regarding brace stripping.

 - added `\xintiiMaxof/\xintiiMinof` (**xint**).

 - TeX hackers only: replaced all code uses of ``\romannumeral-`0``
   by the quicker ``\romannumeral`&&@`` (`^` being used as letter,
   had to find another character usable with catcode 7).

### Bug fixes

 - in **xintexpr**: recent release `1.2` introduced a bad bug in the
   parsing of decimal numbers and as a result `\xinttheexpr 0.01\relax`
   expanded to `0` ! (sigh...)


`1.2 (2015/10/10)`
----

### Removed

 - the macros `\xintAdd`, `\xintSub`, `\xintMul`, `\xintMax`,
   `\xintMin`, `\xintMaxof`, `\xintMinof` are removed from package
   **xint**, and only exist in the versions from **xintfrac**. With only
   **xintcore** or **xint** loaded, one _must_ use `\xintiiAdd`,
   `\xintiiSub`, ..., or `\xintiAdd`, `\xintiSub`, etc...

### Improvements and new features

 - the basic arithmetic implemented in **xintcore** has been entirely
   rewritten. The mathematics remains the elementary school one, but the
   `TeX` implementation achieves higher speed (except, regarding
   addition/subtraction, for numbers up to about thirty digits), the
   gains becoming quite significant for numbers with hundreds of digits.

 - the inputs must have less than 19959 digits. But computations with
   thousands of digits take time.

 - a previously standing limitation of `\xintexpr`, `\xintiiexpr`, and
   of `\xintfloatexpr` to numbers of less than 5000 digits has been
   lifted.

 - a *qint* function is provided to help the parser gather huge integers
   in one-go, as an exception to its normal mode of operation which
   expands token by token.

 - `\xintFloatFac` macro for computing the factorials of integers as
   floating point numbers to a given precision. The `!` postfix operator
   inside `\xintfloatexpr` maps to this new macro rather than to the
   exact factorial as used by `\xintexpr` and `\xintiiexpr`.

 - there is more flexibility in the parsing done by the macros from
   **xintfrac** on fractional input: the decimal parts of both the
   numerator and the denominator may arise from a separate expansion via
   ``\romannumeral-`0``. Also the strict `A/B[N]` format is a bit
   relaxed: `N` may be anything understood by `\numexpr` (it could even
   be empty but that possibility has been removed by later `1.2f`
   release.)

 - on the other hand an isolated dot `.` is not legal syntax anymore
   inside the expression parsers: there must be digits either before or
   after. It remains legal input for the macros of **xintfrac**.

 - added `\ht`, `\dp`, `\wd`, `\fontcharht`, etc... to the tokens
   recognized by the parsers and expanded by `\number`.

 - an obscure bug in package **xintkernel** has been fixed, regarding
   the sanitization of catcodes: under certain circumstances (which
   could not occur in a normal `LaTeX` context), unusual catcodes could
   end up being propagated to the external world.

 - an effort at randomly shuffling around various pieces of the
   documentation has been done.


`1.1c (2015/09/12)`
----

 - bugfix regarding macro `\xintAssign` from **xinttools** which did
   not behave correctly in some circumstances (if there was a space
   before `\to`, in particular).

 - very minor code improvements, and correction of some issues
   regarding the source code formatting in `sourcexint.pdf`, and
   minor issues in `Makefile.mk`.


`1.1b (2015/08/31)`
----

 - bugfix: some macros needed by the integer division routine from
   **xintcore** had been left in **xint.sty** since release `1.1`. This
   for example broke the `\xintGCD` from **xintgcd** if package **xint**
   was not loaded.

 - Slight enhancements to the documentation, particularly in the
   `Read this first` section.


`1.1a (2014/11/07)`
----

 - fixed a bug which prevented `\xintNewExpr` from producing correctly working
   macros from a comma separated replacement text.

 - `\xintiiSqrtR` for rounded integer square root; former `\xintiiSqrt`
   already produced truncated integer square root; corresponding function
   `sqrtr` added to `\xintiiexpr..\relax` syntax.

 - use of straight quotes in the documentation for better legibility.

 - added `\xintiiIsOne`, `\xintiiifOne`, `\xintiiifCmp`, `\xintiiifEq`,
    `\xintiiifGt`, `\xintiiifLt`, `\xintiiifOdd`, `\xintiiCmp`, `\xintiiEq`,
    `\xintiiGt`, `\xintiiLt`, `\xintiiLtorEq`, `\xintiiGtorEq`, `\xintiiNeq`,
    mainly for efficiency of `\xintiiexpr`.

 - for the same reason, added `\xintiiGCD` and `\xintiiLCM`.

 - added the previously mentioned `ii` macros, and some others from `1.1`, to
   the user manual. But their main usage is internal to `\xintiiexpr`, to skip
   unnecessary overheads.

 - various typographical fixes throughout the documentation, and a bit
   of clean up of the code comments. Improved `\Factors` example of nested
   `subs`, `rseq`, `iter` in `\xintiiexpr`.


`1.1 (2014/10/28)`
----

### Breaking changes

 - in `\xintiiexpr`, `/` does _rounded_ division, rather than the
   Euclidean division (for positive arguments, this is truncated division).
   The `//` operator does truncated division,

 - the `:` operator for three-way branching is gone, replaced with `??`,

 - `1e(3+5)` is now illegal. The number parser identifies `e` and `E`
   in the same way it does for the decimal mark, earlier versions treated
   `e` as `E` rather as infix operators of highest precedence,

 - the `add` and `mul` have a new syntax, old syntax is with `` `+` `` and
   `` `*` `` (left quotes mandatory), `sum` and `prd` are gone,

 - no more special treatment for encountered brace pairs `{..}` by the
   number scanner, `a/b[N]` notation can be used without use of braces (the
   `N` will end up as is in a `\numexpr`, it is not parsed by the
   `\xintexpr`-ession scanner),

 - in earlier releases, place holders for `\xintNewExpr` could either
   be denoted `#1`, `#2`, ... or also `$1`, `$2`, ...
   Only the usual `#` form is now accepted and the special cases previously
   treated via the second form are now managed via a `protect(...)` function.

 - **xintfrac**: `\xintFloor` and `\xintCeil` add a trailing `/1[0]` to their
   (integer) output. New `\xintiFloor` and `\xintiCeil` do not.

### Removed

 - `\xintnumexpr`, `\xintthenumexpr`, `\xintNewNumExpr`: use
   `\xintiexpr`, `\xinttheiexpr`, `\xintNewIExpr`.

### Deprecated

 - `\xintDivision`, `\xintQuo`, `\xintRem`: use `\xintiDivision`,
   `\xintiQuo`, `\xintiRem`.

 - `\xintMax`, `\xintMin`, `\xintAdd`, `\xintSub`, `\xintMul`
   (**xint**): their usage without **xintfrac** is deprecated; use
   `\xintiMax`, `\xintiMin`, `\xintiAdd`, `\xintiSub`, `\xintiMul`.

 - the `&` and `|` as Boolean operators in `xintexpr`-essions are
   deprecated in favour of `&&` and `||`. The single letter operators
   might be assigned some other meaning in some later release (bitwise
   operations, perhaps). Do not use them.

### Improvements and new features

  * new package **xintcore** has been split off **xint**. It contains the
      core arithmetic macros (it is loaded by LaTeX package **bnumexpr**),

  * neither **xint** nor **xintfrac** load **xinttools**. Only
      **xintexpr** does,

  * whenever some portion of code has been revised, often use has been made of
      the `\xint_dothis` and `\xint_orthat` pair of macros for expandably
      branching,

  * these tiny helpful macros, and a few others are in package
      **xintkernel** which contains also the catcode and loading order
      management code, initially inspired by code found in Heiko Oberdiek's
      packages,

  * the source code, which was suppressed from `xint.pdf` in release
      `1.09n`, is now compiled into a separate file `sourcexint.pdf`,

  * faster handling by `\xintAdd`, `\xintSub`, `\xintMul`, ... of the case
      where one of the arguments is zero,

  * the `\xintAdd` and `\xintSub` macros from package **xintfrac** check if
      one of the denominators is a multiple of the other, and only if this is
      not the case do they multiply the denominators. But systematic reduction
      would be too costly,

  * this naturally will be also the case for the `+` and `-` operations
      in `\xintexpr`,

  * **xint** added `\xintiiDivRound`, `\xintiiDivTrunc`, `\xintiiMod`
    for rounded and truncated division of big integers (next to
    `\xintiiQuo` and `\xintiiRem`),

  * with **xintfrac** loaded, the `\xintNum` macro does `\xintTTrunc`
      (which is truncation to an integer, same as `\xintiTrunc {0}`),

  * added `\xintMod` to **xintfrac** for modulo operation with
      fractional numbers,

  * added `\xintiFloor` and `\xintiCeil` to **xintfrac**,

  * `\xintiexpr`, `\xinttheiexpr` admit an optional argument within brackets
      `[d]`, they round the computation result (or results, if comma separated)
      to `d` digits after decimal mark, (the whole computation is done exactly,
      as in `xintexpr`),

  * `\xintfloatexpr`, `\xintthefloatexpr` similarly admit an optional
      argument which serves to keep only `d` digits of precision, getting rid
      of cumulated uncertainties in the last digits (the whole computation is
      done according to the precision set via `\xintDigits`),

  * `\xinttheexpr` and `\xintthefloatexpr` _pretty-print_ if possible, the
      former removing unit denominator or `[0]` brackets, the latter avoiding
      scientific notation if decimal notation is practical,

  * the `//` does truncated division and `/:` is the associated modulo,

  * multi-character operators `&&`, `||`, `==`, `<=`, `>=`, `!=`,
      `**`,

  * multi-letter infix binary words `'and'`, `'or'`, `'xor'`, `'mod'`
      (straight quotes mandatory),

  * functions `even`, `odd`,

  * `\xintdefvar A3:=3.1415;` for variable definitions (non expandable,
    naturally), usable in subsequent expressions; variable names may contain
    letters, digits, underscores. They should not start with a digit, the `@`
    is reserved, and single lowercase and uppercase Latin letters are
    predefined to work as dummy variables (see next),

  * generation of comma separated lists `a..b`, `a..[d]..b`,

  * Python syntax-like list extractors `[list][n:]`, `[list][:n]`,
    `[list][a:b]` allowing negative indices, but no optional step argument,
    and `[list][n]` (`n=0` for the number of items in the list),

  * functions `first`, `last`, `reversed`,

  * itemwise operations on comma separated lists `a*[list]`, etc.., possible
    on both sides `a*[list]^b`, and obeying the same precedence rules as with
    numbers,

  * `add` and `mul` must use a dummy variable: `add(x(x+1)(x-1), x=-10..10)`,

  * variable substitutions with `subs`:
    `subs(subs(add(x^2+y^2,x=1..y),y=t),t=20)`,

  * sequence generation using `seq` with a dummy variable: `seq(x^3,
    x=-10..10)`,

  * simple recursive lists with `rseq`, with `@` given the last value,
     `rseq(1;2@+1,i=1..10)`,

  * higher recursion with `rrseq`, `@1`, `@2`, `@3`, `@4`, and `@@(n)`
     for earlier values, up to `n=K` where `K` is the number of terms of the
     initial stretch `rrseq(0,1;@1+@2,i=2..100)`,

  * iteration with `iter` which is like `rrseq` but outputs only the
     last `K` terms, where `K` was the number of initial terms,

  * inside `seq`, `rseq`, `rrseq`, `iter`, possibility to use `omit`,
     `abort` and `break` to control termination,

  * `n++` potentially infinite index generation for `seq`, `rseq`,
     `rrseq`, and `iter`, it is advised to use `abort` or `break(..)` at
     some point,

  * the `add`, `mul`, `seq`, ... are nestable,

  * `\xintthecoords` converts a comma separated list of an even number
     of items to the format expected by the `TikZ` `coordinates` syntax,

  * completely new version `\xintNewExpr`, `protect` function to handle
     external macros. The dollar sign
     `$` for place holders is not accepted anymore, only the standard macro
     parameter `#`. Not all constructs are compatible with `\xintNewExpr`.
% $ this docstripped line for emacs buffer fontification issues in doctex-mode

### Bug fixes

  - `\xintZapFirstSpaces` hence also `\xintZapSpaces` from package **xinttools**
      were buggy when used with  an argument either empty or containing only
      space tokens.

  - `\xintiiexpr` did not strip leading zeroes, hence
    `\xinttheiiexpr 001+1\relax` did not obtain the expected result ...

  - `\xinttheexpr \xintiexpr 1.23\relax\relax` should have produced `1`,
  but it produced `1.23`

  - the catcode of `;` was not set at package launching time.

  - the `\XINTinFloatPrd:csv` macro name had a typo, hence `prd` was
    non-functional in `\xintfloatexpr`.


`1.09n (2014/04/01)`
----

  * the user manual does not include by default the source code
    anymore: the `\NoSourceCode` toggle in file `xint.tex` has to
    be set to 0 before compilation to get source code inclusion
    (later release `1.1` made source code available as `sourcexint.pdf`).

  * bug fix (**xinttools**) in `\XINT_nthelt_finish` (this bug was
    introduced in `1.09i` of `2013/12/18` and showed up when the index
    `N` was larger than the number of elements of the list).


`1.09m (2014/02/26)`
----

  * new in **xinttools**: `\xintKeep` keeps the first `N` or last
    `N` elements of a list (sequence of braced items); `\xintTrim`
    cuts out either the first `N` or the last `N` elements from a
    list.

  * new in **xintcfrac**: `\xintFGtoC` finds the initial partial
    quotients common to two numbers or fractions `f` and `g`;
    `\xintGGCFrac` is a clone of `\xintGCFrac` which however does not
    assume that the coefficients of the generalized continued
    fraction are numeric quantities. Some other minor changes.


`1.09kb (2014/02/13)`
----

  * bug fix (**xintexpr**): an aloof modification done by `1.09i` to
    `\xintNewExpr` had resulted in a spurious trailing space present
    in the outputs of all macros created by `\xintNewExpr`, making
    nesting of such macros impossible.

  * bug fix (**xinttools**): `\xintBreakFor` and `\xintBreakForAndDo`
    were buggy when used in the last iteration of an `\xintFor` loop.

  * bug fix (**xinttools**): `\xintSeq` from `1.09k` needed a `\chardef`
    which was missing from `xinttools.sty`, it was in `xint.sty`.


`1.09k (2014/01/21)`
----

  * inside `\xintexpr..\relax` (and its variants) tacit multiplication is
    implied when a number or operand is followed directly with an
    opening parenthesis,

  * the `"` for denoting (arbitrarily big) hexadecimal numbers is
    recognized by `\xintexpr` and its variants (package
    **xintbinhex** is required); a fractional hexadecimal part
    introduced by a dot `.` is allowed.

  * re-organization of the first sections of the user manual.

  * bug fix (**xinttools**, **xint**, ...): forgotten catcode check of
    `"` at loading time has been added.


`1.09j (2014/01/09)`
----

  * (**xint**) the core division routines have been re-written for some
    (limited) efficiency gain, more pronounced for small divisors. As a
    result the *computation of one thousand digits of $\pi$* is close
    to three times faster than with earlier releases.

  * some various other small improvements, particularly in the power
    routines.

  * (**xintfrac**) a macro `\xintXTrunc` is designed to produce
    thousands or even tens of thousands of digits of the decimal
    expansion of a fraction. Although completely expandable it has its
    use limited to inside an `\edef`, `\write`, `\message`, \dots. It
    can thus not be nested as argument to another package macro.

  * (**xintexpr**) the tacit multiplication done in `\xintexpr..\relax`
    on encountering a count register or variable, or a `\numexpr`,
    while scanning a (decimal) number, is extended to the case of a sub
    `\xintexpr`-ession.

  * `\xintexpr` can now be used in an `\edef` with no `\xintthe` prefix;
    it will execute completely the computation, and the error message
    about a missing `\xintthe` will be inhibited. Previously, in the
    absence of `\xintthe`, expansion could only be a full one (with
    ``\romannumeral-`0``), not a complete one (with `\edef`). Note
    that this differs from the behavior of the non-expandable
    `\numexpr`: `\the` or `\number` (or `\romannumeral`) are needed
    not only to print but
    also to trigger the computation, whereas `\xintthe` is mandatory
    only for the printing step.

  * the default behavior of `\xintAssign` is changed, it now does not
    do any further expansion beyond the initial full-expansion which
    provided the list of items to be assigned to macros.

  * bug fix (**xintfrac**): `1.09i` did an unexplainable change to
    `\XINT_infloat_zero` which broke the floating point routines for
    vanishing operands =:(((

  * bug fix: the `1.09i` `xint.ins` file produced a buggy `xint.tex` file.


`1.09i (2013/12/18)`
----

  * (**xintexpr**) `\xintiiexpr` is a variant of `\xintexpr` which is
    optimized to deal only with (long) integers, `/` does a euclidean
    quotient.

  * *deprecated*: `\xintnumexpr`, `\xintthenumexpr`, `\xintNewNumExpr` are
    renamed, respectively, `\xintiexpr`, `\xinttheiexpr`, `\xintNewIExpr`. The
    earlier denominations are kept but are to be removed at some point.

  * it is now possible within `\xintexpr...\relax` and its variants to
    use count, dimen, and skip registers or variables without
    explicit `\the/\number`: the parser inserts automatically
    `\number` and a tacit multiplication is implied when a register
    or variable immediately follows a number or fraction. Regarding
    dimensions and `\number`, see the further discussion in
    *Dimensions*.

  * (**xintfrac**) conditional `\xintifOne`; `\xintifTrueFalse`
    renamed to `\xintifTrueAelseB`; macros `\xintTFrac`
    (`fractional part`, mapped to function `frac` in
    `\xintexpr`-essions), `\xintFloatE`.

  * (**xinttools**) `\xintAssign` admits an optional argument to
    specify the expansion type to be used: `[]` (none, default), `[o]`
    (once), `[oo]` (twice), `[f]` (full), `[e]` (`\edef`),... to define
    the macros

  * **xinttools** defines `\odef`, `\oodef`, `\fdef` (if the names have
    already been assigned, it uses `\xintoodef` etc...). These tools are
    provided for the case one uses the package macros in a non-expandable
    context. `\oodef` expands twice the macro replacement text, and `\fdef`
    applies full expansion. They are useful in situations where one does not
    want a full `\edef`. `\fdef` appears to be faster than `\oodef` in almost
    all cases (with less than thousand digits in the result), and even faster
    than `\edef` for expanding the package macros when the result has a few
    dozens of digits. `\oodef` needs that expansion ends up in thousands of
    digits to become competitive with the other two.

  * some across the board slight efficiency improvement as a result of
    modifications of various types to *fork macros* and *branching
    conditionals* which are used internally.

  * bug fix (**xint**): `\xintAND` and `\xintOR` inserted a space token
    in some cases and did not expand as promised in two steps `:-((`
    (bug dating back to `1.09a` I think; this bug was without
    consequences when using `&` and `|` in `\xintexpr-essions`, it
    affected only the macro form).

  * bug fix (**xintcfrac**): `\xintFtoCCv` still ended fractions with
    the `[0]`'s which were supposed to have been removed since release
    `1.09b`.

  * *deprecated*: `\xintifTrueFalse`, `\xintifTrue`; use `\xintifTrueAelseB`.


`1.09h (2013/11/28)`
----

  * parts of the documentation have been re-written or re-organized,
    particularly the discussion of expansion issues and of input and
    output formats.

  * the expansion types of macro arguments are documented in the margin
    of the macro descriptions, with conventions mainly taken over
    from those in the `LaTeX3` documentation.

  * a dependency of **xinttools** on **xint** (inside `\xintSeq`) has
    been removed.

  * (**xintgcd**) `\xintTypesetEuclideAlgorithm` and
    `\xintTypesetBezoutAlgorithm` have been slightly modified
    (regarding indentation).

  * (**xint**) macros `xintiSum` and `xintiPrd` are renamed to
    `\xintiiSum` and `\xintiiPrd`.

  * (**xinttools**) a count register used in `1.09g` in the `\xintFor`
    loops for parsing purposes has been removed and replaced by use of
    a `\numexpr`.

  * the few uses of `\loop` have been replaced by `\xintloop/\xintiloop`.

  * all macros of **xinttools** for which it makes sense are now declared
    `\long`.


`1.09g (2013/11/22)`
----

  * a package **xinttools** is detached from **xint**, to make tools such
    as `\xintFor`, `\xintApplyUnbraced`, and `\xintiloop` available
    without the **xint** overhead.

  * expandable nestable loops `\xintloop` and `\xintiloop`.

  * bugfix: `\xintFor` and `\xintFor*` do not modify anymore the value of
    `\count 255`.


`1.09f (2013/11/04)`
----

  * (**xint**) `\xintZapFirstSpaces`, `\xintZapLastSpaces`,
    `\xintZapSpaces`, `\xintZapSpacesB`, for expandably stripping away
    leading and/or ending spaces.

  * `\xintCSVtoList` by default uses `\xintZapSpacesB` to strip away
    spaces around commas (or at the start and end of the comma
    separated list).

  * also the `\xintFor` loop will strip out all spaces around commas and
    at the start and the end of its list argument; and similarly for
    `\xintForpair`, `\xintForthree`, `\xintForfour`.

  * `\xintFor` *et al.* accept all macro parameters from `#1` to
    `#9`.

  * for reasons of inner coherence some macros previously with one extra
    `i` in their names (e.g. `\xintiMON`) now have a doubled
    `ii` (`\xintiiMON`) to indicate that they skip the overhead of
    parsing their inputs via `\xintNum`. Macros with a *single*
    `i` such as `\xintiAdd` are those which maintain the
    non-**xintfrac** output format for big integers, but do parse
    their inputs via `\xintNum` (since release `1.09a`). They too may
    have doubled-`i` variants for matters of programming optimization
    when working only with (big) integers and not fractions or
    decimal numbers.


`1.09e (2013/10/29)`
----

  * (**xint**) `\xintintegers`, `\xintdimensions`, `\xintrationals`
    for infinite `\xintFor` loops, interrupted with `\xintBreakFor` and
    `\xintBreakForAndDo`.

  * `\xintifForFirst`, `\xintifForLast` for the `\xintFor` and
    `\xintFor*` loops,

  * the `\xintFor` and `xintFor*` loops are now `\long`, the
    replacement text and the items may contain explicit `\par`'s.

  * conditionals `\xintifCmp`, `\xintifInt`, `\xintifOdd`.

  * bug fix (**xint**): the `\xintFor` loop (not `\xintFor*`) did
    not correctly detect an empty list.

  * bug fix (**xint**): `\xintiSqrt {0}` crashed. `:-((`

  * the documentation has been enriched with various additional examples,
    such as the *the quick sort algorithm
    illustrated* or the various ways of *computing prime numbers*.

  * the documentation explains with more details various expansion
    related issues, particularly in relation to conditionals.


`1.09d (2013/10/22)`
----

  * bug fix (**xint**): `\xintFor*` is modified to gracefully
    handle a space token (or more than one) located at the very end of
    its list argument (as the space before `\do` in `\xintFor* #1 in
    {{a}{b}{c}<space>} \do {stuff}`; spaces at other locations were
    already harmless). Furthermore this new version _f-expands_ the
    un-braced list items. After `\def\x{{1}{2}}` and `\def\y{{a}\x
    {b}{c}\x }`, `\y` will appear to `\xintFor*` exactly as if it had
    been defined as `\def\y{{a}{1}{2}{b}{c}{1}{2}}`.

  * same bug fix for `\xintApplyInline`.


`1.09c (2013/10/09)`
----

  * (**xintexpr**) added `bool` and `togl` to the `\xintexpr` syntax;
    also added `\xintboolexpr` and `\xintifboolexpr`.

  * added `\xintNewNumExpr`.

  * the factorial `!` and branching `?`, `:`, operators (in
    `\xintexpr...\relax`) have now less precedence than a function
    name located just before,

  * (**xint**) `\xintFor` is a new type of loop, whose replacement text
    inserts the comma separated values or list items via macro
    parameters, rather than encapsulated in macros; the loops are
    nestable up to four levels (nine levels since `1.09f`) and their
    replacement texts are allowed to close groups as happens with the
    tabulation in alignments,

  * `\xintForpair`, `\xintForthree`, `\xintForfour` are experimental
    variants of `\xintFor`,

  * `\xintApplyInline` has been enhanced in order to be usable for
    generating rows (partially or completely) in an alignment,

  * command `\xintSeq` to generate (expandably) arithmetic sequences
    of (short) integers,

  * again various improvements and changes in the documentation.


`1.09b (2013/10/03)`
----

  * various improvements in the documentation,

  * more economical catcode management and re-loading handling,

  * removal of all those `[0]`'s previously forcefully added at the end
    of fractions by various macros of **xintcfrac**,

  * `\xintNthElt` with a negative index returns from the tail of the
    list,

  * macro `\xintPRaw` to have something like what `\xintFrac` does in
    math mode; i.e. a `\xintRaw` which does not print the denominator
    if it is one.


`1.09a (2013/09/24)`
----

  * (**xintexpr**) `\xintexpr..\relax` and `\xintfloatexpr..\relax`
    admit functions in their syntax, with comma separated values as
    arguments, among them `reduce, sqr, sqrt, abs, sgn, floor, ceil,
    quo, rem, round, trunc, float, gcd, lcm, max, min, sum, prd, add,
    mul, not, all, any, xor`.

  * comparison (`<`, `>`, `=`) and logical (`|`, `&`) operators.

  * the command `\xintthe` which converts `\xintexpr`essions into
    printable format (like `\the` with `\numexpr`) is more efficient,
    for example one can do `\xintthe\x` if `\x` was defined to be an
    `\xintexpr..\relax`:

        \def\x{\xintexpr 3^57\relax}
        \def\y{\xintexpr \x^(-2)\relax}
        \def\z{\xintexpr \y-3^-114\relax}
        \xintthe\z

  * `\xintnumexpr .. \relax` (now renamed `\xintiexpr`) is `\xintexpr
    round( .. ) \relax`.

  * `\xintNewExpr` now works with the standard macro parameter character
    `#`.

  * both regular `\xintexpr`-essions and commands defined by
    `\xintNewExpr` will work with comma separated lists of
    expressions,

  * commands `\xintFloor`, `\xintCeil`, `\xintMaxof`, `\xintMinof`
    (package **xintfrac**), `\xintGCDof`, `\xintLCM`, `\xintLCMof`
    (package **xintgcd**), `\xintifLt`, `\xintifGt`, `\xintifSgn`,
    `\xintANDof`, ...

  * The arithmetic macros from package **xint** now filter their operands
    via `\xintNum` which means that they may use directly count
    registers and `\numexpr`-essions without having to prefix them by
    `\the`. This is thus similar to the situation holding previously
    already when **xintfrac** was loaded.

  * a bug (**xintfrac**) introduced in `1.08b` made `\xintCmp` crash
    when one of its arguments was zero. `:-((`


`1.08b (2013/06/14)`
----

  * (**xintexpr**) Correction of a problem with spaces inside
    `\xintexpr`-essions.

  * (**xintfrac**) Additional improvements to the handling of floating
    point numbers.

  * section *Use of count registers* documenting how count
    registers may be directly used in arguments to the macros of
    **xintfrac**.


`1.08a (2013/06/11)`
----

  * (**xintfrac**) Improved efficiency of the basic conversion from
    exact fractions to floating point numbers, with ensuing speed gains
    especially for the power function macros `\xintFloatPow` and
    `\xintFloatPower`,

  * Better management by `\xintCmp`, `\xintMax`, `\xintMin` and
    `\xintGeq` of inputs having big powers of ten in them.

  * Macros for floating point numbers added to the **xintseries**
    package.


`1.08 (2013/06/07)`
----

  * (**xint** and **xintfrac**) Macros for extraction of square roots,
    for floating point numbers (`\xintFloatSqrt`), and integers
    (`\xintiSqrt`).

  * new package **xintbinhex** providing *conversion routines* to and from
    binary and hexadecimal bases.


`1.07 (2013/05/25)`
----

  * The **xintexpr** package is a new core constituent (which loads
    automatically **xintfrac** and **xint**) and implements the
    expandable expanding parser

        \xintexpr . . . \relax,

    and its variant

        \xintfloatexpr . . . \relax

    allowing on input formulas using the infix operators `+`, `-`, `*`,
    `/`, and `^`, and arbitrary levels of parenthesizing. Within a
    float expression the operations are executed according to the
    current value set by `\xintDigits`. Within an `\xintexpr`-ession the
    binary operators are computed exactly.

    To write the `\xintexpr` parser I benefited from the commented
    source of the `l3fp` parser; the `\xintexpr` parser has its own
    features and peculiarities. *See its documentation*.

  * The floating point precision `D` is set (this is a local assignment
    to a `\mathchar` variable) with `\xintDigits := D;` and queried
    with `\xinttheDigits`. It may be set to anything up to
    `32767`.[^1] The macro incarnations of the binary operations
    admit an optional argument which will replace pointwise `D`; this
    argument may exceed the `32767` bound.

  * The **xintfrac** macros now accept numbers written in scientific
    notation, the `\xintFloat` command serves to output its argument
    with a given number `D` of significant figures. The value of `D`
    is either given as optional argument to `\xintFloat` or set with
    `\xintDigits := D;`. The default value is `16`.

[^1]: but values higher than 100 or 200 will presumably give too slow
evaluations.


`1.06b (2013/05/14)`
----

  * Minor code and documentation improvements. Everywhere in the source
   code, a more modern underscore has replaced the @ sign.


`1.06 (2013/05/07)`
----

  * Some code improvements, particularly for macros of **xint** doing loops.

  * New utilities in **xint** for expandable manipulations of lists:

        \xintNthElt, \xintCSVtoList, \xintRevWithBraces

  * The macros did only a double expansion of their arguments. They now
    fully expand them (using ``\romannumeral-`0``). Furthermore, in the
    case of arguments constrained to obey the TeX bounds they will be
    inserted inside a `\numexpr..\relax`, hence completely expanded, one
    may use count registers, even infix arithmetic operations, etc...


`1.05 (2013/05/01)`
----

Minor changes and additions to **xintfrac** and **xintcfrac**.


`1.04 (2013/04/25)`
----

  * New component **xintcfrac** devoted to continued fractions.

  * **xint**: faster division.

  * **xint**: added expandable macros `\xintListWithSep` and `\xintApply` to
    handle token lists.

  * **xintfrac**: added `\xintRound`.

  * **xintseries** has a new implementation of `\xintPowerSeries` based
    on a Horner scheme, and new macro `\xintRationalSeries`. Both to
    help deal with the *denominator buildup* plague.

  * `tex xint.dtx` extracts style files (no need for a `xint.ins`).

  * Bug fix (**xintfrac**): `\xintIrr {0}` crashed.


`1.03 (2013/04/14)`
----

  * New modules **xintfrac** (expandable operations on fractions) and
    **xintseries** (expandable partial sums with xint package).

  * Slightly improved division and faster multiplication (the best
    ordering of the arguments is chosen automatically).

  * Added illustration of Machin algorithm to the documentation.


`1.0 (2013/03/28)`
----

Initial announcement:

>   The **xint** package implements with expandable TeX macros the basic
    arithmetic operations of addition, subtraction, multiplication
    and division, as applied to arbitrarily long numbers represented
    as chains of digits with an optional minus sign.

>  The **xintgcd** package provides implementations of the Euclidean
    algorithm and of its typesetting.

>  The packages may be used with Plain and with LaTeX.

