open Opcode
module StringMap = Map.Make(String)

let _ =
  (* Reading File or stdin(put) *)
  let rec file_in =
    if Array.length Sys.argv > 1 then
      (try
        open_in Sys.argv.(1)
      with e-> 
        Printf.printf "Error Opening File %s\n" Sys.argv.(1);
        raise e;
      )
    else 
      stdin
  in 
  (* Creates output file or print to stdout *)
  let file_out =
    if Array.length Sys.argv > 1 then
      open_out ((String.sub (Sys.argv.(1)) 0 (String.index Sys.argv.(1)
      '.'))^".asm")
    else
      stdout
  in
  (* Lexing *)
  let lexbuf = Lexing.from_channel file_in in
  (* AST Building *)
  let ast = Parser.program Scanner.token lexbuf in
  let program = ast in
  (* Creates an array of correlating bstmts(opcode.ml) *)
  let prg = (Compile.translate program).text in
  (* Creates the stringmap for string literals *)
  let stringlit = 
    let add_string str n map =
      if StringMap.mem str map then map 
      else StringMap.add str ("Str" ^ (string_of_int n)) map
    in
    let rec filter_strings n = function
      | []     -> StringMap.empty
      | hd::tl -> 
        (match hd with
        | Opcode.Str s | Opcode.Arg(_, Opcode.Str s)
        | Opcode.Arg(_, (Opcode.Arg(_, Opcode.Str s))) 
        | Opcode.Assign(_, Opcode.Str s) -> 
          add_string s n (filter_strings (n+1) tl)
        | _   -> filter_strings (n) tl
        )
    in
    filter_strings 0 (Array.to_list prg)
  in
  (*StringMap.iter (fun k v -> Printf.printf "%s->%s\n" k v) stringlit;*)
  (* Transfroms array into a list *)
  let prg_ops = Array.to_list prg in
  let rec makeheader = function
    | [] -> ""
    | hd :: tl -> (* Looks for functions *)
      (match hd with
        | Opcode.Prologue(s, _) ->
          (match s with
            | "fprintf" -> makeheader tl
            | "fopen"   -> makeheader tl
            | s         -> Printf.sprintf "%sglobal %s\n" (makeheader tl) s )
        | _ -> makeheader tl
      )
  in
  let full_prg = 
      [Opcode.Header (makeheader prg_ops)] @ prg_ops @ [Opcode.Tail ("")]
  in
  List.iter (fun x -> Printf.fprintf file_out "%s" x) (List.map (Opcode.string_of_stmt stringlit) full_prg)

