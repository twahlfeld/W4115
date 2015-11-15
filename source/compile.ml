open Ast
open Opcode

module StringMap = Map.Make(String)
module StringSet = Set.Make(String)

(* Symbol table: Information about all the names in scope *)
type env = {
  function_index : StringSet.t; (* Index for each function *)
  global_index   : StringSet.t; (* "Address" for global variables *)
  local_index    : int StringMap.t; (* FP offset for args, locals *)
}

(* enum : int -> int -> ’a list -> (int * ’a) list
 * enum 1 2 [14,23,42] = [ (2,14), (3,23), (4,43) ] 
 *)
let rec enum stride n = function
    | []     -> []
    | hd::tl -> (n, hd) :: enum stride (n+stride) tl
;;

let string_map_pairs map pairs =
  List.fold_left (fun m (i, n) -> StringMap.add n i m) map pairs
;;

(* Translate a program in AST form into a bytecode program.  Throw an
 * exception if something is wrong, e.g., a reference to an unknown
 * variable or function *)
let translate (globals, functions) =

  (* Allocate "addresses for each global variable" *)
  let global_indexes = StringSet.empty in (*= string_map_pairs StringMap.empty (enum 1 0 globals) in*)

  (* Assign indexes to built-in functions is special *)
  let rec string_set_create = function
    | []     -> StringSet.empty
    | hd::tl -> StringSet.add (Printf.sprintf "%s" hd) (string_set_create tl)
  in
  let function_indexes = string_set_create (["print"; "open"; "get"; 
    "find"; "head"; "addafter"; "addbefore"; "remove"; "getdata"] @ 
      List.map (fun x -> Printf.sprintf "%s" x.fname) functions) in

  (* Translate a function in AST form into a list of bytecode statements *)
  let translate env fdecl =
    (* Bookkeeping: FP offsets for locals and arguments *)
    let num_formals = List.length fdecl.formals
    and num_locals = List.length fdecl.locals
    and local_offsets = enum (-8) (-8) fdecl.locals
    and formal_offsets = enum (1) (1) fdecl.formals in
    let env = { env with local_index = string_map_pairs
      StringMap.empty (local_offsets @ formal_offsets) } in

    let rec expr = function
      | Literal i -> [Ld_lit i]
      | Id s ->
        (try [Ld_var (Printf.sprintf "[rbp-%xH]" (StringMap.find s env.local_index))]
          with Not_found -> try [Glob_var (StringSet.find s env.global_index)]
          with Not_found -> raise (Failure ("undeclared variable " ^ s)))
      | Binop (e1, op, e2) -> expr e1 @ expr e2 @ [Bin op]
      | Assign (s, e) -> expr e @
        (try [Ld_reg (Printf.sprintf "[rbp-%xH]" (StringMap.find s env.local_index))]
          with Not_found -> try [Get_gvar (StringSet.find s env.global_index)]
          with Not_found -> raise (Failure ("undeclared variable" ^ s)))
      | Call (fname, actuals) -> (try
        (List.concat (List.map expr (List.rev actuals))) @
        [Call (StringSet.find fname env.function_index)]
          with Not_found -> raise (Failure ("undeclared function" ^ fname)))
      | Noexpr -> []
    in

    let rec stmt = function
      | Block sl        -> List.concat (List.map stmt sl)
      | Expr e          -> expr e
      | Return e        -> expr e @ [Epilogue]
      (*|  TODO IF STATEMENT
       *|  TODO FOR STATEMENT
       *|  TODO WHILE STATEMENT
       *)
    in
    [Prologue fdecl.fname] @ stmt (Block fdecl.body) @ [Epilogue]
  in
  let env = {
    function_index = function_indexes;
    global_index = global_indexes;
    local_index = StringMap.empty}
  in

  let func_bodies = List.map (translate env) functions in

  { num_globals = List.length globals;
    (* Concatenate the compiled functions and replace the function
       indexes in Jsr statements with PC values *)
    text = Array.of_list (
      List.map (
        function
          (*| Jsr i when i > 0 -> Jsr func_offset.(i)*)
          | _ as s -> s) (List.concat func_bodies)
    )
  }
