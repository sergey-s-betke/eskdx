# Process this file with GNU make
TOP_DIR = .
SUBDIRS = manual source test unpacked

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
