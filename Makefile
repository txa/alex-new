all.pdf : proposal.pdf asgCV.pdf timeplan.pdf impact.pdf justification.pdf all.tex
	pdflatex all.tex

proposal.pdf : proposal.tex proposal.bib
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
