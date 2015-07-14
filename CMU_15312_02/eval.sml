(* Evaluation of MinML Expression *)
(* Uses de Bruijn representation *)

signature EVAL =
sig
  exception Stuck

  (* one-step evaluation, raises Stuck if impossible *)
  val step : DBMinML.exp -> DBMinML.exp

  (* ... returns NONE if impossible *)
  val stepOpt : DBMinML.exp -> DBMinML.exp option

  (* repeats step as many times as possible *)
  val multiStep : DBMinML.exp -> DBMinML.exp

  (* a stream of all steps of an evaluation *)
  val stepStream : DBMinML.exp -> DBMinML.exp Stream.stream

end;  (* signature EVAL *)

structure Eval :> EVAL =
struct

  open T
  open P
  open DBMinML
  structure S = Stream

  exception Stuck
  exception Done

  fun step _ = raise Stuck         (* implement this *)
  fun stepOpt _ = raise Stuck      (* implement this *)
  fun multiStep _ = raise Stuck    (* implement this *)
  fun stepStream _ = raise Stuck   (* implement this *)

end;  (* structure Eval *)
