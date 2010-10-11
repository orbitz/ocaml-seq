val read_line : in_channel -> string option
val read_file_lines : ?close:bool -> in_channel -> string Stream.t
val read_chunk : int -> in_channel -> string option
val read_file_chunks : ?close:bool -> int -> in_channel -> string Stream.t
