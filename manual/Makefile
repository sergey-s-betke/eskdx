TOP_DIR = ..

include $(TOP_DIR)/include.mak

all: eskdx.pdf

eskdx.tex: eskdx.tex.in
	m4 $(M4FLAGS) $< >$@

clean:
	rm -f eskdx.{tex,aux,out,log,toc,pdf}
