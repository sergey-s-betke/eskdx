# Process this file with GNU make
TOP_DIR = ..

DIST_FILES = \
	     eskdx.pdf \
	     eskdx.tex.in \
	     Makefile

include $(TOP_DIR)/include.mak

all: eskdx.pdf

eskdx.tex: eskdx.tex.in $(M4DEPS)
	m4 $(M4FLAGS) $< >$@

clean:
	rm -f eskdx.{tex,aux,out,log,toc}
