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
  | FILE
  | ANY

open Parsing;;
let _ = parse_error;;
# 1 "parser.mly"
 open Ast 
# 41 "parser.ml"
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
  284 (* LIST *);
  285 (* ELEMENT *);
  286 (* PAGE *);
  287 (* FILE *);
  288 (* ANY *);
    0|]

let yytransl_block = [|
  280 (* LITERAL *);
  281 (* ID *);
  282 (* STRING_LIT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\004\000\006\000\006\000\009\000\
\009\000\005\000\005\000\005\000\005\000\005\000\005\000\005\000\
\007\000\007\000\003\000\003\000\008\000\008\000\011\000\011\000\
\011\000\011\000\011\000\011\000\011\000\012\000\012\000\010\000\
\010\000\010\000\010\000\010\000\010\000\010\000\010\000\010\000\
\010\000\010\000\010\000\010\000\010\000\010\000\010\000\013\000\
\013\000\014\000\014\000\000\000"

let yylen = "\002\000\
\002\000\000\000\002\000\002\000\009\000\000\000\001\000\002\000\
\004\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
\000\000\002\000\003\000\005\000\000\000\002\000\002\000\003\000\
\003\000\005\000\007\000\009\000\005\000\000\000\001\000\001\000\
\001\000\001\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\004\000\003\000\000\000\
\001\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\002\000\000\000\052\000\000\000\010\000\001\000\013\000\014\000\
\015\000\016\000\011\000\012\000\003\000\004\000\000\000\000\000\
\019\000\000\000\000\000\000\000\000\000\000\000\000\000\032\000\
\000\000\034\000\000\000\008\000\000\000\000\000\000\000\000\000\
\000\000\020\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\017\000\000\000\047\000\000\000\
\000\000\000\000\000\000\000\000\000\000\037\000\038\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\009\000\046\000\
\000\000\018\000\000\000\000\000\000\000\000\000\021\000\005\000\
\000\000\000\000\000\000\000\000\000\000\022\000\000\000\000\000\
\000\000\000\000\000\000\023\000\025\000\024\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\029\000\
\000\000\000\000\027\000\000\000\000\000\028\000"

let yydgoto = "\002\000\
\003\000\004\000\013\000\014\000\015\000\021\000\062\000\068\000\
\022\000\077\000\078\000\089\000\049\000\050\000"

let yysindex = "\008\000\
\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\020\255\029\255\
\000\000\112\000\003\255\026\255\023\255\053\255\003\255\000\000\
\037\255\000\000\142\255\000\000\061\255\112\000\048\000\003\255\
\003\255\000\000\003\255\003\255\003\255\003\255\003\255\003\255\
\003\255\003\255\003\255\003\255\000\000\041\255\000\000\106\000\
\073\255\079\255\106\000\062\255\062\255\000\000\000\000\117\000\
\117\000\089\255\089\255\089\255\089\255\112\000\000\000\000\000\
\003\255\000\000\043\255\031\255\106\000\001\255\000\000\000\000\
\003\255\086\255\091\255\098\255\159\255\000\000\056\255\176\255\
\003\255\003\255\003\255\000\000\000\000\000\000\063\000\106\000\
\104\255\078\000\099\255\003\255\099\255\087\255\105\255\000\000\
\099\255\003\255\000\000\107\255\099\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\110\255\000\000\000\000\000\000\116\255\000\000\000\000\
\125\255\000\000\000\000\000\000\000\000\000\000\000\000\119\255\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\004\255\
\000\000\124\255\005\255\193\255\210\255\000\000\000\000\095\000\
\099\000\227\255\244\255\005\000\033\000\065\255\000\000\000\000\
\000\000\000\000\000\000\000\000\038\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\128\255\000\000\000\000\000\000\000\000\000\000\101\255\
\000\000\000\000\000\000\128\255\000\000\090\255\000\000\000\000\
\000\000\127\255\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\074\000\000\000\241\255\000\000\000\000\073\000\
\000\000\237\255\197\255\201\255\000\000\000\000"

let yytablesize = 400
let yytable = "\027\000\
\006\000\017\000\020\000\031\000\023\000\045\000\050\000\045\000\
\001\000\050\000\045\000\019\000\048\000\051\000\046\000\052\000\
\053\000\054\000\055\000\056\000\057\000\058\000\059\000\060\000\
\061\000\029\000\024\000\025\000\026\000\017\000\018\000\094\000\
\023\000\096\000\071\000\072\000\095\000\099\000\032\000\019\000\
\051\000\102\000\100\000\051\000\016\000\069\000\067\000\033\000\
\073\000\074\000\028\000\075\000\076\000\080\000\024\000\025\000\
\026\000\023\000\030\000\071\000\085\000\087\000\088\000\090\000\
\045\000\063\000\021\000\070\000\021\000\021\000\037\000\038\000\
\088\000\073\000\074\000\064\000\075\000\076\000\088\000\024\000\
\025\000\026\000\021\000\021\000\065\000\021\000\021\000\081\000\
\021\000\021\000\021\000\026\000\082\000\026\000\026\000\035\000\
\036\000\037\000\038\000\083\000\023\000\031\000\071\000\031\000\
\092\000\098\000\097\000\026\000\026\000\101\000\026\000\026\000\
\006\000\026\000\026\000\026\000\073\000\074\000\007\000\075\000\
\076\000\048\000\024\000\025\000\026\000\033\000\049\000\033\000\
\030\000\030\000\033\000\033\000\033\000\033\000\033\000\066\000\
\033\000\033\000\033\000\033\000\033\000\033\000\034\000\079\000\
\000\000\000\000\000\000\000\000\035\000\036\000\037\000\038\000\
\000\000\039\000\040\000\041\000\042\000\043\000\044\000\084\000\
\000\000\000\000\000\000\000\000\000\000\035\000\036\000\037\000\
\038\000\000\000\039\000\040\000\041\000\042\000\043\000\044\000\
\086\000\000\000\000\000\000\000\000\000\000\000\035\000\036\000\
\037\000\038\000\000\000\039\000\040\000\041\000\042\000\043\000\
\044\000\035\000\000\000\035\000\000\000\000\000\035\000\035\000\
\035\000\000\000\000\000\000\000\035\000\035\000\035\000\035\000\
\035\000\035\000\036\000\000\000\036\000\000\000\000\000\036\000\
\036\000\036\000\000\000\000\000\000\000\036\000\036\000\036\000\
\036\000\036\000\036\000\041\000\000\000\041\000\000\000\000\000\
\041\000\000\000\000\000\000\000\000\000\000\000\041\000\041\000\
\041\000\041\000\041\000\041\000\042\000\000\000\042\000\000\000\
\000\000\042\000\000\000\000\000\000\000\000\000\000\000\042\000\
\042\000\042\000\042\000\042\000\042\000\043\000\000\000\043\000\
\000\000\000\000\043\000\000\000\000\000\000\000\000\000\000\000\
\043\000\043\000\043\000\043\000\043\000\043\000\000\000\005\000\
\000\000\000\000\000\000\007\000\008\000\009\000\010\000\011\000\
\012\000\044\000\000\000\044\000\000\000\000\000\044\000\000\000\
\000\000\000\000\000\000\000\000\044\000\044\000\044\000\044\000\
\044\000\044\000\047\000\000\000\000\000\000\000\035\000\036\000\
\037\000\038\000\000\000\039\000\040\000\041\000\042\000\043\000\
\044\000\091\000\000\000\000\000\000\000\035\000\036\000\037\000\
\038\000\000\000\039\000\040\000\041\000\042\000\043\000\044\000\
\093\000\000\000\000\000\000\000\035\000\036\000\037\000\038\000\
\000\000\039\000\040\000\041\000\042\000\043\000\044\000\039\000\
\000\000\039\000\000\000\040\000\039\000\040\000\000\000\000\000\
\040\000\000\000\039\000\039\000\000\000\000\000\040\000\040\000\
\035\000\036\000\037\000\038\000\000\000\039\000\040\000\041\000\
\042\000\043\000\044\000\035\000\036\000\037\000\038\000\000\000\
\000\000\000\000\041\000\042\000\043\000\044\000\005\000\000\000\
\000\000\000\000\007\000\008\000\009\000\010\000\011\000\012\000"

let yycheck = "\019\000\
\000\000\001\001\018\000\023\000\002\001\001\001\003\001\003\001\
\001\000\006\001\006\001\011\001\032\000\033\000\030\000\035\000\
\036\000\037\000\038\000\039\000\040\000\041\000\042\000\043\000\
\044\000\003\001\024\001\025\001\026\001\001\001\002\001\091\000\
\002\001\093\000\004\001\005\001\092\000\097\000\002\001\011\001\
\003\001\101\000\098\000\006\001\025\001\065\000\062\000\011\001\
\018\001\019\001\025\001\021\001\022\001\073\000\024\001\025\001\
\026\001\002\001\006\001\004\001\005\001\081\000\082\000\083\000\
\004\001\025\001\002\001\025\001\004\001\005\001\009\001\010\001\
\092\000\018\001\019\001\003\001\021\001\022\001\098\000\024\001\
\025\001\026\001\018\001\019\001\006\001\021\001\022\001\002\001\
\024\001\025\001\026\001\002\001\002\001\004\001\005\001\007\001\
\008\001\009\001\010\001\002\001\002\001\001\001\004\001\003\001\
\001\001\001\001\020\001\018\001\019\001\003\001\021\001\022\001\
\003\001\024\001\025\001\026\001\018\001\019\001\003\001\021\001\
\022\001\003\001\024\001\025\001\026\001\001\001\003\001\003\001\
\001\001\003\001\006\001\007\001\008\001\009\001\010\001\062\000\
\012\001\013\001\014\001\015\001\016\001\017\001\001\001\071\000\
\255\255\255\255\255\255\255\255\007\001\008\001\009\001\010\001\
\255\255\012\001\013\001\014\001\015\001\016\001\017\001\001\001\
\255\255\255\255\255\255\255\255\255\255\007\001\008\001\009\001\
\010\001\255\255\012\001\013\001\014\001\015\001\016\001\017\001\
\001\001\255\255\255\255\255\255\255\255\255\255\007\001\008\001\
\009\001\010\001\255\255\012\001\013\001\014\001\015\001\016\001\
\017\001\001\001\255\255\003\001\255\255\255\255\006\001\007\001\
\008\001\255\255\255\255\255\255\012\001\013\001\014\001\015\001\
\016\001\017\001\001\001\255\255\003\001\255\255\255\255\006\001\
\007\001\008\001\255\255\255\255\255\255\012\001\013\001\014\001\
\015\001\016\001\017\001\001\001\255\255\003\001\255\255\255\255\
\006\001\255\255\255\255\255\255\255\255\255\255\012\001\013\001\
\014\001\015\001\016\001\017\001\001\001\255\255\003\001\255\255\
\255\255\006\001\255\255\255\255\255\255\255\255\255\255\012\001\
\013\001\014\001\015\001\016\001\017\001\001\001\255\255\003\001\
\255\255\255\255\006\001\255\255\255\255\255\255\255\255\255\255\
\012\001\013\001\014\001\015\001\016\001\017\001\255\255\023\001\
\255\255\255\255\255\255\027\001\028\001\029\001\030\001\031\001\
\032\001\001\001\255\255\003\001\255\255\255\255\006\001\255\255\
\255\255\255\255\255\255\255\255\012\001\013\001\014\001\015\001\
\016\001\017\001\003\001\255\255\255\255\255\255\007\001\008\001\
\009\001\010\001\255\255\012\001\013\001\014\001\015\001\016\001\
\017\001\003\001\255\255\255\255\255\255\007\001\008\001\009\001\
\010\001\255\255\012\001\013\001\014\001\015\001\016\001\017\001\
\003\001\255\255\255\255\255\255\007\001\008\001\009\001\010\001\
\255\255\012\001\013\001\014\001\015\001\016\001\017\001\001\001\
\255\255\003\001\255\255\001\001\006\001\003\001\255\255\255\255\
\006\001\255\255\012\001\013\001\255\255\255\255\012\001\013\001\
\007\001\008\001\009\001\010\001\255\255\012\001\013\001\014\001\
\015\001\016\001\017\001\007\001\008\001\009\001\010\001\255\255\
\255\255\255\255\014\001\015\001\016\001\017\001\023\001\255\255\
\255\255\255\255\027\001\028\001\029\001\030\001\031\001\032\001"

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
  LIST\000\
  ELEMENT\000\
  PAGE\000\
  FILE\000\
  ANY\000\
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
# 303 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    Obj.repr(
# 29 "parser.mly"
                ( [], [] )
# 309 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 30 "parser.mly"
                ( (_2 :: fst _1), snd _1 )
# 317 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fdecl) in
    Obj.repr(
# 31 "parser.mly"
                ( fst _1, (_2 :: snd _1) )
# 325 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 8 : 'type_decl) in
    let _2 = (Parsing.peek_val __caml_parser_env 7 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 5 : 'formals_opt) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'vdecl_list) in
    let _8 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 34 "parser.mly"
     ( { ftype = _1;
         fname = _2;
	     formals = _4;
	     locals = List.rev _7;
	     body = List.rev _8 } )
# 340 "parser.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 41 "parser.mly"
                  ( [] )
# 346 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal_list) in
    Obj.repr(
# 42 "parser.mly"
                  ( List.rev _1 )
# 353 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'type_decl) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 45 "parser.mly"
                                   ( [Arg(_1, _2)] )
# 361 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'formal_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'type_decl) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 46 "parser.mly"
                                   ( Arg(_3, _4) :: _1 )
# 370 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 49 "parser.mly"
        ( Int )
# 376 "parser.ml"
               : 'type_decl))
; (fun __caml_parser_env ->
    Obj.repr(
# 50 "parser.mly"
           ( File )
# 382 "parser.ml"
               : 'type_decl))
; (fun __caml_parser_env ->
    Obj.repr(
# 51 "parser.mly"
          ( Any )
# 388 "parser.ml"
               : 'type_decl))
; (fun __caml_parser_env ->
    Obj.repr(
# 52 "parser.mly"
             ( String )
# 394 "parser.ml"
               : 'type_decl))
; (fun __caml_parser_env ->
    Obj.repr(
# 53 "parser.mly"
           ( List )
# 400 "parser.ml"
               : 'type_decl))
; (fun __caml_parser_env ->
    Obj.repr(
# 54 "parser.mly"
              ( Element )
# 406 "parser.ml"
               : 'type_decl))
; (fun __caml_parser_env ->
    Obj.repr(
# 55 "parser.mly"
           ( Page )
# 412 "parser.ml"
               : 'type_decl))
; (fun __caml_parser_env ->
    Obj.repr(
# 58 "parser.mly"
                     ( [] )
# 418 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'vdecl_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 59 "parser.mly"
                     ( _2 :: _1 )
# 426 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'type_decl) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 62 "parser.mly"
                     ( Var(_1, _2, Noexpr) )
# 434 "parser.ml"
               : 'vdecl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : 'type_decl) in
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 63 "parser.mly"
                                   ( Var(_1, _2, _4) )
# 443 "parser.ml"
               : 'vdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 66 "parser.mly"
                   ( [] )
# 449 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 67 "parser.mly"
                   ( _2 :: _1 )
# 457 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 70 "parser.mly"
              ( Expr(_1) )
# 464 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 71 "parser.mly"
                     ( Return(_2) )
# 471 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 72 "parser.mly"
                            ( Block(List.rev _2) )
# 478 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 73 "parser.mly"
                                            ( If(_3, _5, Block([])) )
# 486 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 74 "parser.mly"
                                            ( If(_3, _5, _7) )
# 495 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : 'expr_opt) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : 'expr_opt) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'expr_opt) in
    let _9 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 76 "parser.mly"
     ( For(_3, _5, _7, _9) )
# 505 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 77 "parser.mly"
                                  ( While(_3, _5) )
# 513 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 80 "parser.mly"
                  ( Noexpr )
# 519 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 81 "parser.mly"
                  ( _1 )
# 526 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 84 "parser.mly"
                     ( Literal(_1) )
# 533 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 85 "parser.mly"
                     ( Id(_1) )
# 540 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 86 "parser.mly"
                     ( Stringlit(_1) )
# 547 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 87 "parser.mly"
                     ( Binop(_1, Add,   _3) )
# 555 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 88 "parser.mly"
                     ( Binop(_1, Sub,   _3) )
# 563 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 89 "parser.mly"
                     ( Binop(_1, Mult,  _3) )
# 571 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 90 "parser.mly"
                     ( Binop(_1, Div,   _3) )
# 579 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 91 "parser.mly"
                     ( Binop(_1, Equal, _3) )
# 587 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 92 "parser.mly"
                     ( Binop(_1, Neq,   _3) )
# 595 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 93 "parser.mly"
                     ( Binop(_1, Less,  _3) )
# 603 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 94 "parser.mly"
                     ( Binop(_1, Leq,   _3) )
# 611 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 95 "parser.mly"
                     ( Binop(_1, Greater,  _3) )
# 619 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 96 "parser.mly"
                     ( Binop(_1, Geq,   _3) )
# 627 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 97 "parser.mly"
                     ( Assign(_1, _3) )
# 635 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'actuals_opt) in
    Obj.repr(
# 98 "parser.mly"
                                 ( Call(_1, _3) )
# 643 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 99 "parser.mly"
                       ( _2 )
# 650 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 102 "parser.mly"
                  ( [] )
# 656 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'actuals_list) in
    Obj.repr(
# 103 "parser.mly"
                  ( List.rev _1 )
# 663 "parser.ml"
               : 'actuals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 106 "parser.mly"
                            ( [_1] )
# 670 "parser.ml"
               : 'actuals_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'actuals_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 107 "parser.mly"
                            ( _3 :: _1 )
# 678 "parser.ml"
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
