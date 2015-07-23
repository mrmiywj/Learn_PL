type expr =
    EInt of int
  | ENil
  | ESelf
  | EString of string
  | ELocal of string    (* Read a local variable *)
  | EField of string    (* Read a field *)
  | EIf of expr * expr * expr
  | ESeq of expr * expr
  | EWrite of string * expr  (* Write a local variable *)
  | EWriteField of string * expr  (* Write a field *)
  | ENew of string
  | EInvoke of expr * string * ((string option * expr) list) (* The string option is for part 5 *)
  | ECast of expr * typ

and typ = TClass of string
(* We don't really need a constructor for the above type,
   but it may help catch some type errors *)

and mtyp = (typ list) * typ

(*  meth name * arg name list * method body *)
type meth = { meth_name : string;
	      meth_ret: typ;
	      (* The expr option and string option fields below are used only
		 for part 5 of the project, and they can be ignored for
	         parts 1-4. *)
	      meth_args : (string * typ * expr option * string option) list;
	      meth_locals : (string * typ) list;
	      meth_body : expr }

(* class name * superclass name * methods *)
type cls = { cls_name : string;
	     cls_super : string;
	     cls_fields : (string * typ) list;
	     cls_meths : meth list }

(* classes * top-level expression *)
type prog = { prog_clss : cls list;
	      prog_main : expr }
