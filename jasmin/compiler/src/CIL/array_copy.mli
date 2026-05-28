(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open BinNums
open Datatypes
open Compiler_util
open Expr
open Memory_model
open Pseudo_operator
open Seq
open Sopn
open Type
open Utils0
open Var0
open Warray_
open Wsize

module E :
 sig
  val pass : string

  val error : pp_error_loc
 end

val direct_copy :
  'a1 asmOp -> wsize -> var_i -> gvar -> pexpr -> 'a1 instr_r list

val tmp_var :
  (v_kind -> instr_info -> string -> atype -> Ident.Ident.ident) -> fun_info
  -> wsize -> Var.var

val indirect_copy :
  'a1 asmOp -> (v_kind -> instr_info -> string -> atype -> Ident.Ident.ident)
  -> fun_info -> wsize -> var_i -> gvar -> pexpr -> 'a1 instr_r list

val needs_temporary : Var.var -> Var.var -> bool

val array_copy :
  'a1 asmOp -> (v_kind -> instr_info -> string -> atype -> Ident.Ident.ident)
  -> fun_info -> instr_info -> var_i -> wsize -> positive -> gvar -> 'a1
  instr list

val array_copy_c :
  'a1 asmOp -> SvExtra.Sv.t -> (SvExtra.Sv.t -> 'a1 instr -> 'a1 instr list
  cexec) -> 'a1 instr list -> 'a1 instr list cexec

val is_copy : 'a1 asmOp -> 'a1 sopn -> (wsize * positive) option

val get_source :
  'a1 asmOp -> (v_kind -> instr_info -> string -> atype -> Ident.Ident.ident)
  -> SvExtra.Sv.t -> instr_info -> pexpr list -> (gvar * 'a1 instr list) cexec

val get_target :
  'a1 asmOp -> (v_kind -> instr_info -> string -> atype -> Ident.Ident.ident)
  -> SvExtra.Sv.t -> instr_info -> lval list -> (var_i * 'a1 instr list) cexec

val array_copy_i :
  'a1 asmOp -> (v_kind -> instr_info -> string -> atype -> Ident.Ident.ident)
  -> fun_info -> SvExtra.Sv.t -> 'a1 instr -> 'a1 instr list cexec

val array_copy_fd :
  'a1 asmOp -> (v_kind -> instr_info -> string -> atype -> Ident.Ident.ident)
  -> progT -> 'a1 fundef -> (pp_error_loc, ('a1, extra_fun_t) _fundef) result

val array_copy_prog :
  'a1 asmOp -> (v_kind -> instr_info -> string -> atype -> Ident.Ident.ident)
  -> progT -> 'a1 prog -> (pp_error_loc, ('a1, extra_fun_t, extra_prog_t)
  _prog) result
