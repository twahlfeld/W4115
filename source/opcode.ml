type bstmt =
  | Lit of int                (* Integer Literal *)
  | Str of string             (* String Literal *)
  | Bin of Ast.op             (* Binary Operators *)
  (*| Unop of Ast.unop        (* Unary Operators *)*)
  | Mov of string * string    (* Mov instruction *)
  | Local_var of int          (* Local Variables, Relative Frame Pointer offset *)
  | Glob_var of string        (* Global Variables, by absolute label *)
  | Get_gvar of string        (* Gets Global Variables *)
  | Set_gvar of string        (* Sets Global Variables  *)
  | Call of string            (* Call function by name or address *)
  | Push of string            (* Pushes arg onto stack *)
  | Pop of string             (* Pop statck in register *)
  | Fdecl of string           (* Function Declaration *)
  | Imprt                     (* Import/Extern function *)
  | Prologue of string        (* Start of every stack frame *)
  | Epilogue                  (* End of every stack frame *)
  | Assign of string * string (* Set variable *)
  | Ld_var of string          (* Load variable *)
  | Ld_reg of string          (* Load register into id *)
  | Ld_lit of int             (* Load lit into register *)

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
  | Lit(x)            -> string_of_int x
  | Str(x)            -> Bytes.to_string 
                       ("STRING" ^ (string_of_int acc) ^ ":" ^ 
                       (define_global 0 (explode x)))
  | Bin(Ast.Add)      -> Bytes.to_string "\tadd\trax, rdx\n"
  | Bin(Ast.Sub)      -> Bytes.to_string "\tsub\trax, rdx\n"
  | Bin(Ast.Mult)     -> Bytes.to_string "\tmul\trdx\n"
  | Bin(Ast.Div)      -> Bytes.to_string "\tdiv\trcx\n"
  | Bin(Ast.Equal)    -> Bytes.to_string "\tsub\trax, rdx\n"
  | Bin(Ast.Neq)      -> Bytes.to_string "\txor\trax, rdx\n"
  | Bin(Ast.Less)     -> Bytes.to_string "\tsub\trax, rdx\n\tshr\trax, 63\n"
  | Bin(Ast.Leq)      -> Printf.sprintf "\tcmp\trax, rdx\n" ^
                     "\tsetle dl" ^
                     "\tmovzx\trax, dl\n"
  | Bin(Ast.Greater)  -> Printf.sprintf "\tcmp\trax, rdx\n" ^
                     "\tsetg dl" ^
                     "\tmovzx\trax, dl\n"
  | Bin(Ast.Geq)      -> Printf.sprintf "\tcmp\trax, rdx\n" ^
                     "\tsetge dl" ^
                     "\tmovzx\trax, dl\n"
  | Mov(dst, src)     -> Printf.sprintf "\tmov\t%s, %s\n" dst src
  | Prologue(s)       -> Printf.sprintf "%s\n\tpush\tebp\n\tmov\tebp, esp\n" s
  | Epilogue          -> Bytes.to_string "\tpop\tebp\n\tret\n"
  | Local_var(x)      -> Printf.sprintf "[ebp-%xH]" (x*4)
  | Glob_var(s)       -> s
  | Set_gvar(s)       -> Printf.sprintf "\tmov\t[%s], rax\n" s
  | Get_gvar(s)       -> Printf.sprintf "\tmov\trax, [%s]\n" s
  | Call(s)           -> Printf.sprintf "\tcall\t%s\n" s
  | Push(s)           -> Printf.sprintf "\tpush\t%s\n" s
  | Pop(s)            -> Printf.sprintf "\tpop\t%s\n" s
  | Fdecl(s)          -> Printf.sprintf "%s\n" s
  | Imprt             -> Printf.sprintf "extern fprintf\nextern fopen\n"
  | Assign(dest, src) -> Printf.sprintf "\tmov\trax, [%s]\n\tmov\t[%s], rax\n" src dest
  | Ld_var(var)       -> Printf.sprintf "\tmov\trdx, rax\n\tmov\t[%s], rax\n" var
  | Ld_reg(reg)       -> Printf.sprintf "\tmov\t%s, rax\n" reg
  | Ld_lit(lit)       -> Printf.sprintf "\tmov\trax, %s\n" (string_of_int lit)
;;
