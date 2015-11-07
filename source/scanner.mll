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
  | '%'     { MOD }     | "->" { ACCVAL }
    (* keywords *)
  | "else"   { ELSE }    | "if"      { IF }
  | "while"  { WHILE }   | "for"     { FOR }
  | "int"    { INT }     | "float"  { FLOAT }
  | "str"    { STRING }  | "list"   { LIST }
  | "FILE"   { FILE }    | "Page"    { PAGE }
  | "Element"{ ELM }     | "return"  { RETURN }
    (* data values *)
  | "id"     { ELMID }   | "class"   { CLASS }
  | "html"   { HTML }    | "text"    { TEXT }
  | "type"   { TYPE }    | "attr"    { ATTR }
  | "children" { CHILDREN }
  | "response" { RESPONSE }
  | "url"    { URL } 
  | eof      { EOF }
  | D+ as lit { LITERAL(int_of_string lit) }
  | L(D|L|'_')* as lit { ID(lit) }
  | (D+E) | (D*'.'D+E) | (D+'.'D*E) as lit { FLITERAL(float_of_string lit) }
  | _ as char { raise (Failure("illegal character " ^ Char.escaped char))}

and comment = parse
  | "*/" { token lexbuf }   (* End Comment *)
  | _    { comment lexbuf } (* Ignore *)
