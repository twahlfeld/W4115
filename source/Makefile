.PHONY: default
default: ted

ted: scanner.ml parser ast parser.cmo opcode.cmo compile.cmo ted.cmo
	ocamlc -o ted parser.cmo scanner.cmo opcode.cmo compile.cmo ted.cmo

ted.cmo: ted.ml
	ocamlc -c ted.ml

parser.cmo: parser.mli
	ocamlc -c parser.mli
	ocamlc -c scanner.ml
	ocamlc -c parser.ml

opcode.cmo: opcode.ml
	ocamlc -c opcode.ml

compile.cmo: compile.ml
	ocamlc -c compile.ml

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
	rm -f *.cmo *.cmi *.o *.asm scanner.ml parser.mli parser.ml 

.PHONY: all
all: clean default
