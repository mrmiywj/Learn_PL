open Rubevm

let main () =
  let input_file = ref "" in
  Arg.parse [] (fun s -> input_file := s)  "Usage: ./rubevm input_file";
  if !input_file <> "" then
    let chan = open_in (!input_file) in
    let lexbuf = Lexing.from_channel chan in
    let p =
      try Parser.main Lexer.token lexbuf
      with _ -> Printf.printf "Parse error!\n"; exit 0 in
    let p' = Hashtbl.create 17 in
    let _ = List.iter (fun (f, is) -> Hashtbl.add p' f (Array.of_list is)) p in
    let _ = close_in chan in
(*    Disassembler.disassemble p'; *)
    let v = Rubevm.run_prog p' in
    Printf.printf "%a\n" Disassembler.value v
  else
    Printf.printf "Usage: ./rubevm input_file"

;;

main ()
