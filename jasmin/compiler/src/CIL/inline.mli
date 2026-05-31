(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open Datatypes
open Compiler_util
open Expr
open Seq
open Sopn
open Type
open Utils0
open Var0

module E :
 sig
  val pass : string

  val inline_error : pp_error -> pp_error_loc
 end

val get_flag : lval -> assgn_tag -> assgn_tag

val assgn_tuple :
  'a1 asmOp -> instr_info -> lval list -> assgn_tag -> atype list -> pexpr
  list -> 'a1 instr list

val inline_c :
  'a1 asmOp -> ('a1 instr -> SvExtra.Sv.t -> (SvExtra.Sv.t * 'a1 instr list)
  cexec) -> 'a1 instr list -> SvExtra.Sv.t -> (pp_error_loc,
  SvExtra.Sv.t * 'a1 instr list) result

val locals_p : 'a1 asmOp -> 'a1 ufundef -> SvExtra.Sv.t

val check_disjoint :
  'a1 asmOp -> 'a1 ufundef -> SvExtra.Sv.t -> (pp_error_loc, unit) result

val get_fun :
  'a1 asmOp -> 'a1 ufun_decls -> funname -> (pp_error_loc, 'a1 fundef) result

val extend_iinfo_i :
  'a1 asmOp -> (instr_info -> instr_info -> instr_info) -> instr_info -> 'a1
  instr -> 'a1 instr

val extend_iinfo_cmd :
  'a1 asmOp -> (instr_info -> instr_info -> instr_info) -> instr_info -> 'a1
  instr list -> 'a1 instr list

val inline_i :
  'a1 asmOp -> (instr_info -> instr_info -> instr_info) -> 'a1 ufun_decls ->
  'a1 instr -> SvExtra.Sv.t -> (SvExtra.Sv.t * 'a1 instr list) cexec

val inline_fd :
  'a1 asmOp -> (instr_info -> instr_info -> instr_info) -> 'a1 ufun_decls ->
  'a1 ufundef -> (pp_error_loc, ('a1, extra_fun_t) _fundef) result

val inline_fd_cons :
  'a1 asmOp -> (instr_info -> instr_info -> instr_info) -> (funname * 'a1
  ufundef) -> 'a1 ufun_decls cexec -> (pp_error_loc, (funname * 'a1 fundef)
  list) result

val inline_prog :
  'a1 asmOp -> (instr_info -> instr_info -> instr_info) -> 'a1 ufun_decls ->
  'a1 ufun_decls cexec

val inline_prog_err :
  'a1 asmOp -> (instr_info -> instr_info -> instr_info) -> 'a1 uprog ->
  (pp_error_loc, ('a1, extra_fun_t, extra_prog_t) _prog) result
