RDIR= /Users/ajinkyaingale/Software Engineering/MastersProjectdocuments/Code/system/analysis/technical/cran/trunk/srs-cran/src
FIGDIR= ./figs
 
# list R files
RFILES := $(wildcard $(RDIR)/main/*.R)


# Indicator files to show R file has run
OUT_FILES:= $(RFILES:.R=.Rout)


 
all: 
	echo "all" 
	$(OUT_FILES)
	
 
# May need to add something here if some R files depend on others.
 
# RUN EVERY R FILE
$(RDIR)/%.Rout: 
	echo "run every R file"
	$(RDIR)/main/mainscript.R
	R CMD BATCH $<
 
 
# Run R files
R: 
	$(OUT_FILES)
 

 
# Clean up stray files
clean:
	rm -fv $(OUT_FILES) 
	rm -fv *.aux *.log *.toc *.blg *.bbl *.synctex.gz
	rm -fv *.out *.bcf *blx.bib *.run.xml
	rm -fv *.fdb_latexmk *.fls
 
.PHONY: all clean