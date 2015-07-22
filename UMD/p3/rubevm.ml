(* Put your implementation in this file. *)

open Instr

let max_regs (p:prog) (f:string):int = failwith "Unimplemented"

let next_inst (p:prog) ((h, s):config):instr = failwith "Unimplemented"

let run_inst (p:prog) ((h, s):config):config = failwith "Unimplemented"

let run_prog (p:prog):value = `L_Int 42 (* failwith "Unimplemented" *)
