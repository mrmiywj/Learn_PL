%{
  open Ast
%}

%token EOF
%type <Ast.expr list> main
%start main

%%
main:
 EOF { [] }
;
