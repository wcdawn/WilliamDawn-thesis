CHAPTERS=ch*/ch*.tex ap*/ap*.tex
FIGURES=ch*/figs/*.* ap*/figs/*.*
NAME=WilliamDawn-thesis
AUX=$(NAME).aux front.aux ch*/*.aux ap*/*.aux optional.aux 
INTERMEDIATES=$(NAME).bbl $(NAME).blg $(NAME).lof $(NAME).lot \
							$(NAME).log $(NAME).toc $(NAME).out

DEFENSE_DIR=./defense/
DEFENSE=$(DEFENSE_DIR)WilliamDawn-defense
DEFENSE_EXTRA=$(DEFENSE_DIR)*.tex
DEFENSE_AUX=$(DEFENSE_DIR)*.aux
DEFENSE_INTERMEDIATES=$(DEFENSE_DIR)*.log $(DEFENSE_DIR)*.nav \
					  $(DEFENSE_DIR)*.out $(DEFENSE_DIR)*.snm \
					  $(DEFENSE_DIR)*.toc 

all : text defense

text : $(NAME).pdf

defense : $(DEFENSE).pdf

$(NAME).pdf : $(NAME).tex $(NAME).bib front.tex $(FIGURES) $(CHAPTERS) \
	ncsuthesis.cls optional.tex
	pdflatex $(NAME)
	bibtex $(NAME)
	pdflatex $(NAME)
	pdflatex $(NAME)
	grep -i "Warn" $(NAME).log

$(DEFENSE).pdf : $(DEFENSE).tex $(DEFENSE_EXTRA) $(FIGURES) 
	echo $(DEFENSE)
	pdflatex --output-directory=./defense $(DEFENSE).tex
	#bibtex $(DEFENSE)
	pdflatex --output-directory=./defense $(DEFENSE).tex
	pdflatex --output-directory=./defense $(DEFENSE).tex

forcedefense : 
	rm $(DEFENSE).pdf
	make defense

forcetext :
	rm $(NAME).pdf
	make

clean :
	rm $(AUX) $(INTERMEDIATES) $(DEFENSE_AUX) $(DEFENSE_INTERMEDIATES)
