(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open Compiler_util
open Expr
open Seq
open Sopn

val remove_assert_c :
  'a1 asmOp -> ('a1 instr -> 'a1 instr list) -> 'a1 instr list -> 'a1 instr
  list

val remove_assert_i : 'a1 asmOp -> 'a1 instr -> 'a1 instr list

val remove_assert_fd :
  'a1 asmOp -> progT -> 'a1 fundef -> ('a1, extra_fun_t) _fundef

val remove_assert_prog : 'a1 asmOp -> progT -> 'a1 prog -> 'a1 prog
