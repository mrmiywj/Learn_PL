open Ast

let print_unit c (s, n) =
  if n == 1 then
    Printf.fprintf c "%s" s
  else
    Printf.fprintf c "%s^%d" s n

let rec print_unit_t c = function
  | [] -> ()
  | [u] -> Printf.fprintf c "%a" print_unit u
  | u::us -> Printf.fprintf c "%a %a" print_unit u print_unit_t us

let print_value c (fp, u) = Printf.fprintf c "%f %a" fp print_unit_t u

let rec print_expr c = function
  | Val v -> print_value c v
  | Plus (e1, e2) -> Printf.fprintf c "(%a) + (%a)" print_expr e1 print_expr e2
  | Minus (e1, e2) -> Printf.fprintf c "(%a) - (%a)" print_expr e1 print_expr e2
  | Mult (e1, e2) -> Printf.fprintf c "(%a) * (%a)" print_expr e1 print_expr e2
  | Div (e1, e2) -> Printf.fprintf c "(%a) / (%a)" print_expr e1 print_expr e2
  | In (e, u) -> Printf.fprintf c "%a in %a" print_expr e print_unit_t u
