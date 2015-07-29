open OUnit2
open Ast

let meth1={meth_name="meth1";
            meth_ret=TClass "class1";
            meth_args=[("a",TClass "Integer",None,None);
                       ("b",TClass "String",None,None)];
            meth_locals=[("a",TClass "local1")];
            meth_body = ENil}

let meth2={meth_name="meth2";
           meth_ret=TClass "Integer";
           meth_args=[("a",TClass "class1",None,None)];
           meth_locals = [("a",TClass "local2");
                         ("b",TClass "local1")];
          meth_body=ENil}

let sampleclsslist = [{cls_name="class1";
                       cls_super="Object";
                       cls_fields=[("field1", TClass "type1")];
                       cls_meths=[meth1]};
                      {cls_name="class2";
                       cls_super="class1";
                       cls_fields=[("field1",TClass "type1");
                                   ("field2",TClass "type2")];
                       cls_meths=[meth2]}]

let sampleprog = {prog_clss=sampleclsslist;
                 prog_main=ENil}

let test1 test_ctxt = assert_equal 1 (Rube.fstoffour (1,2,3,4))
let test2 test_ctxt = assert_equal true (Rube.defined_class {prog_clss=[{cls_name="class";cls_super="Object";cls_fields=[("",TClass "")];cls_meths=[]}];prog_main=ENil} "class") 
let test3 text_ctxt = assert_equal true (Rube.defined_class sampleprog "Integer")
let test4 text_ctxt = assert_equal true (Rube.defined_class sampleprog "class2")
let test5 text_ctxt = assert_equal "class1" (Rube.lca_class sampleprog "class1" "class2")
let test6 test_ctxt = assert_equal "Object" (Rube.lca_class sampleprog "class1" "Integer")

let suit =
  "suite">:::
    ["test1" >:: test1;
     "test2" >:: test2;
     "test3" >:: test3;
     "test4">:: test4;
     "test5">:: test5;
     "test6">::test6]
;;

let () =
  run_test_tt_main suit
