SHELL := /bin/bash

BEAMER_FILES =  myMacros.tex \
	beamer-settings.tex \
	$(wildcard packages/*.sty) \
	beamer-examples.tex \
  muss.bbx \
  muss.cbx \
	$(wildcard graphics/*.pdf) 

test_beamer:
	rm -fr test
	mkdir test
	cd test; mkdir beamer-template
	cp -r --parents $(BEAMER_FILES) test/beamer-template
	cp beamer-template.org beamer-template.tex \
		themes/* \
		references.bib \
		latexmkrc \
		test
	cd test; \
			latexmk -pdf beamer-template.tex

release_beamer:
	rm -fr temp
	mkdir temp
	cd temp; mkdir beamer-template
	cp -r --parents $(BEAMER_FILES) temp/beamer-template
	cp beamer-template.org beamer-template.tex \
		themes/* \
		references.bib \
		latexmkrc \
		temp
	cd temp; zip -r beamer-template.zip *; mv beamer-template.zip ..
	rm -fr temp
