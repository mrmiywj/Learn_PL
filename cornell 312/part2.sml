(*
 * Name:
 * NetID:
 *)

datatype CircuitTree =
  AND of CircuitTree*CircuitTree | OR of CircuitTree*CircuitTree |
  XOR of CircuitTree*CircuitTree | NAND of CircuitTree*CircuitTree |
  IMPLIES of CircuitTree*CircuitTree | NOT of CircuitTree |
  Var of string;

(* The following allows CircuitTree expression to be written like
 * (NOT (Var "x") AND (Var "y" IMPLIES Var "z"))
 *)
infix AND
infix OR
infix XOR
infix NAND
infix IMPLIES


fun makeTree(circuit : string) : CircuitTree =
  raise Fail "Implement me!"


