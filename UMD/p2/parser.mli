type token =
  | EOF

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.expr list
