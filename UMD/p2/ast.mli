type unit_t = (string * int) list

type value = float * unit_t

type expr =
  | Val of value
  | Plus of expr * expr
  | Minus of expr * expr
  | Mult of expr * expr
  | Div of expr * expr
  | In of expr * unit_t
