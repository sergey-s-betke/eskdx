# Process this file with GNU make
TOP_DIR = .
SUBDIRS = source manual test

DIST_FILES = \
	     ChangeLog \
	     include.m4 \
	     include.mak \
	     Makefile \
	     manifest.txt \
	     NEWS \
	     NEWS.in \
	     README \
	     README.in

include $(TOP_DIR)/include.mak

all: NEWS README

NEWS: NEWS.in $(M4DEPS)
	m4 $(M4FLAGS) $< >$@
README: README.in $(M4DEPS)
	m4 $(M4FLAGS) $< >$@

unpacked-dist-zip: NEWS
	$(MAKE) -C source
	$(MAKE) -C manual
	rm -rf .dist
	mkdir -p .dist/{eskdx,doc,examples}
	cp -a source/*.{cls,sty,def} .dist/eskdx/
	cp -a manual/eskdx.pdf .dist/doc/
	cp -a test/*.tex .dist/examples/
	cd .dist && find eskdx -type f >manifest.txt
	m4 $(M4FLAGS) -Dm4_UNPACKED=1 README.in >.dist/README
	cp -a NEWS .dist/
	rm -f $(PACKAGE)-$(VERSION)-unpacked.zip
	cd .dist && zip -r ../$(PACKAGE)-$(VERSION)-unpacked.zip *
	rm -rf .dist
