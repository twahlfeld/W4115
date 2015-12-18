open Printf

let prog = "add"

let link = 
	let rslt = Sys.command ("nasm -f elf64 " ^ prog ^ ".asm") in
		if rslt = 0 then
			Sys.command ("gcc " ^ prog ^ ".o -o " ^ prog)
		else 
			rslt;;

link;;