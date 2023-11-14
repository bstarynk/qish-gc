# file qish-gc/GNUmakefile
# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright © 2002-2023 Basile STARYNKEVITCH
SUFFIXES += .i
RM=/bin/rm -vf
MV=/bin/mv
CP=/bin/cp -v
ED=/usr/bin/ed
INSTALL=/usr/bin/install
MKDIR=/usr/bin/mkdir -vp
RELEASE=1.0

.PHONY: all prog clean lib dist install test
all: lib prog

lib:
	$(MAKE) -C lib lib

clean:
	$(MAKE) -C lib clean
	$(MAKE) -C doc clean
#	$(MAKE) -C ruko clean
	$(RM) core *~ .*.prcs_aux

prog:
#	$(MAKE) -C beth prog

test: all
#	$(MAKE) -C beth test

dist:
	$(MAKE) clean
	$(RM) -r $(HOME)/tmp/Qish_$(RELEASE)/
	$(MKDIR) $(HOME)/tmp/Qish_$(RELEASE)/
	cd doc; $(MAKE) halfclean
#	$(CP) doc/*.{html,ps,pdf} $(HOME)/tmp/Qish_$(RELEASE)/doc
#	$(RM) $(HOME)/tmp/Qish_$(RELEASE)/.Qish.prcs_aux
	tar -C $(HOME)/tmp --exclude=.git -czvf $(HOME)/tmp/qish-$(RELEASE).tar.gz Qish_$(RELEASE)/
	$(RM) -r $(HOME)/tmp/Qish_$(RELEASE)/

install: do-update-gitid.sh lib prog
	./do-update-gitid.sh
	$(MAKE) -C lib install

#eof GNUmakefile of qish-gc
