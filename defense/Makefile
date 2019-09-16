# Makefile
DEFENSE=WilliamDawn-defense
DEFENSE_EXTRA=*.tex
DEFENSE_AUX=*.aux
DEFENSE_INTERMEDIATES=*.log *.nav *.out *.snm *.toc \
					  *.bbl *.blg *.lof *.lot
FIGURES=../ch*/figs/*.* ../ap*/figs/*.* ./figs/*.*

.PHONY : all defense

all : defense

defense : $(DEFENSE).pdf

$(DEFENSE).pdf : $(DEFENSE).tex $(DEFENSE_EXTRA) $(FIGURES) beamerthemeNCSU.sty\
	../WilliamDawn-thesis.bib
	pdflatex --draftmode --shell-escape $(DEFENSE)
	biber $(DEFENSE)
	makeglossaries $(DEFENSE)
	pdflatex --draftmode --shell-escape $(DEFENSE)
	pdflatex --shell-escape $(DEFENSE)
	grep -i "Warn" $(DEFENSE).log

forcedefense :
	rm $(DEFENSE).pdf
	$(MAKE) defense

clean : 
	rm -f $(DEFENSE_AUX) $(DEFENSE_INTERMEDIATES)
