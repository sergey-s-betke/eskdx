PACKAGE = eskdx
VERSION = 0.98
RELEASE_DATE = 2011/05/13
M4DEPS = $(TOP_DIR)/include.m4 $(TOP_DIR)/include.mak
M4FLAGS = -P -Dm4_ESKDX_INIT="m4_include($(TOP_DIR)/include.m4)" \
	  -Dm4_ESKDX_VERSION=$(VERSION) -Dm4_ESKDX_DATE=$(RELEASE_DATE)
PASS=1
DIST_DIR = $(TOP_DIR)/.dist
DIST_PREFIX = /$(PACKAGE)-$(VERSION)

all: all-recursive

%.pdf: %.eps
	epstopdf --outfile $@ $<

%.pdf: %.tex
	for i in `seq 1 $(PASS)`; do pdflatex $<; done
	
%.dvi: %.tex
	for i in `seq 1 $(PASS)`; do latex $<; done
	
%.ps: %.dvi
	dvips $(DVIPS_FLAGS) -o $@ $<

all-recursive:
	for i in $(SUBDIRS); do $(MAKE) -C $$i all || exit $$?; done

clean: clean-recursive

clean-recursive:
	for i in $(SUBDIRS); do $(MAKE) -C $$i clean || exit $$?; done

dist: $(DIST_FILES) dist-recursive
	mkdir -p $(DIST_DIR)$(DIST_PREFIX)
	cp -a $(DIST_FILES) $(DIST_DIR)$(DIST_PREFIX)

dist-recursive:
	for i in $(SUBDIRS); do $(MAKE) -C $$i \
	  DIST_PREFIX=$(DIST_PREFIX)/$$i dist || exit $$?; done

dist-bzip2: dist
	tar -C $(DIST_DIR) -cjf $(PACKAGE)-$(VERSION).tar.bz2 .
	rm -rf $(DIST_DIR)

dist-zip: dist
	zipfile=`pwd`/$(PACKAGE)-$(VERSION).zip; \
	rm -f "$$zipfile"; \
	cd $(DIST_DIR) && zip -r "$$zipfile" *
	rm -rf $(DIST_DIR)

dist-ctan: dist
	zipfile=`pwd`/$(PACKAGE)-$(VERSION)-ctan.zip; \
	rm -f "$$zipfile"; \
	cd $(DIST_DIR)$(DIST_PREFIX) && zip -r "$$zipfile" *
	rm -rf $(DIST_DIR)

.PHONY: all all-recursive clean clean-recursive \
	dist dist-recursive dist-bzip2
