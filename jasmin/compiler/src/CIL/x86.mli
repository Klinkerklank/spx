(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open Datatypes
open Arch_decl
open Eqtype
open Utils0
open X86_decl
open X86_instr_decl

val x86_eval_cond :
  (rflag -> (error, bool) result) -> condt -> (error, bool) result

val x86 : (register, register_ext, xmm_register, rflag, condt, x86_op) asm
