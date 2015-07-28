OCAMLMAKEFILE = OCamlMakefile

SOURCES = ast.mli parser.mly lexer.mll rube.ml main.ml
RESULT = rube
OCAMLLDFLAGS = -g

include $(OCAMLMAKEFILE)

test:
	 ocamlfind ocamlc -o test -package oUnit -linkpkg -g rube.ml test.ml parser.ml lexer.ml

cleantest:
	rm test
