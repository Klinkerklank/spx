(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open BinNums
open Datatypes

(** val shift_nat : nat -> positive -> positive **)

let rec shift_nat n z =
  match n with
  | O -> z
  | S n0 -> Coq_xO (shift_nat n0 z)

(** val two_power_nat : nat -> coq_Z **)

let two_power_nat n =
  Zpos (shift_nat n Coq_xH)
