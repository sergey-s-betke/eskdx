TOP_DIR = ..

include $(TOP_DIR)/include.mak

all: $(patsubst %.tex, %.pdf, $(wildcard *.tex))

clean:
	rm -f *.{aux,out,log,pdf}
