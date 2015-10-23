.PHONY: default
default: ted

ted: parser.cmo scanner.cmo  ast
	ocamlc -o parser.cmo scanner.cmo ted.cmo

parser.cmo: parser.ml
	ocamlc -c parser.ml

scanner.cmo: scanner.ml
	ocamlc -c scanner.ml

parser.ml: parser.mly
	ocamlyacc parser.mly

ast:
	ocamlc -c ast.mli

parser.mly:
	ocamlyacc parser.mly

scanner.ml: scanner.mll
	ocamllex scanner.mll

.PHONY: clean
clean:
	rm -f *.cmo *.cmi scanner.ml parser.mli parser.ml 

.PHONY: all
all: clean default
