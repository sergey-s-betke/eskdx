SUBDIRS = manual source test

include Rules.mak

all: unpacked doc

unpacked:
	rm -f unpacked/*.{sty,def,cls}
	cp -p source/*.{sty,def,cls} unpacked/

doc:
	rm -f doc/*.pdf
	cp -p manual/*.pdf doc/

.PHONY: doc unpacked
