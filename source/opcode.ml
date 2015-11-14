type bstmt =
  | Lit of int             (* Integer Literal *)
  | Str of string          (* String Literal *)
  | Flit of float          (* Float Literal *)
  | Binop of Ast.op        (* Binary Operators *)
  (*| Unop of Ast.unop     (* Unary Operators *)*)
  | Mov of Ast.arg*Ast.arg (* Fetch global var *)
  | Call of Ast.arg        (* Call function by name or address *)
  | Push of Ast.arg        (* Pushes arg onto stack *)
  | Pop of string          (* Pop statck in register *)
  | Ret                    (* Returns to prev stack frame *)
  | Fdecl of string        (* Function Declaration *)
  | Imprt of string        (* Import/Extern function *)


let explode s =
  let rec exp i l =
    if i < 0 then (code l) else exp (i - 1) ((code s.[i]) :: l) in
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
  | Str(x) -> Bytes.to_string ("STRING" ^ (string_of_int acc) ^ ":" ^ (define_global 0 (explode x)))
;;
