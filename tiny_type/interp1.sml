(*  Here's a skeleton file to help you get started on Interpreter 1.  *)

use "parser.sml";

(*  Here you need to put in the definition of
      subst : term -> string -> term -> term
*)
fun subst (AST_IF (e1, e2, e3)) x t = AST_IF ((subst e1 x t), (subst e2 x t), (subst e3 x t))
  | subst (AST_APP (e1, e2)) x t  =AST_APP ((subst e1 x t), (subst e2 x t))
  | subst (AST_ID v) x t = if v=x then t else AST_ID v
  | subst (AST_FUN (v,e)) x t = AST_FUN (v, if v = x then e else (subst e x t))
  | subst (AST_REC (v,e)) x t = AST_REC (v, if v=x then e else (subst e x t))
  | subst e _ _ = e
(*  Here's a partial skeleton of interp : term -> term.
    Also, I've shown you how rule (7) can be implemented.
*)

fun interp (AST_IF (e1, e2, e3)) =
(*AST_ERROR "rules (5) and (6) not implemented"*)
  (case (interp e1) of
       AST_BOOL true => interp e2
    |  AST_BOOL false  => interp e3
    |  _ => AST_ERROR "IF does not accept any term except BOOL" )
| interp (AST_ID _) = AST_ERROR "unbounde identifier"
| interp (AST_REC (x,e)) = interp (subst e x (AST_REC (x, e)))
| interp (AST_APP (e1, e2)) =
  (case (interp e1, interp e2) of
    (AST_ERROR s,_) => AST_ERROR s
 |  (_, AST_ERROR s) => AST_ERROR s
 |  (AST_SUCC, AST_NUM n) => AST_NUM (n + 1)
 |  (AST_SUCC, _) => AST_ERROR "SUCC accepts int argument only"
 |  (AST_PRED, AST_NUM n) => AST_NUM (n - 1)
 |  (AST_FUN (x, e), y) => interp (subst e x y)
 |  (AST_PRED, _) => AST_ERROR "PRED accepts int argument only"
 |  (AST_ISZERO, AST_NUM 0) => AST_BOOL true
 |  (AST_ISZERO, AST_NUM _) => AST_BOOL false
 |  (AST_ISZEOR, _) => AST_ERROR "iszero accpets int argument only")
| interp e = e
(*  Once you have defined interp, you can try out simple examples by
      interp (parsestr "succ (succ 7)");
    and you can try out larger examples by
      interp (parsefile "factorial.pcf");
*)

