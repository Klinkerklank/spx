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

module LE :
 sig
  val encode : wsize -> word -> word list

  val decode : wsize -> word list -> word
 end

type pointer_op = { add : (Equality.sort -> coq_Z -> Equality.sort);
                    sub : (Equality.sort -> Equality.sort -> coq_Z);
                    p_to_z : (Equality.sort -> coq_Z) }

val is_align :
  Equality.coq_type -> pointer_op -> Equality.sort -> wsize -> bool

type 'core_mem coreMem = { get : ('core_mem -> Equality.sort -> word exec);
                           set : ('core_mem -> Equality.sort -> word ->
                                 'core_mem exec);
                           valid8 : ('core_mem -> Equality.sort -> bool);
                           valid8P : ('core_mem -> Equality.sort -> word ->
                                     reflect) }

type aligned =
| Unaligned
| Aligned

val aligned_tag : aligned -> positive

type box_aligned_Unaligned =
| Box_aligned_Unaligned

type aligned_fields_t = __

val aligned_fields : aligned -> aligned_fields_t

val aligned_eqb_fields :
  (aligned -> aligned -> bool) -> positive -> aligned_fields_t ->
  aligned_fields_t -> bool

val aligned_eqb : aligned -> aligned -> bool

val aligned_eqb_OK : aligned -> aligned -> reflect

val coq_HB_unnamed_factory_1 : aligned Coq_hasDecEq.axioms_

val memory_model_aligned__canonical__eqtype_Equality : Equality.coq_type

val aligned_le : aligned -> aligned -> bool

module CoreMem :
 sig
  val is_aligned_if :
    Equality.coq_type -> pointer_op -> aligned -> Equality.sort -> wsize ->
    bool

  val read :
    Equality.coq_type -> pointer_op -> 'a1 coreMem -> 'a1 -> aligned ->
    Equality.sort -> wsize -> word exec

  val write :
    Equality.coq_type -> pointer_op -> 'a1 coreMem -> 'a1 -> aligned ->
    Equality.sort -> wsize -> word -> 'a1 exec
 end

val coq_PointerW : coq_PointerData -> pointer_op

val round_ws : wsize -> coq_Z -> coq_Z

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
