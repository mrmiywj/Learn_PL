open Ast

let parse_file name =
  let chan = open_in name in
  let lexbuf = Lexing.from_channel chan in
  let (p:prog) = Parser.main Lexer.token lexbuf in
    close_in chan;
    p

let main () =
  let p = parse_file Sys.argv.(1) in
    try
      Rube.tc_prog p;
      Printf.printf "yes\n"
    with _ -> Printf.printf "no\n"
;;

main ()
