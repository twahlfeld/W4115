open Ast
open Opcode

module StringMap = Map.Make(String)
module StringSet = Set.Make(String)

(* Symbol table: Information about all the names in scope *)
type env = {
  function_index : string StringMap.t; (* Index for each function *)
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
  let global_indexes = StringSet.add "stdout" global_indexes in

  (* Assign indexes to built-in functions is special *)
  let rec string_map_create = function
    | []     -> StringMap.empty
    | (fn, fp)::tl -> StringMap.add fn fp (string_map_create tl)
  in
  let function_indexes = string_map_create ([("print", "fprintf"); 
    ("open", "fopen"); ("get", "get_title"); ("find", "find"); ("head", "head"); 
    ("addafter", "addafter"); ("addbefore", "addbefore"); ("remove", "remove");
    ("getdata", "getdata")] @ 
      List.map (fun x -> (x.fname, x.fname)) functions) 
  in
  

  (* Translate a function in AST form into a list of bytecode statements *)
  let translate env fdecl =
    (* Bookkeeping: FP offsets for locals and arguments *)
    let num_formals = List.length fdecl.formals
    and num_locals = List.length fdecl.locals
    and local_offsets = 
      enum (-8) (-8) (List.map (fun x -> match x with Ast.Var(_, s, _) -> s) fdecl.locals)
    and formal_offsets = 
      enum (1) (1) (List.map (fun x -> match x with Ast.Arg(_, s) -> s) fdecl.formals) in
    let env = { env with local_index = string_map_pairs
      StringMap.empty (local_offsets @ formal_offsets) } in

    let int_to_var = function
      | 1 -> "rdi"
      | 2 -> "rsi"
      | 3 -> "rdx"
      | 4 -> "rcx"
      | 5 -> "r8"
      | 6 -> "r9"
      | x -> if x > 6 then Printf.sprintf "rbp+%x" ((x-4)*8) 
        else Printf.sprintf "rbp-%xH" (abs x)
    in
    let rec to_arg acc hd =
      match acc with
      | 0 -> Arg("rdi", hd)
      | 1 -> Arg("rsi", hd)
      | 2 -> Arg("rdx", hd)
      | 3 -> Arg("rcx", hd)
      | 4 -> Arg("r9",  hd)
      | 5 -> Arg("r8",  hd)
      | _ -> Arg("", Fakenop)
    in
    let rec expr = function
      | Literal i -> [Lit i]
      | Id s -> 
        (try [Ld_var (int_to_var (StringMap.find s env.local_index))]
          with Not_found -> try [Glob_var (StringSet.find s env.global_index)]
          with Not_found -> raise (Failure ("undeclared variable " ^ s)))
      | Stringlit s    -> [Str s]
      | Binop (e1, op, e2) -> expr e1 @ expr e2 @ [Bin op]
      | Assign (s, e) -> 
        let exp = 
          match expr e with
          | [x] -> x
          | _   ->  Fakenop
        in
        let bassign = 
          (try [Str_var (int_to_var (StringMap.find s env.local_index))]
            with Not_found -> try [Get_gvar (StringSet.find s env.global_index)]
            with Not_found -> raise (Failure ("undeclared variable" ^ s)))
        in
        let asn = 
          match bassign with
          | [x] -> x
          | _   -> Fakenop
        in
        [Opcode.Assign(asn, exp)]
      | Call (fname, actuals) -> (try
        (List.rev (List.mapi to_arg (List.concat (List.map expr actuals)))) @
        [Opcode.Call (StringMap.find fname env.function_index)]
          with Not_found -> 
            StringMap.iter (fun k v -> Printf.printf "%s->%s\n" k v) env.function_index;
            Printf.printf "TESTING:%s\n" (StringMap.find fname env.function_index);
            raise (Failure ("undeclared function " ^ fname)))
      | Noexpr -> []
    in

    let rec stmt = function
      | Block sl        -> List.concat (List.map stmt sl)
      | Expr e          -> expr e @ []
      | Return e        -> [Fakenop]
      (*|  TODO IF STATEMENT
       *|  TODO FOR STATEMENT
       *|  TODO WHILE STATEMENT
       *)
    in
    [Prologue(fdecl.fname, (List.length fdecl.locals))] @ stmt(Block fdecl.body) @ [Epilogue]
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
