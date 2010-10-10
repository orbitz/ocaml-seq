(*pp camlp4o *)
(*
 * Functions for perform lazy i/o
 *)


let read_line fin =
  try
    Some (input_line fin)
  with
      End_of_file ->
	None

(*
 * Read the lines from an open file lazily.  If close is set to true
 * the file will be closed when the end is reached
 *)
let rec read_file_lines ?(close = false) fin =
  match read_line fin with
      Some line ->
	[< 'line; read_file_lines ~close:close fin >]
    | None ->
	if close then
	  begin
	    close_in fin;
	    [< >]
	  end
	else
	  [< >]


let read_chunk chunk_size fin = 
  let s = String.create chunk_size in
  let len = input fin s 0 chunk_size in
  if len = 0 then
    None
  else if len <> chunk_size then
    Some (String.sub s 0 len)
  else
    Some s

let rec read_file_chunks ?(close = false) chunk_size fin =
  match read_chunk chunk_size fin with
      Some chunk ->
	[< 'chunk; read_file_chunks ~close:close chunk_size fin >]
    | None ->
	if close then
	  begin
	    close_in fin;
	    [< >]
	  end
	else
	  [< >]


