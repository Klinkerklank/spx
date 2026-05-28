(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open Bool
open Datatypes
open Nat0
open Eqtype
open Ssrbool

val eqn : nat -> nat -> bool

val eqnP : nat eq_axiom

val coq_HB_unnamed_factory_1 : nat Coq_hasDecEq.axioms_

val coq_Datatypes_nat__canonical__eqtype_Equality : Equality.coq_type

val addn_rec : nat -> nat -> nat

val addn : nat -> nat -> nat

val subn_rec : nat -> nat -> nat

val subn : nat -> nat -> nat

val leq : nat -> nat -> bool

val iter : nat -> ('a1 -> 'a1) -> 'a1 -> 'a1

val muln_rec : nat -> nat -> nat

val muln : nat -> nat -> nat

val nat_of_bool : bool -> nat
