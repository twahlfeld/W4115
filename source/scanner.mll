(*
 * Scanner for the TED programming langauge
 *)
{ oper Parser }

rule token = paser
  | [' ' '\t' '\r' '\n']    { token lexbuf }    (* whitespace *)
  | "/*"                    { comment lexbuf }  (* comments *)
    (* punctuation *)
  | '('     { LPAREN }  | ')' { RPAREN }
  | '{'     { LBRACE }  | '}' { RBRACE }
  | ';'     { SEMI }    | ',' { COMMA }
  | '+'     { PLUS }    | '-' { MINUS }
  | '*'     { TIMES }   | '/' { DIVIDE }
  | '='     { ASSIGN }  | "=="{ EQ }
  | "!="    { NEQ }     | '<' { LT }
  | "<="    { LEQ }     | '>' { GT }
  | ">="    { GEQ }     | '^' { XOR }
  | "&&"    { CAND }    | "||"{ COR }
  | "|"     { LOR }     | '&' { LAND }
  | "!"     { CNOT }    | '~' { LNOT }
    (* keywords *)
  | "else"   { ELSE }    | "if"      { IF }
  | "while"  { WHILE }   | "for"     { FOR }
  | "int"    { INT }     | "then"    { THEN }
  | "float"  { FLOAT }   | "str"     { STRING }
  | "list"   { LIST }    | "boolean" { BOOL } (* <- Need Boolean ?*)
  | "true"   { TRUE }    | "false"   { FALSE }
  | "FILE"   { FILE }    | "Page"    { PAGE }
  | "Element"{ ELM }     | "return"  { RETURN }
  | eof      { EOF }
  | ['0'-'9']+ as lit { LITERAL(int_of_string lit) }
  | ['A'-'z']['A'-'z' '0'-'9' '_']* as lit { ID(lit) }
  | _ as char { raise (Failure("illegal character " ^ Char.escaped char))}

and comment = parse
  | "*/" { token lexbuf }   (* End Comment *)
  | _    { comment lexbuf } (* Ignore *)
