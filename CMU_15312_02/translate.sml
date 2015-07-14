(* Translation from named to de Bruijn represention *)

signature TRANSLATE =
sig
    exception Error of string
    val translate: MinML.exp Stream.stream -> DBMinML.exp Stream.stream
end;  (* signature TRANSLATE *)

structure Translate :> TRANSLATE =
struct
    structure M = MinML
    structure DB = DBMinML
    structure S = Stream

    exception Error of string

    fun translate _ = raise Error "translate unimplemented" (* implement this *)

end;  (* structure Translate *)
