(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open BinInt
open BinNums
open BinPos
open Bool
open Datatypes
open Zpower
open Eqtype
open Ssrbool
open Ssrint

val int_to_Z : int -> coq_Z

val coq_ZeqbP : coq_Z -> coq_Z -> reflect

val coq_HB_unnamed_factory_1 : coq_Z Coq_hasDecEq.axioms_

val coq_BinNums_Z__canonical__eqtype_Equality : Equality.coq_type

val mod_pow2 : positive -> nat -> coq_N

val zmod_pow2 : coq_Z -> nat -> coq_Z
