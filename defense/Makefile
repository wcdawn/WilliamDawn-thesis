# Makefile
DEFENSE=WilliamDawn-defense
DEFENSE_EXTRA=*.tex
DEFENSE_AUX=*.aux
DEFENSE_INTERMEDIATES=*.log *.nav *.out *.snm *.toc \
					  *.bbl *.blg *.lof *.lot
FIGURES=../ch*/figs/*.* ../ap*/figs/*.*

all : defense

defense : $(DEFENSE).pdf

$(DEFENSE).pdf : $(DEFENSE).tex $(DEFENSE_EXTRA) $(FIGURES) beamerthemeNCSU.sty
	pdflatex --shell-escape $(DEFENSE)
	bibtex $(DEFENSE)
	pdflatex --shell-escape $(DEFENSE)
	pdflatex --shell-escape $(DEFENSE)
	grep -i "Warn" $(DEFENSE).log

forcedefense :
	rm $(DEFENSE).pdf
	make defense

clean : 
	rm $(DEFENSE_AUX) $(DEFENSE_INTERMEDIATES)
