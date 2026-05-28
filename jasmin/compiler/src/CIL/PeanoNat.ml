(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open Datatypes

module Nat =
 struct
  (** val leb : nat -> nat -> bool **)

  let rec leb n m =
    match n with
    | O -> true
    | S n' -> (match m with
               | O -> false
               | S m' -> leb n' m')

  (** val iter : nat -> ('a1 -> 'a1) -> 'a1 -> 'a1 **)

  let rec iter n f x =
    match n with
    | O -> x
    | S n0 -> f (iter n0 f x)
 end
