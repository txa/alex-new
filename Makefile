.PHONY : all
all : all.pdf

all.pdf : proposal.pdf asgCV.pdf timeplan.pdf impact.pdf justification.pdf all.tex
	pdflatex all.tex

proposal.pdf : proposal.tex proposal.bib teleport.eps
	latex proposal.tex
	bibtex track
	bibtex main
	latex proposal.tex
	latex proposal.tex
	dvips proposal
	ps2pdf proposal.ps

asgCV.pdf : asgCV.tex res.cls
	pdflatex asgCV.tex

timeplan.pdf : timeplan.tex
	latex timeplan.tex
	dvips timeplan
	ps2pdf timeplan.ps

impact.pdf : impact.tex proposal.bib
	pdflatex impact.tex
	bibtex impact
	pdflatex impact.tex
	pdflatex impact.tex 

justification.pdf : justification.tex
	pdflatex justification.tex

graphic.pdf : graphic.tex
	latex graphic.tex
	dvips graphic
	ps2pdf graphic.ps

.PHONY : tidy
tidy : 
	rm -f all.aux all.log 
	rm -f asgCV.log 
	rm -f impact.aux impact.bbl impact.blg impact.log
	rm -f justification.aux justification.log 
	rm -f main.aux main.bbl main.blg
	rm -f proposal.aux proposal.dvi proposal.log proposal.ps
	rm -f timeplan.aux timeplan.dvi timeplan.log timeplan.ps
	rm -f track.aux track.bbl track.blg

.PHONY : clean
clean : tidy
	rm -f all.pdf asgCV.pdf impact.pdf justification.pdf proposal.pdf timeplan.pdf
