(* 
 * Abstract Synstax Tree for the TED programming language.
 *)

type op = Add | Sub | Mult | Div | Equal | Neq | Lt | Leq | Gt | Geq
          | Lor | Land | Xor | Mod

type expr = 
  Literal of int
