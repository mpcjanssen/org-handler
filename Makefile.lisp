.PHONY: install all clean 

all: install

install: org-handler.sbcl
	cp $< ${HOME}/bin/$<

org-handler.sbcl: org-handler.lisp
	sbcl --load org-handler.lisp --eval "(sb-ext:save-lisp-and-die \"$@\" :executable t :toplevel #'main)"


clean:
	git clean -f
