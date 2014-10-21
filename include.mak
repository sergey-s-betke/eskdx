PACKAGE			:= eskdx
VERSION			:= 0.99
RELEASE_DATE	:= 2014/10/21
M4				:= m4
M4DEPS 			= \
				$(TOP_DIR)/include.m4 \
				$(TOP_DIR)/include.mak
M4FLAGS 		= -P -Dm4_ESKDX_INIT="m4_include($(TOP_DIR)/include.m4)" \
				-Dm4_ESKDX_VERSION=$(VERSION) -Dm4_ESKDX_DATE=$(RELEASE_DATE)
RM				:= del
CP				:= copy
PASS			:= 1
DIST_DIR 		= $(TOP_DIR)/.dist
DIST_PREFIX 	= /$(PACKAGE)-$(VERSION)

all: all-recursive
k
%.pdf: %.eps
	epstopdf --outfile $@ $<

%.pdf: %.tex
	pdflatex $<
	
%.dvi: %.tex
	latex $<
	
%.ps: %.dvi
	dvips $(DVIPS_FLAGS) -o $@ $<

all-recursive:
	$(foreach i, $(SUBDIRS), \
		$(shell $(MAKE) -C $i all ) \
	)

clean: clean-recursive

clean-recursive:
	$(foreach i, $(SUBDIRS), \
		$(shell $(MAKE) -C $i clean ) \
	)

dist: $(DIST_FILES) dist-recursive
	mkdir -p $(DIST_DIR)$(DIST_PREFIX)
	$(CP) -a $(DIST_FILES) $(DIST_DIR)$(DIST_PREFIX)

dist-recursive:
	$(foreach i, $(SUBDIRS), \
		$(shell $(MAKE) -C $i DIST_PREFIX=$(DIST_PREFIX)/$i dist ) \
	)

dist-bzip2: dist
	tar -C $(DIST_DIR) -cjf $(PACKAGE)-$(VERSION).tar.bz2 .
	$(RM) -rf $(DIST_DIR)

dist-zip: dist
	zipfile=`pwd`/$(PACKAGE)-$(VERSION).zip; \
	$(RM) -f "$$zipfile"; \
	cd $(DIST_DIR) && zip -r "$$zipfile" *
	$(RM) -rf $(DIST_DIR)

dist-ctan: dist
	zipfile=`pwd`/$(PACKAGE)-$(VERSION)-ctan.zip; \
	$(RM) -f "$$zipfile"; \
	cd $(DIST_DIR)$(DIST_PREFIX) && zip -r "$$zipfile" *
	$(RM) -rf $(DIST_DIR)

.PHONY: \
	all \
	all-recursive \
	clean \
	clean-recursive \
	dist \
	dist-recursive \
	dist-bzip2
