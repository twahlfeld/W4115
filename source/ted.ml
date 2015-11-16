(*let _ =
  let lexbuf = Lexing.from_channel stdin in
  let program = Parser.program Scanner.token lexbuf in
  Array.iter (fun x -> Printf.printf "%s" x) (Array.map Opcode.string_of_stmt (Compile.translate program).text)
*)let _ =
  let lexbuf = Lexing.from_channel stdin in
  let program = Parser.program Scanner.token lexbuf in
  let prg = (Compile.translate program).text in
  let prg_ops = Array.to_list prg in
  let rec makeheader = function
    | [] -> ""
    | hd :: tl ->
      (match hd with
        | Opcode.Call s ->
          (match s with
            | "fprintf" -> makeheader tl
            | "fopen"   -> makeheader tl
            | s         -> Printf.sprintf "%sglobal %s\n" (makeheader tl) s )
        | _ -> makeheader tl
      )
  in
  let rec maketail = function
      | [] -> ""
      | hd :: tl ->
        (match hd with
          | Opcode.Str s -> Opcode.build_str s ^ (maketail tl)
          | _ ->  maketail tl
        )
  in
  let full_prg = 
      [Opcode.Header (makeheader prg_ops)] @ prg_ops @ [Opcode.Tail (maketail prg_ops)]
  in
  List.iter (fun x -> Printf.printf "%s" x) (List.map Opcode.string_of_stmt full_prg)

