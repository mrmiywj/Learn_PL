open Ast

exception Type_error

(*********************************************************************)

let rec output_expr o = function
  | EInt i -> Printf.fprintf o "%d" i
  | ENil -> Printf.fprintf o "nil"
  | ESelf -> Printf.fprintf o "self"
  | EString s -> Printf.fprintf o "\"%s\"" s
  | ELocal x -> output_string o x
  | EField x -> output_string o x
  | EIf (e1, e2, e3) ->
      Printf.fprintf o "if %a then %a else %a end" output_expr e1
	output_expr e2 output_expr e3
  | ESeq (e1, e2) -> Printf.fprintf o "%a; %a" output_expr e1 output_expr e2
  | EWrite (x, e) ->
      Printf.fprintf o "%s = (%a)" x output_expr e
  | EWriteField (x, e) ->
      Printf.fprintf o "%s = (%a)" x output_expr e
  | ENew x ->
      Printf.fprintf o "new %s" x
  | EInvoke (e, m, es) ->
      Printf.fprintf o "%a.%s(%a)" output_expr e m output_actuals es
  | ECast (e, t) ->
      Printf.fprintf o "(%a:%a)" output_expr e output_typ t

and output_actual o (_, e) = Printf.fprintf o "%a" output_expr e

and output_actuals o = function
    [] -> ()
  | [e] -> output_actual o e
  | e::es -> Printf.fprintf o "%a, %a" output_actual e output_actuals es

and output_exprs o = function
    [] -> ()
  | [e] -> output_expr o e
  | e::es -> Printf.fprintf o "%a, %a" output_expr e output_exprs es

and output_typ o = function
  | TClass s -> Printf.fprintf o "%s" s

and output_typs o = function
  | [] -> ()
  | [t] -> output_typ o t
  | t::ts -> Printf.fprintf o "%a, %a" output_typ t output_typs ts

and output_arg o = function
    (s, t, _, _) -> Printf.fprintf o "%s:%a" s output_typ t

and output_args o = function
  | [] -> ()
  | [a] -> output_arg o a
  | a::aa -> Printf.fprintf o "%a, %a" output_arg a output_args aa

and output_local o = function
    (s, t) -> Printf.fprintf o "%s:%a" s output_typ t

and output_locals o = function
  | [] -> ()
  | [l] -> output_local o l
  | l::ls -> Printf.fprintf o "%a\n%a" output_local l output_locals ls

and output_meth o ({meth_name=name; meth_ret=ret; meth_args=args; meth_locals=locals; meth_body=body}:meth) =
  Printf.fprintf o "  def %a %s(%a)\n %a  begin\n    %a\n   end\n" output_typ ret name output_args args output_locals locals output_expr body

and output_meths o = function
    [] -> ()
  | [m] -> Printf.fprintf o "%a" output_meth m
  | m::ms -> Printf.fprintf o "%a\n%a" output_meth m output_meths ms

and output_cls o ({cls_name=name; cls_super=super; cls_fields=fields; cls_meths=meths}:cls) =
  Printf.fprintf o "class %s < %s\n %a\n %a\nend\n" name super output_locals fields output_meths meths

and output_clss o = function
    [] -> ()
  | [c] -> Printf.fprintf o "%a" output_cls c
  | c::cs -> Printf.fprintf o "%a\n%a" output_cls c output_clss cs

and print_program ({prog_clss=clss; prog_main=main}:prog) = match clss with
  | [] -> Printf.printf "%a\n" output_expr main
  | _ -> Printf.printf "%a\n%a\n" output_clss clss output_expr main

(*********************************************************************)

let tc_prog (p:prog) =
  (* change this! *)

  print_program p

let defined_class ({prog_clss=clss;prog_main=main}:prog) (c:string) = match c with
  | "Object" -> true
  | "Integer" -> true
  | "String" -> true
  | "Bot" -> true
  | _ -> List.exists (fun x -> (x.cls_name = c)) clss 

let rec lca_class ({prog_clss=clss;prog_main=main}:prog) (c1:string) (c2:string) = match (c1,c2) with
  | (_,"Object") -> "Object"
  | ("Object",_) -> "Object"
  | (c,"Bot") -> "Bot"
  | ("Bot",c) -> "Bot"
  | (a,b) ->let class1 = List.find (fun x -> (x.cls_name = c1)) clss in
            let ancestor1 = class1.cls_super in
            let class2 = List.find (fun x -> (x.cls_name = c2)) clss in
            let ancestor2 = class2.cls_super in
            if (ancestor1 = ancestor2) then ancestor1
             else lca_class {prog_clss=clss;prog_main=main} ancestor1 ancestor2

let fatherof ({prog_clss=clss;prog_main=main}:prog) (t:typ) = match t with
  | TClass tname -> let cl = List.find (fun x -> (x.cls_name = tname)) clss in
                    (TClass cl.cls_super)

let rec castatob ({prog_clss=clss;prog_main=main}:prog) (t1:typ) (t2:typ) =
  if (t1 = t2) then true
  else if (t1 = TClass "Object") then false
  else castatob {prog_clss=clss;prog_main=main} (fatherof {prog_clss=clss;prog_main=main} t1) t2

let rec castbtoa ({prog_clss=clss;prog_main=main}:prog) (t1:typ) (t2:typ) =
  if (t1 = t2) then true
  else if (t2 = TClass "Object") then false
  else castbtoa {prog_clss=clss;prog_main=main} t1 (fatherof {prog_clss=clss;prog_main=main} t2)

let castable ({prog_clss=clss;prog_main=main}:prog) (t1:typ) (t2:typ) =
  if (t1 = t2) then true
  else (castatob  {prog_clss=clss;prog_main=main} t1 t2) || (castbtoa {prog_clss=clss;prog_main=main} t1 t2)


