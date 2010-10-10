val next : 'a Stream.t -> 'a option
val of_list : 'a list -> 'a Stream.t
val of_string : string -> char Stream.t
val fold_left : ('a -> 'b -> 'a) -> 'a -> 'b Stream.t -> 'a
val to_list : 'a Stream.t -> 'a list
val iterate : ('a -> 'a) -> 'a -> 'a Stream.t
val take : int -> 'a Stream.t -> 'a Stream.t
val enumerate : ?start:int -> ?step:int -> 'a Stream.t -> (int * 'a) Stream.t
val map : ('a -> 'b) -> 'a Stream.t -> 'b Stream.t
val filter : ('a -> bool) -> 'a Stream.t -> 'a Stream.t
