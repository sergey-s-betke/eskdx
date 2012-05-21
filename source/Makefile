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

testinstall: all
	cp -a *.{sty,cls,def} ~/texmf/tex/latex/eskdx
# testinstall: all
# 	cp -a *.{sty,cls,def} $(TOP_DIR)/../local_latex_files/tex/latex/eskdx

clean:
	rm -f $(UNPACKED)
