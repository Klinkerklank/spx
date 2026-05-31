(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open Datatypes

val add : Uint63.t -> Uint63.t -> Uint63.t

val eqb : Uint63.t -> Uint63.t -> bool

val leb : Uint63.t -> Uint63.t -> bool

val compares : Uint63.t -> Uint63.t -> comparison
