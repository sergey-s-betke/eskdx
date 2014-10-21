# Process this file with GNU make
TOP_DIR			:= ..
SOURCES 		:= $(notdir $(shell grep ^source $(TOP_DIR)/manifest.txt))
UNPACKED 		:= $(patsubst %.in, %, $(filter %.in, $(SOURCES)))
RM				:= del

DIST_FILES 		:= \
				Makefile \
				$(SOURCES)

include $(TOP_DIR)/include.mak

%.def: %.def.in $(M4DEPS)
	$(M4) $(M4FLAGS) $< >$@
%.sty: %.sty.in $(M4DEPS)
	$(M4) $(M4FLAGS) $< >$@
%.cls: %.cls.in $(M4DEPS)
	$(M4) $(M4FLAGS) $< >$@

all: $(UNPACKED)

clean:
	$(RM) -f $(UNPACKED)
