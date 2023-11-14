# file qish-gc/doc/GNUmakefile
# SPDX-License-Identifier: GPL-3.0-or-later
#  Copyright © 2002-2023 Basile STARYNKEVITCH

# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General
# Public License along with this library; if not, write to the
# Free Software Foundation, Inc., 59 Temple Place, Suite 330,
# Boston, MA 02111-1307, USA.

# we use the Hevea LaTeX to HTML translator
# see http://para.inria.fr/~maranget/hevea/
HEVEA=hevea
LATEX=latex
DVIPS=dvips
# hevea -version output two lines, the second one being something like
# library directory: /usr/lib/hevea
HEVEALIBDIR:=$(shell $(HEVEA) -version | grep library | cut '-d ' -f3)
TEXINPUTS:=$(TEXINPUTS):$(HEVEALIBDIR)
export TEXINPUTS
RM=rm -vf
.PHONY: all clean html ps pdf halfclean

# the basename of our documents
DOCUMENTS=qishintro

HTML_DOCUMENTS=$(patsubst %, %.html, $(DOCUMENTS))
PS_DOCUMENTS=$(patsubst %, %.ps, $(DOCUMENTS))

.SUFFIXES: .html .tex .ps .hva .sty .aux .haux

all: html ps pdf

clean:
	$(RM) *~ *.log *.dvi *.ps *.pdf *.html *.aux *.haux *.toc *.htoc *.out

html: $(HTML_DOCUMENTS)

ps: $(PS_DOCUMENTS)

pdf: $(PS_DOCUMENTS)
	for f in $(PS_DOCUMENTS) ; do ps2pdf $$f $$(basename $$f .ps).pdf ; done
halfclean: all
	$(RM) *~ *.log *.dvi *.aux *.haux *.toc *.htoc
.tex.dvi:
	$(LATEX) $<
	$(LATEX) $<

.dvi.ps:
	$(DVIPS) -o $@ $<

.tex.html:
	$(HEVEA) $<
	$(HEVEA) $<

#eof $Id: GNUmakefile 25 2005-07-08 08:54:46Z basile $
