open Ast
open Unparse

type config = (string, float * unit_t) Hashtbl.t

let parse_config (file:string) (conf:config):unit =
  (* implement me *)
  ()

let do_print_config conf =
  Printf.printf "{\n";
  Hashtbl.iter (fun k (r, u) -> Printf.printf "\"%s\": [%f, \"%a\"],\n" k r print_unit_t u) conf;
  Printf.printf "}\n"

let rec eval (c:config) (e:expr):value =
  (1.0, ["s", 1])

let do_calculator (parse_only:bool) (c:config) (f:string) =
  let chan = open_in f in
  let lexbuf = Lexing.from_channel chan in
  try
    let (es:expr list) =
      try Parser.main Lexer.token lexbuf
      with _ -> Printf.printf "Exception Raised!"; print_newline (); exit 0 in
    let _ = close_in chan in
    if parse_only then
      List.iter (fun e -> print_expr stdout e; print_newline ()) es
    else
      List.iter (fun e -> try
			 print_value stdout (eval c e); print_newline ()
		       with _ -> Printf.printf "Exception Raised!\n";
		(* The print statement above is used by the
                      grading scripts, so if you change it, be
                      sure to change it back before submitting. *)
		) es
  with _ -> Printf.printf "Exception Raised!\n"

let main () =
  let config_file = ref "" in
  let parse_only = ref false in
  let parse_config_only = ref false in
  let input_file = ref "" in
  let (conf : config) = Hashtbl.create(17) in (* initially empty *)
  let argspecs =
    ["-config", Arg.String (fun s -> config_file := s), "Specify config file";
     "-parse-only", Arg.Unit (fun () -> parse_only := true), "Parse and output ASTs only (do not eval)";
     "-parse-config-only", Arg.Unit (fun () -> parse_config_only := true), "Parse config file, print it, and exit";
    ]
  in
  Arg.parse argspecs (fun s -> input_file := s) "Usage: ./calc [options] input_file";
  if !config_file <> "" then (
    try (parse_config (!config_file) conf; )
    with _ -> Printf.printf "Configuration Exception Raised!\n"; (exit 1) );
  if !parse_config_only then
    do_print_config conf
  else if !input_file <> "" then
    do_calculator !parse_only conf !input_file
  else
    Printf.printf "Usage: ./calc [options] input_file\n"
;;

  main ()
