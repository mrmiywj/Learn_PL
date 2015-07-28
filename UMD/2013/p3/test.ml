open OUnit2
open Ast

let test1 test_ctxt = assert_equal 1 (Rube.fstoffour (1,2,3,4))
let test2 test_ctxt = assert_equal true (Rube.defined_class {prog_clss=[{cls_name="class";cls_super="Object";cls_fields=[("",TClass "")];cls_meths=[]}];prog_main=ENil} "class") 

let suit =
  "suite">:::
    ["test1" >:: test1;
    "test2" >:: test2]
;;

let () =
  run_test_tt_main suit
