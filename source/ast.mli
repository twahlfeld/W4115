(* 
 * Abstract Synstax Tree for the TED programming language.
 *)

type binop = Add | Sub | Mult | Div | Equal | Neq | Less | Leq | Greater | Geq
  | Lor | Land | Xor | Mod
type unop = MINUS | CNOT | LNOT

type expr = (* Expressions *)
  Literal of int (* 42 *)
  | Fliteral of float (* 3.14.5 *)
  | Noexpr (* for (;;) *)
  | Id of string (* foo *)
  | Assign of string * expr (* foo = 42 *)
  | Binop of expr * binop * expr (* a + b *)
  | Call of string * expr list (* foo(1, 25 *)

type stmt = (* Statements *)
  Block of stmt list (* { ... } *)
  | Expr of expr (* foo = bar + 3; *)
  | Return of expr (* return 42; *)
  | If of expr * stmt * stmt (* if (foo == 42) {} else {} *)
  | For of expr * expr * expr * stmt (* for (i=0;i<10;i=i+1) { ... } *)
  | While of expr * stmt (* while (i<10) { i = i + 1 } *)

type func_decl = {
  fname : string; (* Name of the function *)
  formals : string list; (* Formal argument names *)
  locals : string list; (* Locally defined variables *)
  body : stmt list;
}
type program = string list * func_decl list (* global vars, funcs *)
