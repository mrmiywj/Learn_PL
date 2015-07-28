open OUnit2

let test1 test_ctxt = assert_equal 1 (Rube.fstoffour (1,2,3,4))

let suit =
  "suite">:::
    ["test1" >:: test1]
;;

let () =
  run_test_tt_main suit
