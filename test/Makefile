# Process this file with GNU make
TOP_DIR = ..

TESTS = $(wildcard *.tex)

DIST_FILES = \
	     Makefile \
	     $(TESTS)

include $(TOP_DIR)/include.mak

all: $(patsubst %.tex, %.pdf, $(TESTS))

clean:
	rm -f *.{aux,out,log,toc,pdf}
