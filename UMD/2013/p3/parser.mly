%{
  open Ast
%}

%token <int> INT
%token <string> STR ID FID TID
%token CLASS IF THEN ELSE DEF END NEW NIL
%token LT LP RP COMMA SEMI DOT EQ EOF SELF BEGIN INHERITS
%start main
%type <Ast.expr> expr exprs
%type <(string option * Ast.expr) list> params
%type <string list> ids
%type <Ast.meth> meth
%type <Ast.meth list> meths
%type <Ast.cls> cls
%type <Ast.cls list> clss
%type <Ast.prog> main
%right SEMI
%right EQ
%nonassoc DOT
%%
main:
 clss exprs EOF { { prog_clss=$1; prog_main=$2 } }
;
clss:
  { [] }
| cls clss { $1::$2 }
cls:
  CLASS ID INHERITS ID BEGIN fields meths END {
    { cls_name = $2;
      cls_super = $4;
      cls_fields = $6; (*// TODO *)
      cls_meths = $7 }
  }

meths:
  { [] }
| meth meths { $1::$2 }
;
meth:
  DEF ID ID LP idandtyps RP localtyps BEGIN exprs END {
    { meth_name = $3;
      meth_ret = TClass( ":" ^ $2); (* //TODO *)
      meth_args = (List.map (fun x -> (fst x, snd x, None, None))) $5; (* //TODO *)
      meth_locals = $7; (* //TODO *)
      meth_body = $9 }
  }
;
typ:
  TID {TClass $1}
;
fields:
  {[]}
| field fields {$1::$2}
;
field:
  FID typ{($1,$2)}
;
idandtyps:
  {[]}
| ID typ {[($1,$2)]}
| ID typ COMMA idandtyps {($1,$2)::$4}
;
localtyps:
  {[]}
| ID typ {[($1,$2)]}
| ID typ localtyps {($1,$2) :: $3}
;
ids:
  { [] }
| ID  { [$1] }
| ID COMMA ids { $1::$3 }
;
exprs:
  expr { $1 }
| expr SEMI exprs { ESeq($1, $3) }
;
expr:
| INT { EInt $1 }
| NIL { ENil }
| SELF { ESelf }
| STR { EString $1 }
| ID { ELocal $1 }
| FID { EField $1 }
| IF expr THEN expr ELSE expr END { EIf($2, $4, $6) }
| ID EQ expr { EWrite($1, $3) }
| FID EQ expr { EWriteField($1, $3) }
| expr DOT ID LP params RP { EInvoke($1, $3, $5) }
| NEW ID { ENew $2 }
| LP exprs RP { $2 }
| LP expr typ RP { ECast($2,$3)}
;
params:
  { [] }
| expr { [None, $1] }
| expr COMMA params { (None, $1)::$3 }
