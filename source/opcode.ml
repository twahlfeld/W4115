type bstmt =
  | Lit of int                (* Integer Literal *)
  | Str of string             (* String Literal *)
  | Arg of string * bstmt
  | Bin of Ast.op             (* Binary Operators *)
  (*| Unop of Ast.unop        (* Unary Operators *)*)
  | Mov of string * bstmt    (* Mov instruction *)
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
  | Str_var of string         (* Stores variable *)
  | Header of string          (* Creates standard header *)
  | Tail of string            (* Creates a standard string *)
  | Fakenop
  | Ret of bstmt
;;

type prog = {
    num_globals : int;  (* Number of global variables *)
    text : bstmt array; (* Code for all the functions *)
  }

let explode s =
  let rec exp i l =
    if i < 0 then l 
    else
      let ch = s.[i] in
        (if i > 1 && ch = 'n' && s.[i-1] = '\\' then
          let tl = function
            | []     -> []
            | hd::[] -> []
            | hd::hd'::tl -> tl
          in
          exp (i - 2) (Char.code '\n' :: (tl l)) 
        else exp (i - 1) (Char.code ch :: l))
  in
  exp (String.length s - 1) []
;;

let rec define_global acc = function
  | [] -> if acc = 0 then "\n\t\tdb 00H\n" else "00H\n"
  | hd :: tl -> 
    if acc = 0 then 
      "\n\t\tdb " ^ (Printf.sprintf "%02XH, " hd) ^ define_global (acc+1) tl
    else if acc = 7 then
      (Printf.sprintf "%02XH" hd) ^ define_global 0 tl
    else 
      (Printf.sprintf "%02XH, " hd) ^ define_global (acc+1) tl
;;

let build_str s = 
  Printf.sprintf "STRING:" ^ (define_global 0 (explode s))
;;


let rec string_of_stmt = function
  | Lit(x)            -> string_of_int x
  | Str(s)            -> "STRING"
  | Arg(lhs, rhs)     -> Printf.sprintf "\tmov\t%s, %s\n" lhs (string_of_stmt rhs)
  | Bin(Ast.Add)      -> Printf.sprintf "\tadd\trax, rdx\n"
  | Bin(Ast.Sub)      -> Printf.sprintf "\tsub\trax, rdx\n"
  | Bin(Ast.Mult)     -> Printf.sprintf "\tmul\trdx\n"
  | Bin(Ast.Div)      -> Printf.sprintf "\tdiv\trcx\n"
  | Bin(Ast.Equal)    -> Printf.sprintf "\tsub\trax, rdx\n"
  | Bin(Ast.Neq)      -> Printf.sprintf "\txor\trax, rdx\n"
  | Bin(Ast.Less)     -> Printf.sprintf "\tsub\trax, rdx\n\tshr\trax, 63\n"
  | Bin(Ast.Leq)      -> Printf.sprintf "\tcmp\trax, rdx\n" ^
                         "\tsetle dl" ^
                         "\tmovzx\trax, dl\n"
  | Bin(Ast.Greater)  -> Printf.sprintf "\tcmp\trax, rdx\n" ^
                         "\tsetg dl" ^
                         "\tmovzx\trax, dl\n"
  | Bin(Ast.Geq)      -> Printf.sprintf "\tcmp\trax, rdx\n" ^
                         "\tsetge dl" ^
                         "\tmovzx\trax, dl\n"
  | Mov(dst, src)     -> Printf.sprintf "\tmov\t%s, %s\n" dst (string_of_stmt src)
  | Ret(b)            -> Printf.sprintf "\tmov\teax, %s\n" (string_of_stmt b)
  | Prologue(s)       -> Printf.sprintf "%s:\n\tpush\trbp\n\tmov\trbp, rsp\n" s
  | Epilogue          -> Printf.sprintf "\tpop\trbp\n\tret\n"
  | Local_var(x)      -> Printf.sprintf "[rbp-%XH]" (x*4)
  | Glob_var(s)       -> "["^s^"]"
  | Set_gvar(s)       -> Printf.sprintf "\tmov\t[%s], rax\n" s
  | Get_gvar(s)       -> Printf.sprintf "\tmov\trax, [%s]\n" s
  | Call(s)           -> Printf.sprintf "\tcall\t%s\n" s
  | Push(s)           -> Printf.sprintf "\tpush\t%s\n" s
  | Pop(s)            -> Printf.sprintf "\tpop\t%s\n" s
  | Fdecl(s)          -> Printf.sprintf "global %s\n" s
  | Imprt             -> Printf.sprintf "extern fprintf\nextern fopen\n"
  | Assign(dst, src) -> Printf.sprintf "\tmov\trax, %s\n%s" src dst
  | Ld_var(var)       -> Printf.sprintf "\tmov\trdx, rax\n\tmov\t%s, rax\n" var
  | Ld_reg(reg)       -> Printf.sprintf "\tmov\trax, %s\n" reg
  | Ld_lit(lit)       -> Printf.sprintf "\tmov\trax, %s\n" (string_of_int lit)
  | Str_var(var)      -> Printf.sprintf "\tmov\tqword [%s], rax\n" var
  | Header(s)         -> s ^ "\nextern fprintf\nextern fopen\nextern stdout\n"^
                             "\nSECTION .text\n"
  | Tail(s)           -> Printf.sprintf "SECTION .data\nSECTION .bss\nSECTION .rodata\n%s\n" s 
  | Fakenop           -> ""
;;
