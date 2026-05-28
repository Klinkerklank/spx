(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open BinInt
open BinNums
open BinPos
open Bool
open Datatypes
open Div
open EqbOK
open Eqb_core_defs
open Eqtype
open Global
open Memory_model
open Operators
open Seq
open Sopn
open Ssrbool
open Ssrfun
open Strings
open Syscall
open Type
open Utils0
open Var0
open Warray_
open Word0
open Word_ssrZ
open Wsize

type __ = Obj.t

val uint_of_word : wsize -> sop1

val sint_of_word : wsize -> sop1

val etype_of_wiop1 :
  signedness -> wiop1 -> 'a1 extended_type * 'a1 extended_type

val type_of_wiop1 : wiop1 -> atype * atype

val type_of_opk : op_kind -> atype

val etype_of_opk : op_kind -> 'a1 extended_type

val etype_of_op1 : sop1 -> 'a1 extended_type * 'a1 extended_type

val type_of_op1 : sop1 -> atype * atype

val etype_of_wiop2 :
  signedness -> wsize -> wiop2 -> ('a1 extended_type * 'a1
  extended_type) * 'a1 extended_type

val type_of_wiop2 : wsize -> wiop2 -> (atype * atype) * atype

val opk8 : op_kind -> op_kind

val opk_of_cmpk : cmp_kind -> op_kind

val etype_of_op2 :
  sop2 -> ('a1 extended_type * 'a1 extended_type) * 'a1 extended_type

val type_of_op2 : sop2 -> (atype * atype) * atype

val tin_combine_flags : atype list

val type_of_opN : opN -> atype list * atype

module type TAG =
 sig
  type t

  val witness : t
 end

module VarInfo :
 TAG

type var_info = Location.t

val dummy_var_info : var_info

type var_i = { v_var : Var.var; v_info : var_info }

val v_var : var_i -> Var.var

val v_info : var_i -> var_info

val mk_var_i : Var.var -> var_i

type v_scope =
| Slocal
| Sglob

type is_v_scope =
| Coq_is_Slocal
| Coq_is_Sglob

val v_scope_tag : v_scope -> positive

val is_v_scope_inhab : v_scope -> is_v_scope

val is_v_scope_functor : v_scope -> is_v_scope -> is_v_scope

type box_v_scope_Slocal =
| Box_v_scope_Slocal

type v_scope_fields_t = __

val v_scope_fields : v_scope -> v_scope_fields_t

val v_scope_construct : positive -> v_scope_fields_t -> v_scope option

val v_scope_induction : 'a1 -> 'a1 -> v_scope -> is_v_scope -> 'a1

val v_scope_eqb_fields :
  (v_scope -> v_scope -> bool) -> positive -> v_scope_fields_t ->
  v_scope_fields_t -> bool

val v_scope_eqb : v_scope -> v_scope -> bool

val v_scope_eqb_OK : v_scope -> v_scope -> reflect

val v_scope_eqb_OK_sumbool : v_scope -> v_scope -> bool

val coq_HB_unnamed_factory_1 : v_scope Coq_hasDecEq.axioms_

val expr_v_scope__canonical__eqtype_Equality : Equality.coq_type

type gvar = { gv : var_i; gs : v_scope }

val gv : gvar -> var_i

val gs : gvar -> v_scope

val mk_gvar : var_i -> gvar

val mk_lvar : var_i -> gvar

val is_lvar : gvar -> bool

val is_glob : gvar -> bool

type pexpr =
| Pconst of coq_Z
| Pbool of bool
| Parr_init of wsize * positive
| Pvar of gvar
| Pget of aligned * arr_access * wsize * gvar * pexpr
| Psub of arr_access * wsize * positive * gvar * pexpr
| Pload of aligned * wsize * pexpr
| Papp1 of sop1 * pexpr
| Papp2 of sop2 * pexpr * pexpr
| PappN of opN * pexpr list
| Pif of atype * pexpr * pexpr * pexpr

val coq_Plvar : var_i -> pexpr

val enot : pexpr -> pexpr

val eor : pexpr -> pexpr -> pexpr

val eand : pexpr -> pexpr -> pexpr

val eeq : pexpr -> pexpr -> pexpr

val eneq : pexpr -> pexpr -> pexpr

val eaddw : wsize -> pexpr -> pexpr -> pexpr

val cf_of_condition : sop2 -> (combine_flags * wsize) option

val pexpr_of_cf : combine_flags -> var_info -> Var.var list -> pexpr

type lval =
| Lnone of var_info * atype
| Lvar of var_i
| Lmem of aligned * wsize * var_info * pexpr
| Laset of aligned * arr_access * wsize * var_i * pexpr
| Lasub of arr_access * wsize * positive * var_i * pexpr

val get_pvar : pexpr -> Var.var exec

val get_lvar : lval -> Var.var exec

val coq_Lnone_b : var_info -> lval

val var_info_of_lval : lval -> var_info

type dir =
| UpTo
| DownTo

type is_dir =
| Coq_is_UpTo
| Coq_is_DownTo

val dir_tag : dir -> positive

val is_dir_inhab : dir -> is_dir

val is_dir_functor : dir -> is_dir -> is_dir

type box_dir_UpTo =
| Box_dir_UpTo

type dir_fields_t = __

val dir_fields : dir -> dir_fields_t

val dir_construct : positive -> dir_fields_t -> dir option

val dir_induction : 'a1 -> 'a1 -> dir -> is_dir -> 'a1

val dir_eqb_fields :
  (dir -> dir -> bool) -> positive -> dir_fields_t -> dir_fields_t -> bool

val dir_eqb : dir -> dir -> bool

val dir_eqb_OK : dir -> dir -> reflect

val dir_eqb_OK_sumbool : dir -> dir -> bool

val coq_HB_unnamed_factory_3 : dir Coq_hasDecEq.axioms_

val expr_dir__canonical__eqtype_Equality : Equality.coq_type

type range = (dir * pexpr) * pexpr

val wrange : dir -> coq_Z -> coq_Z -> coq_Z list

module type InstrInfoT =
 sig
  type t

  val witness : t

  val with_location : t -> t

  val is_inline : t -> bool

  val var_info_of_ii : t -> var_info
 end

module InstrInfo :
 InstrInfoT

type instr_info = IInfo.t

val dummy_instr_info : instr_info

val ii_with_location : instr_info -> instr_info

val ii_is_inline : instr_info -> bool

val var_info_of_ii : instr_info -> var_info

type assgn_tag =
| AT_none
| AT_keep
| AT_rename
| AT_inline
| AT_phinode

type is_assgn_tag =
| Coq_is_AT_none
| Coq_is_AT_keep
| Coq_is_AT_rename
| Coq_is_AT_inline
| Coq_is_AT_phinode

val assgn_tag_tag : assgn_tag -> positive

val is_assgn_tag_inhab : assgn_tag -> is_assgn_tag

val is_assgn_tag_functor : assgn_tag -> is_assgn_tag -> is_assgn_tag

type box_assgn_tag_AT_none =
| Box_assgn_tag_AT_none

type assgn_tag_fields_t = __

val assgn_tag_fields : assgn_tag -> assgn_tag_fields_t

val assgn_tag_construct : positive -> assgn_tag_fields_t -> assgn_tag option

val assgn_tag_induction :
  'a1 -> 'a1 -> 'a1 -> 'a1 -> 'a1 -> assgn_tag -> is_assgn_tag -> 'a1

val assgn_tag_eqb_fields :
  (assgn_tag -> assgn_tag -> bool) -> positive -> assgn_tag_fields_t ->
  assgn_tag_fields_t -> bool

val assgn_tag_eqb : assgn_tag -> assgn_tag -> bool

val assgn_tag_eqb_OK : assgn_tag -> assgn_tag -> reflect

val assgn_tag_eqb_OK_sumbool : assgn_tag -> assgn_tag -> bool

val coq_HB_unnamed_factory_5 : assgn_tag Coq_hasDecEq.axioms_

val expr_assgn_tag__canonical__eqtype_Equality : Equality.coq_type

type align =
| Align
| NoAlign

module Coq_align :
 sig
  type is_align =
  | Coq_is_Align
  | Coq_is_NoAlign

  val tag : align -> positive

  val is_align_inhab : align -> is_align

  val is_align_functor : align -> is_align -> is_align

  type box_align_Align =
  | Box_align_Align

  type fields_t = __

  val fields : align -> fields_t

  val construct : positive -> fields_t -> align option

  val induction : 'a1 -> 'a1 -> align -> is_align -> 'a1

  val eqb_fields :
    (align -> align -> bool) -> positive -> fields_t -> fields_t -> bool

  val eqb : align -> align -> bool

  val eqb_OK : align -> align -> reflect

  val eqb_OK_sumbool : align -> align -> bool
 end

val coq_HB_unnamed_factory_7 : align Coq_hasDecEq.axioms_

val expr_align__canonical__eqtype_Equality : Equality.coq_type

type assertion = assertion_label * pexpr

type assertions = assertion list

type 'asm_op instr_r =
| Cassgn of lval * assgn_tag * atype * pexpr
| Copn of lval list * assgn_tag * 'asm_op sopn * pexpr list
| Csyscall of lval list
   * (Wsize.wsize * BinNums.positive) Syscall_t.syscall_t * pexpr list
| Cassert of assertion
| Cif of pexpr * 'asm_op instr list * 'asm_op instr list
| Cfor of var_i * range * 'asm_op instr list
| Cwhile of align * 'asm_op instr list * pexpr * instr_info
   * 'asm_op instr list
| Ccall of lval list * funname * pexpr list
and 'asm_op instr =
| MkI of instr_info * 'asm_op instr_r

val cmd_rect_aux :
  'a1 asmOp -> 'a3 -> ('a1 instr -> 'a1 instr list -> 'a2 -> 'a3 -> 'a3) ->
  ('a1 instr -> 'a2) -> 'a1 instr list -> 'a3

val instr_Rect :
  'a1 asmOp -> ('a1 instr_r -> instr_info -> 'a2 -> 'a3) -> 'a4 -> ('a1 instr
  -> 'a1 instr list -> 'a3 -> 'a4 -> 'a4) -> (lval -> assgn_tag -> atype ->
  pexpr -> 'a2) -> (lval list -> assgn_tag -> 'a1 sopn -> pexpr list -> 'a2)
  -> (lval list -> (Wsize.wsize * BinNums.positive) Syscall_t.syscall_t ->
  pexpr list -> 'a2) -> (assertion -> 'a2) -> (pexpr -> 'a1 instr list -> 'a1
  instr list -> 'a4 -> 'a4 -> 'a2) -> (var_i -> dir -> pexpr -> pexpr -> 'a1
  instr list -> 'a4 -> 'a2) -> (align -> 'a1 instr list -> pexpr ->
  instr_info -> 'a1 instr list -> 'a4 -> 'a4 -> 'a2) -> (lval list -> funname
  -> pexpr list -> 'a2) -> 'a1 instr -> 'a3

val instr_r_Rect :
  'a1 asmOp -> ('a1 instr_r -> instr_info -> 'a2 -> 'a3) -> 'a4 -> ('a1 instr
  -> 'a1 instr list -> 'a3 -> 'a4 -> 'a4) -> (lval -> assgn_tag -> atype ->
  pexpr -> 'a2) -> (lval list -> assgn_tag -> 'a1 sopn -> pexpr list -> 'a2)
  -> (lval list -> (Wsize.wsize * BinNums.positive) Syscall_t.syscall_t ->
  pexpr list -> 'a2) -> (assertion -> 'a2) -> (pexpr -> 'a1 instr list -> 'a1
  instr list -> 'a4 -> 'a4 -> 'a2) -> (var_i -> dir -> pexpr -> pexpr -> 'a1
  instr list -> 'a4 -> 'a2) -> (align -> 'a1 instr list -> pexpr ->
  instr_info -> 'a1 instr list -> 'a4 -> 'a4 -> 'a2) -> (lval list -> funname
  -> pexpr list -> 'a2) -> 'a1 instr_r -> 'a2

val cmd_rect :
  'a1 asmOp -> ('a1 instr_r -> instr_info -> 'a2 -> 'a3) -> 'a4 -> ('a1 instr
  -> 'a1 instr list -> 'a3 -> 'a4 -> 'a4) -> (lval -> assgn_tag -> atype ->
  pexpr -> 'a2) -> (lval list -> assgn_tag -> 'a1 sopn -> pexpr list -> 'a2)
  -> (lval list -> (Wsize.wsize * BinNums.positive) Syscall_t.syscall_t ->
  pexpr list -> 'a2) -> (assertion -> 'a2) -> (pexpr -> 'a1 instr list -> 'a1
  instr list -> 'a4 -> 'a4 -> 'a2) -> (var_i -> dir -> pexpr -> pexpr -> 'a1
  instr list -> 'a4 -> 'a2) -> (align -> 'a1 instr list -> pexpr ->
  instr_info -> 'a1 instr list -> 'a4 -> 'a4 -> 'a2) -> (lval list -> funname
  -> pexpr list -> 'a2) -> 'a1 instr list -> 'a4

module type FunInfoT =
 sig
  type t

  val witness : t

  val entry_info : t -> instr_info

  val ret_info : t -> instr_info
 end

module FunInfo :
 FunInfoT

type fun_info = FInfo.t

val entry_info_of_fun_info : fun_info -> instr_info

val ret_info_of_fun_info : fun_info -> instr_info

type progT =
| Build_progT

type extra_fun_t = __

type extra_prog_t = __

type extra_val_t = __

type ('asm_op, 'extra_fun_t) _fundef = { f_info : fun_info;
                                         f_tyin : atype list;
                                         f_params : var_i list;
                                         f_body : 'asm_op instr list;
                                         f_tyout : atype list;
                                         f_res : var_i list;
                                         f_extra : 'extra_fun_t }

val f_info : 'a1 asmOp -> ('a1, 'a2) _fundef -> fun_info

val f_tyin : 'a1 asmOp -> ('a1, 'a2) _fundef -> atype list

val f_params : 'a1 asmOp -> ('a1, 'a2) _fundef -> var_i list

val f_body : 'a1 asmOp -> ('a1, 'a2) _fundef -> 'a1 instr list

val f_tyout : 'a1 asmOp -> ('a1, 'a2) _fundef -> atype list

val f_res : 'a1 asmOp -> ('a1, 'a2) _fundef -> var_i list

val f_extra : 'a1 asmOp -> ('a1, 'a2) _fundef -> 'a2

type ('asm_op, 'extra_fun_t) _fun_decl =
  funname * ('asm_op, 'extra_fun_t) _fundef

type ('asm_op, 'extra_fun_t, 'extra_prog_t) _prog = { p_funcs : ('asm_op,
                                                                'extra_fun_t)
                                                                _fun_decl list;
                                                      p_globs : glob_decl list;
                                                      p_extra : 'extra_prog_t }

val p_funcs : 'a1 asmOp -> ('a1, 'a2, 'a3) _prog -> ('a1, 'a2) _fun_decl list

val p_globs : 'a1 asmOp -> ('a1, 'a2, 'a3) _prog -> glob_decl list

val p_extra : 'a1 asmOp -> ('a1, 'a2, 'a3) _prog -> 'a3

type 'asm_op fundef = ('asm_op, extra_fun_t) _fundef

type function_signature = atype list * atype list

val signature_of_fundef :
  'a1 asmOp -> progT -> 'a1 fundef -> function_signature

type 'asm_op fun_decl = funname * 'asm_op fundef

type 'asm_op prog = ('asm_op, extra_fun_t, extra_prog_t) _prog

val coq_Build_prog :
  'a1 asmOp -> progT -> ('a1, extra_fun_t) _fun_decl list -> glob_decl list
  -> extra_prog_t -> 'a1 prog

val progUnit : progT

type 'asm_op ufundef = 'asm_op fundef

type 'asm_op ufun_decl = 'asm_op fun_decl

type 'asm_op ufun_decls = 'asm_op fun_decl list

type 'asm_op uprog = 'asm_op prog

type 'asm_op _ufundef = ('asm_op, unit) _fundef

type 'asm_op _ufun_decl = ('asm_op, unit) _fun_decl

type 'asm_op _ufun_decls = ('asm_op, unit) _fun_decl list

type 'asm_op _uprog = ('asm_op, unit, unit) _prog

val to_uprog : 'a1 asmOp -> 'a1 _uprog -> 'a1 uprog

type saved_stack =
| SavedStackNone
| SavedStackReg of Var.var
| SavedStackStk of coq_Z

val saved_stack_beq : saved_stack -> saved_stack -> bool

val saved_stack_eq_axiom : saved_stack eq_axiom

val coq_HB_unnamed_factory_9 : saved_stack Coq_hasDecEq.axioms_

val expr_saved_stack__canonical__eqtype_Equality : Equality.coq_type

type return_address_location =
| RAnone
| RAreg of Var.var * Var.var option
| RAstack of Var.var option * Var.var option * coq_Z * Var.var option

val is_RAnone : return_address_location -> bool

val is_RAstack : return_address_location -> bool

val return_address_location_beq :
  return_address_location -> return_address_location -> bool

val return_address_location_eq_axiom : return_address_location eq_axiom

val coq_HB_unnamed_factory_11 : return_address_location Coq_hasDecEq.axioms_

val expr_return_address_location__canonical__eqtype_Equality :
  Equality.coq_type

type stk_fun_extra = { sf_align : wsize; sf_stk_sz : coq_Z;
                       sf_stk_ioff : coq_Z; sf_stk_extra_sz : coq_Z;
                       sf_stk_max : coq_Z; sf_max_call_depth : coq_Z;
                       sf_to_save : (Var.var * coq_Z) list;
                       sf_save_stack : saved_stack;
                       sf_return_address : return_address_location;
                       sf_align_args : wsize list }

val sf_align : stk_fun_extra -> wsize

val sf_stk_sz : stk_fun_extra -> coq_Z

val sf_stk_ioff : stk_fun_extra -> coq_Z

val sf_stk_extra_sz : stk_fun_extra -> coq_Z

val sf_stk_max : stk_fun_extra -> coq_Z

val sf_max_call_depth : stk_fun_extra -> coq_Z

val sf_to_save : stk_fun_extra -> (Var.var * coq_Z) list

val sf_save_stack : stk_fun_extra -> saved_stack

val sf_return_address : stk_fun_extra -> return_address_location

val sf_align_args : stk_fun_extra -> wsize list

type sprog_extra = { sp_rsp : Ident.Ident.ident; sp_rip : Ident.Ident.ident;
                     sp_globs : word list;
                     sp_glob_names : ((Var.var * wsize) * coq_Z) list }

val sp_rsp : sprog_extra -> Ident.Ident.ident

val sp_rip : sprog_extra -> Ident.Ident.ident

val sp_globs : sprog_extra -> word list

val sp_glob_names : sprog_extra -> ((Var.var * wsize) * coq_Z) list

val progStack : coq_PointerData -> progT

type 'asm_op sfundef = 'asm_op fundef

type 'asm_op sfun_decl = 'asm_op fun_decl

type 'asm_op sfun_decls = 'asm_op fun_decl list

type 'asm_op sprog = 'asm_op prog

type 'asm_op _sfundef = ('asm_op, stk_fun_extra) _fundef

type 'asm_op _sfun_decl = ('asm_op, stk_fun_extra) _fun_decl

type 'asm_op _sfun_decls = ('asm_op, stk_fun_extra) _fun_decl list

type 'asm_op _sprog = ('asm_op, stk_fun_extra, sprog_extra) _prog

val to_sprog : coq_PointerData -> 'a1 asmOp -> 'a1 _sprog -> 'a1 sprog

val with_body :
  'a1 asmOp -> ('a1, 'a2) _fundef -> 'a1 instr list -> ('a1, 'a2) _fundef

val swith_extra :
  coq_PointerData -> 'a1 asmOp -> coq_PointerData -> 'a1 ufundef ->
  extra_fun_t -> 'a1 sfundef

val is_const : pexpr -> coq_Z option

val is_bool : pexpr -> bool option

val is_Papp2 : pexpr -> ((sop2 * pexpr) * pexpr) option

val is_Pload : pexpr -> bool

val is_load : pexpr -> bool

val is_array_init : pexpr -> bool

val cast_w : wsize -> pexpr -> pexpr

val cast_ptr : coq_PointerData -> pexpr -> pexpr

val cast_const : coq_PointerData -> coq_Z -> pexpr

val eword_of_int : wsize -> coq_Z -> pexpr

val wconst : wsize -> word -> pexpr

val is_wconst : wsize -> pexpr -> word option

val is_wconst_of_size : Equality.sort -> pexpr -> coq_Z option

val vrv_rec : SvExtra.Sv.t -> lval -> SvExtra.Sv.t

val vrvs_rec : SvExtra.Sv.t -> lval list -> SvExtra.Sv.t

val vrv : lval -> SvExtra.Sv.t

val vrvs : lval list -> SvExtra.Sv.t

val lv_write_mem : lval -> bool

val write_i_rec : 'a1 asmOp -> SvExtra.Sv.t -> 'a1 instr_r -> SvExtra.Sv.t

val write_I_rec : 'a1 asmOp -> SvExtra.Sv.t -> 'a1 instr -> SvExtra.Sv.t

val write_i : 'a1 asmOp -> 'a1 instr_r -> SvExtra.Sv.t

val write_I : 'a1 asmOp -> 'a1 instr -> SvExtra.Sv.t

val write_c_rec : 'a1 asmOp -> SvExtra.Sv.t -> 'a1 instr list -> SvExtra.Sv.t

val write_c : 'a1 asmOp -> 'a1 instr list -> SvExtra.Sv.t

val use_mem : pexpr -> bool

val read_gvar : gvar -> SvExtra.Sv.t

val read_e_rec : SvExtra.Sv.t -> pexpr -> SvExtra.Sv.t

val read_e : pexpr -> SvExtra.Sv.t

val read_es_rec : SvExtra.Sv.t -> pexpr list -> SvExtra.Sv.t

val read_es : pexpr list -> SvExtra.Sv.t

val read_rv_rec : SvExtra.Sv.t -> lval -> SvExtra.Sv.t

val read_rv : lval -> SvExtra.Sv.t

val read_rvs_rec : SvExtra.Sv.t -> lval list -> SvExtra.Sv.t

val read_rvs : lval list -> SvExtra.Sv.t

val read_i_rec : 'a1 asmOp -> SvExtra.Sv.t -> 'a1 instr_r -> SvExtra.Sv.t

val read_I_rec : 'a1 asmOp -> SvExtra.Sv.t -> 'a1 instr -> SvExtra.Sv.t

val read_c_rec : 'a1 asmOp -> SvExtra.Sv.t -> 'a1 instr list -> SvExtra.Sv.t

val read_i : 'a1 asmOp -> 'a1 instr_r -> SvExtra.Sv.t

val read_I : 'a1 asmOp -> 'a1 instr -> SvExtra.Sv.t

val read_c : 'a1 asmOp -> 'a1 instr list -> SvExtra.Sv.t

val vars_I : 'a1 asmOp -> 'a1 instr -> SvExtra.Sv.t

val vars_c : 'a1 asmOp -> 'a1 instr list -> SvExtra.Sv.t

val vars_lval : lval -> SvExtra.Sv.t

val vars_lvals : lval list -> SvExtra.Sv.t

val vars_l : var_i list -> SvExtra.Sv.t

val vars_fd : 'a1 asmOp -> progT -> 'a1 fundef -> SvExtra.Sv.t

val vars_p : 'a1 asmOp -> progT -> 'a1 fun_decl list -> SvExtra.Sv.t

val eq_gvar : gvar -> gvar -> bool

val eq_expr : pexpr -> pexpr -> bool

val eq_lval : lval -> lval -> bool

val eq_instr_r : 'a1 asmOp -> 'a1 instr_r -> 'a1 instr_r -> bool

val eq_instr : 'a1 asmOp -> 'a1 instr -> 'a1 instr -> bool

val eq_cmd : 'a1 asmOp -> 'a1 instr list -> 'a1 instr list -> bool

val to_lvals : Var.var list -> lval list

val is_false : pexpr -> bool

val is_zero : Equality.sort -> pexpr -> bool

val instr_of_copn_args :
  'a1 asmOp -> assgn_tag -> ((lval list * 'a1 sopn) * pexpr list) -> 'a1
  instr_r
