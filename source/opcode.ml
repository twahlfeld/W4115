type bstmt =
  | Lit of int             (* Integer Literal *)
  | Str of string          (* String Literal *)
  (*| Flit of float          (* Float Literal *)*)
  | Bin of Ast.op        (* Binary Operators *)
  (*| Unop of Ast.unop     (* Unary Operators *)*)
  | Mov of Ast.arg*Ast.arg (* Fetch global var *)
  | Call of Ast.arg        (* Call function by name or address *)
  | Push of Ast.arg        (* Pushes arg onto stack *)
  | Pop of string          (* Pop statck in register *)
  | Ret                    (* Returns to prev stack frame *)
  | Fdecl of string        (* Function Declaration *)
  | Imprt of string        (* Import/Extern function *)
;;

let explode s =
  let rec exp i l =
    if i < 0 then l else exp (i - 1) ((Char.code s.[i]) :: l) in
  exp (String.length s - 1) []
;;

let rec define_global acc = function
  | [] -> "00H\n"
  | hd :: tl -> 
    if acc = 0 then 
      "\n\t\tdb " ^ (Printf.sprintf "%02xH, " hd) ^ define_global (acc+1) tl
    else if acc = 7 then
      (Printf.sprintf "%02xH" hd) ^ define_global 0 tl
    else 
      (Printf.sprintf "%02xH, " hd) ^ define_global (acc+1) tl
;;

let string_of_stmt acc = function
  | Lit(x) -> string_of_int x
  | Str(x)           -> Bytes.to_string 
                       ("STRING" ^ (string_of_int acc) ^ ":" ^ 
                       (define_global 0 (explode x)))
  | Bin(Ast.Add)     -> Bytes.to_string "\tadd\teax, edx\n"
  | Bin(Ast.Sub)     -> Bytes.to_string "\tsub\teax, edx\n"
  | Bin(Ast.Mult)    -> Bytes.to_string "\tmul\tedx\n"
  | Bin(Ast.Div)     -> Bytes.to_string "\tdiv\tecx\n"
  | Bin(Ast.Equal)   -> Bytes.to_string "\tsub\teax, edx\n"
  | Bin(Ast.Neq)     -> Bytes.to_string "\txor\teax, edx\n"
  | Bin(Ast.Less)    -> Bytes.to_string "\tsub\teax, edx\n\tshr\teax, 31\n"
  | Bin(Ast.Leq)     -> Bytes.to_string (
                     "\tcmp\teax, edx\n"
                     "\tjle LE" ^ (string_of_int acc) ^ "\n" ^ 
                      "\tmov\teax, 0\n" ^
                      "\tjmp\tENDLE" ^ (string_of_int acc) ^"\n" ^ 
                      "LE" ^ (string_of_int acc) ^ ":\n" ^
                      "\tmov eax, 1\n" ^
                      "ENDLE" ^ (string_of_int acc) ^ ":\n")
  | Bin(Ast.Greater) -> Bytes.to_string (
                     "\tcmp\teax, edx\n"
                     "\tjge GE" ^ (string_of_int acc) ^ "\n" ^ 
                      "\tmov\teax, 0\n" ^
                      "\tjmp\tENDGE" ^ (string_of_int acc) ^"\n" ^ 
                      "GE" ^ (string_of_int acc) ^ ":\n" ^
                      "\tmov eax, 1\n" ^
                      "ENDGE" ^ (string_of_int acc) ^ ":\n")
;;
