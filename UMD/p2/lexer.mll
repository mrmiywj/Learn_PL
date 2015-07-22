{
 open Parser
 exception Eof
}
rule token = parse
  [' ' '\t' '\n' '\r']	{ token lexbuf } (* skip whitespace *)
| eof { EOF }
| _ as lxm { Printf.printf "Illegal character %c" lxm; failwith "Bad input" }

