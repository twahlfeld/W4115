let _ =
  let lexbuf = Lexing.from_channel stdin in
  let program = Parser.program Scanner.token lexbuf in
  Array.iter (fun x -> Printf.printf "%s" x) (Array.map Opcode.string_of_stmt (Compile.translate program).text)

