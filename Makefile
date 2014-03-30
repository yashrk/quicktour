.PHONY: clean lessons
all: quicktour.tex
	touch quicktour.ind
	latex quicktour.tex
	makeindex quicktour.idx
	latex quicktour.tex
	dvips -o quicktour.ps quicktour.dvi
	ps2pdf quicktour.ps
new: quicktour.tex
	touch quicktour.ind
	xelatex quicktour.tex
	makeindex quicktour.idx
	xelatex quicktour.tex
book: quicktour.tex
	cat quicktour.ps | psbook | psnup -2 > quicktour_book.ps
booknew: quicktour.tex
	pdftops quicktour.pdf
	cat quicktour.ps | psbook | psnup -b 5 -2 > quicktour_book.ps
	ps2pdf quicktour_book.ps quicktour_book.pdf
problems:
	latex problems.tex
	dvips -o problems.ps problems.dvi
	ps2pdf problems.ps
clean:
	rm -f *~ *.dvi \
    problems.pdf problems.ps \
    quicktour.pdf quicktour.ps \
    *.aux *.idx *.ilg *.ind *.log *.nav *.out *.snm *.toc
	rm -f abc/*.beam abc/*~
	rm -f best_practices/*.beam best_practices/*~
	rm -f parallel/*.beam parallel/*~
	rm -f sugar/*.beam sugar/*~
