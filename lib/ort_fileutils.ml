open Core_extended
open Core_extended.Std

type file_path = string

let join = String.concat ~sep:"/"

let basename path =
  match String.rsplit2 ~on:'/' path with
    | Some (_, basename) -> basename
    | None -> path

let dirname path =
  match String.rsplit2 ~on:'/' path with
    | Some (dirname, _) -> dirname
    | None -> path
