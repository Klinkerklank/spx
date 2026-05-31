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

(** val sem_cond_arg : (register -> word) -> register option -> word **)

let sem_cond_arg get = function
| Some r -> get r
| None -> wrepr riscv_reg_size Z0

(** val sem_cond_kind : condition_kind -> word -> word -> bool **)

let sem_cond_kind ck x y =
  match ck with
  | EQ ->
    eq_op (word_word__canonical__eqtype_Equality riscv_reg_size)
      (Obj.magic x) (Obj.magic y)
  | NE ->
    negb
      (eq_op (word_word__canonical__eqtype_Equality riscv_reg_size)
        (Obj.magic x) (Obj.magic y))
  | LT sg -> wlt riscv_reg_size sg x y
  | GE sg -> wle riscv_reg_size sg y x

(** val riscv_eval_cond :
    (register -> word) -> condt -> (error, bool) result **)

let riscv_eval_cond get c =
  Ok
    (sem_cond_kind c.cond_kind (sem_cond_arg get c.cond_fst)
      (sem_cond_arg get c.cond_snd))

(** val riscv : (register, empty, empty, empty, condt, riscv_op) asm **)

let riscv =
  { _arch_decl = riscv_decl; _asm_op_decl = riscv_op_decl; eval_cond =
    (fun r _ -> riscv_eval_cond r) }
