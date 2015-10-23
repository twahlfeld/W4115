%{ open Ast %}

%token SEMI LPAREN RPAREN LBRACE RBRACE COMMA PLUS MINUS TIMES DIVIDE
%token ASSIGN EQ NEQ LT LEQ GT GEQ RETURN IF ELSE FOR WHILE INT EOF
%token <int> LITERAL
%token <string> ID

%nonassoc NOELSE (* Precedence and associativity of each operator *)
%nonassoc ELSE
%right ASSIGN
%left EQ NEQ
%left LT GT LEQ GEQ
%left PLUS MINUS
%left TIMES DIVIDE

%start program (* Start symbol *)
%type <Ast.program> program (* Type returned by a program *)

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
  (* nothing *)             { [] }
  | formal_list             { List.rev $1 }

formal_list:
  ID                        { [$1] }
  | formal_list COMMA ID    { $3 :: $1 }

vdecl_list:
  (* nothing *) { [] }
  | vdecl_list vdecl        { $2 :: $1 }

vdecl:
  INT ID SEMI               { $2 }

stmt_list:
  (* nothing *)             { [] }
  | stmt_list stmt          { $2 :: $1 }

stmt:
  expr SEMI                 { Expr($1) }
    | RETURN expr SEMI { Return($2) }
    | LBRACE stmt_list RBRACE { Block(List.rev $2) }
    | IF LPAREN expr RPAREN stmt %prec NOELSE { If($3, $5, Block([])) }
    | IF LPAREN expr RPAREN stmt ELSE stmt { If($3, $5, $7) }
    | FOR LPAREN expr_opt SEMI expr_opt SEMI expr_opt RPAREN stmt
    { For($3, $5, $7, $9) }
    | WHILE LPAREN expr RPAREN stmt { While($3, $5) }
    expr_opt:
      /* nothing */ { Noexpr }
      | expr { $1 }
