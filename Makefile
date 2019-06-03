.PHONY: install all clean eggs

all: install

install: org-handler
	cp $< ${HOME}/bin/$<

org-handler: org-handler.scm 
	csc -O3 $<

