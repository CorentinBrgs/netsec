MAIN:=report

all: ${MAIN}.pdf

%.pdf: %.tex
	pdflatex $<
	pdflatex $<
	pdflatex $<

.PHONY: clean remove

clean:
	rm -f ${MAIN}.aux
	rm -f ${MAIN}.log

full_clean: clean
	rm -f ${MAIN}.pdf
