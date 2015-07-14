(* MinML Abstract Syntax *)
(* Given in named form and deBruijn form without variable names *)

(* Types and primitive operations *)
signature TYPE =
sig
  (* MinML types *)
  datatype typ =
      INT
    | BOOL
    | ARROW of typ * typ
end;  (* signature TP *)

structure T :> TYPE =
struct
  (* MinML types *)
  datatype typ =
      INT
    | BOOL
    | ARROW of typ * typ
end;  (* structure T *)

signature PRIMOP =
sig  
  (* Primitive operations *)
  datatype primop = Equals | LessThan | Plus | Minus | Times | Negate

  (* given a primop, get its argument and result types *)
  val typeOfPrimop : primop -> T.typ list * T.typ

end;  (* signature PRIMOP *)

structure P :> PRIMOP =
struct
  (* Primitive operations *)
  datatype primop = Equals | LessThan | Plus | Minus | Times | Negate

  fun typeOfPrimop Equals  = ([T.INT, T.INT], T.BOOL)
    | typeOfPrimop LessThan  = ([T.INT, T.INT], T.BOOL)
    | typeOfPrimop Plus   = ([T.INT, T.INT], T.INT)
    | typeOfPrimop Minus  = ([T.INT, T.INT], T.INT)
    | typeOfPrimop Times  = ([T.INT, T.INT], T.INT)
    | typeOfPrimop Negate = ([T.INT], T.INT)

end;  (* structure P *)

(* MinML *)
(* Shared between representations *)
signature MINML =
sig

  (* Variables *)
  type var
  type bind
  (* val varEqual : var * var -> bool *)

  (* Expression *)
  (* Binders are grouped with their scope *)
  datatype exp =
      Int of int			(* k *)
    | Bool of bool			(* true or false *)
    | If of exp * exp * exp		(* if e then e1 else e2 fi *)
    | Primop of P.primop * exp list	(* e1 <op> e2  or  <op> e *)
    | Fun of T.typ * T.typ * (bind * bind * exp) (* fun f(x:t1):t2 is e end *)
    | Let of exp * (bind * exp)		(* let x be e1 in e2 end *)
    | Apply of exp * exp		(* e1 e2 *)
    | Var of var			(* x *)

  (* given a primop and some arguments, try to apply it *)
  val evalPrimop : P.primop * exp list -> exp option

end;  (* signature MINML *)

(* Named representation *)
signature NAMEDMINML =
  MINML where type bind = string and type var = string;

(* de Bruijn representation *)
signature DBMINML =
  MINML where type bind = unit and type var = int;


(* MinML *)
(* Shared between representations *)
functor MinML
   (type bind
    type var)
 :> MINML where type bind = bind and type var = var
=
struct

  (* Variables *)
  type bind = bind
  type var = var

  (* Expressions *)
  (* Binders are grouped with their scope *)
  datatype exp =
      Int of int			(* k *)
    | Bool of bool			(* true or false *)
    | If of exp * exp * exp		(* if e then e1 else e2 fi *)
    | Primop of P.primop * exp list	(* e1 <op> e2  or  <op> e *)
    | Fun of T.typ * T.typ * (bind * bind * exp) (* fun f(x:t1):t2 is e end *)
    | Let of exp * (bind * exp)		(* let x be e1 in e2 end *)
    | Apply of exp * exp		(* e1 e2 *)
    | Var of var			(* x *)

  (* Evaluation of primops on evaluated arguments *)
  fun evalPrimop (P.Equals, [Int i, Int i']) = SOME (Bool (i = i'))
    | evalPrimop (P.LessThan, [Int i, Int i']) = SOME (Bool (i < i'))
    | evalPrimop (P.Plus, [Int i, Int i']) = SOME (Int (i + i'))
    | evalPrimop (P.Minus, [Int i, Int i']) = SOME (Int (i - i'))
    | evalPrimop (P.Times, [Int i, Int i']) = SOME (Int (i * i'))
    | evalPrimop (P.Negate, [Int i]) = SOME (Int (~i))
    | evalPrimop _ = NONE

end;  (* functor MinML *)

structure MinML = MinML (type bind = string
                         type var = string);
structure DBMinML = MinML (type bind = unit
                           type var = int);
