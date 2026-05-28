(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open Datatypes
open Arch_decl
open Arch_utils
open Arm_decl
open Arm_instr_decl
open Eqtype
open Utils0

val arm_eval_cond :
  (rflag -> (error, bool) result) -> condt -> (error, bool) result

val arm : (register, empty, empty, rflag, condt, arm_op) asm
