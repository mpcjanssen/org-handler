.PHONY: install all clean eggs

all: install

install: bld/org-handler
	cp $< ${HOME}/bin/$(notdir $<)

bld/org-handler: org-handler.scm 
	csc -O3 $< -o $@


clean:
	rm bld/org-handler
