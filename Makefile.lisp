.PHONY: install all clean 

all: install

install: bld/org-handler.sbcl
	cp $< ${HOME}/bin/$(notdir $<)

bld/org-handler.sbcl: org-handler.lisp
	sbcl --load org-handler.lisp --eval "(sb-ext:save-lisp-and-die \"$@\" :executable t :toplevel #'main)"


clean:
	rm bld/org-handler.sbcl
