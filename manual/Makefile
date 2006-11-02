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

eskdx.pdf: example.tex \
           img-title.pdf img-form1.pdf img-form2.pdf img-form2a.pdf

html.tex: eskdx.tex.in $(M4DEPS)
	m4 $(M4FLAGS) -Dm4_HTML $< >$@

html.aux: html.tex
	latex $<

html: html.tex html.aux example.tex \
      img-title.eps img-form1.eps img-form2.eps img-form2a.eps
	latex2html -init_file latex2html-init -iso_language RU $<

%.eps: %.svg
	inkscape --without-gui --export-text-to-path \
	    --export-eps=$@ $<

%.pdf: %.svg
	inkscape --without-gui --export-text-to-path \
	    --export-pdf=$@ $<

clean:
	rm -f {eskdx,html}.{aux,out,log,toc}
	rm -f html.{tex,dvi} WARNINGS
	rm -rf html

.PHONY: html
