# This file: Makefile.mk (generated from xint-calx.dtx)
# "make --file=Makefile.mk help"

# The 1.4p CTAN zip does not include an xint.tds.zip anymore
# But the Makefile recipe is kept here in case of need.
# A copy of README.md is not included in xint-calx.dtx anymore.

# The 1.4n CTAN zip includes an xintchanges.md but no CHANGES.html
# anymore.  The xintchanges.md is not extracted from the dtx but
# kept separate.

# The 1.4n CTAN zip does not ship with a commodity Makefile anymore,
# use -f Makefile.mk as above or rename it to Makefile.
# Also it does not include CHANGES.html.  It can be build via make
# or checked at https://jfbu.github.io/xint/CHANGES.html.

# With 1.4n also, sourcexint.pdf got renamed into xintsource.pdf
# and xint.pdf became what was called xint-all.pdf, i.e. (as was also
# the case originally) it contains both user manual and documented
# source code.  This allows to benefit from hyperlinks between the two,
# which were added already in 2022.

# Starting with xint 1.3c, Latexmk is used for easier compilation of
# sourcexint.pdf as the latter then included indices. These indices
# got removed at 1.3e but usage of Latexmk is maintained for the build.

# Originally tested on Mac OS X Mavericks with GNU Make 3.81,
# TeXLive 2014 and Pandoc 1.13.1.

# Note to myself: I wanted to use .RECIPEPREFIX = > but it is
# supported only with GNU Make 3.82 and later.

# this crazyness is to circumvent a problem with docstrip generation
# of the Makefile; we do not want two empty lines becoming only one
nullstring :=
define newline
$(nullstring)

endef
# will speed-up a little, I think.
newline := $(newline)

define helptext
==== INSTRUCTIONS

It is recommended to work with xint-calx.dtx and Makefile moved to some
otherwise empty temporary repertory.

make help
    Display this help using the more pager.

make helpless
    Display this help using the less pager.

make doc
    Produce all documentation, requires Latexmk and Pandoc.

make all
    Produce all documentation, then creates xint.tds.zip.

make xint.tds.zip
    Same as "make all"

make xintmanual.pdf
    Extract files and produce xintmanual.pdf (user manual),
    using latex and dvipdfmx.  This requires Latexmk.

make xintsource.pdf
    Extract files and produce xintsource.pdf (source code),
    using latex and dvipdfmx.  This requires Latexmk.

make xint-calx.pdf
    Extract files and produce xint-calx.pdf (manual + code),
    using latex and dvipdfmx.  This requires Latexmk.

make CHANGES.html
    This requires Pandoc.

make clean
    Remove auxiliary files and repertories.

make cleanmore
    Remove also PDFs and ZIP archives and a few more.

==== INSTALLING

The following has been tested on a TeXLive installation:

make installhome
    Create xint.tds.zip, and unzip it in <TEXMFHOME>

make installlocal
    Create xint.tds.zip, unzip it in <TEXMFLOCAL>
        and then does texhash <TEXMFLOCAL>

    Depending on access rights "sudo make installlocal"
    might be needed. In case of doubt run first "make doc"
    then "make installlocal". If the latter fails, then
    try "sudo make installlocal".

make uninstallhome
    Remove all xint files and repertories from <TEXMFHOME>

make uninstalllocal
    Remove all xint files and repertories from <TEXMFLOCAL>
        and then does texhash <TEXMFLOCAL>

    Might need "sudo".

endef

# Quelques difficultés à trouver le bon choix de ' ou " et de \#
# et l'utilisation des \ en fins de ligne pour que ça fonctionne.
highlighting-css = '    body {margin: 0; margin-left: 10%; margin-right: 15%; margin-top: 4ex; font-size: 20px; font-family: serif; max-width: 100%; padding: 0;}\
    pre {white-space: pre-wrap;}\
    code {white-space: pre-wrap;}\
    a:link {color: blue;}\
    a:visited {color: green;}\
    a:hover {text-decoration: underline; color: hotpink;}\
    a:active {color: brown;}\
    \#TOC {float: none; position: static; margin: 0 0 2em 0; display: grid; grid-template-columns: repeat(auto-fill, 20ch); grid-auto-flow: row; justify-content: center; gap: 0.5em 1.5em;}\
    @media (max-width: 500px) {\#TOC {grid-template-columns: minmax(0, 20ch);}}\
    \#TOC ul, \#TOC li {display: contents;}\
    \#TOC a {display: block;}\
    \#TOC > ul > li > a {font-weight: bold;}\
    \#TOC ul ul a {padding-left: 1em;}\
    \#TOC ul ul {display: none;}'



.PHONY: help helpless all doc clean cleanmore\
        installhome uninstallhome installlocal uninstalllocal

# for printf with subst and \n, got it from
#     http://stackoverflow.com/a/5887751

# I could do the trick with := here, for \n substitution, but this would add
# tiny overhead to all other operations of make

help:
	@printf '$(subst $(newline),\n,$(helptext))' | more

helpless:
	@printf '$(subst $(newline),\n,$(helptext))' | less

# RM         = rm -f
JF_tmpdir  := $(shell mktemp -d TEMP_XINT_XXX)
TEXMF_local = $(shell kpsewhich -var-value TEXMFLOCAL)
TEXMF_home  = $(shell kpsewhich -var-value TEXMFHOME)
packages = xintkernel.sty xintcore.sty xint.sty xintfrac.sty xintexpr.sty\
           xintgcd.sty xintbinhex.sty xintseries.sty xintcfrac.sty\
           xinttools.sty\
           calxcore.sty calxint.sty calxfp.sty calx.sty\
           calxlog.tex calxlogdata.tex calxtrig.tex calxtrigdata.tex
# Makefile.mk n'est pas mis dans $(extrated) pour éviter des messages
# de make.  Les sty (aussi extraits) sont dans $(packages).
extracted  = xintmanual.tex xintsource.tex xint-calx.tex xint-dates.txt
filesfortex    = $(packages)
filesforsource = xint-calx.dtx
filesfordoc    = xint-calx.pdf README.md xintchanges.md
auxiliaryfiles = xintmanual.dvi xintmanual.aux xintmanual.toc xintmanual.log\
     xintsource.dvi xintsource.aux xintsource.toc xintsource.log\
     xint-calx.dvi xint-calx.aux xint-calx.toc xint-calx.log

all: $(packages) $(extracted) doc xint-calx.tds.zip
	@echo 'make all done.'

$(packages): xint-calx.dtx
	etex xint-calx.dtx

$(extracted): xint-calx.dtx
	etex xint-calx.dtx

doc: xintmanual.pdf xintsource.pdf CHANGES.html
	@echo 'make doc done.'

xintmanual.pdf: xint-calx.dtx xintmanual.tex
	latexmk xintmanual.tex
	dvipdfmx xintmanual.dvi

xintsource.pdf: xint-calx.dtx xintsource.tex
	latexmk xintsource.tex
	dvipdfmx xintsource.dvi

xint-calx.pdf: xint-calx.dtx xint-calx.tex
	latexmk xint-calx.tex
	dvipdfmx xint-calx.dvi

CHANGES.html: xintchanges.md Makefile.mk
	pandoc -o CHANGES.html -s --toc -V highlighting-css=$(highlighting-css) xintchanges.md

xint.tds.zip: $(filesfordoc) $(filesforsource) $(filesfortex)
	rm -fr $(JF_tmpdir)
	mkdir -p $(JF_tmpdir)/doc/generic/xint
	mkdir -p $(JF_tmpdir)/source/generic/xint
	mkdir -p $(JF_tmpdir)/tex/generic/xint
	chmod -R ugo+rwx $(JF_tmpdir)
	cp -a $(filesfordoc)    $(JF_tmpdir)/doc/generic/xint
	cp -a $(filesforsource) $(JF_tmpdir)/source/generic/xint
	cp -a $(filesfortex)    $(JF_tmpdir)/tex/generic/xint
	cd $(JF_tmpdir); chmod -R ugo+r doc source tex
	umask 0022 && cd $(JF_tmpdir) &&\
                zip -r xint.tds.zip doc source tex &&\
                mv -f xint.tds.zip ../
	rm -fr $(JF_tmpdir)
	@echo 'make xint.tds.zip done.'

xint.zip: $(filesfordoc) $(filesforsource) $(filesfortex)
	mkdir -p              $(JF_tmpdir)/xint
	chmod ugo+rwx         $(JF_tmpdir)/xint
	cp -a $(filesfordoc)    $(JF_tmpdir)/xint
	cp -a $(filesforsource) $(JF_tmpdir)/xint
	chmod -R ugo+r        $(JF_tmpdir)/xint
	umask 0022 && cd $(JF_tmpdir) && zip -r xint.zip xint
	mv -f  $(JF_tmpdir)/xint.zip ./
	rm -fr $(JF_tmpdir)
	@echo 'make xint.zip done.'

installhome: xint.tds.zip
	unzip xint.tds.zip -d $(TEXMF_home)

uninstallhome:
	cd $(TEXMF_home) && rm -fr  doc/generic/xint \
	                            source/generic/xint \
	                            tex/generic/xint

# cf http://stackoverflow.com/a/1909390
# as kpsewhich is very slow (.5s) I want to evaluate once only.
installlocal: xint.tds.zip
	$(eval $@_tmp := $(TEXMF_local))
	unzip xint.tds.zip -d $($@_tmp) && texhash $($@_tmp)

uninstalllocal:
	cd $(TEXMF_local) && rm -fr doc/generic/xint \
	                            source/generic/xint \
	                            tex/generic/xint && texhash .
clean:
	rm -fr auto/ .auto/ TEMP*/
	rm -f $(auxiliaryfiles)\
	  xintmanual.fls xintmanual.fdb_latexmk\
	  xintsource.fls xintsource.fdb_latexmk\
	  xint-calx.fls xint-calx.fdb_latexmk

# 1.4p does not remove xintmanual.pdf and xintsource.pdf
# because cleanmore is used at home for building zip for CTAN
# and it does not include them anyhow.
cleanmore: clean
	rm -f xint-calx.pdf xint.tds.zip xint.zip
