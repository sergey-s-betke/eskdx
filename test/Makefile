include ../Rules.mak

all: $(patsubst %.tex, %.pdf, $(wildcard *.tex))

clean:
	rm -f *.{aux,out,log,pdf}
