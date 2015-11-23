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

open Parsing;;
let _ = parse_error;;
# 1 "parser.mly"
 open Ast 
# 36 "parser.ml"
let yytransl_const = [|
  257 (* SEMI *);
  258 (* LPAREN *);
  259 (* RPAREN *);
  260 (* LBRACE *);
  261 (* RBRACE *);
  262 (* COMMA *);
  263 (* PLUS *);
  264 (* MINUS *);
  265 (* TIMES *);
  266 (* DIVIDE *);
  267 (* ASSIGN *);
  268 (* EQ *);
  269 (* NEQ *);
  270 (* LT *);
  271 (* LEQ *);
  272 (* GT *);
  273 (* GEQ *);
  274 (* RETURN *);
  275 (* IF *);
  276 (* ELSE *);
  277 (* FOR *);
  278 (* WHILE *);
  279 (* INT *);
    0 (* EOF *);
  283 (* STRING *);
    0|]

let yytransl_block = [|
  280 (* LITERAL *);
  281 (* ID *);
  282 (* STRING_LIT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\004\000\005\000\005\000\008\000\
\008\000\009\000\009\000\006\000\006\000\003\000\007\000\007\000\
\010\000\010\000\010\000\010\000\010\000\010\000\010\000\012\000\
\012\000\011\000\011\000\011\000\011\000\011\000\011\000\011\000\
\011\000\011\000\011\000\011\000\011\000\011\000\011\000\011\000\
\011\000\013\000\013\000\014\000\014\000\000\000"

let yylen = "\002\000\
\002\000\000\000\002\000\002\000\009\000\000\000\001\000\001\000\
\003\000\001\000\001\000\000\000\002\000\003\000\000\000\002\000\
\002\000\003\000\003\000\005\000\007\000\009\000\005\000\000\000\
\001\000\001\000\001\000\001\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\004\000\
\003\000\000\000\001\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\002\000\000\000\046\000\000\000\000\000\001\000\011\000\003\000\
\004\000\000\000\000\000\000\000\000\000\014\000\008\000\000\000\
\000\000\000\000\000\000\012\000\009\000\000\000\010\000\013\000\
\000\000\000\000\015\000\005\000\000\000\000\000\000\000\000\000\
\026\000\000\000\028\000\016\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\017\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\041\000\019\000\018\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\031\000\032\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\040\000\000\000\000\000\000\000\023\000\000\000\000\000\000\000\
\021\000\000\000\000\000\022\000"

let yydgoto = "\002\000\
\003\000\004\000\008\000\009\000\016\000\022\000\025\000\017\000\
\010\000\036\000\037\000\062\000\065\000\066\000"

let yysindex = "\011\000\
\000\000\000\000\000\000\001\000\011\255\000\000\000\000\000\000\
\000\000\023\255\063\255\069\255\048\255\000\000\000\000\072\255\
\071\255\075\255\057\255\000\000\000\000\239\254\000\000\000\000\
\033\255\007\255\000\000\000\000\007\255\082\255\088\255\105\255\
\000\000\009\255\000\000\000\000\144\255\032\000\042\255\161\255\
\007\255\007\255\007\255\007\255\007\255\000\000\007\255\007\255\
\007\255\007\255\007\255\007\255\007\255\007\255\007\255\007\255\
\000\000\000\000\000\000\047\000\073\000\107\255\062\000\073\000\
\114\255\112\255\073\000\040\255\040\255\000\000\000\000\084\000\
\084\000\104\255\104\255\104\255\104\255\101\255\007\255\101\255\
\000\000\007\255\090\255\120\255\000\000\073\000\101\255\007\255\
\000\000\121\255\101\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\126\255\000\000\000\000\000\000\
\128\255\000\000\000\000\000\000\000\000\067\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\127\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\131\255\000\000\135\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\038\255\000\000\000\000\002\255\
\000\000\143\255\039\255\178\255\195\255\000\000\000\000\001\255\
\103\255\212\255\229\255\246\255\017\000\000\000\131\255\000\000\
\000\000\000\000\076\255\000\000\000\000\093\255\000\000\145\255\
\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\125\000\000\000\000\000\000\000\122\000\000\000\
\000\000\252\255\230\255\211\255\000\000\000\000"

let yytablesize = 357
let yytable = "\038\000\
\006\000\033\000\040\000\033\000\044\000\023\000\033\000\044\000\
\026\000\007\000\044\000\001\000\033\000\033\000\060\000\061\000\
\063\000\064\000\067\000\045\000\068\000\069\000\070\000\071\000\
\072\000\073\000\074\000\075\000\076\000\077\000\033\000\034\000\
\035\000\084\000\026\000\011\000\027\000\028\000\025\000\039\000\
\025\000\039\000\090\000\026\000\039\000\027\000\058\000\012\000\
\049\000\050\000\029\000\030\000\061\000\031\000\032\000\086\000\
\033\000\034\000\035\000\029\000\030\000\061\000\031\000\032\000\
\013\000\033\000\034\000\035\000\015\000\014\000\015\000\015\000\
\015\000\083\000\018\000\085\000\019\000\020\000\020\000\020\000\
\020\000\021\000\089\000\041\000\015\000\015\000\092\000\015\000\
\015\000\042\000\015\000\015\000\015\000\020\000\020\000\045\000\
\020\000\020\000\045\000\020\000\020\000\020\000\026\000\034\000\
\027\000\034\000\043\000\079\000\034\000\087\000\047\000\048\000\
\049\000\050\000\034\000\034\000\081\000\082\000\029\000\030\000\
\088\000\031\000\032\000\091\000\033\000\034\000\035\000\027\000\
\006\000\027\000\007\000\024\000\027\000\027\000\027\000\027\000\
\027\000\042\000\027\000\027\000\027\000\027\000\027\000\027\000\
\046\000\043\000\024\000\024\000\039\000\000\000\047\000\048\000\
\049\000\050\000\000\000\051\000\052\000\053\000\054\000\055\000\
\056\000\059\000\000\000\000\000\000\000\000\000\000\000\047\000\
\048\000\049\000\050\000\000\000\051\000\052\000\053\000\054\000\
\055\000\056\000\029\000\000\000\029\000\000\000\000\000\029\000\
\029\000\029\000\000\000\000\000\000\000\029\000\029\000\029\000\
\029\000\029\000\029\000\030\000\000\000\030\000\000\000\000\000\
\030\000\030\000\030\000\000\000\000\000\000\000\030\000\030\000\
\030\000\030\000\030\000\030\000\035\000\000\000\035\000\000\000\
\000\000\035\000\000\000\000\000\000\000\000\000\000\000\035\000\
\035\000\035\000\035\000\035\000\035\000\036\000\000\000\036\000\
\000\000\000\000\036\000\000\000\000\000\000\000\000\000\000\000\
\036\000\036\000\036\000\036\000\036\000\036\000\037\000\000\000\
\037\000\000\000\000\000\037\000\000\000\000\000\000\000\000\000\
\000\000\037\000\037\000\037\000\037\000\037\000\037\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\038\000\000\000\038\000\000\000\000\000\038\000\005\000\
\000\000\000\000\000\000\007\000\038\000\038\000\038\000\038\000\
\038\000\038\000\057\000\000\000\000\000\000\000\047\000\048\000\
\049\000\050\000\000\000\051\000\052\000\053\000\054\000\055\000\
\056\000\078\000\000\000\000\000\000\000\047\000\048\000\049\000\
\050\000\000\000\051\000\052\000\053\000\054\000\055\000\056\000\
\080\000\000\000\000\000\000\000\047\000\048\000\049\000\050\000\
\000\000\051\000\052\000\053\000\054\000\055\000\056\000\047\000\
\048\000\049\000\050\000\000\000\051\000\052\000\053\000\054\000\
\055\000\056\000\047\000\048\000\049\000\050\000\000\000\000\000\
\000\000\053\000\054\000\055\000\056\000"

let yycheck = "\026\000\
\000\000\001\001\029\000\003\001\003\001\023\001\006\001\006\001\
\002\001\027\001\002\001\001\000\012\001\013\001\041\000\042\000\
\043\000\044\000\045\000\011\001\047\000\048\000\049\000\050\000\
\051\000\052\000\053\000\054\000\055\000\056\000\024\001\025\001\
\026\001\079\000\002\001\025\001\004\001\005\001\001\001\001\001\
\003\001\003\001\088\000\002\001\006\001\004\001\005\001\025\001\
\009\001\010\001\018\001\019\001\079\000\021\001\022\001\082\000\
\024\001\025\001\026\001\018\001\019\001\088\000\021\001\022\001\
\002\001\024\001\025\001\026\001\002\001\001\001\004\001\005\001\
\025\001\078\000\003\001\080\000\006\001\002\001\004\001\004\001\
\005\001\025\001\087\000\002\001\018\001\019\001\091\000\021\001\
\022\001\002\001\024\001\025\001\026\001\018\001\019\001\003\001\
\021\001\022\001\006\001\024\001\025\001\026\001\002\001\001\001\
\004\001\003\001\002\001\001\001\006\001\020\001\007\001\008\001\
\009\001\010\001\012\001\013\001\003\001\006\001\018\001\019\001\
\001\001\021\001\022\001\003\001\024\001\025\001\026\001\001\001\
\003\001\003\001\003\001\001\001\006\001\007\001\008\001\009\001\
\010\001\003\001\012\001\013\001\014\001\015\001\016\001\017\001\
\001\001\003\001\022\000\003\001\027\000\255\255\007\001\008\001\
\009\001\010\001\255\255\012\001\013\001\014\001\015\001\016\001\
\017\001\001\001\255\255\255\255\255\255\255\255\255\255\007\001\
\008\001\009\001\010\001\255\255\012\001\013\001\014\001\015\001\
\016\001\017\001\001\001\255\255\003\001\255\255\255\255\006\001\
\007\001\008\001\255\255\255\255\255\255\012\001\013\001\014\001\
\015\001\016\001\017\001\001\001\255\255\003\001\255\255\255\255\
\006\001\007\001\008\001\255\255\255\255\255\255\012\001\013\001\
\014\001\015\001\016\001\017\001\001\001\255\255\003\001\255\255\
\255\255\006\001\255\255\255\255\255\255\255\255\255\255\012\001\
\013\001\014\001\015\001\016\001\017\001\001\001\255\255\003\001\
\255\255\255\255\006\001\255\255\255\255\255\255\255\255\255\255\
\012\001\013\001\014\001\015\001\016\001\017\001\001\001\255\255\
\003\001\255\255\255\255\006\001\255\255\255\255\255\255\255\255\
\255\255\012\001\013\001\014\001\015\001\016\001\017\001\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\001\001\255\255\003\001\255\255\255\255\006\001\023\001\
\255\255\255\255\255\255\027\001\012\001\013\001\014\001\015\001\
\016\001\017\001\003\001\255\255\255\255\255\255\007\001\008\001\
\009\001\010\001\255\255\012\001\013\001\014\001\015\001\016\001\
\017\001\003\001\255\255\255\255\255\255\007\001\008\001\009\001\
\010\001\255\255\012\001\013\001\014\001\015\001\016\001\017\001\
\003\001\255\255\255\255\255\255\007\001\008\001\009\001\010\001\
\255\255\012\001\013\001\014\001\015\001\016\001\017\001\007\001\
\008\001\009\001\010\001\255\255\012\001\013\001\014\001\015\001\
\016\001\017\001\007\001\008\001\009\001\010\001\255\255\255\255\
\255\255\014\001\015\001\016\001\017\001"

let yynames_const = "\
  SEMI\000\
  LPAREN\000\
  RPAREN\000\
  LBRACE\000\
  RBRACE\000\
  COMMA\000\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  DIVIDE\000\
  ASSIGN\000\
  EQ\000\
  NEQ\000\
  LT\000\
  LEQ\000\
  GT\000\
  GEQ\000\
  RETURN\000\
  IF\000\
  ELSE\000\
  FOR\000\
  WHILE\000\
  INT\000\
  EOF\000\
  STRING\000\
  "

let yynames_block = "\
  LITERAL\000\
  ID\000\
  STRING_LIT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    Obj.repr(
# 26 "parser.mly"
            ( _1 )
# 273 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    Obj.repr(
# 29 "parser.mly"
                 ( [], [] )
# 279 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 30 "parser.mly"
               ( (_2 :: fst _1), snd _1 )
# 287 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fdecl) in
    Obj.repr(
# 31 "parser.mly"
               ( fst _1, (_2 :: snd _1) )
# 295 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 7 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 5 : 'formals_opt) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'vdecl_list) in
    let _8 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 35 "parser.mly"
     ( { fname = _2;
	 formals = _4;
	 locals = List.rev _7;
	 body = List.rev _8 } )
# 308 "parser.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 41 "parser.mly"
                  ( [] )
# 314 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal_list) in
    Obj.repr(
# 42 "parser.mly"
                  ( List.rev _1 )
# 321 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 45 "parser.mly"
                         ( [_1] )
# 328 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'formal_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 46 "parser.mly"
                         ( _3 :: _1 )
# 336 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 49 "parser.mly"
        ( Int )
# 342 "parser.ml"
               : 'type_decl))
; (fun __caml_parser_env ->
    Obj.repr(
# 50 "parser.mly"
             ( String )
# 348 "parser.ml"
               : 'type_decl))
; (fun __caml_parser_env ->
    Obj.repr(
# 53 "parser.mly"
                     ( [] )
# 354 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'vdecl_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 54 "parser.mly"
                     ( _2 :: _1 )
# 362 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'type_decl) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 57 "parser.mly"
                     ( Var(Int, _2, Noexpr) )
# 370 "parser.ml"
               : 'vdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 60 "parser.mly"
                   ( [] )
# 376 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 61 "parser.mly"
                   ( _2 :: _1 )
# 384 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 64 "parser.mly"
              ( Expr(_1) )
# 391 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 65 "parser.mly"
                     ( Return(_2) )
# 398 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 66 "parser.mly"
                            ( Block(List.rev _2) )
# 405 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 67 "parser.mly"
                                            ( If(_3, _5, Block([])) )
# 413 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 68 "parser.mly"
                                            ( If(_3, _5, _7) )
# 422 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : 'expr_opt) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : 'expr_opt) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'expr_opt) in
    let _9 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 70 "parser.mly"
     ( For(_3, _5, _7, _9) )
# 432 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 71 "parser.mly"
                                  ( While(_3, _5) )
# 440 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 74 "parser.mly"
                  ( Noexpr )
# 446 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 75 "parser.mly"
                  ( _1 )
# 453 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 78 "parser.mly"
                     ( Literal(_1) )
# 460 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 79 "parser.mly"
                     ( Id(_1) )
# 467 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 80 "parser.mly"
                     ( Stringlit(_1) )
# 474 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 81 "parser.mly"
                     ( Binop(_1, Add,   _3) )
# 482 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 82 "parser.mly"
                     ( Binop(_1, Sub,   _3) )
# 490 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 83 "parser.mly"
                     ( Binop(_1, Mult,  _3) )
# 498 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 84 "parser.mly"
                     ( Binop(_1, Div,   _3) )
# 506 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 85 "parser.mly"
                     ( Binop(_1, Equal, _3) )
# 514 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 86 "parser.mly"
                     ( Binop(_1, Neq,   _3) )
# 522 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 87 "parser.mly"
                     ( Binop(_1, Less,  _3) )
# 530 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 88 "parser.mly"
                     ( Binop(_1, Leq,   _3) )
# 538 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 89 "parser.mly"
                     ( Binop(_1, Greater,  _3) )
# 546 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 90 "parser.mly"
                     ( Binop(_1, Geq,   _3) )
# 554 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 91 "parser.mly"
                     ( Assign(_1, _3) )
# 562 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'actuals_opt) in
    Obj.repr(
# 92 "parser.mly"
                                 ( Call(_1, _3) )
# 570 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 93 "parser.mly"
                       ( _2 )
# 577 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 96 "parser.mly"
                  ( [] )
# 583 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'actuals_list) in
    Obj.repr(
# 97 "parser.mly"
                  ( List.rev _1 )
# 590 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 100 "parser.mly"
                            ( [_1] )
# 597 "parser.ml"
               : 'actuals_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'actuals_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 101 "parser.mly"
                            ( _3 :: _1 )
# 605 "parser.ml"
               : 'actuals_list))
(* Entry program *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let program (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.program)
