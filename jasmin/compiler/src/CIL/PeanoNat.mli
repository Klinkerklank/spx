(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open Datatypes

module Nat :
 sig
  val leb : nat -> nat -> bool

  val iter : nat -> ('a1 -> 'a1) -> 'a1 -> 'a1
 end
