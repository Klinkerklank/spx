(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open BinInt
open BinNums
open BinPos
open Datatypes
open Prelude
open Div
open Eqtype
open Flag_combination
open Operators
open Sem_type
open Seq
open Type
open Utils0
open Warray_
open Word0
open Word_ssrZ
open Wsize

val mk_sem_sop1 : ('a1 -> 'a2) -> 'a1 -> 'a2 exec

val sem_wiop1_typed : signedness -> wiop1 -> sem_t -> sem_t exec

val sem_sop1_typed : sop1 -> sem_t -> sem_t exec

val zlsl : coq_Z -> coq_Z -> coq_Z

val zasr : coq_Z -> coq_Z -> coq_Z

val sem_shift :
  (wsize -> word -> coq_Z -> word) -> wsize -> word -> word -> word

val sem_shr : wsize -> word -> word -> word

val sem_sar : wsize -> word -> word -> word

val sem_shl : wsize -> word -> word -> word

val sem_ror : wsize -> word -> word -> word

val sem_rol : wsize -> word -> word -> word

val sem_vadd : velem -> wsize -> word -> word -> word

val sem_vsub : velem -> wsize -> word -> word -> word

val sem_vmul : velem -> wsize -> word -> word -> word

val sem_vshr : velem -> wsize -> word -> word -> word

val sem_vsar : velem -> wsize -> word -> word -> word

val sem_vshl : velem -> wsize -> word -> word -> word

val mk_sem_divmod :
  signedness -> wsize -> (word -> word -> word) -> word -> word -> word exec

val mk_sem_sop2 : ('a1 -> 'a2 -> 'a3) -> 'a1 -> 'a2 -> 'a3 exec

val mk_sem_wiop2 :
  signedness -> wsize -> (coq_Z -> coq_Z -> coq_Z) -> word -> word -> word
  exec

val mk_sem_wishift :
  signedness -> wsize -> (coq_Z -> coq_Z -> coq_Z) -> word -> word -> word
  exec

val mk_sem_wicmp :
  signedness -> wsize -> (coq_Z -> coq_Z -> bool) -> word -> word -> bool exec

val sem_wiop2_typed :
  signedness -> wsize -> wiop2 -> sem_t -> sem_t -> sem_t exec

val sem_sop2_typed : sop2 -> sem_t -> sem_t -> sem_t exec

val sem_combine_flags :
  coq_FlagCombinationParams -> combine_flags -> bool -> bool -> bool -> bool
  -> bool

val sem_opN_typed : coq_FlagCombinationParams -> opN -> sem_t exec sem_prod
