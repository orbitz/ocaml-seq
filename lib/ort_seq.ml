(*pp camlp4o pa_extend.cmo *)

let next s = 
  try
    Some (Stream.next s)
  with 
      Stream.Failure -> None



let rec fold ~f ~init s =
  match next s with
      Some v ->
	fold ~f:f ~init:(f init v) s
    | None -> init

let consume ~f =
  fold ~f:(fun () e -> f e) ~init:()

(*
 * Takes a function and an initial value and returns a stream incrementally
 * calling the function
 *)
let rec iterate ~f v = 
  let fv = f v in
  [< 'fv; iterate ~f:f fv >]

let rec take n s =
  if n > 0 then
    match next s with
      | Some e -> [< 'e; take (n - 1) s >]
      | None -> [< >]
  else
    [< >]

let rec take_while ~f s =
  match next s with
    | Some e -> 
      if f e then
	[< 'e; take_while ~f:f s >]
      else
	[< 'e; s >]
    | None ->
      [< >]

let rec drop n s =
  if n > 0 then
    match next s with
      | Some _ ->
	drop (n - 1) s
      | None ->
	[< >]
  else
    s

let rec drop_while ~f s =
  match next s with
    | Some e ->
      if f e then
	drop_while ~f:f s
      else
	[< 'e; s >]
    | None ->
      [< >]

(*
 * Given a sequene will iterate that sequence and for each
 * element return a tuple of (intvalue, seq)
 *)
let rec enumerate ?(start = 0) ?(step = 1) seq =
  match next seq with
    | Some v ->
	let d = (start, v) in
	[< 'd; enumerate ~start:(start + step) ~step:step seq >]
    | None ->
	[< >]

let rec map ~f s =
  match next s with
    | Some v ->
	[< 'f v; map ~f:f s >]
    | None ->
	[< >]

let rec filter ~f s =
  match next s with
    | Some v ->
      if f v then 
	[< 'v; filter ~f:f s >]
      else
	[< filter ~f:f s >]
    | None ->
      [< >]


let rec chunk n s =
  let rec chunk' a = function
    | 0 -> [< 'List.rev a; chunk n s >]
    | n -> begin
      match next s with
	| Some e ->
	  chunk' (e::a) (n - 1)
	| None -> begin
	  match a with
	    | [] ->
	      [< >]
	    | v ->
	      [< 'List.rev a >]
	end
    end
  in
  chunk' [] n

(*
 * Conversion functions
 *)
let to_list s = List.rev (fold ~f:(fun a e -> e::a) ~init:[] s)

let rec of_list =
  function
      [] -> 
	[< >]
    | x::xs -> 
	[< 'x; of_list xs >]
  
let of_string s =
  let rec of_string' idx =
    if idx < String.length s then
      let c = s.[idx] in
      [< 'c; of_string' (idx + 1) >]
    else
      [< >]
  in
  of_string' 0
