# Process this file with GNU make
TOP_DIR = ..

DIST_FILES = \
	     latex2html-init \
	     eskdx.pdf \
	     eskdx.tex.in \
	     example.tex \
	     Makefile

include $(TOP_DIR)/include.mak

all: eskdx.pdf

eskdx.tex: eskdx.tex.in $(M4DEPS)
	m4 $(M4FLAGS) $< >$@

eskdx.pdf: example.tex

html.tex: eskdx.tex.in $(M4DEPS)
	m4 $(M4FLAGS) -Dm4_HTML $< >$@

html.aux: html.tex
	latex $<

html: html.tex html.aux example.tex
	latex2html -init_file latex2html-init -iso_language RU $<

clean:
	rm -f {eskdx,html}.{aux,out,log,toc}
	rm -f html.{tex,dvi} WARNINGS
	rm -rf html

.PHONY: html
