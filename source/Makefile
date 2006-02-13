SOURCES = $(wildcard *.in)
UNPACKED = $(patsubst %.in, %, $(SOURCES))

%.def: %.def.in
	m4 -P -Dm4_ESKDX_INIT="m4_include(../eskdx.m4)" $< >$@
%.sty: %.sty.in
	m4 -P -Dm4_ESKDX_INIT="m4_include(../eskdx.m4)" $< >$@
%.cls: %.cls.in
	m4 -P -Dm4_ESKDX_INIT="m4_include(../eskdx.m4)" $< >$@

all: $(UNPACKED)

clean:
	rm -f $(UNPACKED)
