module StringMap = Map.Make(String)

let _ =
  let rec file_in =
    if Array.length Sys.argv > 1 then
      (try
        open_in Sys.argv.(1)
      with e-> 
        close_in_noerr; 
        Printf.printf "Error Opening File %s\n" Sys.argv.(1);
        raise e;
      )
    else 
      stdin
  in 
  let file_out =
    if Array.length Sys.argv > 1 then
      open_out ((String.sub (Sys.argv.(1)) 0 (String.index Sys.argv.(1)
      '.'))^".asm")
    else
      stdout
  in
  let lexbuf = Lexing.from_channel file_in in
  let ast = Parser.program Scanner.token lexbuf in
  let program = ast in
  let prg = (Compile.translate program).text in
  let stringlit =
    let add_string map str =
      StringMap.add str ("Str" ^ (string_of_int (StringMap.cardinal map))) map
    in
    let rec filter_string = function
      | []     -> []
      | hd::tl ->
        (match hd with
        | Opcode.Str s -> s :: filter_string tl
        | Opcode.Arg(_, Opcode.Str s ) -> s :: filter_string tl
        | Opcode.Arg(_, (Opcode.Arg(_, Opcode.Str s))) -> s :: filter_string tl
        | _        -> filter_string tl
        )
    in
    List.fold_left add_string StringMap.empty (filter_string (Array.to_list prg))
  in
  StringMap.iter (fun k v -> Printf.printf "%s->%s\n" k v) stringlit;
  let prg_ops = Array.to_list prg in
  let rec makeheader = function
    | [] -> ""
    | hd :: tl ->
      (match hd with
        | Opcode.Prologue s ->
          (match s with
            | "fprintf" -> makeheader tl
            | "fopen"   -> makeheader tl
            | s         -> Printf.sprintf "%sglobal %s\n" (makeheader tl) s )
        | _ -> makeheader tl
      )
  in
  (*let rec maketail = function
      | [] -> ""
      | hd :: tl ->
        (match hd with
          | Opcode.Str s         -> Opcode.build_str s ^ (maketail tl)
          | Opcode.Arg(_, Opcode.Str s) -> Opcode.build_str s ^ (maketail tl)
          | _ ->  maketail tl
        )
  in*)
  let full_prg = 
      [Opcode.Header (makeheader prg_ops)] @ prg_ops @ [Opcode.Tail ("")]
  in
  List.iter (fun x -> Printf.fprintf file_out "%s" x) (List.map (Opcode.string_of_stmt stringlit) full_prg)

