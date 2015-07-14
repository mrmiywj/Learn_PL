(* Type checking MinML *)
(* Operates on de Bruijn form of expressions *)

signature TYPING =
sig

  exception Error

  (* typeOf (e) = t for the t such that |- e : t *)
  (* raises Error if no such t exists *)
  val typeOf : DBMinML.exp -> T.typ

  (* typeOpt (e) = SOME(t) for the t such that |- e : t *)
  (* typeOpt (e) = NONE if no such t exists *)
  val typeOpt : DBMinML.exp -> T.typ option

end;  (* signature TYPING *)

structure Typing :> TYPING =
struct

  open T
  open P
  open DBMinML

  exception Error

  fun typeOf _ = raise Error  (* implement this *)
  fun typeOpt _ = raise Error (* implement this *)

end;  (* structure Typing *)
