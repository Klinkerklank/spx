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

(** val int_to_Z : int -> coq_Z **)

let int_to_Z = function
| Posz n -> Z.of_nat n
| Negz n -> Z.opp (Z.of_nat (S n))

(** val coq_ZeqbP : coq_Z -> coq_Z -> reflect **)

let coq_ZeqbP x y =
  iffP (Z.eqb x y) (if Z.eqb x y then ReflectT else ReflectF)

(** val coq_HB_unnamed_factory_1 : coq_Z Coq_hasDecEq.axioms_ **)

let coq_HB_unnamed_factory_1 =
  { Coq_hasDecEq.eq_op = Z.eqb; Coq_hasDecEq.eqP = coq_ZeqbP }

(** val coq_BinNums_Z__canonical__eqtype_Equality : Equality.coq_type **)

let coq_BinNums_Z__canonical__eqtype_Equality =
  Obj.magic coq_HB_unnamed_factory_1

(** val mod_pow2 : positive -> nat -> coq_N **)

let rec mod_pow2 p = function
| O -> N0
| S n0 ->
  (match p with
   | Coq_xI p0 -> Pos.coq_Nsucc_double (mod_pow2 p0 n0)
   | Coq_xO p0 -> Pos.coq_Ndouble (mod_pow2 p0 n0)
   | Coq_xH -> Npos Coq_xH)

(** val zmod_pow2 : coq_Z -> nat -> coq_Z **)

let zmod_pow2 z n =
  match z with
  | Z0 -> Z0
  | Zpos p -> Z.of_N (mod_pow2 p n)
  | Zneg p ->
    (match mod_pow2 p n with
     | N0 -> Z0
     | Npos p0 -> Z.sub (two_power_nat n) (Zpos p0))
