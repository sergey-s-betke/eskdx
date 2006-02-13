TOP_DIR = .
SUBDIRS = manual source test

include $(TOP_DIR)/include.mak

all: unpacked doc README

unpacked:
	$(MAKE) -C source
	rm -f unpacked/*.{sty,def,cls}
	cp -p source/*.{sty,def,cls} unpacked/

doc:
	$(MAKE) -C manual
	rm -f doc/*.pdf
	cp -p manual/*.pdf doc/

README: README.in
	m4 $(M4FLAGS) $< >$@

.PHONY: doc unpacked
