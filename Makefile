# Process this file with GNU make
TOP_DIR = .
SUBDIRS = manual source test unpacked

DIST_FILES = \
	     ChangeLog \
	     include.m4 \
	     include.mak \
	     Makefile \
	     manifest.txt \
	     README \
	     README.in

include $(TOP_DIR)/include.mak

all: README

README: README.in $(M4DEPS)
	m4 $(M4FLAGS) $< >$@
