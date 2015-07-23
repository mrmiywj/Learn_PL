type token =
  | INT of (int)
  | STR of (string)
  | ID of (string)
  | FID of (string)
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
# 31 "parser.ml"
let yytransl_const = [|
  261 (* CLASS *);
  262 (* IF *);
  263 (* THEN *);
  264 (* ELSE *);
  265 (* DEF *);
  266 (* END *);
  267 (* NEW *);
  268 (* NIL *);
  269 (* LT *);
  270 (* LP *);
  271 (* RP *);
  272 (* COMMA *);
  273 (* SEMI *);
  274 (* DOT *);
  275 (* EQ *);
    0 (* EOF *);
  276 (* SELF *);
  277 (* BEGIN *);
  278 (* INHERITS *);
    0|]

let yytransl_block = [|
  257 (* INT *);
  258 (* STR *);
  259 (* ID *);
  260 (* FID *);
    0|]

let yylhs = "\255\255\
\001\000\009\000\009\000\008\000\007\000\007\000\006\000\005\000\
\005\000\005\000\003\000\003\000\002\000\002\000\002\000\002\000\
\002\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\004\000\004\000\004\000\000\000"

let yylen = "\002\000\
\003\000\000\000\002\000\007\000\000\000\002\000\008\000\000\000\
\001\000\003\000\001\000\003\000\001\000\001\000\001\000\001\000\
\001\000\001\000\007\000\003\000\003\000\006\000\002\000\003\000\
\000\000\001\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\028\000\000\000\000\000\000\000\003\000\
\013\000\016\000\000\000\000\000\000\000\000\000\014\000\000\000\
\015\000\000\000\000\000\000\000\000\000\000\000\000\000\023\000\
\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\
\024\000\012\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\006\000\004\000\000\000\
\000\000\022\000\000\000\019\000\027\000\000\000\000\000\000\000\
\000\000\010\000\000\000\000\000\007\000"

let yydgoto = "\002\000\
\004\000\018\000\019\000\044\000\055\000\040\000\041\000\005\000\
\006\000"

let yysindex = "\008\000\
\011\255\000\000\020\255\000\000\011\255\034\255\002\255\000\000\
\000\000\000\000\006\255\007\255\034\255\024\255\000\000\034\255\
\000\000\001\255\029\000\027\255\034\255\034\255\251\254\000\000\
\016\255\034\255\030\255\000\000\013\255\023\255\023\255\034\255\
\000\000\000\000\028\255\035\255\252\254\034\255\044\255\035\255\
\039\255\034\255\246\254\041\255\043\255\000\000\000\000\253\254\
\034\255\000\000\055\255\000\000\000\000\046\255\050\255\055\255\
\038\255\000\000\034\255\054\255\000\000"

let yyrindex = "\000\000\
\049\255\000\000\000\000\000\000\049\255\000\000\000\000\000\000\
\000\000\000\000\001\000\005\000\000\000\000\000\000\000\000\000\
\000\000\020\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\017\000\021\000\000\000\
\000\000\000\000\000\000\056\255\000\000\052\255\000\000\056\255\
\000\000\000\000\053\255\000\000\000\000\000\000\000\000\000\000\
\052\255\000\000\057\255\000\000\000\000\058\255\000\000\057\255\
\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\246\255\240\255\022\000\014\000\000\000\034\000\000\000\
\070\000"

let yytablesize = 294
let yytable = "\025\000\
\017\000\032\000\023\000\042\000\018\000\049\000\052\000\027\000\
\001\000\034\000\030\000\031\000\027\000\027\000\027\000\003\000\
\020\000\026\000\027\000\011\000\021\000\037\000\007\000\020\000\
\021\000\022\000\024\000\043\000\028\000\029\000\033\000\048\000\
\035\000\036\000\009\000\010\000\011\000\012\000\043\000\013\000\
\027\000\038\000\060\000\039\000\014\000\015\000\045\000\016\000\
\047\000\002\000\002\000\002\000\002\000\017\000\002\000\050\000\
\051\000\054\000\059\000\002\000\002\000\056\000\002\000\061\000\
\057\000\005\000\025\000\026\000\002\000\058\000\053\000\008\000\
\009\000\046\000\008\000\000\000\000\000\000\000\000\000\000\000\
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
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\017\000\
\017\000\000\000\017\000\018\000\018\000\000\000\018\000\017\000\
\017\000\017\000\017\000\018\000\018\000\018\000\018\000\020\000\
\020\000\000\000\020\000\021\000\021\000\011\000\021\000\020\000\
\020\000\020\000\011\000\021\000\021\000\021\000"

let yycheck = "\016\000\
\000\000\007\001\013\000\008\001\000\000\016\001\010\001\018\001\
\001\000\026\000\021\000\022\000\018\001\018\001\018\001\005\001\
\000\000\017\001\018\001\000\000\000\000\032\000\003\001\022\001\
\019\001\019\001\003\001\038\000\000\000\003\001\015\001\042\000\
\003\001\021\001\001\001\002\001\003\001\004\001\049\000\006\001\
\018\001\014\001\059\000\009\001\011\001\012\001\003\001\014\001\
\010\001\001\001\002\001\003\001\004\001\020\001\006\001\015\001\
\014\001\003\001\021\001\011\001\012\001\016\001\014\001\010\001\
\015\001\010\001\015\001\015\001\020\001\056\000\049\000\015\001\
\015\001\040\000\005\000\255\255\255\255\255\255\255\255\255\255\
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
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\007\001\
\008\001\255\255\010\001\007\001\008\001\255\255\010\001\015\001\
\016\001\017\001\018\001\015\001\016\001\017\001\018\001\007\001\
\008\001\255\255\010\001\007\001\008\001\010\001\010\001\015\001\
\016\001\017\001\015\001\015\001\016\001\017\001"

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
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.cls list) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    Obj.repr(
# 23 "parser.mly"
                ( { prog_clss=_1; prog_main=_2 } )
# 227 "parser.ml"
               : Ast.prog))
; (fun __caml_parser_env ->
    Obj.repr(
# 26 "parser.mly"
  ( [] )
# 233 "parser.ml"
               : Ast.cls list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.cls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Ast.cls list) in
    Obj.repr(
# 27 "parser.mly"
           ( _1::_2 )
# 241 "parser.ml"
               : Ast.cls list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : Ast.meth list) in
    Obj.repr(
# 29 "parser.mly"
                                       (
    { cls_name = _2;
      cls_super = _4;
      cls_fields = []; (* TODO *)
      cls_meths = _6 }
  )
# 255 "parser.ml"
               : Ast.cls))
; (fun __caml_parser_env ->
    Obj.repr(
# 37 "parser.mly"
  ( [] )
# 261 "parser.ml"
               : Ast.meth list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : Ast.meth) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : Ast.meth list) in
    Obj.repr(
# 38 "parser.mly"
             ( _1::_2 )
# 269 "parser.ml"
               : Ast.meth list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 6 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 4 : string list) in
    let _7 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    Obj.repr(
# 41 "parser.mly"
                                   (
    { meth_name = _2;
      meth_ret = TClass "Bot"; (* TODO *)
      meth_args = (List.map (fun x -> (x, TClass "Bot", None, None))) _4; (* TODO *)
      meth_locals = []; (* TODO *)
      meth_body = _7 }
  )
# 284 "parser.ml"
               : Ast.meth))
; (fun __caml_parser_env ->
    Obj.repr(
# 50 "parser.mly"
  ( [] )
# 290 "parser.ml"
               : string list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 51 "parser.mly"
      ( [_1] )
# 297 "parser.ml"
               : string list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string list) in
    Obj.repr(
# 52 "parser.mly"
               ( _1::_3 )
# 305 "parser.ml"
               : string list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 55 "parser.mly"
       ( _1 )
# 312 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 56 "parser.mly"
                  ( ESeq(_1, _3) )
# 320 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 59 "parser.mly"
      ( EInt _1 )
# 327 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 60 "parser.mly"
      ( ENil )
# 333 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 61 "parser.mly"
       ( ESelf )
# 339 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 62 "parser.mly"
      ( EString _1 )
# 346 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 63 "parser.mly"
     ( ELocal _1 )
# 353 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 64 "parser.mly"
      ( EField _1 )
# 360 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 5 : Ast.expr) in
    let _4 = (Parsing.peek_val __caml_parser_env 3 : Ast.expr) in
    let _6 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    Obj.repr(
# 65 "parser.mly"
                                  ( EIf(_2, _4, _6) )
# 369 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 66 "parser.mly"
             ( EWrite(_1, _3) )
# 377 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 67 "parser.mly"
              ( EWriteField(_1, _3) )
# 385 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 5 : Ast.expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 1 : (string option * Ast.expr) list) in
    Obj.repr(
# 68 "parser.mly"
                           ( EInvoke(_1, _3, _5) )
# 394 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 69 "parser.mly"
         ( ENew _2 )
# 401 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Ast.expr) in
    Obj.repr(
# 70 "parser.mly"
              ( _2 )
# 408 "parser.ml"
               : Ast.expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 73 "parser.mly"
  ( [] )
# 414 "parser.ml"
               : (string option * Ast.expr) list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : Ast.expr) in
    Obj.repr(
# 74 "parser.mly"
       ( [None, _1] )
# 421 "parser.ml"
               : (string option * Ast.expr) list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Ast.expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : (string option * Ast.expr) list) in
    Obj.repr(
# 75 "parser.mly"
                    ( (None, _1)::_3 )
# 429 "parser.ml"
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
