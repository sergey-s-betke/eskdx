# Process this file with GNU make
TOP_DIR = ..

UNPACKED = $(patsubst %.in, %, $(notdir \
	     $(shell grep ^source $(TOP_DIR)/manifest.txt)))

DIST_FILES = Makefile $(UNPACKED)

include $(TOP_DIR)/include.mak

all: $(UNPACKED)

$(UNPACKED):
	$(MAKE) -C $(TOP_DIR)/source
	rm -f eskd*.{sty,def,cls}
	cp -p $(addprefix $(TOP_DIR)/source/, $(UNPACKED)) .
