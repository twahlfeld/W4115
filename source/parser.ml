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
  | STRING of (string)
  | EOF

open Parsing;;
let _ = parse_error;;
# 1 "parser.mly"
 open Ast 
# 35 "parser.ml"
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
    0|]

let yytransl_block = [|
  280 (* LITERAL *);
  281 (* ID *);
  282 (* STRING *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\004\000\005\000\005\000\008\000\
\008\000\006\000\006\000\003\000\007\000\007\000\009\000\009\000\
\009\000\009\000\009\000\009\000\009\000\011\000\011\000\010\000\
\010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
\010\000\010\000\010\000\010\000\010\000\010\000\010\000\012\000\
\012\000\013\000\013\000\000\000"

let yylen = "\002\000\
\002\000\000\000\002\000\002\000\009\000\000\000\001\000\001\000\
\003\000\000\000\002\000\003\000\000\000\002\000\002\000\003\000\
\003\000\005\000\007\000\009\000\005\000\000\000\001\000\001\000\
\001\000\001\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\004\000\003\000\000\000\
\001\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\002\000\000\000\044\000\000\000\000\000\001\000\003\000\004\000\
\000\000\012\000\000\000\008\000\000\000\000\000\000\000\000\000\
\010\000\009\000\000\000\000\000\011\000\000\000\000\000\000\000\
\013\000\005\000\000\000\000\000\000\000\000\000\024\000\000\000\
\026\000\014\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\015\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\039\000\017\000\
\016\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\029\000\030\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\038\000\000\000\
\000\000\000\000\021\000\000\000\000\000\000\000\019\000\000\000\
\000\000\020\000"

let yydgoto = "\002\000\
\003\000\004\000\007\000\008\000\013\000\019\000\022\000\014\000\
\034\000\035\000\060\000\063\000\064\000"

let yysindex = "\005\000\
\000\000\000\000\000\000\001\000\241\254\000\000\000\000\000\000\
\047\255\000\000\243\254\000\000\062\255\030\255\046\255\045\255\
\000\000\000\000\050\255\052\255\000\000\033\255\074\255\007\255\
\000\000\000\000\007\255\077\255\080\255\082\255\000\000\009\255\
\000\000\000\000\144\255\028\000\042\255\161\255\007\255\007\255\
\007\255\007\255\007\255\000\000\007\255\007\255\007\255\007\255\
\007\255\007\255\007\255\007\255\007\255\007\255\000\000\000\000\
\000\000\043\000\069\000\089\255\058\000\069\000\107\255\111\255\
\069\000\098\255\098\255\000\000\000\000\080\000\080\000\104\255\
\104\255\104\255\104\255\101\255\007\255\101\255\000\000\007\255\
\109\255\117\255\000\000\069\000\101\255\007\255\000\000\118\255\
\101\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\121\255\000\000\000\000\128\255\000\000\000\000\
\000\000\000\000\067\255\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\127\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\131\255\
\000\000\135\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\038\255\000\000\000\000\002\255\000\000\143\255\
\039\255\178\255\195\255\000\000\000\000\001\255\103\255\212\255\
\229\255\246\255\013\000\000\000\131\255\000\000\000\000\000\000\
\076\255\000\000\000\000\093\255\000\000\145\255\000\000\000\000\
\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\128\000\000\000\000\000\000\000\124\000\000\000\
\254\255\232\255\213\255\000\000\000\000"

let yytablesize = 353
let yytable = "\036\000\
\006\000\031\000\038\000\031\000\042\000\001\000\031\000\042\000\
\024\000\009\000\042\000\012\000\031\000\031\000\058\000\059\000\
\061\000\062\000\065\000\043\000\066\000\067\000\068\000\069\000\
\070\000\071\000\072\000\073\000\074\000\075\000\031\000\032\000\
\033\000\082\000\024\000\016\000\025\000\026\000\023\000\037\000\
\023\000\037\000\088\000\024\000\037\000\025\000\056\000\010\000\
\011\000\017\000\027\000\028\000\059\000\029\000\030\000\084\000\
\031\000\032\000\033\000\027\000\028\000\059\000\029\000\030\000\
\015\000\031\000\032\000\033\000\013\000\018\000\013\000\013\000\
\020\000\081\000\010\000\083\000\023\000\018\000\039\000\018\000\
\018\000\040\000\087\000\041\000\013\000\013\000\090\000\013\000\
\013\000\077\000\013\000\013\000\013\000\018\000\018\000\043\000\
\018\000\018\000\043\000\018\000\018\000\018\000\024\000\032\000\
\025\000\032\000\047\000\048\000\032\000\079\000\045\000\046\000\
\047\000\048\000\032\000\032\000\080\000\086\000\027\000\028\000\
\089\000\029\000\030\000\006\000\031\000\032\000\033\000\025\000\
\085\000\025\000\007\000\022\000\025\000\025\000\025\000\025\000\
\025\000\040\000\025\000\025\000\025\000\025\000\025\000\025\000\
\044\000\041\000\021\000\022\000\037\000\000\000\045\000\046\000\
\047\000\048\000\000\000\049\000\050\000\051\000\052\000\053\000\
\054\000\057\000\000\000\000\000\000\000\000\000\000\000\045\000\
\046\000\047\000\048\000\000\000\049\000\050\000\051\000\052\000\
\053\000\054\000\027\000\000\000\027\000\000\000\000\000\027\000\
\027\000\027\000\000\000\000\000\000\000\027\000\027\000\027\000\
\027\000\027\000\027\000\028\000\000\000\028\000\000\000\000\000\
\028\000\028\000\028\000\000\000\000\000\000\000\028\000\028\000\
\028\000\028\000\028\000\028\000\033\000\000\000\033\000\000\000\
\000\000\033\000\000\000\000\000\000\000\000\000\000\000\033\000\
\033\000\033\000\033\000\033\000\033\000\034\000\000\000\034\000\
\000\000\000\000\034\000\000\000\000\000\000\000\000\000\000\000\
\034\000\034\000\034\000\034\000\034\000\034\000\035\000\000\000\
\035\000\000\000\000\000\035\000\000\000\000\000\000\000\000\000\
\000\000\035\000\035\000\035\000\035\000\035\000\035\000\000\000\
\000\000\000\000\000\000\000\000\000\000\036\000\000\000\036\000\
\000\000\000\000\036\000\000\000\000\000\000\000\000\000\005\000\
\036\000\036\000\036\000\036\000\036\000\036\000\055\000\000\000\
\000\000\000\000\045\000\046\000\047\000\048\000\000\000\049\000\
\050\000\051\000\052\000\053\000\054\000\076\000\000\000\000\000\
\000\000\045\000\046\000\047\000\048\000\000\000\049\000\050\000\
\051\000\052\000\053\000\054\000\078\000\000\000\000\000\000\000\
\045\000\046\000\047\000\048\000\000\000\049\000\050\000\051\000\
\052\000\053\000\054\000\045\000\046\000\047\000\048\000\000\000\
\049\000\050\000\051\000\052\000\053\000\054\000\045\000\046\000\
\047\000\048\000\000\000\000\000\000\000\051\000\052\000\053\000\
\054\000"

let yycheck = "\024\000\
\000\000\001\001\027\000\003\001\003\001\001\000\006\001\006\001\
\002\001\025\001\002\001\025\001\012\001\013\001\039\000\040\000\
\041\000\042\000\043\000\011\001\045\000\046\000\047\000\048\000\
\049\000\050\000\051\000\052\000\053\000\054\000\024\001\025\001\
\026\001\077\000\002\001\006\001\004\001\005\001\001\001\001\001\
\003\001\003\001\086\000\002\001\006\001\004\001\005\001\001\001\
\002\001\004\001\018\001\019\001\077\000\021\001\022\001\080\000\
\024\001\025\001\026\001\018\001\019\001\086\000\021\001\022\001\
\003\001\024\001\025\001\026\001\002\001\025\001\004\001\005\001\
\023\001\076\000\001\001\078\000\025\001\002\001\002\001\004\001\
\005\001\002\001\085\000\002\001\018\001\019\001\089\000\021\001\
\022\001\001\001\024\001\025\001\026\001\018\001\019\001\003\001\
\021\001\022\001\006\001\024\001\025\001\026\001\002\001\001\001\
\004\001\003\001\009\001\010\001\006\001\003\001\007\001\008\001\
\009\001\010\001\012\001\013\001\006\001\001\001\018\001\019\001\
\003\001\021\001\022\001\003\001\024\001\025\001\026\001\001\001\
\020\001\003\001\003\001\001\001\006\001\007\001\008\001\009\001\
\010\001\003\001\012\001\013\001\014\001\015\001\016\001\017\001\
\001\001\003\001\019\000\003\001\025\000\255\255\007\001\008\001\
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
\255\255\255\255\255\255\255\255\255\255\001\001\255\255\003\001\
\255\255\255\255\006\001\255\255\255\255\255\255\255\255\023\001\
\012\001\013\001\014\001\015\001\016\001\017\001\003\001\255\255\
\255\255\255\255\007\001\008\001\009\001\010\001\255\255\012\001\
\013\001\014\001\015\001\016\001\017\001\003\001\255\255\255\255\
\255\255\007\001\008\001\009\001\010\001\255\255\012\001\013\001\
\014\001\015\001\016\001\017\001\003\001\255\255\255\255\255\255\
\007\001\008\001\009\001\010\001\255\255\012\001\013\001\014\001\
\015\001\016\001\017\001\007\001\008\001\009\001\010\001\255\255\
\012\001\013\001\014\001\015\001\016\001\017\001\007\001\008\001\
\009\001\010\001\255\255\255\255\255\255\014\001\015\001\016\001\
\017\001"

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
  "

let yynames_block = "\
  LITERAL\000\
  ID\000\
  STRING\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    Obj.repr(
# 25 "parser.mly"
            ( _1 )
# 270 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    Obj.repr(
# 28 "parser.mly"
                 ( [], [] )
# 276 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 29 "parser.mly"
               ( (_2 :: fst _1), snd _1 )
# 284 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fdecl) in
    Obj.repr(
# 30 "parser.mly"
               ( fst _1, (_2 :: snd _1) )
# 292 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 7 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 5 : 'formals_opt) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'vdecl_list) in
    let _8 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 34 "parser.mly"
     ( { fname = _2;
	 formals = _4;
	 locals = List.rev _7;
	 body = List.rev _8 } )
# 305 "parser.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 40 "parser.mly"
                  ( [] )
# 311 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal_list) in
    Obj.repr(
# 41 "parser.mly"
                  ( List.rev _1 )
# 318 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 44 "parser.mly"
                         ( [_1] )
# 325 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'formal_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 45 "parser.mly"
                         ( _3 :: _1 )
# 333 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 48 "parser.mly"
                     ( [] )
# 339 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'vdecl_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 49 "parser.mly"
                     ( _2 :: _1 )
# 347 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 52 "parser.mly"
               ( _2 )
# 354 "parser.ml"
               : 'vdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 55 "parser.mly"
                   ( [] )
# 360 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 56 "parser.mly"
                   ( _2 :: _1 )
# 368 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 59 "parser.mly"
              ( Expr(_1) )
# 375 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 60 "parser.mly"
                     ( Return(_2) )
# 382 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 61 "parser.mly"
                            ( Block(List.rev _2) )
# 389 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 62 "parser.mly"
                                            ( If(_3, _5, Block([])) )
# 397 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 63 "parser.mly"
                                            ( If(_3, _5, _7) )
# 406 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : 'expr_opt) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : 'expr_opt) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'expr_opt) in
    let _9 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 65 "parser.mly"
     ( For(_3, _5, _7, _9) )
# 416 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 66 "parser.mly"
                                  ( While(_3, _5) )
# 424 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 69 "parser.mly"
                  ( Noexpr )
# 430 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 70 "parser.mly"
                  ( _1 )
# 437 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 73 "parser.mly"
                     ( Literal(_1) )
# 444 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 74 "parser.mly"
                     ( Id(_1) )
# 451 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 75 "parser.mly"
                     ( String(_1) )
# 458 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 76 "parser.mly"
                     ( Binop(_1, Add,   _3) )
# 466 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 77 "parser.mly"
                     ( Binop(_1, Sub,   _3) )
# 474 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 78 "parser.mly"
                     ( Binop(_1, Mult,  _3) )
# 482 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 79 "parser.mly"
                     ( Binop(_1, Div,   _3) )
# 490 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 80 "parser.mly"
                     ( Binop(_1, Equal, _3) )
# 498 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 81 "parser.mly"
                     ( Binop(_1, Neq,   _3) )
# 506 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 82 "parser.mly"
                     ( Binop(_1, Less,  _3) )
# 514 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 83 "parser.mly"
                     ( Binop(_1, Leq,   _3) )
# 522 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 84 "parser.mly"
                     ( Binop(_1, Greater,  _3) )
# 530 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 85 "parser.mly"
                     ( Binop(_1, Geq,   _3) )
# 538 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 86 "parser.mly"
                     ( Assign(_1, _3) )
# 546 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'actuals_opt) in
    Obj.repr(
# 87 "parser.mly"
                                 ( Call(_1, _3) )
# 554 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 88 "parser.mly"
                       ( _2 )
# 561 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 91 "parser.mly"
                  ( [] )
# 567 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'actuals_list) in
    Obj.repr(
# 92 "parser.mly"
                  ( List.rev _1 )
# 574 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 95 "parser.mly"
                            ( [_1] )
# 581 "parser.ml"
               : 'actuals_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'actuals_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 96 "parser.mly"
                            ( _3 :: _1 )
# 589 "parser.ml"
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
