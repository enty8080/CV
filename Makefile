MAIN     = cv
LATEX    = xelatex
FLAGS    = -interaction=nonstopmode
PACKAGES = titlesec enumitem tabto-ltx

# Use 'make SUDO=' to run tlmgr without sudo (e.g. user-local TeX installs)
SUDO     = sudo

.PHONY: all deps clean

all: $(MAIN).pdf

deps:
	$(SUDO) tlmgr install $(PACKAGES)

# Run twice so hyperref/fancyhdr resolve correctly
$(MAIN).pdf: $(MAIN).tex
	$(LATEX) $(FLAGS) $<
	$(LATEX) $(FLAGS) $<

clean:
	rm -f $(MAIN).aux $(MAIN).log $(MAIN).out $(MAIN).xdv \
	      $(MAIN).fls $(MAIN).fdb_latexmk $(MAIN).synctex.gz
