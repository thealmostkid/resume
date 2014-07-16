LATEX=latex
PDFLATEX=pdflatex
BIBTEX=bibtex
DVIPS=dvips -t letter -Pcmz
PS2PDF=ps2pdf

RES=nathomps-cv
CL=coverletter
RS=rs
all: cv 

cv:
	$(PDFLATEX) $(RES)

	#latex $(RES)
	#dvips -t letter -o $(RES).ps $(RES).dvi

letter:
	$(PDFLATEX) $(CL)

	#latex $(CL)
	#dvips -t letter -o $(CL).ps $(CL).dvi

statement:
	latex $(RS)
	bibtex $(RS)
	latex $(RS)
	latex $(RS)
	dvips -t letter -o $(RS).ps $(RS).dvi
	$(DVIPS) -o $(RS).ps $(RS).dvi
	$(PS2PDF) $(RS).ps

pdf: all

clean:
	- $(RM) $(RES).dvi $(CL).dvi $(RS).dvi
	- $(RM) $(RES).log $(CL).log $(RS).log *.log
	- $(RM) $(RES).ps $(CL).ps $(RS).ps
	- $(RM) *.bak
	- $(RM) $(RES).pdf $(CL).pdf $(RS).pdf
	- $(RM) $(RES).aux $(CL).aux $(RS).aux *.aux
	- $(RM) $(RES).bbl $(CL).bbl $(RS).bbl
	- $(RM) $(RES).blg $(CL).blg $(RS).blg

html:
	bibtex2html nat-pubs.bib
	latex2html -split 0 -nonavigation -noauto_navigation -noinfo -noimages -ascii_mode $(file)
