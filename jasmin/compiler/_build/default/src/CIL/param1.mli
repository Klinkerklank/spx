(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)


type ('t, 'p) full = 't -> 'p

module Coq_exports :
 sig
  type is_bool =
  | Coq_is_true
  | Coq_is_false
 end
