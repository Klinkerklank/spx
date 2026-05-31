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

let __ = let rec f _ = Obj.repr f in Obj.repr f

(** val modulus : nat -> coq_Z **)

let modulus =
  two_power_nat

type word = coq_Z
  (* singleton inductive, whose constructor was mkWord *)

(** val coq_HB_unnamed_factory_1 : nat -> (coq_Z, word) Coq_isSub.axioms_ **)

let coq_HB_unnamed_factory_1 _ =
  { Coq_isSub.val_subdef = (fun w -> w); Coq_isSub.coq_Sub = (fun x _ -> x);
    Coq_isSub.coq_Sub_rect = (fun _ k_S u -> k_S u __) }

(** val word_word__canonical__eqtype_SubType :
    nat -> coq_Z SubType.coq_type **)

let word_word__canonical__eqtype_SubType nbits =
  Obj.magic coq_HB_unnamed_factory_1 nbits

(** val coq_HB_unnamed_factory_3 : nat -> word Equality.axioms_ **)

let coq_HB_unnamed_factory_3 nbits =
  Obj.magic eqtype_sub_type__canonical__eqtype_Equality
    coq_BinNums_Z__canonical__eqtype_Equality (fun x ->
    (&&) (Z.leb Z0 (Obj.magic x)) (Z.ltb (Obj.magic x) (modulus nbits)))
    (reverse_coercion (Obj.magic word_word__canonical__eqtype_SubType nbits)
      __)

(** val coq_HB_unnamed_mixin_5 : nat -> word Coq_hasDecEq.axioms_ **)

let coq_HB_unnamed_mixin_5 =
  coq_HB_unnamed_factory_3

(** val word_word__canonical__eqtype_Equality : nat -> Equality.coq_type **)

let word_word__canonical__eqtype_Equality nbits =
  Obj.magic coq_HB_unnamed_mixin_5 nbits

(** val mkword : nat -> coq_Z -> word **)

let mkword n z =
  zmod_pow2 z n

(** val urepr : nat -> word -> coq_Z **)

let urepr _ w =
  w

(** val word0 : nat -> word **)

let word0 _ =
  Z0

(** val wsize : nat -> word -> nat **)

let wsize n _ =
  n

(** val add_word : nat -> word -> word -> word **)

let add_word n w1 w2 =
  mkword n (Z.add (urepr n w1) (urepr n w2))

(** val sub_word : nat -> word -> word -> word **)

let sub_word n w1 w2 =
  mkword n (Z.sub (urepr n w1) (urepr n w2))

(** val opp_word : nat -> word -> word **)

let opp_word n w =
  mkword n (Z.opp (urepr n w))

(** val mul_word : nat -> word -> word -> word **)

let mul_word n w1 w2 =
  mkword n (Z.mul (urepr n w1) (urepr n w2))

(** val word1 : nat -> word **)

let word1 _ =
  Zpos Coq_xH

(** val wbit : coq_Z -> nat -> bool **)

let wbit z n =
  Z.testbit z (Z.of_nat n)

(** val w2t : nat -> word -> bool tuple_of **)

let w2t n w =
  mktuple n (fun k -> wbit w (nat_of_ord n k))

(** val t2w_def : nat -> bool tuple_of -> coq_Z **)

let t2w_def n t =
  Coq_bigop.body Z0
    (Obj.magic index_enum (fintype_ordinal__canonical__fintype_Finite n))
    (fun i -> BigBody (i, Z.add, true,
    (Z.mul (two_power_nat (nat_of_ord n i))
      (Z.of_nat (nat_of_bool (tnth n t i))))))

(** val t2w : nat -> bool tuple_of -> word **)

let t2w =
  t2w_def

(** val srepr : nat -> word -> coq_Z **)

let srepr n w =
  if wbit w (pred (wsize n w)) then Z.sub w (modulus n) else w

(** val wand : nat -> word -> word -> word **)

let wand _ =
  Z.coq_land

(** val wor : nat -> word -> word -> word **)

let wor _ =
  Z.coq_lor

(** val wxor : nat -> word -> word -> word **)

let wxor _ =
  Z.coq_lxor

(** val shiftr_nat : coq_Z -> nat -> coq_Z **)

let shiftr_nat a n =
  Nat.iter n Z.div2 a

(** val coq_lsr : nat -> word -> nat -> word **)

let coq_lsr n w k =
  shiftr_nat (urepr n w) k

(** val rotl : nat -> word -> nat -> word **)

let rotl n w k =
  t2w n
    (mktuple n (fun i ->
      wbit w (modn (addn (nat_of_ord n i) (subn n (modn k n))) n)))

(** val rotr : nat -> word -> nat -> word **)

let rotr n w k =
  t2w n (mktuple n (fun i -> wbit w (modn (addn (nat_of_ord n i) k) n)))

(** val subword : nat -> nat -> nat -> word -> word **)

let subword n i l w =
  mkword l (coq_lsr n w i)

(** val wcat_r : nat -> word list -> coq_Z **)

let rec wcat_r n = function
| [] -> Z0
| w :: s0 ->
  Z.coq_lor (urepr n w) (Z.shiftl (wcat_r n s0) (int_to_Z (Posz n)))
