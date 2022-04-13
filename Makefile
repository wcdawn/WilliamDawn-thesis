# Makefile
CHAPTERS=ch*/ch*.tex ap*/ap*.tex variable_definitions.tex acronym.tex custom.tex
FIGURES=ch*/figs/*.* ap*/figs/*.*
DATA=ch*/data/*.* ap*/data/*.*
NAME=WilliamDawn-thesis
AUX=$(NAME).aux front.aux ch*/*.aux ap*/*.aux optional.aux 
INTERMEDIATES=$(NAME).bbl $(NAME).blg $(NAME).lof $(NAME).lot \
			$(NAME).log $(NAME).toc $(NAME).out $(NAME).acn \
			$(NAME).acr $(NAME).alg $(NAME).glg $(NAME).glo \
			$(NAME).gls $(NAME).ist

.PHONY : default all text defense forcedefense forcetext clean

default : text

all : text defense

text : $(NAME).pdf

defense : 
	$(MAKE) -C ./defense/ defense

forcedefense : 
	$(MAKE) -C ./defense/ forcedefense

$(NAME).pdf : $(NAME).tex $(NAME).bib front.tex $(FIGURES) $(DATA) $(CHAPTERS) \
	ncsuthesis.cls optional.tex
	pdflatex --draftmode $(NAME)
	biber $(NAME)
	makeglossaries $(NAME)
	pdflatex --draftmode $(NAME)
	pdflatex $(NAME)
	grep -i "Warn" $(NAME).log

forcetext :
	rm $(NAME).pdf
	$(MAKE) text

clean :
	rm -f $(AUX) $(INTERMEDIATES)
	$(MAKE) -C ./defense/ clean
