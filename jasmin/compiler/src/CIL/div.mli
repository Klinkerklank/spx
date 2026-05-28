(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open Datatypes
open Nat0
open Ssrnat

val edivn_rec : nat -> nat -> nat -> nat * nat

val edivn : nat -> nat -> nat * nat

val divn : nat -> nat -> nat

val modn_rec : nat -> nat -> nat

val modn : nat -> nat -> nat
