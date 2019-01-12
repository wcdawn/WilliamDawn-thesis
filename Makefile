# Makefile
CHAPTERS=ch*/ch*.tex ap*/ap*.tex variable_definitions.tex
FIGURES=ch*/figs/*.* ap*/figs/*.*
NAME=WilliamDawn-thesis
AUX=$(NAME).aux front.aux ch*/*.aux ap*/*.aux optional.aux 
INTERMEDIATES=$(NAME).bbl $(NAME).blg $(NAME).lof $(NAME).lot \
							$(NAME).log $(NAME).toc $(NAME).out

all : text defense

text : $(NAME).pdf

defense : 
	$(MAKE) -C ./defense defense

$(NAME).pdf : $(NAME).tex $(NAME).bib front.tex $(FIGURES) $(CHAPTERS) \
	ncsuthesis.cls optional.tex
	pdflatex $(NAME)
	bibtex $(NAME)
	pdflatex $(NAME)
	pdflatex $(NAME)
	grep -i "Warn" $(NAME).log

forcetext :
	rm $(NAME).pdf
	make

clean :
	rm $(AUX) $(INTERMEDIATES)
