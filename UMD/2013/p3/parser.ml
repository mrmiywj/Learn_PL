type token =
  | INT of (int)
  | STR of (string)
  | ID of (string)
  | FID of (string)
  | TID of (string)
  | CLASS
  | IF
  | THEN
  | ELSE
  | DEF
  | END
  | NEW
  | NIL
  | LT
  | LP
  | RP
  | COMMA
  | SEMI
  | DOT
  | EQ
  | EOF
  | SELF
  | BEGIN
  | INHERITS

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
  open Ast
# 32 "parser.ml"
let yytransl_const = [|
  262 (* CLASS *);
  263 (* IF *);
  264 (* THEN *);
  265 (* ELSE *);
  266 (* DEF *);
  267 (* END *);
  268 (* NEW *);
  269 (* NIL *);
  270 (* LT *);
  271 (* LP *);
  272 (* RP *);
  273 (* COMMA *);
  274 (* SEMI *);
  275 (* DOT *);
  276 (* EQ *);
    0 (* EOF *);
  277 (* SELF *);
  278 (* BEGIN *);
  279 (* INHERITS *);
    0|]

let yytransl_block = [|
  257 (* INT *);
  258 (* STR *);
  259 (* ID *);
  260 (* FID *);
  261 (* TID *);
    0|]

let yylhs = "\255\255\
\001\000\009\000\009\000\008\000\007\000\007\000\006\000\013\000\
\010\000\010\000\014\000\011\000\011\000\011\000\012\000\012\000\
\012\000\005\000\005\000\005\000\003\000\003\000\002\000\002\000\
\002\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\002\000\002\000\004\000\004\000\004\000\000\000"

let yylen = "\002\000\
\003\000\000\000\002\000\008\000\000\000\002\000\010\000\001\000\
\000\000\002\000\002\000\000\000\002\000\004\000\000\000\002\000\
\003\000\000\000\001\000\003\000\001\000\003\000\001\000\001\000\
\001\000\001\000\001\000\001\000\007\000\003\000\003\000\006\000\
\002\000\003\000\004\000\000\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\039\000\000\000\000\000\000\000\003\000\
\023\000\026\000\000\000\000\000\000\000\000\000\024\000\000\000\
\025\000\000\000\000\000\000\000\000\000\000\000\000\000\033\000\
\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\
\000\000\008\000\000\000\034\000\022\000\000\000\000\000\000\000\
\035\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\011\000\000\000\000\000\000\000\010\000\000\000\000\000\032\000\
\000\000\006\000\004\000\029\000\038\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\014\000\000\000\
\000\000\017\000\000\000\007\000"

let yydgoto = "\002\000\
\004\000\018\000\019\000\048\000\000\000\051\000\052\000\005\000\
\006\000\044\000\065\000\070\000\035\000\045\000"

let yysindex = "\002\000\
\000\255\000\000\007\255\000\000\000\255\039\255\254\254\000\000\
\000\000\000\000\015\255\016\255\039\255\027\255\000\000\039\255\
\000\000\008\255\037\000\036\255\039\255\039\255\001\255\000\000\
\255\254\028\255\039\255\045\255\000\000\031\255\030\255\030\255\
\039\255\000\000\034\255\000\000\000\000\040\255\052\255\010\255\
\000\000\039\255\053\255\049\255\052\255\039\255\005\255\050\255\
\000\000\062\255\049\255\057\255\000\000\252\254\039\255\000\000\
\066\255\000\000\000\000\000\000\000\000\055\255\068\255\053\255\
\058\255\059\255\074\255\068\255\053\255\056\255\000\000\074\255\
\039\255\000\000\069\255\000\000"

let yyrindex = "\000\000\
\060\255\000\000\000\000\000\000\060\255\000\000\000\000\000\000\
\000\000\000\000\001\000\016\000\000\000\000\000\000\000\000\000\
\000\000\012\000\000\000\000\000\000\000\000\000\000\000\000\000\
\063\255\000\000\000\000\000\000\000\000\000\000\031\000\045\000\
\000\000\000\000\000\000\000\000\000\000\000\000\022\255\000\000\
\000\000\028\255\000\000\071\255\022\255\000\000\067\255\000\000\
\000\000\000\000\071\255\000\000\000\000\000\000\028\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\070\255\000\000\
\000\000\072\255\065\255\070\255\000\000\000\000\000\000\065\255\
\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\248\255\240\255\029\000\000\000\000\000\034\000\000\000\
\084\000\046\000\022\000\020\000\215\255\000\000"

let yytablesize = 319
let yytable = "\026\000\
\027\000\049\000\001\000\034\000\023\000\003\000\060\000\025\000\
\033\000\007\000\037\000\021\000\031\000\032\000\028\000\028\000\
\027\000\028\000\046\000\028\000\020\000\055\000\066\000\028\000\
\040\000\027\000\028\000\072\000\028\000\024\000\030\000\009\000\
\009\000\047\000\021\000\022\000\029\000\054\000\030\000\009\000\
\010\000\011\000\012\000\036\000\031\000\013\000\047\000\038\000\
\028\000\041\000\014\000\015\000\039\000\016\000\042\000\043\000\
\075\000\034\000\050\000\017\000\002\000\002\000\002\000\002\000\
\057\000\056\000\002\000\059\000\062\000\063\000\064\000\002\000\
\002\000\067\000\002\000\068\000\069\000\073\000\021\000\076\000\
\002\000\005\000\037\000\061\000\058\000\012\000\015\000\013\000\
\008\000\071\000\053\000\074\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\027\000\000\000\000\000\
\027\000\027\000\000\000\027\000\000\000\000\000\000\000\000\000\
\027\000\027\000\027\000\027\000\028\000\000\000\021\000\028\000\
\028\000\000\000\028\000\021\000\000\000\000\000\000\000\028\000\
\028\000\028\000\028\000\030\000\000\000\000\000\030\000\030\000\
\000\000\030\000\000\000\000\000\000\000\000\000\030\000\030\000\
\030\000\031\000\000\000\000\000\031\000\031\000\000\000\031\000\
\000\000\000\000\000\000\000\000\031\000\031\000\031\000"

let yycheck = "\016\000\
\000\000\043\000\001\000\005\001\013\000\006\001\011\001\016\000\
\008\001\003\001\027\000\000\000\021\000\022\000\019\001\000\000\
\018\001\019\001\009\001\019\001\023\001\017\001\064\000\019\001\
\033\000\018\001\019\001\069\000\019\001\003\001\000\000\010\001\
\011\001\042\000\020\001\020\001\000\000\046\000\003\001\001\001\
\002\001\003\001\004\001\016\001\000\000\007\001\055\000\003\001\
\019\001\016\001\012\001\013\001\022\001\015\001\015\001\004\001\
\073\000\005\001\010\001\021\001\001\001\002\001\003\001\004\001\
\003\001\016\001\007\001\011\001\003\001\015\001\003\001\012\001\
\013\001\016\001\015\001\017\001\003\001\022\001\016\001\011\001\
\021\001\011\001\016\001\055\000\051\000\016\001\022\001\016\001\
\005\000\068\000\045\000\072\000\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\005\001\255\255\255\255\
\008\001\009\001\255\255\011\001\255\255\255\255\255\255\255\255\
\016\001\017\001\018\001\019\001\005\001\255\255\011\001\008\001\
\009\001\255\255\011\001\016\001\255\255\255\255\255\255\016\001\
\017\001\018\001\019\001\005\001\255\255\255\255\008\001\009\001\
\255\255\011\001\255\255\255\255\255\255\255\255\016\001\017\001\
\018\001\005\001\255\255\255\255\008\001\009\001\255\255\011\001\
\255\255\255\255\255\255\255\255\016\001\017\001\018\001"

let yynames_const = "\
  CLASS\000\
  IF\000\
  THEN\000\
  ELSE\000\
  DEF\000\
  END\000\
  NEW\000\
  NIL\000\
  LT\000\
  LP\000\
  RP\000\
  COMMA\000\
  SEMI\000\
  DOT\000\
  EQ\000\
  EOF\000\
  SELF\000\
  BEGIN\000\
  INHERITS\000\
  "

let yynames_block = "\
  INT\000\
  STR\000\
  ID\000\
  FID\000\
  TID\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.cls list) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    Obj.repr(
# 23 "parser.mly"
                ( { prog_clss=_1; prog_main=_2 } )
# 244 "parser.ml"
               : Ast.prog))
; (fun __caml_parser_env ->
    Obj.repr(
# 26 "parser.mly"
  ( [] )
# 250 "parser.ml"
               : Ast.cls list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.cls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Ast.cls list) in
    Obj.repr(
# 27 "parser.mly"
           ( _1::_2 )
# 258 "parser.ml"
               : Ast.cls list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 6 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _6 = (Parsing.peek_val __caml_parser_env 2 : 'fields) in
    let _7 = (Parsing.peek_val __caml_parser_env 1 : Ast.meth list) in
    Obj.repr(
# 29 "parser.mly"
                                              (
    { cls_name = _2;
      cls_super = _4;
      cls_fields = _6; (*// TODO *)
      cls_meths = _7 }
  )
# 273 "parser.ml"
               : Ast.cls))
; (fun __caml_parser_env ->
    Obj.repr(
# 37 "parser.mly"
  ( [] )
# 279 "parser.ml"
               : Ast.meth list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.meth) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Ast.meth list) in
    Obj.repr(
# 38 "parser.mly"
             ( _1::_2 )
# 287 "parser.ml"
               : Ast.meth list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 8 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 7 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 5 : 'idandtyps) in
    let _7 = (Parsing.peek_val __caml_parser_env 3 : 'localtyps) in
    let _9 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    Obj.repr(
# 41 "parser.mly"
                                                      (
    { meth_name = _3;
      meth_ret = TClass _2; (* //TODO *)
      meth_args = (List.map (fun x -> (fst x, snd x, None, None))) _5; (* //TODO *)
      meth_locals = _7; (* //TODO *)
      meth_body = _9 }
  )
# 304 "parser.ml"
               : Ast.meth))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 50 "parser.mly"
      (TClass _1)
# 311 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 53 "parser.mly"
  ([])
# 317 "parser.ml"
               : 'fields))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'field) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fields) in
    Obj.repr(
# 54 "parser.mly"
               (_1::_2)
# 325 "parser.ml"
               : 'fields))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'typ) in
    Obj.repr(
# 57 "parser.mly"
         ((_1,_2))
# 333 "parser.ml"
               : 'field))
; (fun __caml_parser_env ->
    Obj.repr(
# 60 "parser.mly"
  ([])
# 339 "parser.ml"
               : 'idandtyps))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'typ) in
    Obj.repr(
# 61 "parser.mly"
         ([(_1,_2)])
# 347 "parser.ml"
               : 'idandtyps))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'typ) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'idandtyps) in
    Obj.repr(
# 62 "parser.mly"
                         ((_1,_2)::_4)
# 356 "parser.ml"
               : 'idandtyps))
; (fun __caml_parser_env ->
    Obj.repr(
# 65 "parser.mly"
  ([])
# 362 "parser.ml"
               : 'localtyps))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'typ) in
    Obj.repr(
# 66 "parser.mly"
         ([(_1,_2)])
# 370 "parser.ml"
               : 'localtyps))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'localtyps) in
    Obj.repr(
# 67 "parser.mly"
                   ((_1,_2) :: _3)
# 379 "parser.ml"
               : 'localtyps))
; (fun __caml_parser_env ->
    Obj.repr(
# 70 "parser.mly"
  ( [] )
# 385 "parser.ml"
               : string list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 71 "parser.mly"
      ( [_1] )
# 392 "parser.ml"
               : string list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string list) in
    Obj.repr(
# 72 "parser.mly"
               ( _1::_3 )
# 400 "parser.ml"
               : string list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 75 "parser.mly"
       ( _1 )
# 407 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 76 "parser.mly"
                  ( ESeq(_1, _3) )
# 415 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 79 "parser.mly"
      ( EInt _1 )
# 422 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 80 "parser.mly"
      ( ENil )
# 428 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 81 "parser.mly"
       ( ESelf )
# 434 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 82 "parser.mly"
      ( EString _1 )
# 441 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 83 "parser.mly"
     ( ELocal _1 )
# 448 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 84 "parser.mly"
      ( EField _1 )
# 455 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : Ast.expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : Ast.expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    Obj.repr(
# 85 "parser.mly"
                                  ( EIf(_2, _4, _6) )
# 464 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 86 "parser.mly"
             ( EWrite(_1, _3) )
# 472 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 87 "parser.mly"
              ( EWriteField(_1, _3) )
# 480 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 5 : Ast.expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : (string option * Ast.expr) list) in
    Obj.repr(
# 88 "parser.mly"
                           ( EInvoke(_1, _3, _5) )
# 489 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 89 "parser.mly"
         ( ENew _2 )
# 496 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    Obj.repr(
# 90 "parser.mly"
              ( _2 )
# 503 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    Obj.repr(
# 91 "parser.mly"
                 ( ECast(_2,_3))
# 511 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 94 "parser.mly"
  ( [] )
# 517 "parser.ml"
               : (string option * Ast.expr) list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 95 "parser.mly"
       ( [None, _1] )
# 524 "parser.ml"
               : (string option * Ast.expr) list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : (string option * Ast.expr) list) in
    Obj.repr(
# 96 "parser.mly"
                    ( (None, _1)::_3 )
# 532 "parser.ml"
               : (string option * Ast.expr) list))
(* Entry main *)
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
let main (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.prog)
