signature TOP =
sig
    (* interactive loop *)
    val loop_print : unit -> unit
    val loop_print_noDB : unit -> unit  (* print before translating to 
                                           deBruijn form *)
    val loop_type  : unit -> unit
    val loop_eval  : unit -> unit

    (* read a MinML source file *)
    val file_print : string -> unit
    val file_print_noDB : string -> unit (* print before translating to 
                                            deBruijn form *)
    val file_type  : string -> unit
    val file_eval  : string -> unit
    val file_step  : string -> unit
end

structure Top :> TOP =
struct

    fun loop_eval () = 
        (Loop.loop (Loop.eval Loop.showType)) 
        handle Parse.Error s => print ("Parse Error: " ^ s ^ "\n");

    fun loop_type () = 
        (Loop.loop Loop.showType)
        handle Parse.Error s => print ("Parse Error: " ^ s ^ "\n");

    fun loop_print_noDB () =
        (Loop.loop_noDB Loop.show_noDB)
        handle Parse.Error s => print ("Parse Error: " ^ s ^ "\n");

    fun loop_print () =
        (Loop.loop Loop.show)
        handle Parse.Error s => print ("Parse Error: " ^ s ^ "\n");

    fun file_print f =
        (Loop.loopFile f Loop.show)
        handle Parse.Error s => print ("Parse Error: " ^ s ^ "\n");

    fun file_print_noDB f =
        (Loop.loopFile_noDB f Loop.show_noDB)
        handle Parse.Error s => print ("Parse Error: " ^ s ^ "\n");

    fun file_type  f = 
        (Loop.loopFile f Loop.showType)
        handle Parse.Error s => print ("Parse Error: " ^ s ^ "\n");

    fun file_eval  f =
        (Loop.loopFile f (Loop.eval Loop.showType)) 
        handle Parse.Error s => print ("Parse Error: " ^ s ^ "\n");

    fun file_step  f =
        (Loop.loopFile f (Loop.step Loop.showType)) 
        handle Parse.Error s => print ("Parse Error: " ^ s ^ "\n");

end
