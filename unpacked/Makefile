# Process this file with GNU make
TOP_DIR = ..

DIST_FILES = \
	     Makefile \
	     $(wildcard eskd*)

include $(TOP_DIR)/include.mak

all:
	$(MAKE) -C $(TOP_DIR)/source
	rm -f *.{sty,def,cls}
	cp -p $(TOP_DIR)/source/*.{sty,def,cls} .
