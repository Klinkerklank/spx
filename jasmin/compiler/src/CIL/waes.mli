(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open BinNums
open Datatypes
open Seq
open Ssrnat
open Word0
open Word
open Wsize

val coq_Sbox : Word0.word -> Word0.word

val coq_InvSbox : Word0.word -> Word0.word

val coq_SubWord : Word0.word -> Word0.word

val coq_InvSubWord : Word0.word -> Word0.word

val coq_RotWord : Word0.word -> Word0.word

val to_matrix :
  Word0.word ->
  ((((((((((((((word * word) * word) * word) * word) * word) * word) * word) * word) * word) * word) * word) * word) * word) * word) * word

val to_state :
  (((((((((((((((Word0.word * Word0.word) * Word0.word) * Word0.word) * Word0.word) * Word0.word) * Word0.word) * Word0.word) * Word0.word) * Word0.word) * Word0.word) * Word0.word) * Word0.word) * Word0.word) * Word0.word) * Word0.word)
  -> Word0.word

val coq_SubBytes : Word0.word -> Word0.word

val coq_InvSubBytes : Word0.word -> Word0.word

val coq_ShiftRows : Word0.word -> Word0.word

val coq_InvShiftRows : Word0.word -> Word0.word

val coq_MixColumns : Word0.word -> Word0.word

val coq_InvMixColumns : Word0.word -> Word0.word

val wAESDEC : Word0.word -> Word0.word -> Word0.word

val wAESDECLAST : Word0.word -> Word0.word -> Word0.word

val wAESENC : Word0.word -> Word0.word -> Word0.word

val wAESENCLAST : Word0.word -> Word0.word -> Word0.word

val wAESKEYGENASSIST : Word0.word -> Word0.word -> Word0.word
