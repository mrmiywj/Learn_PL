(* Printing expressions *)
(* Supports both named and de Bruijn form *)

signature PRINT =
sig
  type exp

  (* print a type *)
  val typToString : T.typ -> string

  (* print an expression *)
  val expToString : exp -> string
end

signature NAMEDPRINT = PRINT 
    where type exp = MinML.exp

signature DBPRINT = PRINT 
    where type exp = DBMinML.exp

(*--------------------------------------------------*)
structure Print :> NAMEDPRINT =
struct

    structure M = MinML
    type exp = M.exp

    fun po P.Equals = "="
      | po P.LessThan = "<"
      | po P.Plus = "+"
      | po P.Minus = "-"
      | po P.Times = "*"
      | po P.Negate = "~"

    fun typToString T.INT = "int"
      | typToString T.BOOL = "bool"
      | typToString (T.ARROW(d, r)) = 
	"(" ^ typToString d ^ ") -> (" ^ typToString r ^ ")"

    and expToString (M.Int i) = Int.toString i
      | expToString (M.Bool true) = "true"
      | expToString (M.Bool false) = "false"
      | expToString (M.If (ec, et, ef)) = 
	"if " ^ expToString ec ^ " then " ^
	expToString et ^ " else " ^ expToString ef ^ " fi"
      | expToString (M.Primop (p, nil)) = "(bad primop)"
      | expToString (M.Primop (p, e::es)) = 
	"(" ^ foldl (fn (a, b) => "(" ^ b ^ ")" ^ po p ^ "(" ^ 
                                  expToString a ^ ")")
	(expToString e) es ^ ")"
      | expToString (M.Fn (t, (x, e))) = 
	"fn " ^ x ^ " : " ^ typToString t ^ " => " ^ expToString e
      | expToString (M.Rec (t, (x, e))) = 
	"rec " ^ x ^ " : " ^ typToString t ^ " => " ^ expToString e
      | expToString (M.Let (e1, (x, e2))) = 
	"let " ^ x ^ " = " ^ expToString e1 ^ " in " ^
	expToString e2 ^ " end"
      | expToString (M.Apply (f, e)) = 
	"(" ^ expToString f ^ " " ^ expToString e ^ ")"
      | expToString (M.Var v) = v

end;  (* structure Print *)

structure DBPrint :> DBPRINT =
struct

    structure M = DBMinML
    type exp = M.exp

    fun po P.Equals = "="
      | po P.LessThan = "<"
      | po P.Plus = "+"
      | po P.Minus = "-"
      | po P.Times = "*"
      | po P.Negate = "~"

    fun typToString T.INT = "int"
      | typToString T.BOOL = "bool"
      | typToString (T.ARROW(d, r)) = 
	"(" ^ typToString d ^ ") -> (" ^ typToString r ^ ")"

    and expToString (M.Int i) = Int.toString i
      | expToString (M.Bool true) = "true"
      | expToString (M.Bool false) = "false"
      | expToString (M.Fn (t, ((), e))) = 
	"fn _ : " ^ typToString t ^ " => " ^ expToString e
      | expToString (M.Rec (t, ((), e))) = 
	"rec _ : " ^ typToString t ^ " => " ^ expToString e
      | expToString (M.If (ec, et, ef)) = 
	"if " ^ expToString ec ^ " then " ^
	expToString et ^ " else " ^ expToString ef ^ " fi"
      | expToString (M.Primop (p, nil)) = "(bad primop)"
      | expToString (M.Primop (p, e::es)) = 
	"(" ^ foldl (fn (a, b) => "(" ^ b ^ ")" ^ po p ^ "(" ^ 
                                  expToString a ^ ")")
	(expToString e) es ^ ")"
      | expToString (M.Let (e1, ((), e2))) = 
	"let - = " ^ expToString e1 ^ " in " ^
	expToString e2 ^ " end"
      | expToString (M.Apply (e1, e2)) = 
	"(" ^ expToString e1 ^ " " ^ expToString e2 ^ ")"
      | expToString (M.Var x) = "DB[" ^ (Int.toString x) ^ "]"

end;  (* structure DBPrint *)
