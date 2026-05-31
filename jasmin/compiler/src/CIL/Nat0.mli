(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open Datatypes

val pred : nat -> nat

val add : nat -> nat -> nat

val mul : nat -> nat -> nat

val sub : nat -> nat -> nat

val max : nat -> nat -> nat

val min : nat -> nat -> nat
