type token =
  | IDENTIFIER of (string)
  | INT of (int)
  | PLUS
  | MINUS
  | TIMES
  | TRUE
  | FALSE
  | EQ_TOK
  | LE_TOK
  | NOT
  | AND
  | OR
  | SKIP
  | SET
  | SEMICOLON
  | IF
  | THEN
  | ELSE
  | WHILE
  | DO
  | TRY
  | CATCH
  | AFTER
  | FINALLY
  | THROW
  | PRINT
  | LPAREN
  | RPAREN
  | LBRACE
  | RBRACE
  | EOF

open Parsing;;
# 2 "parse.mly"
(* 
 * Wes Weimer - CS 655
 * 
 * Parser for our IMP concrete syntax. 
 * See http://caml.inria.fr/pub/docs/manual-ocaml/manual026.html
 * but basically it works just like Yacc/Bison.
 * See http://en.wikipedia.org/wiki/YACC
 *)

open Imp		    (* IMP abstract syntax 	*)

let error msg	= failwith msg

# 50 "parse.ml"
let yytransl_const = [|
  259 (* PLUS *);
  260 (* MINUS *);
  261 (* TIMES *);
  262 (* TRUE *);
  263 (* FALSE *);
  264 (* EQ_TOK *);
  265 (* LE_TOK *);
  266 (* NOT *);
  267 (* AND *);
  268 (* OR *);
  269 (* SKIP *);
  270 (* SET *);
  271 (* SEMICOLON *);
  272 (* IF *);
  273 (* THEN *);
  274 (* ELSE *);
  275 (* WHILE *);
  276 (* DO *);
  277 (* TRY *);
  278 (* CATCH *);
  279 (* AFTER *);
  280 (* FINALLY *);
  281 (* THROW *);
  282 (* PRINT *);
  283 (* LPAREN *);
  284 (* RPAREN *);
  285 (* LBRACE *);
  286 (* RBRACE *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  257 (* IDENTIFIER *);
  258 (* INT *);
    0|]

let yylhs = "\255\255\
\002\000\002\000\002\000\002\000\002\000\002\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\001\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\001\000\000\000"

let yylen = "\002\000\
\001\000\001\000\003\000\003\000\003\000\003\000\001\000\001\000\
\003\000\003\000\002\000\003\000\003\000\001\000\003\000\003\000\
\006\000\004\000\002\000\005\000\004\000\002\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\014\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\002\000\001\000\007\000\
\008\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\011\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\023\000\000\000\006\000\000\000\000\000\005\000\
\000\000\000\000\000\000\013\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000"

let yydgoto = "\002\000\
\012\000\020\000\021\000"

let yysindex = "\003\000\
\045\255\000\000\247\254\000\000\007\255\007\255\045\255\045\255\
\001\255\001\255\045\255\000\255\001\255\000\000\000\000\000\000\
\000\000\007\255\001\255\097\255\092\255\010\255\014\255\029\255\
\086\255\086\255\252\254\045\255\086\255\000\000\015\255\001\255\
\001\255\001\255\001\255\001\255\007\255\007\255\045\255\045\255\
\022\255\045\255\000\000\000\255\000\000\011\255\011\255\000\000\
\086\255\086\255\021\255\000\000\034\255\000\255\045\255\000\255\
\045\255\000\255\000\255"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\037\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\025\000\035\000\000\000\000\000\045\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\040\000\000\000\001\000\024\000\000\000\
\066\255\068\255\031\255\000\000\000\000\050\000\000\000\055\000\
\000\000\060\000\065\000"

let yygindex = "\000\000\
\255\255\063\000\250\255"

let yytablesize = 351
let yytable = "\022\000\
\003\000\014\000\015\000\001\000\013\000\023\000\024\000\014\000\
\015\000\027\000\028\000\030\000\016\000\017\000\028\000\034\000\
\018\000\032\000\033\000\034\000\037\000\038\000\055\000\004\000\
\019\000\043\000\044\000\019\000\028\000\040\000\051\000\052\000\
\038\000\019\000\022\000\041\000\024\000\053\000\054\000\016\000\
\056\000\012\000\045\000\028\000\015\000\003\000\000\000\012\000\
\028\000\018\000\012\000\057\000\042\000\058\000\021\000\059\000\
\000\000\004\000\000\000\020\000\005\000\000\000\000\000\006\000\
\017\000\007\000\000\000\008\000\000\000\009\000\010\000\025\000\
\026\000\011\000\000\000\029\000\009\000\009\000\010\000\010\000\
\000\000\031\000\009\000\000\000\010\000\009\000\000\000\010\000\
\032\000\033\000\034\000\000\000\000\000\000\000\046\000\047\000\
\048\000\049\000\050\000\032\000\033\000\034\000\037\000\038\000\
\035\000\036\000\000\000\000\000\039\000\000\000\000\000\000\000\
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
\000\000\000\000\000\000\003\000\003\000\000\000\000\000\000\000\
\003\000\003\000\000\000\003\000\003\000\000\000\000\000\003\000\
\000\000\003\000\003\000\000\000\003\000\000\000\003\000\000\000\
\003\000\000\000\004\000\004\000\003\000\000\000\003\000\004\000\
\004\000\000\000\004\000\004\000\000\000\000\000\004\000\019\000\
\004\000\004\000\019\000\004\000\000\000\004\000\019\000\004\000\
\019\000\022\000\000\000\004\000\022\000\004\000\019\000\000\000\
\022\000\016\000\022\000\015\000\000\000\016\000\015\000\016\000\
\022\000\000\000\015\000\018\000\015\000\016\000\000\000\018\000\
\021\000\018\000\015\000\000\000\021\000\020\000\021\000\018\000\
\000\000\020\000\017\000\020\000\021\000\000\000\017\000\000\000\
\017\000\020\000\000\000\000\000\000\000\000\000\017\000"

let yycheck = "\006\000\
\000\000\001\001\002\001\001\000\014\001\007\000\008\000\001\001\
\002\001\011\000\015\001\018\000\006\001\007\001\015\001\005\001\
\010\001\003\001\004\001\005\001\011\001\012\001\001\001\000\000\
\000\000\030\001\028\000\027\001\015\001\020\001\037\000\038\000\
\012\001\027\001\000\000\022\001\000\000\039\000\040\000\000\000\
\042\000\011\001\028\001\015\001\000\000\001\001\255\255\017\001\
\015\001\000\000\020\001\018\001\024\001\055\000\000\000\057\000\
\255\255\013\001\255\255\000\000\016\001\255\255\255\255\019\001\
\000\000\021\001\255\255\023\001\255\255\025\001\026\001\009\000\
\010\000\029\001\255\255\013\000\011\001\012\001\011\001\012\001\
\255\255\019\000\017\001\255\255\017\001\020\001\255\255\020\001\
\003\001\004\001\005\001\255\255\255\255\255\255\032\000\033\000\
\034\000\035\000\036\000\003\001\004\001\005\001\011\001\012\001\
\008\001\009\001\255\255\255\255\017\001\255\255\255\255\255\255\
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
\255\255\255\255\255\255\003\001\004\001\255\255\255\255\255\255\
\008\001\009\001\255\255\011\001\012\001\255\255\255\255\015\001\
\255\255\017\001\018\001\255\255\020\001\255\255\022\001\255\255\
\024\001\255\255\003\001\004\001\028\001\255\255\030\001\008\001\
\009\001\255\255\011\001\012\001\255\255\255\255\015\001\015\001\
\017\001\018\001\018\001\020\001\255\255\022\001\022\001\024\001\
\024\001\015\001\255\255\028\001\018\001\030\001\030\001\255\255\
\022\001\018\001\024\001\015\001\255\255\022\001\018\001\024\001\
\030\001\255\255\022\001\018\001\024\001\030\001\255\255\022\001\
\018\001\024\001\030\001\255\255\022\001\018\001\024\001\030\001\
\255\255\022\001\018\001\024\001\030\001\255\255\022\001\255\255\
\024\001\030\001\255\255\255\255\255\255\255\255\030\001"

let yynames_const = "\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  TRUE\000\
  FALSE\000\
  EQ_TOK\000\
  LE_TOK\000\
  NOT\000\
  AND\000\
  OR\000\
  SKIP\000\
  SET\000\
  SEMICOLON\000\
  IF\000\
  THEN\000\
  ELSE\000\
  WHILE\000\
  DO\000\
  TRY\000\
  CATCH\000\
  AFTER\000\
  FINALLY\000\
  THROW\000\
  PRINT\000\
  LPAREN\000\
  RPAREN\000\
  LBRACE\000\
  RBRACE\000\
  EOF\000\
  "

let yynames_block = "\
  IDENTIFIER\000\
  INT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 63 "parse.mly"
                                             ( Const(_1) )
# 271 "parse.ml"
               : 'aexp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 64 "parse.mly"
                                             ( Var(_1) )
# 278 "parse.ml"
               : 'aexp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'aexp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'aexp) in
    Obj.repr(
# 65 "parse.mly"
                                             ( Add(_1,_3) )
# 286 "parse.ml"
               : 'aexp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'aexp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'aexp) in
    Obj.repr(
# 66 "parse.mly"
                                             ( Sub(_1,_3) )
# 294 "parse.ml"
               : 'aexp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'aexp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'aexp) in
    Obj.repr(
# 67 "parse.mly"
                                             ( Mul(_1,_3) )
# 302 "parse.ml"
               : 'aexp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'aexp) in
    Obj.repr(
# 68 "parse.mly"
                                             ( _2 )
# 309 "parse.ml"
               : 'aexp))
; (fun __caml_parser_env ->
    Obj.repr(
# 71 "parse.mly"
                                             ( True )
# 315 "parse.ml"
               : 'bexp))
; (fun __caml_parser_env ->
    Obj.repr(
# 72 "parse.mly"
                                             ( False )
# 321 "parse.ml"
               : 'bexp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'aexp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'aexp) in
    Obj.repr(
# 73 "parse.mly"
                                             ( EQ(_1,_3) )
# 329 "parse.ml"
               : 'bexp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'aexp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'aexp) in
    Obj.repr(
# 74 "parse.mly"
                                             ( LE(_1,_3) )
# 337 "parse.ml"
               : 'bexp))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'bexp) in
    Obj.repr(
# 75 "parse.mly"
                                             ( Not(_2) )
# 344 "parse.ml"
               : 'bexp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'bexp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'bexp) in
    Obj.repr(
# 76 "parse.mly"
                                             ( And(_1,_3) )
# 352 "parse.ml"
               : 'bexp))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'bexp) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'bexp) in
    Obj.repr(
# 77 "parse.mly"
                                             ( Or(_1,_3) )
# 360 "parse.ml"
               : 'bexp))
; (fun __caml_parser_env ->
    Obj.repr(
# 80 "parse.mly"
                                             ( Skip )
# 366 "parse.ml"
               : Imp.com))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'aexp) in
    Obj.repr(
# 81 "parse.mly"
                                             ( Set(_1,_3) )
# 374 "parse.ml"
               : Imp.com))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : Imp.com) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : Imp.com) in
    Obj.repr(
# 82 "parse.mly"
                                             ( Seq(_1,_3) )
# 382 "parse.ml"
               : Imp.com))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 4 : 'bexp) in
    let _4 = (Parsing.peek_val __caml_parser_env 2 : Imp.com) in
    let _6 = (Parsing.peek_val __caml_parser_env 0 : Imp.com) in
    Obj.repr(
# 83 "parse.mly"
                                             ( If(_2,_4,_6) )
# 391 "parse.ml"
               : Imp.com))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'bexp) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : Imp.com) in
    Obj.repr(
# 84 "parse.mly"
                                             ( While(_2,_4) )
# 399 "parse.ml"
               : Imp.com))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'aexp) in
    Obj.repr(
# 85 "parse.mly"
                                             ( Throw(_2) )
# 406 "parse.ml"
               : Imp.com))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : Imp.com) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : Imp.com) in
    Obj.repr(
# 86 "parse.mly"
                                             ( TryCatch(_2,_4,_5) )
# 415 "parse.ml"
               : Imp.com))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 2 : Imp.com) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : Imp.com) in
    Obj.repr(
# 87 "parse.mly"
                                             ( AfterFinally(_2,_4) )
# 423 "parse.ml"
               : Imp.com))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'aexp) in
    Obj.repr(
# 88 "parse.mly"
                                             ( Print(_2) )
# 430 "parse.ml"
               : Imp.com))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : Imp.com) in
    Obj.repr(
# 89 "parse.mly"
                                             ( _2 )
# 437 "parse.ml"
               : Imp.com))
(* Entry com *)
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
let com (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Imp.com)
