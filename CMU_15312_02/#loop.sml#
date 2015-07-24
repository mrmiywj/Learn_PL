signature LOOP =
sig
  type action = DBMinML.exp -> unit
  type noDB_action = MinML.exp -> unit

  (* print the expression *)
  val show      : action
  val show_noDB      : noDB_action

  (* ... with its type *)
  val showType  : action

  (* apply an action to a completely evaluated expression *)
  val eval      : action -> action

  (* apply an action to each step of the evaluation *)
  val step      : action -> action

  (* wait after executing an action *)
  val wait      : action -> action

  (* run an action on user input expressions, without translating to deBruijn form *)
  val loop_noDB      : noDB_action -> unit
  (* ... on a file *)
  val loopFile_noDB  : string -> noDB_action -> unit

  (* run an action on user input expressions, after translating to deBruijn form *)
  val loop      : action -> unit
  (* ... on a file *)
  val loopFile  : string -> action -> unit
end

structure Loop :> LOOP =
struct

  type action = DBMinML.exp -> unit
  type noDB_action = MinML.exp -> unit

  fun typing e =
          (case Typing.typeOpt e
             of SOME t => " : " ^ DBPrint.typToString t
              | NONE => " has no type.")

  (* A few actions *)

  fun show e =
      List.app print [DBPrint.expToString e, ";\n"]

  fun show_noDB e =
      List.app print [Print.expToString e, ";\n"]

  fun showType e =
      List.app print [DBPrint.expToString e, typing e, "\n"]

  fun eval action e = action (Eval.multiStep e)

  fun wait action e =
      (action e;
       print "Press return:";
       TextIO.inputLine TextIO.stdIn;
       ())

  fun step action e = Stream.app action (Eval.stepStream e)


  (* Running the actions on an interactive loop or a file *)

  fun loop action =
         Stream.app action
         ((Translate.translate o Parse.parse o Lexer.lex) (Input.promptkeybd "MinML> "))

  fun loop_noDB action =
         Stream.app action
         (Parse.parse (Lexer.lex (Input.promptkeybd "MinML> ")))

  fun loopFile name action =
         Stream.app action
         ((Translate.translate o Parse.parse o Lexer.lex) (Input.readfile name))

  fun loopFile_noDB name action =
         Stream.app action
         (Parse.parse (Lexer.lex (Input.readfile name)))

end
