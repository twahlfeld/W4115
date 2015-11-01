(*
 * Scanner for the TED programming language
 *)
{ open Parser }

let D = ['0'-'9']
let L = ['A'-'z']
let E = ('E'|'e')('+'|'-')?D+



rule token = parse
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
  | '|'     { LOR }     | '&' { LAND }
  | '!'     { CNOT }    | '~' { LNOT }
  | '%'     { MOD }
    (* keywords *)
  | "else"   { ELSE }    | "if"      { IF }
  | "while"  { WHILE }   | "for"     { FOR }
  | "int"    { INT }     | "float"  { FLOAT }
  | "str"     { STRING } | "list"   { LIST }
  | "FILE"   { FILE }    | "Page"    { PAGE }
  | "Element"{ ELM }     | "return"  { RETURN }
  | eof      { EOF }
  | D+ as lit { LITERAL(int_of_string lit) }
  | L(D|L|'_')* as lit { ID(lit) }
  | (D+E) | (D*'.'D+E) | (D+'.'D*E) as lit { FLITERAL(float_of_string lit) }
  | _ as char { raise (Failure("illegal character " ^ Char.escaped char))}

and comment = parse
  | "*/" { token lexbuf }   (* End Comment *)
  | _    { comment lexbuf } (* Ignore *)
