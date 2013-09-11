MAINDOC = thesis-main
#MAINDOC = transfer
SRCDIR = .
SETUPDIR = ./Setup
TEXSRC	= $(wildcard $(SRCDIR)/*.tex) \
	  $(wildcard $(SRCDIR)/ThesisFrontMatter/*.tex) \
	  $(wildcard $(SRCDIR)/TransferFrontMatter/*.tex) \
	  $(wildcard $(SRCDIR)/Ch1/*.tex) \
	  $(wildcard $(SRCDIR)/Ch2/*.tex) \
	  $(wildcard $(SRCDIR)/Ch3/*.tex) \
	  $(wildcard $(SRCDIR)/Ch4/*.tex) \
	  $(wildcard $(SRCDIR)/Ch5/*.tex) \
	  $(wildcard $(SRCDIR)/Ch6/*.tex) \
	  $(wildcard $(SRCDIR)/Ch7/*.tex) \
	  $(wildcard $(SRCDIR)/Ch8/*.tex) \
	  $(wildcard $(SRCDIR)/Ch9/*.tex) \
	  $(wildcard $(SRCDIR)/ApA/*.tex) 
FIGSRC	= $(wildcard $(SRCDIR)/*.tex) \
	  $(wildcard $(SRCDIR)/ThesisFrontMatter/ps/*.pdf) \
	  $(wildcard $(SRCDIR)/TransferFrontMatter/ps/*.pdf) \
	  $(wildcard $(SRCDIR)/Ch1/Figs/*.pdf) \
	  $(wildcard $(SRCDIR)/Ch2/Figs/*.pdf) \
	  $(wildcard $(SRCDIR)/Ch3/Figs/*.pdf) \
	  $(wildcard $(SRCDIR)/Ch4/Figs/*.pdf) \
	  $(wildcard $(SRCDIR)/Ch5/Figs/*.pdf) \
	  $(wildcard $(SRCDIR)/Ch6/Figs/*.pdf) \
	  $(wildcard $(SRCDIR)/Ch7/Figs/*.pdf) \
	  $(wildcard $(SRCDIR)/Ch8/Figs/*.pdf) \
	  $(wildcard $(SRCDIR)/Ch9/Figs/*.pdf) \
	  $(wildcard $(SRCDIR)/ApA/Figs/*.pdf) 
BIBSRC	= $(wildcard $(SRCDIR)/*.bib)
STYSRC	= $(wildcard $(SETUPDIR)/*.sty) $(wildcard $(SETUPDIR)/*.cls)
all: $(MAINDOC).pdf wordcount
$(MAINDOC).pdf : $(TEXSRC) $(FIGSRC) $(STYSRC) $(BBLSRC)
	@echo "===========================PDFLATEX PASS================================"
	@pdflatex $(MAINDOC) 
	@echo "===========================BIBTEX PASS================================"
	@bibtex $(MAINDOC) 
	@echo "===========================PDFLATEX PASS================================"
	@pdflatex $(MAINDOC) 
	@echo "===========================PDFLATEX PASS================================"
	@pdflatex $(MAINDOC)
clean:
	rm -f *.aux 
	rm -f *.bbl 
	rm -f *.blg 
	rm -f *.log 
	rm -f *.pdf 
	rm -f *.toc 
	rm -f *.out
	rm -f *~
	rm -f *.backup
	rm -f *.lof
	rm -f *.lot
wordcount:
	@echo "===========================WORDCOUNT ================================"
	@ps2ascii $(MAINDOC).pdf | wc -w
