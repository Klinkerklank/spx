(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open BinNums
open Datatypes
open Arch_decl
open Arch_utils
open Eqtype
open Riscv_decl
open Riscv_instr_decl
open Utils0
open Word0

val sem_cond_arg : (register -> word) -> register option -> word

val sem_cond_kind : condition_kind -> word -> word -> bool

val riscv_eval_cond : (register -> word) -> condt -> (error, bool) result

val riscv : (register, empty, empty, empty, condt, riscv_op) asm
