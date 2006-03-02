# Process this file with GNU make
TOP_DIR = ..
SOURCES = $(notdir $(shell grep ^source $(TOP_DIR)/manifest.txt))
UNPACKED = $(patsubst %.in, %, $(filter %.in, $(SOURCES)))

DIST_FILES = \
	     Makefile \
	     $(SOURCES)

include $(TOP_DIR)/include.mak

%.def: %.def.in $(M4DEPS)
	m4 $(M4FLAGS) $< >$@
%.sty: %.sty.in $(M4DEPS)
	m4 $(M4FLAGS) $< >$@
%.cls: %.cls.in $(M4DEPS)
	m4 $(M4FLAGS) $< >$@

all: $(UNPACKED)

clean:
	rm -f $(UNPACKED)
