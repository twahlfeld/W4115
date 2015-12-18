type token =
  | SEMI
  | LPAREN
  | RPAREN
  | LBRACE
  | RBRACE
  | COMMA
  | PLUS
  | MINUS
  | TIMES
  | DIVIDE
  | ASSIGN
  | EQ
  | NEQ
  | LT
  | LEQ
  | GT
  | GEQ
  | RETURN
  | IF
  | ELSE
  | FOR
  | WHILE
  | INT
  | LITERAL of (int)
  | ID of (string)
  | STRING_LIT of (string)
  | EOF
  | STRING
  | LIST
  | ELEMENT
  | PAGE

val program :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.program
