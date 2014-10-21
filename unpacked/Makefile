# Process this file with GNU make
TOP_DIR 		:= ..
RM				:= del
CP				:= copy
UNPACKED 		= $(patsubst \
					%.in, \
					%, \
					$(notdir \
						$(shell grep ^source $(TOP_DIR)/manifest.txt) \
					) \
				)
DIST_FILES 		= Makefile $(UNPACKED)

include $(TOP_DIR)/include.mak

all: $(UNPACKED)

$(UNPACKED):
	$(MAKE) -C $(TOP_DIR)/source
	$(RM) -f eskd*.sty
	$(RM) -f eskd*.def
	$(RM) -f eskd*.cls
	$(CP) -p $(addprefix $(TOP_DIR)/source/, $(UNPACKED)) .
