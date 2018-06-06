MAIN:=report

all: ${MAIN}.pdf

%.pdf: %.tex
	pdflatex $<
	pdflatex $<
	pdflatex $<

.PHONY: clean remove

clean:
	rm -f ${MAIN}.{log,aux,lox,out}

remove: clean
	rm -f ${MAIN}.pdf
