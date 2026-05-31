(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)


(** val locked_with : unit -> 'a1 -> 'a1 **)

let locked_with _ x =
  x

(** val ssr_have_upoly : 'a1 -> ('a1 -> 'a2) -> 'a2 **)

let ssr_have_upoly step rest =
  rest step
