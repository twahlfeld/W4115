%{ open Ast %}

%token SEMI LPAREN RPAREN LBRACE RBRACE COMMA PLUS MINUS TIMES DIVIDE MOD
%token ASSIGN EQ NEQ LT LEQ GT GEQ RETURN IF ELSE FOR WHILE INT FLOAT
STRING LIST FILE PAGE ELM EOF
%token XOR CAND COR LOR LAND CNOT LNOT
%token <int> LITERAL
%token <string> ID

%nonassoc NOELSE /* Precedence and associativity of each operator*/
%nonassoc ELSE
%right ASSIGN
%left CAND COR CNOT
%left LOR LAND XOR
%left EQ NEQ
%left LT GT LEQ GEQ
%left PLUS MINUS
%left TIMES DIVIDE MOD
%right LNOT

%start program /* Start symbol */
%type <Ast.program> program /* Type returned by a program */

%%
program:
  decls EOF { $1 }

decls:
  /* nothing */ { [], [] }
  | decls vdecl { ($2 :: fst $1), snd $1 }
  | decls fdecl { fst $1, ($2 :: snd $1) }

fdecl:
  ID LPAREN formals_opt RPAREN LBRACE vdecl_list stmt_list RBRACE
                            { { fname = $1;
                                formals = $3;
                                locals = List.rev $6;
                                body = List.rev $7 } }
formals_opt:
  /* nothing */             { [] }
  | formal_list             { List.rev $1 }

formal_list:
  ID                        { [$1] }
  | formal_list COMMA ID    { $3 :: $1 }

vdecl_list:
  /* nothing */ { [] }
  | vdecl_list vdecl        { $2 :: $1 }

vdecl:
  prim ID SEMI              { $2 }
  | prim ID ASSIGN expr SEMI  { $2 }
  | obj ID SEMI               { $2 }
  | obj ID ASSIGN expr SEMI   { $2 }

 /* INT ID SEMI               { $2 }
  | LIST ID SEMI            { $2 }
  | FILE ID SEMI            { $2 }
  | ELM ID SEMI             { $2 }
  | STRING ID SEMI          { $2 }
  | FLOAT ID SEMI           { $2 }
  | PAGE ID SEMI            { $2 }*/

stmt_list:
  /* nothing */             { [] }
  | stmt_list stmt          { $2 :: $1 }

stmt:
  expr SEMI                                   { Expr($1) }
  | RETURN expr SEMI                          { Return($2) }
  | LBRACE stmt_list RBRACE                   { Block(List.rev $2) }
  | IF LPAREN expr RPAREN stmt %prec NOELSE   { If($3, $5, Block([])) }
  | IF LPAREN expr RPAREN stmt ELSE stmt      { If($3, $5, $7) }
  | FOR LPAREN expr_opt SEMI expr_opt SEMI expr_opt RPAREN stmt
                                              { For($3, $5, $7, $9) }
  | WHILE LPAREN expr RPAREN stmt             { While($3, $5) }

expr_opt:
  /* nothing */ { Noexpr }
  | expr { $1 }

expr:
  LITERAL                         { Literal($1) }
  | ID                            { Id($1) }
  | expr PLUS expr                { Binop($1, Add, $3) }
  | expr MINUS expr               { Binop($1, Sub, $3) }
  | expr TIMES expr               { Binop($1, Mult, $3) }
  | expr DIVIDE expr              { Binop($1, Div, $3) }
  | expr EQ expr                  { Binop($1, Equal, $3) }
  | expr NEQ expr                 { Binop($1, Neq, $3) }
  | expr LT expr                  { Binop($1, Less, $3) }
  | expr LEQ expr                 { Binop($1, Leq, $3) }
  | expr GT expr                  { Binop($1, Greater, $3) }
  | expr GEQ expr                 { Binop($1, Geq, $3) }
  | expr XOR expr                 { Binop($1, Xor, $3) }
  | expr CAND expr                { Binop($1, Cand, $3) }
  | expr COR expr                 { Binop($1, Cor, $3) }
  | expr LOR expr                 { Binop($1, Lor, $3) }
  | expr LAND expr                { Binop($1, Land, $3) }
  | expr MOD expr                 { Binop($1, Mod, $3) }
  | MINUS expr                    { Unary(Minus, $2) }
  | CNOT expr                     { Unary(Cnot, $2) }
  | LNOT expr                     { Unary(Lnot, $2) }
  | ID ASSIGN expr                { Assign($1, $3) }
  | ID LPAREN actuals_opt RPAREN  { Call($1, $3) }
  | LPAREN expr RPAREN            { $2 }

actuals_opt:
  /* nothing */   { [] }
  | actuals_list  { List.rev $1 }

actuals_list:
  expr                        { [$1] }
  | actuals_list COMMA expr   { $3 :: $1 }

