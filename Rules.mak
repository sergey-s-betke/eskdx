PASS=1

all: all-recursive

%.pdf: %.eps
	epstopdf --outfile $@ $<

%.pdf: %.tex
	for i in `seq 1 $(PASS)`; do pdflatex $<; done
	
%.dvi: %.tex
	for i in `seq 1 $(PASS)`; do latex $<; done
	
%.ps: %.dvi
	dvips $(DVIPS_FLAGS) -o $@ $<

all-recursive:
	for i in $(SUBDIRS); do $(MAKE) -C $$i all || exit $$?; done

clean: clean-recursive

clean-recursive:
	for i in $(SUBDIRS); do $(MAKE) -C $$i clean || exit $$?; done

.PHONY: all all-recursive clean clean-recursive
