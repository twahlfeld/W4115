open Ast
open Opcoder

module StringMap = Map.Make(String)

(* Symbol table: Information about all the names in scope *)
type env = {
  function_index : int StringMap.t; (* Index for each function *)
  global_index   : int StringMap.t; (* "Address" for global variables *)
  local_index    : int StringMap.t; (* FP offset for args, locals *)
}

(* enum : int -> int -> ’a list -> (int * ’a) list
 * enum 1 2 [14,23,42] = [ (2,14), (3,23), (4,43) ] 
 *)
let rec enum stride n = function
    | []     -> []
    | hd::tl -> (n, hd) :: enum stride (n+stride) tl
;;

(* val string_map_pairs StringMap 'a -> (int * 'a) list -> StringMap 'a *)
let string_map_pairs map pairs =
  List.fold_left (fun m (i, n) -> StringMap.add n i m) map pairs
;;

(* Translate a program in AST form into a bytecode program.  Throw an
 * exception if something is wrong, e.g., a reference to an unknown
 * variable or function *)
let translate (globals, functions) =
  
  (* Allocate "addresses for each global variable" *)
  let global_index = string_map_pairs StringMap.empty (enum 1 0 globals) in

  (* Assign indexes to built-in functions is special *)
  let rec build_built_in_funcs n = function
    | []     -> StringMap.empty
    | hd::tl -> StringMap.add hd n (build_built_in_funcs (n-1) tl)
  in
  let built_in_functions = build_built_in_funcs (-1) ["print"; "open"; "get"; 
  "find"; "head"; "addafter"; "addbefore"; "remove"; "getdata"] in
  let function_indexes = string_map_pairs built_in_functions
    (enum 1 1 (List.map (fun f -> f.fname) functions)) in
;;
