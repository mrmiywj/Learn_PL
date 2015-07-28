open Rube
open Ounit2

let test1 "test1"= assert_equal 1 (fstoffour (1,2,3,4))

let suit =
  "suite">:::
    ["test1" >:: test]
;;

let () =
  run_test_tt_main suit
