(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open Flag_combination
open Sopn
open Syscall
open Wsize

type 'syscall_state coq_EstateParams = { _pd : coq_PointerData;
                                         _msf_size : coq_MSFsize }

type coq_SemPexprParams =
  coq_FlagCombinationParams
  (* singleton inductive, whose constructor was mk_spp *)

type ('asm_op, 'syscall_state) coq_SemInstrParams = { _asmop : 'asm_op asmOp;
                                                      _sc_sem : 'syscall_state
                                                                syscall_sem }
