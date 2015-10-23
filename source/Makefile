.PHONY: default
default: ted

ted: scanner.ml parser ast parser.cmo scanner.cmo
	ocamlc -o parser.cmo scanner.cmo ted.cmo

parser.cmo: parser.ml
	ocamlc -c parser.mli

scanner.cmo: scanner.ml
	ocamlc -c scanner.ml

parser.ml: parser.mly
	ocamlyacc parser.mly

ast:
	ocamlc -c ast.ml

parser:
	ocamlyacc parser.mly

scanner.ml: scanner.mll
	ocamllex scanner.mll

.PHONY: clean
clean:
	rm -f *.cmo *.cmi scanner.ml parser.mli parser.ml 

.PHONY: all
all: clean default
