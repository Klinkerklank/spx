(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open Eqtype

val assoc :
  Equality.coq_type -> (Equality.sort * 'a1) list -> Equality.sort -> 'a1
  option
