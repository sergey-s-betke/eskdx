# Process this file with GNU make
TOP_DIR 		:= ..
RM				= del /f
TESTS 			= $(wildcard *.tex)

DIST_FILES 		= \
				Makefile \
				$(TESTS)

#include $(TOP_DIR)/include.mak

#all: $(patsubst %.tex, %.pdf, $(TESTS))

clean:
	$(RM) *.aux,*.out,*.log,*.toc,*.pdf
