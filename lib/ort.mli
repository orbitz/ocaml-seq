module Seq :
  sig
    val next : 'a Stream.t -> 'a option
    val fold : f:('a -> 'b -> 'a) -> init:'a -> 'b Stream.t -> 'a
    val consume : f:('a -> unit) -> 'a Stream.t -> unit
    val iterate : f:('a -> 'a) -> 'a -> 'a Stream.t
    val take : int -> 'a Stream.t -> 'a Stream.t
    val take_while : f:('a -> bool) -> 'a Stream.t -> 'a Stream.t
    val drop : int -> 'a Stream.t -> 'a Stream.t
    val drop_while : f:('a -> bool) -> 'a Stream.t -> 'a Stream.t
    val enumerate :
      ?start:int -> ?step:int -> 'a Stream.t -> (int * 'a) Stream.t
    val map : f:('a -> 'b) -> 'a Stream.t -> 'b Stream.t
    val filter : f:('a -> bool) -> 'a Stream.t -> 'a Stream.t
    val chunk : int -> 'a Stream.t -> 'a list Stream.t
    val to_list : 'a Stream.t -> 'a list
    val of_list : 'a list -> 'a Stream.t
    val of_string : string -> char Stream.t
  end
module Lazy_io :
  sig
    val read_line : in_channel -> string option
    val read_file_lines : ?close:bool -> in_channel -> string Stream.t
    val read_chunk : int -> in_channel -> string option
    val read_file_chunks :
      ?close:bool -> int -> in_channel -> string Stream.t
  end
module Function :
  sig
    val ( |> ) : 'a -> ('a -> 'b) -> 'b
    val flip : ('a -> 'b -> 'c) -> 'b -> 'a -> 'c
    val const : 'a -> 'b -> 'a
    val identity : 'a -> 'a
  end
module Fileutils :
  sig
    type file_path = Ort_fileutils.file_path
    val join : file_path list -> file_path
    val basename : file_path -> file_path
    val dirname : file_path -> file_path
  end
