(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open BinInt
open BinNums
open Datatypes
open Nat0
open PeanoNat
open Prelude
open Zpower
open Bigop
open Div
open Eqtype
open Fintype
open Ssrint
open Ssrnat
open Tuple
open Word_ssrZ

val modulus : nat -> coq_Z

type word = coq_Z
  (* singleton inductive, whose constructor was mkWord *)

val coq_HB_unnamed_factory_1 : nat -> (coq_Z, word) Coq_isSub.axioms_

val word_word__canonical__eqtype_SubType : nat -> coq_Z SubType.coq_type

val coq_HB_unnamed_factory_3 : nat -> word Equality.axioms_

val coq_HB_unnamed_mixin_5 : nat -> word Coq_hasDecEq.axioms_

val word_word__canonical__eqtype_Equality : nat -> Equality.coq_type

val mkword : nat -> coq_Z -> word

val urepr : nat -> word -> coq_Z

val word0 : nat -> word

val wsize : nat -> word -> nat

val add_word : nat -> word -> word -> word

val sub_word : nat -> word -> word -> word

val opp_word : nat -> word -> word

val mul_word : nat -> word -> word -> word

val word1 : nat -> word

val wbit : coq_Z -> nat -> bool

val w2t : nat -> word -> bool tuple_of

val t2w_def : nat -> bool tuple_of -> coq_Z

val t2w : nat -> bool tuple_of -> word

val srepr : nat -> word -> coq_Z

val wand : nat -> word -> word -> word

val wor : nat -> word -> word -> word

val wxor : nat -> word -> word -> word

val shiftr_nat : coq_Z -> nat -> coq_Z

val coq_lsr : nat -> word -> nat -> word

val rotl : nat -> word -> nat -> word

val rotr : nat -> word -> nat -> word

val subword : nat -> nat -> nat -> word -> word

val wcat_r : nat -> word list -> coq_Z
