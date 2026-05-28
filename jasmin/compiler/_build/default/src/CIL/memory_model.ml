(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open BinInt
open BinNums
open Bool
open Eqb_core_defs
open Eqtype
open Seq
open Utils0
open Word0
open Word_ssrZ
open Wsize

type __ = Obj.t

module LE =
 struct
  (** val encode : wsize -> word -> word list **)

  let encode sz w =
    split_vec sz (nat_of_wsize U8) w

  (** val decode : wsize -> word list -> word **)

  let decode sz n =
    make_vec U8 sz n
 end

type pointer_op = { add : (Equality.sort -> coq_Z -> Equality.sort);
                    sub : (Equality.sort -> Equality.sort -> coq_Z);
                    p_to_z : (Equality.sort -> coq_Z) }

(** val is_align :
    Equality.coq_type -> pointer_op -> Equality.sort -> wsize -> bool **)

let is_align _ pointer p sz =
  eq_op coq_BinNums_Z__canonical__eqtype_Equality
    (Obj.magic Z.modulo (pointer.p_to_z p) (wsize_size sz)) (Obj.magic Z0)

type 'core_mem coreMem = { get : ('core_mem -> Equality.sort -> word exec);
                           set : ('core_mem -> Equality.sort -> word ->
                                 'core_mem exec);
                           valid8 : ('core_mem -> Equality.sort -> bool);
                           valid8P : ('core_mem -> Equality.sort -> word ->
                                     reflect) }

type aligned =
| Unaligned
| Aligned

(** val aligned_tag : aligned -> positive **)

let aligned_tag = function
| Unaligned -> Coq_xH
| Aligned -> Coq_xO Coq_xH

type box_aligned_Unaligned =
| Box_aligned_Unaligned

type aligned_fields_t = __

(** val aligned_fields : aligned -> aligned_fields_t **)

let aligned_fields _ =
  Obj.magic Box_aligned_Unaligned

(** val aligned_eqb_fields :
    (aligned -> aligned -> bool) -> positive -> aligned_fields_t ->
    aligned_fields_t -> bool **)

let aligned_eqb_fields _ _ _ _ =
  true

(** val aligned_eqb : aligned -> aligned -> bool **)

let aligned_eqb x1 x2 =
  eqb_body aligned_tag aligned_fields
    (Obj.magic aligned_eqb_fields (fun _ _ -> true)) (aligned_tag x1)
    Box_aligned_Unaligned x2

(** val aligned_eqb_OK : aligned -> aligned -> reflect **)

let aligned_eqb_OK =
  iffP2 aligned_eqb

(** val coq_HB_unnamed_factory_1 : aligned Coq_hasDecEq.axioms_ **)

let coq_HB_unnamed_factory_1 =
  { Coq_hasDecEq.eq_op = aligned_eqb; Coq_hasDecEq.eqP = aligned_eqb_OK }

(** val memory_model_aligned__canonical__eqtype_Equality :
    Equality.coq_type **)

let memory_model_aligned__canonical__eqtype_Equality =
  Obj.magic coq_HB_unnamed_factory_1

(** val aligned_le : aligned -> aligned -> bool **)

let aligned_le x y =
  (||)
    (eq_op memory_model_aligned__canonical__eqtype_Equality (Obj.magic x)
      (Obj.magic Unaligned))
    (eq_op memory_model_aligned__canonical__eqtype_Equality (Obj.magic y)
      (Obj.magic Aligned))

module CoreMem =
 struct
  (** val is_aligned_if :
      Equality.coq_type -> pointer_op -> aligned -> Equality.sort -> wsize ->
      bool **)

  let is_aligned_if pointer pointer0 al ptr sz =
    match al with
    | Unaligned -> true
    | Aligned -> is_align pointer pointer0 ptr sz

  (** val read :
      Equality.coq_type -> pointer_op -> 'a1 coreMem -> 'a1 -> aligned ->
      Equality.sort -> wsize -> word exec **)

  let read pointer pointer0 cM m al ptr sz =
    if is_aligned_if pointer pointer0 al ptr sz
    then (match mapM (fun k -> cM.get m (pointer0.add ptr k))
                  (ziota Z0 (wsize_size sz)) with
          | Ok x -> Ok (LE.decode sz x)
          | Error s -> Error s)
    else let s = ErrAddrInvalid in Error s

  (** val write :
      Equality.coq_type -> pointer_op -> 'a1 coreMem -> 'a1 -> aligned ->
      Equality.sort -> wsize -> word -> 'a1 exec **)

  let write pointer pointer0 cM m al ptr sz w =
    if is_aligned_if pointer pointer0 al ptr sz
    then let bytes = LE.encode sz w in
         foldM (fun k m0 ->
           cM.set m0 (pointer0.add ptr k) (nth (word0 U8) bytes (Z.to_nat k)))
           m (ziota Z0 (wsize_size sz))
    else let s = ErrAddrInvalid in Error s
 end

(** val coq_PointerW : coq_PointerData -> pointer_op **)

let coq_PointerW pd =
  { add = (fun p k -> Obj.magic add_word pd p (wrepr pd k)); sub =
    (fun p1 p2 -> wunsigned pd (sub_word pd (Obj.magic p1) (Obj.magic p2)));
    p_to_z = (fun p -> wunsigned pd (Obj.magic p)) }

(** val round_ws : wsize -> coq_Z -> coq_Z **)

let round_ws ws sz =
  let d = wsize_size ws in
  let (q, r) = Z.div_eucl sz d in
  if eq_op coq_BinNums_Z__canonical__eqtype_Equality (Obj.magic r)
       (Obj.magic Z0)
  then sz
  else Z.mul (Z.add q (Zpos Coq_xH)) d

type 'mem memory = { stack_root : ('mem -> word);
                     stack_limit : ('mem -> word);
                     frames : ('mem -> word list);
                     alloc_stack : ('mem -> wsize -> coq_Z -> coq_Z -> coq_Z
                                   -> 'mem exec);
                     free_stack : ('mem -> 'mem);
                     init : ((word * coq_Z) list -> word -> 'mem exec) }

module type MemoryT =
 sig
  type mem

  val coq_CM : coq_PointerData -> mem coreMem

  val coq_M : coq_PointerData -> mem memory
 end
