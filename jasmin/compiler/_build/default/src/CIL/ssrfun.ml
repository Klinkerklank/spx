(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)


module Option =
 struct
  (** val apply : ('a1 -> 'a2) -> 'a2 -> 'a1 option -> 'a2 **)

  let apply f x = function
  | Some y -> f y
  | None -> x

  (** val default : 'a1 -> 'a1 option -> 'a1 **)

  let default x =
    apply (fun x0 -> x0) x

  (** val bind : ('a1 -> 'a2 option) -> 'a1 option -> 'a2 option **)

  let bind f =
    apply f None

  (** val map : ('a1 -> 'a2) -> 'a1 option -> 'a2 option **)

  let map f =
    bind (fun x -> Some (f x))
 end

type ('aT, 'rT) simpl_fun =
  'aT -> 'rT
  (* singleton inductive, whose constructor was SimplFun *)

(** val fun_of_simpl : ('a1, 'a2) simpl_fun -> 'a1 -> 'a2 **)

let fun_of_simpl f =
  f

(** val comp : ('a2 -> 'a1) -> ('a3 -> 'a2) -> 'a3 -> 'a1 **)

let comp f g x =
  f (g x)

(** val pcomp :
    ('a2 -> 'a1 option) -> ('a3 -> 'a2 option) -> 'a3 -> 'a1 option **)

let pcomp f g x =
  Option.bind f (g x)
