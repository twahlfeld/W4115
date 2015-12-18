type op = Add | Sub | Mult | Div | Equal | Neq | Less | Leq | Greater | Geq

type expr =
    Literal of int
  | Id of string
  | Stringlit of string  
  | Binop of expr * op * expr
  | Assign of string * expr
  | Call of string * expr list
  | Noexpr

type stmt =
    Block of stmt list
  | Expr of expr
  | Return of expr
  | If of expr * stmt * stmt
  | For of expr * expr * expr * stmt
  | While of expr * stmt

type type_def =
    Int
    | String
    | List
    | Page
    | Element

(* type * ID * value *)
type var = Var of type_def * string * expr

type arg = Arg of type_def * string

type func_decl = {
    fname : string;
    formals : arg list;
    locals : var list;
    body : stmt list;
}

type program = var list * func_decl list

