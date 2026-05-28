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

(** val uint_of_word : wsize -> sop1 **)

let uint_of_word ws =
  Oint_of_word (Unsigned, ws)

(** val sint_of_word : wsize -> sop1 **)

let sint_of_word ws =
  Oint_of_word (Signed, ws)

(** val etype_of_wiop1 :
    signedness -> wiop1 -> 'a1 extended_type * 'a1 extended_type **)

let etype_of_wiop1 s = function
| WIwint_of_int sz -> (tint, (twint s sz))
| WIint_of_wint sz -> ((twint s sz), tint)
| WIword_of_wint sz -> ((twint s sz), (tword sz))
| WIwint_of_word sz -> ((tword sz), (twint s sz))
| WIwint_ext (szo, szi) -> ((twint s szi), (twint s szo))
| WIneg sz -> ((twint s sz), (twint s sz))

(** val type_of_wiop1 : wiop1 -> atype * atype **)

let type_of_wiop1 = function
| WIwint_of_int sz -> (Coq_aint, (Coq_aword sz))
| WIint_of_wint sz -> ((Coq_aword sz), Coq_aint)
| WIword_of_wint sz -> ((Coq_aword sz), (Coq_aword sz))
| WIwint_of_word sz -> ((Coq_aword sz), (Coq_aword sz))
| WIwint_ext (szo, szi) -> ((Coq_aword szi), (Coq_aword szo))
| WIneg sz -> ((Coq_aword sz), (Coq_aword sz))

(** val type_of_opk : op_kind -> atype **)

let type_of_opk = function
| Op_int -> Coq_aint
| Op_w sz -> Coq_aword sz

(** val etype_of_opk : op_kind -> 'a1 extended_type **)

let etype_of_opk = function
| Op_int -> tint
| Op_w sz -> tword sz

(** val etype_of_op1 : sop1 -> 'a1 extended_type * 'a1 extended_type **)

let etype_of_op1 = function
| Oword_of_int sz -> (tint, (tword sz))
| Oint_of_word (_, sz) -> ((tword sz), tint)
| Osignext (szo, szi) -> ((tword szi), (tword szo))
| Ozeroext (szo, szi) -> ((tword szi), (tword szo))
| Onot -> (tbool, tbool)
| Olnot sz -> ((tword sz), (tword sz))
| Oneg k -> let t0 = etype_of_opk k in (t0, t0)
| Owi1 (s, o0) -> etype_of_wiop1 s o0

(** val type_of_op1 : sop1 -> atype * atype **)

let type_of_op1 = function
| Oword_of_int sz -> (Coq_aint, (Coq_aword sz))
| Oint_of_word (_, sz) -> ((Coq_aword sz), Coq_aint)
| Osignext (szo, szi) -> ((Coq_aword szi), (Coq_aword szo))
| Ozeroext (szo, szi) -> ((Coq_aword szi), (Coq_aword szo))
| Onot -> (Coq_abool, Coq_abool)
| Olnot sz -> ((Coq_aword sz), (Coq_aword sz))
| Oneg k -> let t0 = type_of_opk k in (t0, t0)
| Owi1 (_, o0) -> type_of_wiop1 o0

(** val etype_of_wiop2 :
    signedness -> wsize -> wiop2 -> ('a1 extended_type * 'a1
    extended_type) * 'a1 extended_type **)

let etype_of_wiop2 s sz = function
| WIadd -> let t0 = twint s sz in ((t0, t0), t0)
| WImul -> let t0 = twint s sz in ((t0, t0), t0)
| WIsub -> let t0 = twint s sz in ((t0, t0), t0)
| WIdiv -> let t0 = twint s sz in ((t0, t0), t0)
| WImod -> let t0 = twint s sz in ((t0, t0), t0)
| WIshl -> let t0 = twint s sz in let tu8 = tuint U8 in ((t0, tu8), t0)
| WIshr -> let t0 = twint s sz in let tu8 = tuint U8 in ((t0, tu8), t0)
| _ -> let t0 = twint s sz in ((t0, t0), tbool)

(** val type_of_wiop2 : wsize -> wiop2 -> (atype * atype) * atype **)

let type_of_wiop2 sz = function
| WIadd -> let t0 = Coq_aword sz in ((t0, t0), t0)
| WImul -> let t0 = Coq_aword sz in ((t0, t0), t0)
| WIsub -> let t0 = Coq_aword sz in ((t0, t0), t0)
| WIdiv -> let t0 = Coq_aword sz in ((t0, t0), t0)
| WImod -> let t0 = Coq_aword sz in ((t0, t0), t0)
| WIshl -> let t0 = Coq_aword sz in let tu8 = Coq_aword U8 in ((t0, tu8), t0)
| WIshr -> let t0 = Coq_aword sz in let tu8 = Coq_aword U8 in ((t0, tu8), t0)
| _ -> let t0 = Coq_aword sz in ((t0, t0), Coq_abool)

(** val opk8 : op_kind -> op_kind **)

let opk8 = function
| Op_int -> Op_int
| Op_w _ -> Op_w U8

(** val opk_of_cmpk : cmp_kind -> op_kind **)

let opk_of_cmpk = function
| Cmp_int -> Op_int
| Cmp_w (_, sz) -> Op_w sz

(** val etype_of_op2 :
    sop2 -> ('a1 extended_type * 'a1 extended_type) * 'a1 extended_type **)

let etype_of_op2 = function
| Oadd k -> let t0 = etype_of_opk k in ((t0, t0), t0)
| Omul k -> let t0 = etype_of_opk k in ((t0, t0), t0)
| Osub k -> let t0 = etype_of_opk k in ((t0, t0), t0)
| Odiv (_, k) -> let t0 = etype_of_opk k in ((t0, t0), t0)
| Omod (_, k) -> let t0 = etype_of_opk k in ((t0, t0), t0)
| Oland s -> let t0 = tword s in ((t0, t0), t0)
| Olor s -> let t0 = tword s in ((t0, t0), t0)
| Olxor s -> let t0 = tword s in ((t0, t0), t0)
| Olsr s -> let t0 = tword s in ((t0, (tword U8)), t0)
| Olsl k ->
  let t1 = etype_of_opk k in let t2 = etype_of_opk (opk8 k) in ((t1, t2), t1)
| Oasr k ->
  let t1 = etype_of_opk k in let t2 = etype_of_opk (opk8 k) in ((t1, t2), t1)
| Oror s -> let t0 = tword s in ((t0, (tword U8)), t0)
| Orol s -> let t0 = tword s in ((t0, (tword U8)), t0)
| Oeq k -> let t0 = etype_of_opk k in ((t0, t0), tbool)
| Oneq k -> let t0 = etype_of_opk k in ((t0, t0), tbool)
| Olt k -> let t0 = etype_of_opk (opk_of_cmpk k) in ((t0, t0), tbool)
| Ole k -> let t0 = etype_of_opk (opk_of_cmpk k) in ((t0, t0), tbool)
| Ogt k -> let t0 = etype_of_opk (opk_of_cmpk k) in ((t0, t0), tbool)
| Oge k -> let t0 = etype_of_opk (opk_of_cmpk k) in ((t0, t0), tbool)
| Ovadd (_, s) -> let t0 = tword s in ((t0, t0), t0)
| Ovsub (_, s) -> let t0 = tword s in ((t0, t0), t0)
| Ovmul (_, s) -> let t0 = tword s in ((t0, t0), t0)
| Ovlsr (_, s) -> let t0 = tword s in ((t0, (tword U128)), t0)
| Ovlsl (_, s) -> let t0 = tword s in ((t0, (tword U128)), t0)
| Ovasr (_, s) -> let t0 = tword s in ((t0, (tword U128)), t0)
| Owi2 (s, sz, o0) -> etype_of_wiop2 s sz o0
| _ -> ((tbool, tbool), tbool)

(** val type_of_op2 : sop2 -> (atype * atype) * atype **)

let type_of_op2 = function
| Oadd k -> let t0 = type_of_opk k in ((t0, t0), t0)
| Omul k -> let t0 = type_of_opk k in ((t0, t0), t0)
| Osub k -> let t0 = type_of_opk k in ((t0, t0), t0)
| Odiv (_, k) -> let t0 = type_of_opk k in ((t0, t0), t0)
| Omod (_, k) -> let t0 = type_of_opk k in ((t0, t0), t0)
| Oland s -> let t0 = Coq_aword s in ((t0, t0), t0)
| Olor s -> let t0 = Coq_aword s in ((t0, t0), t0)
| Olxor s -> let t0 = Coq_aword s in ((t0, t0), t0)
| Olsr s -> let t0 = Coq_aword s in ((t0, (Coq_aword U8)), t0)
| Olsl k ->
  let t1 = type_of_opk k in let t2 = type_of_opk (opk8 k) in ((t1, t2), t1)
| Oasr k ->
  let t1 = type_of_opk k in let t2 = type_of_opk (opk8 k) in ((t1, t2), t1)
| Oror s -> let t0 = Coq_aword s in ((t0, (Coq_aword U8)), t0)
| Orol s -> let t0 = Coq_aword s in ((t0, (Coq_aword U8)), t0)
| Oeq k -> let t0 = type_of_opk k in ((t0, t0), Coq_abool)
| Oneq k -> let t0 = type_of_opk k in ((t0, t0), Coq_abool)
| Olt k -> let t0 = type_of_opk (opk_of_cmpk k) in ((t0, t0), Coq_abool)
| Ole k -> let t0 = type_of_opk (opk_of_cmpk k) in ((t0, t0), Coq_abool)
| Ogt k -> let t0 = type_of_opk (opk_of_cmpk k) in ((t0, t0), Coq_abool)
| Oge k -> let t0 = type_of_opk (opk_of_cmpk k) in ((t0, t0), Coq_abool)
| Ovadd (_, s) -> let t0 = Coq_aword s in ((t0, t0), t0)
| Ovsub (_, s) -> let t0 = Coq_aword s in ((t0, t0), t0)
| Ovmul (_, s) -> let t0 = Coq_aword s in ((t0, t0), t0)
| Ovlsr (_, s) -> let t0 = Coq_aword s in ((t0, (Coq_aword U128)), t0)
| Ovlsl (_, s) -> let t0 = Coq_aword s in ((t0, (Coq_aword U128)), t0)
| Ovasr (_, s) -> let t0 = Coq_aword s in ((t0, (Coq_aword U128)), t0)
| Owi2 (_, sz, o0) -> type_of_wiop2 sz o0
| _ -> ((Coq_abool, Coq_abool), Coq_abool)

(** val tin_combine_flags : atype list **)

let tin_combine_flags =
  Coq_abool :: (Coq_abool :: (Coq_abool :: (Coq_abool :: [])))

(** val type_of_opN : opN -> atype list * atype **)

let type_of_opN = function
| Opack (ws, p) ->
  let n = divn (nat_of_wsize ws) (nat_of_pelem p) in
  ((nseq n Coq_aint), (Coq_aword ws))
| Oarray len -> ((nseq (Pos.to_nat len) (Coq_aword U8)), (Coq_aarr (U8, len)))
| Ocombine_flags _ -> (tin_combine_flags, Coq_abool)

module type TAG =
 sig
  type t

  val witness : t
 end

module VarInfo =
 struct
  type t = Location.t

  (** val witness : t **)

  let witness = Location._dummy
 end

type var_info = Location.t

(** val dummy_var_info : var_info **)

let dummy_var_info =
  VarInfo.witness

type var_i = { v_var : Var.var; v_info : var_info }

(** val v_var : var_i -> Var.var **)

let v_var v =
  v.v_var

(** val v_info : var_i -> var_info **)

let v_info v =
  v.v_info

(** val mk_var_i : Var.var -> var_i **)

let mk_var_i x =
  { v_var = x; v_info = dummy_var_info }

type v_scope =
| Slocal
| Sglob

type is_v_scope =
| Coq_is_Slocal
| Coq_is_Sglob

(** val v_scope_tag : v_scope -> positive **)

let v_scope_tag = function
| Slocal -> Coq_xH
| Sglob -> Coq_xO Coq_xH

(** val is_v_scope_inhab : v_scope -> is_v_scope **)

let is_v_scope_inhab = function
| Slocal -> Coq_is_Slocal
| Sglob -> Coq_is_Sglob

(** val is_v_scope_functor : v_scope -> is_v_scope -> is_v_scope **)

let rec is_v_scope_functor _ x =
  x

type box_v_scope_Slocal =
| Box_v_scope_Slocal

type v_scope_fields_t = __

(** val v_scope_fields : v_scope -> v_scope_fields_t **)

let v_scope_fields _ =
  Obj.magic Box_v_scope_Slocal

(** val v_scope_construct : positive -> v_scope_fields_t -> v_scope option **)

let v_scope_construct p _ =
  match p with
  | Coq_xI _ -> None
  | Coq_xO _ -> Some Sglob
  | Coq_xH -> Some Slocal

(** val v_scope_induction : 'a1 -> 'a1 -> v_scope -> is_v_scope -> 'a1 **)

let v_scope_induction his_Slocal his_Sglob _ = function
| Coq_is_Slocal -> his_Slocal
| Coq_is_Sglob -> his_Sglob

(** val v_scope_eqb_fields :
    (v_scope -> v_scope -> bool) -> positive -> v_scope_fields_t ->
    v_scope_fields_t -> bool **)

let v_scope_eqb_fields _ _ _ _ =
  true

(** val v_scope_eqb : v_scope -> v_scope -> bool **)

let v_scope_eqb x1 x2 =
  eqb_body v_scope_tag v_scope_fields
    (Obj.magic v_scope_eqb_fields (fun _ _ -> true)) (v_scope_tag x1)
    Box_v_scope_Slocal x2

(** val v_scope_eqb_OK : v_scope -> v_scope -> reflect **)

let v_scope_eqb_OK =
  iffP2 v_scope_eqb

(** val v_scope_eqb_OK_sumbool : v_scope -> v_scope -> bool **)

let v_scope_eqb_OK_sumbool =
  reflect_dec v_scope_eqb v_scope_eqb_OK

(** val coq_HB_unnamed_factory_1 : v_scope Coq_hasDecEq.axioms_ **)

let coq_HB_unnamed_factory_1 =
  { Coq_hasDecEq.eq_op = v_scope_eqb; Coq_hasDecEq.eqP = v_scope_eqb_OK }

(** val expr_v_scope__canonical__eqtype_Equality : Equality.coq_type **)

let expr_v_scope__canonical__eqtype_Equality =
  Obj.magic coq_HB_unnamed_factory_1

type gvar = { gv : var_i; gs : v_scope }

(** val gv : gvar -> var_i **)

let gv g =
  g.gv

(** val gs : gvar -> v_scope **)

let gs g =
  g.gs

(** val mk_gvar : var_i -> gvar **)

let mk_gvar x =
  { gv = x; gs = Sglob }

(** val mk_lvar : var_i -> gvar **)

let mk_lvar x =
  { gv = x; gs = Slocal }

(** val is_lvar : gvar -> bool **)

let is_lvar x =
  eq_op expr_v_scope__canonical__eqtype_Equality (Obj.magic x.gs)
    (Obj.magic Slocal)

(** val is_glob : gvar -> bool **)

let is_glob x =
  eq_op expr_v_scope__canonical__eqtype_Equality (Obj.magic x.gs)
    (Obj.magic Sglob)

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

(** val coq_Plvar : var_i -> pexpr **)

let coq_Plvar x =
  Pvar (mk_lvar x)

(** val enot : pexpr -> pexpr **)

let enot e =
  Papp1 (Onot, e)

(** val eor : pexpr -> pexpr -> pexpr **)

let eor e1 e2 =
  Papp2 (Oor, e1, e2)

(** val eand : pexpr -> pexpr -> pexpr **)

let eand e1 e2 =
  Papp2 (Oand, e1, e2)

(** val eeq : pexpr -> pexpr -> pexpr **)

let eeq e1 e2 =
  Papp2 (Obeq, e1, e2)

(** val eneq : pexpr -> pexpr -> pexpr **)

let eneq e1 e2 =
  enot (eeq e1 e2)

(** val eaddw : wsize -> pexpr -> pexpr -> pexpr **)

let eaddw w e1 e2 =
  Papp2 ((Oadd (Op_w w)), e1, e2)

(** val cf_of_condition : sop2 -> (combine_flags * wsize) option **)

let cf_of_condition = function
| Oeq o -> (match o with
            | Op_int -> None
            | Op_w ws -> Some (CF_EQ, ws))
| Oneq o -> (match o with
             | Op_int -> None
             | Op_w ws -> Some (CF_NEQ, ws))
| Olt c ->
  (match c with
   | Cmp_int -> None
   | Cmp_w (s, ws) -> Some ((CF_LT s), ws))
| Ole c ->
  (match c with
   | Cmp_int -> None
   | Cmp_w (s, ws) -> Some ((CF_LE s), ws))
| Ogt c ->
  (match c with
   | Cmp_int -> None
   | Cmp_w (s, ws) -> Some ((CF_GT s), ws))
| Oge c ->
  (match c with
   | Cmp_int -> None
   | Cmp_w (s, ws) -> Some ((CF_GE s), ws))
| _ -> None

(** val pexpr_of_cf : combine_flags -> var_info -> Var.var list -> pexpr **)

let pexpr_of_cf cf vi flags =
  let eflags = map (fun x -> coq_Plvar { v_var = x; v_info = vi }) flags in
  PappN ((Ocombine_flags cf), eflags)

type lval =
| Lnone of var_info * atype
| Lvar of var_i
| Lmem of aligned * wsize * var_info * pexpr
| Laset of aligned * arr_access * wsize * var_i * pexpr
| Lasub of arr_access * wsize * positive * var_i * pexpr

(** val get_pvar : pexpr -> Var.var exec **)

let get_pvar = function
| Pvar g ->
  let { gv = x; gs = gs0 } = g in
  (match gs0 with
   | Slocal -> Ok x.v_var
   | Sglob -> type_error)
| _ -> type_error

(** val get_lvar : lval -> Var.var exec **)

let get_lvar = function
| Lvar x0 -> Ok x0.v_var
| _ -> type_error

(** val coq_Lnone_b : var_info -> lval **)

let coq_Lnone_b vi =
  Lnone (vi, Coq_abool)

(** val var_info_of_lval : lval -> var_info **)

let var_info_of_lval = function
| Lnone (i, _) -> i
| Lvar x0 -> x0.v_info
| Lmem (_, _, i, _) -> i
| Laset (_, _, _, x0, _) -> x0.v_info
| Lasub (_, _, _, x0, _) -> x0.v_info

type dir =
| UpTo
| DownTo

type is_dir =
| Coq_is_UpTo
| Coq_is_DownTo

(** val dir_tag : dir -> positive **)

let dir_tag = function
| UpTo -> Coq_xH
| DownTo -> Coq_xO Coq_xH

(** val is_dir_inhab : dir -> is_dir **)

let is_dir_inhab = function
| UpTo -> Coq_is_UpTo
| DownTo -> Coq_is_DownTo

(** val is_dir_functor : dir -> is_dir -> is_dir **)

let rec is_dir_functor _ x =
  x

type box_dir_UpTo =
| Box_dir_UpTo

type dir_fields_t = __

(** val dir_fields : dir -> dir_fields_t **)

let dir_fields _ =
  Obj.magic Box_dir_UpTo

(** val dir_construct : positive -> dir_fields_t -> dir option **)

let dir_construct p _ =
  match p with
  | Coq_xI _ -> None
  | Coq_xO _ -> Some DownTo
  | Coq_xH -> Some UpTo

(** val dir_induction : 'a1 -> 'a1 -> dir -> is_dir -> 'a1 **)

let dir_induction his_UpTo his_DownTo _ = function
| Coq_is_UpTo -> his_UpTo
| Coq_is_DownTo -> his_DownTo

(** val dir_eqb_fields :
    (dir -> dir -> bool) -> positive -> dir_fields_t -> dir_fields_t -> bool **)

let dir_eqb_fields _ _ _ _ =
  true

(** val dir_eqb : dir -> dir -> bool **)

let dir_eqb x1 x2 =
  eqb_body dir_tag dir_fields (Obj.magic dir_eqb_fields (fun _ _ -> true))
    (dir_tag x1) Box_dir_UpTo x2

(** val dir_eqb_OK : dir -> dir -> reflect **)

let dir_eqb_OK =
  iffP2 dir_eqb

(** val dir_eqb_OK_sumbool : dir -> dir -> bool **)

let dir_eqb_OK_sumbool =
  reflect_dec dir_eqb dir_eqb_OK

(** val coq_HB_unnamed_factory_3 : dir Coq_hasDecEq.axioms_ **)

let coq_HB_unnamed_factory_3 =
  { Coq_hasDecEq.eq_op = dir_eqb; Coq_hasDecEq.eqP = dir_eqb_OK }

(** val expr_dir__canonical__eqtype_Equality : Equality.coq_type **)

let expr_dir__canonical__eqtype_Equality =
  Obj.magic coq_HB_unnamed_factory_3

type range = (dir * pexpr) * pexpr

(** val wrange : dir -> coq_Z -> coq_Z -> coq_Z list **)

let wrange d n1 n2 =
  let n = Z.to_nat (Z.sub n2 n1) in
  (match d with
   | UpTo -> map (fun i -> Z.add n1 (Z.of_nat i)) (iota O n)
   | DownTo -> map (fun i -> Z.sub n2 (Z.of_nat i)) (iota O n))

module type InstrInfoT =
 sig
  type t

  val witness : t

  val with_location : t -> t

  val is_inline : t -> bool

  val var_info_of_ii : t -> var_info
 end

module InstrInfo =
 struct
  type t = IInfo.t

  (** val witness : t **)

  let witness = IInfo.dummy

  (** val with_location : t -> t **)

  let with_location = IInfo.with_location

  (** val is_inline : t -> bool **)

  let is_inline = IInfo.is_inline

  (** val var_info_of_ii : t -> var_info **)

  let var_info_of_ii = IInfo.var_info_of_ii
 end

type instr_info = IInfo.t

(** val dummy_instr_info : instr_info **)

let dummy_instr_info =
  InstrInfo.witness

(** val ii_with_location : instr_info -> instr_info **)

let ii_with_location =
  InstrInfo.with_location

(** val ii_is_inline : instr_info -> bool **)

let ii_is_inline =
  InstrInfo.is_inline

(** val var_info_of_ii : instr_info -> var_info **)

let var_info_of_ii =
  InstrInfo.var_info_of_ii

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

(** val assgn_tag_tag : assgn_tag -> positive **)

let assgn_tag_tag = function
| AT_none -> Coq_xH
| AT_keep -> Coq_xO Coq_xH
| AT_rename -> Coq_xI Coq_xH
| AT_inline -> Coq_xO (Coq_xO Coq_xH)
| AT_phinode -> Coq_xI (Coq_xO Coq_xH)

(** val is_assgn_tag_inhab : assgn_tag -> is_assgn_tag **)

let is_assgn_tag_inhab = function
| AT_none -> Coq_is_AT_none
| AT_keep -> Coq_is_AT_keep
| AT_rename -> Coq_is_AT_rename
| AT_inline -> Coq_is_AT_inline
| AT_phinode -> Coq_is_AT_phinode

(** val is_assgn_tag_functor : assgn_tag -> is_assgn_tag -> is_assgn_tag **)

let rec is_assgn_tag_functor _ x =
  x

type box_assgn_tag_AT_none =
| Box_assgn_tag_AT_none

type assgn_tag_fields_t = __

(** val assgn_tag_fields : assgn_tag -> assgn_tag_fields_t **)

let assgn_tag_fields _ =
  Obj.magic Box_assgn_tag_AT_none

(** val assgn_tag_construct :
    positive -> assgn_tag_fields_t -> assgn_tag option **)

let assgn_tag_construct p _ =
  match p with
  | Coq_xI x ->
    (match x with
     | Coq_xI _ -> None
     | Coq_xO _ -> Some AT_phinode
     | Coq_xH -> Some AT_rename)
  | Coq_xO x ->
    (match x with
     | Coq_xI _ -> None
     | Coq_xO _ -> Some AT_inline
     | Coq_xH -> Some AT_keep)
  | Coq_xH -> Some AT_none

(** val assgn_tag_induction :
    'a1 -> 'a1 -> 'a1 -> 'a1 -> 'a1 -> assgn_tag -> is_assgn_tag -> 'a1 **)

let assgn_tag_induction his_AT_none his_AT_keep his_AT_rename his_AT_inline his_AT_phinode _ = function
| Coq_is_AT_none -> his_AT_none
| Coq_is_AT_keep -> his_AT_keep
| Coq_is_AT_rename -> his_AT_rename
| Coq_is_AT_inline -> his_AT_inline
| Coq_is_AT_phinode -> his_AT_phinode

(** val assgn_tag_eqb_fields :
    (assgn_tag -> assgn_tag -> bool) -> positive -> assgn_tag_fields_t ->
    assgn_tag_fields_t -> bool **)

let assgn_tag_eqb_fields _ _ _ _ =
  true

(** val assgn_tag_eqb : assgn_tag -> assgn_tag -> bool **)

let assgn_tag_eqb x1 x2 =
  eqb_body assgn_tag_tag assgn_tag_fields
    (Obj.magic assgn_tag_eqb_fields (fun _ _ -> true)) (assgn_tag_tag x1)
    Box_assgn_tag_AT_none x2

(** val assgn_tag_eqb_OK : assgn_tag -> assgn_tag -> reflect **)

let assgn_tag_eqb_OK =
  iffP2 assgn_tag_eqb

(** val assgn_tag_eqb_OK_sumbool : assgn_tag -> assgn_tag -> bool **)

let assgn_tag_eqb_OK_sumbool =
  reflect_dec assgn_tag_eqb assgn_tag_eqb_OK

(** val coq_HB_unnamed_factory_5 : assgn_tag Coq_hasDecEq.axioms_ **)

let coq_HB_unnamed_factory_5 =
  { Coq_hasDecEq.eq_op = assgn_tag_eqb; Coq_hasDecEq.eqP = assgn_tag_eqb_OK }

(** val expr_assgn_tag__canonical__eqtype_Equality : Equality.coq_type **)

let expr_assgn_tag__canonical__eqtype_Equality =
  Obj.magic coq_HB_unnamed_factory_5

type align =
| Align
| NoAlign

module Coq_align =
 struct
  type is_align =
  | Coq_is_Align
  | Coq_is_NoAlign

  (** val tag : align -> positive **)

  let tag = function
  | Align -> Coq_xH
  | NoAlign -> Coq_xO Coq_xH

  (** val is_align_inhab : align -> is_align **)

  let is_align_inhab = function
  | Align -> Coq_is_Align
  | NoAlign -> Coq_is_NoAlign

  (** val is_align_functor : align -> is_align -> is_align **)

  let rec is_align_functor _ x =
    x

  type box_align_Align =
  | Box_align_Align

  type fields_t = __

  (** val fields : align -> fields_t **)

  let fields _ =
    Obj.magic Box_align_Align

  (** val construct : positive -> fields_t -> align option **)

  let construct p _ =
    match p with
    | Coq_xI _ -> None
    | Coq_xO _ -> Some NoAlign
    | Coq_xH -> Some Align

  (** val induction : 'a1 -> 'a1 -> align -> is_align -> 'a1 **)

  let induction his_Align his_NoAlign _ = function
  | Coq_is_Align -> his_Align
  | Coq_is_NoAlign -> his_NoAlign

  (** val eqb_fields :
      (align -> align -> bool) -> positive -> fields_t -> fields_t -> bool **)

  let eqb_fields _ _ _ _ =
    true

  (** val eqb : align -> align -> bool **)

  let eqb x1 x2 =
    eqb_body tag fields (Obj.magic eqb_fields (fun _ _ -> true)) (tag x1)
      Box_align_Align x2

  (** val eqb_OK : align -> align -> reflect **)

  let eqb_OK =
    iffP2 eqb

  (** val eqb_OK_sumbool : align -> align -> bool **)

  let eqb_OK_sumbool =
    reflect_dec eqb eqb_OK
 end

(** val coq_HB_unnamed_factory_7 : align Coq_hasDecEq.axioms_ **)

let coq_HB_unnamed_factory_7 =
  { Coq_hasDecEq.eq_op = Coq_align.eqb; Coq_hasDecEq.eqP = Coq_align.eqb_OK }

(** val expr_align__canonical__eqtype_Equality : Equality.coq_type **)

let expr_align__canonical__eqtype_Equality =
  Obj.magic coq_HB_unnamed_factory_7

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

(** val cmd_rect_aux :
    'a1 asmOp -> 'a3 -> ('a1 instr -> 'a1 instr list -> 'a2 -> 'a3 -> 'a3) ->
    ('a1 instr -> 'a2) -> 'a1 instr list -> 'a3 **)

let rec cmd_rect_aux asmop hnil hcons instr_rect = function
| [] -> hnil
| i :: c0 ->
  hcons i c0 (instr_rect i) (cmd_rect_aux asmop hnil hcons instr_rect c0)

(** val instr_Rect :
    'a1 asmOp -> ('a1 instr_r -> instr_info -> 'a2 -> 'a3) -> 'a4 -> ('a1
    instr -> 'a1 instr list -> 'a3 -> 'a4 -> 'a4) -> (lval -> assgn_tag ->
    atype -> pexpr -> 'a2) -> (lval list -> assgn_tag -> 'a1 sopn -> pexpr
    list -> 'a2) -> (lval list ->
    (Wsize.wsize * BinNums.positive) Syscall_t.syscall_t -> pexpr list ->
    'a2) -> (assertion -> 'a2) -> (pexpr -> 'a1 instr list -> 'a1 instr list
    -> 'a4 -> 'a4 -> 'a2) -> (var_i -> dir -> pexpr -> pexpr -> 'a1 instr
    list -> 'a4 -> 'a2) -> (align -> 'a1 instr list -> pexpr -> instr_info ->
    'a1 instr list -> 'a4 -> 'a4 -> 'a2) -> (lval list -> funname -> pexpr
    list -> 'a2) -> 'a1 instr -> 'a3 **)

let instr_Rect asmop hmk hnil hcons hasgn hopn hsyscall hassert hif hfor hwhile hcall =
  let rec instr_Rect0 = function
  | MkI (ii, i0) -> hmk i0 ii (instr_r_Rect0 i0)
  and instr_r_Rect0 = function
  | Cassgn (x, tg, ty, e) -> hasgn x tg ty e
  | Copn (xs, t0, o, es) -> hopn xs t0 o es
  | Csyscall (xs, o, es) -> hsyscall xs o es
  | Cassert a -> hassert a
  | Cif (e, c1, c2) ->
    hif e c1 c2 (cmd_rect_aux asmop hnil hcons instr_Rect0 c1)
      (cmd_rect_aux asmop hnil hcons instr_Rect0 c2)
  | Cfor (i0, r, c) ->
    let (p, hi) = r in
    let (dir0, lo) = p in
    hfor i0 dir0 lo hi c (cmd_rect_aux asmop hnil hcons instr_Rect0 c)
  | Cwhile (a, c, e, info, c') ->
    hwhile a c e info c' (cmd_rect_aux asmop hnil hcons instr_Rect0 c)
      (cmd_rect_aux asmop hnil hcons instr_Rect0 c')
  | Ccall (xs, f, es) -> hcall xs f es
  in instr_Rect0

(** val instr_r_Rect :
    'a1 asmOp -> ('a1 instr_r -> instr_info -> 'a2 -> 'a3) -> 'a4 -> ('a1
    instr -> 'a1 instr list -> 'a3 -> 'a4 -> 'a4) -> (lval -> assgn_tag ->
    atype -> pexpr -> 'a2) -> (lval list -> assgn_tag -> 'a1 sopn -> pexpr
    list -> 'a2) -> (lval list ->
    (Wsize.wsize * BinNums.positive) Syscall_t.syscall_t -> pexpr list ->
    'a2) -> (assertion -> 'a2) -> (pexpr -> 'a1 instr list -> 'a1 instr list
    -> 'a4 -> 'a4 -> 'a2) -> (var_i -> dir -> pexpr -> pexpr -> 'a1 instr
    list -> 'a4 -> 'a2) -> (align -> 'a1 instr list -> pexpr -> instr_info ->
    'a1 instr list -> 'a4 -> 'a4 -> 'a2) -> (lval list -> funname -> pexpr
    list -> 'a2) -> 'a1 instr_r -> 'a2 **)

let instr_r_Rect asmop hmk hnil hcons hasgn hopn hsyscall hassert hif hfor hwhile hcall =
  let rec instr_Rect0 = function
  | MkI (ii, i0) -> hmk i0 ii (instr_r_Rect0 i0)
  and instr_r_Rect0 = function
  | Cassgn (x, tg, ty, e) -> hasgn x tg ty e
  | Copn (xs, t0, o, es) -> hopn xs t0 o es
  | Csyscall (xs, o, es) -> hsyscall xs o es
  | Cassert a -> hassert a
  | Cif (e, c1, c2) ->
    hif e c1 c2 (cmd_rect_aux asmop hnil hcons instr_Rect0 c1)
      (cmd_rect_aux asmop hnil hcons instr_Rect0 c2)
  | Cfor (i0, r, c) ->
    let (p, hi) = r in
    let (dir0, lo) = p in
    hfor i0 dir0 lo hi c (cmd_rect_aux asmop hnil hcons instr_Rect0 c)
  | Cwhile (a, c, e, info, c') ->
    hwhile a c e info c' (cmd_rect_aux asmop hnil hcons instr_Rect0 c)
      (cmd_rect_aux asmop hnil hcons instr_Rect0 c')
  | Ccall (xs, f, es) -> hcall xs f es
  in instr_r_Rect0

(** val cmd_rect :
    'a1 asmOp -> ('a1 instr_r -> instr_info -> 'a2 -> 'a3) -> 'a4 -> ('a1
    instr -> 'a1 instr list -> 'a3 -> 'a4 -> 'a4) -> (lval -> assgn_tag ->
    atype -> pexpr -> 'a2) -> (lval list -> assgn_tag -> 'a1 sopn -> pexpr
    list -> 'a2) -> (lval list ->
    (Wsize.wsize * BinNums.positive) Syscall_t.syscall_t -> pexpr list ->
    'a2) -> (assertion -> 'a2) -> (pexpr -> 'a1 instr list -> 'a1 instr list
    -> 'a4 -> 'a4 -> 'a2) -> (var_i -> dir -> pexpr -> pexpr -> 'a1 instr
    list -> 'a4 -> 'a2) -> (align -> 'a1 instr list -> pexpr -> instr_info ->
    'a1 instr list -> 'a4 -> 'a4 -> 'a2) -> (lval list -> funname -> pexpr
    list -> 'a2) -> 'a1 instr list -> 'a4 **)

let cmd_rect asmop hmk hnil hcons hasgn hopn hsyscall hassert hif hfor hwhile hcall =
  cmd_rect_aux asmop hnil hcons
    (instr_Rect asmop hmk hnil hcons hasgn hopn hsyscall hassert hif hfor
      hwhile hcall)

module type FunInfoT =
 sig
  type t

  val witness : t

  val entry_info : t -> instr_info

  val ret_info : t -> instr_info
 end

module FunInfo =
 struct
  type t = positive

  (** val witness : t **)

  let witness =
    Coq_xH

  (** val entry_info : t -> instr_info **)

  let entry_info _ =
    dummy_instr_info

  (** val ret_info : t -> instr_info **)

  let ret_info _ =
    dummy_instr_info
 end

type fun_info = FInfo.t

(** val entry_info_of_fun_info : fun_info -> instr_info **)

let entry_info_of_fun_info = FInfo.entry_info

(** val ret_info_of_fun_info : fun_info -> instr_info **)

let ret_info_of_fun_info = FInfo.ret_info

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

(** val f_info : 'a1 asmOp -> ('a1, 'a2) _fundef -> fun_info **)

let f_info _ x =
  x.f_info

(** val f_tyin : 'a1 asmOp -> ('a1, 'a2) _fundef -> atype list **)

let f_tyin _ x =
  x.f_tyin

(** val f_params : 'a1 asmOp -> ('a1, 'a2) _fundef -> var_i list **)

let f_params _ x =
  x.f_params

(** val f_body : 'a1 asmOp -> ('a1, 'a2) _fundef -> 'a1 instr list **)

let f_body _ x =
  x.f_body

(** val f_tyout : 'a1 asmOp -> ('a1, 'a2) _fundef -> atype list **)

let f_tyout _ x =
  x.f_tyout

(** val f_res : 'a1 asmOp -> ('a1, 'a2) _fundef -> var_i list **)

let f_res _ x =
  x.f_res

(** val f_extra : 'a1 asmOp -> ('a1, 'a2) _fundef -> 'a2 **)

let f_extra _ x =
  x.f_extra

type ('asm_op, 'extra_fun_t) _fun_decl =
  funname * ('asm_op, 'extra_fun_t) _fundef

type ('asm_op, 'extra_fun_t, 'extra_prog_t) _prog = { p_funcs : ('asm_op,
                                                                'extra_fun_t)
                                                                _fun_decl list;
                                                      p_globs : glob_decl list;
                                                      p_extra : 'extra_prog_t }

(** val p_funcs :
    'a1 asmOp -> ('a1, 'a2, 'a3) _prog -> ('a1, 'a2) _fun_decl list **)

let p_funcs _ x =
  x.p_funcs

(** val p_globs : 'a1 asmOp -> ('a1, 'a2, 'a3) _prog -> glob_decl list **)

let p_globs _ x =
  x.p_globs

(** val p_extra : 'a1 asmOp -> ('a1, 'a2, 'a3) _prog -> 'a3 **)

let p_extra _ x =
  x.p_extra

type 'asm_op fundef = ('asm_op, extra_fun_t) _fundef

type function_signature = atype list * atype list

(** val signature_of_fundef :
    'a1 asmOp -> progT -> 'a1 fundef -> function_signature **)

let signature_of_fundef _ _ fd =
  (fd.f_tyin, fd.f_tyout)

type 'asm_op fun_decl = funname * 'asm_op fundef

type 'asm_op prog = ('asm_op, extra_fun_t, extra_prog_t) _prog

(** val coq_Build_prog :
    'a1 asmOp -> progT -> ('a1, extra_fun_t) _fun_decl list -> glob_decl list
    -> extra_prog_t -> 'a1 prog **)

let coq_Build_prog _ _ p_funcs0 p_globs0 p_extra0 =
  { p_funcs = p_funcs0; p_globs = p_globs0; p_extra = p_extra0 }

(** val progUnit : progT **)

let progUnit =
  Build_progT

type 'asm_op ufundef = 'asm_op fundef

type 'asm_op ufun_decl = 'asm_op fun_decl

type 'asm_op ufun_decls = 'asm_op fun_decl list

type 'asm_op uprog = 'asm_op prog

type 'asm_op _ufundef = ('asm_op, unit) _fundef

type 'asm_op _ufun_decl = ('asm_op, unit) _fun_decl

type 'asm_op _ufun_decls = ('asm_op, unit) _fun_decl list

type 'asm_op _uprog = ('asm_op, unit, unit) _prog

(** val to_uprog : 'a1 asmOp -> 'a1 _uprog -> 'a1 uprog **)

let to_uprog _ p =
  Obj.magic p

type saved_stack =
| SavedStackNone
| SavedStackReg of Var.var
| SavedStackStk of coq_Z

(** val saved_stack_beq : saved_stack -> saved_stack -> bool **)

let saved_stack_beq x y =
  match x with
  | SavedStackNone -> (match y with
                       | SavedStackNone -> true
                       | _ -> false)
  | SavedStackReg v1 ->
    (match y with
     | SavedStackReg v2 ->
       eq_op Var.coq_MvMake_var__canonical__eqtype_Equality (Obj.magic v1)
         (Obj.magic v2)
     | _ -> false)
  | SavedStackStk z1 ->
    (match y with
     | SavedStackStk z2 ->
       eq_op coq_BinNums_Z__canonical__eqtype_Equality (Obj.magic z1)
         (Obj.magic z2)
     | _ -> false)

(** val saved_stack_eq_axiom : saved_stack eq_axiom **)

let saved_stack_eq_axiom __top_assumption_ =
  let _evar_0_ = fun __top_assumption_0 ->
    let _evar_0_ = ReflectT in
    let _evar_0_0 = fun _ -> ReflectF in
    let _evar_0_1 = fun _ -> ReflectF in
    (match __top_assumption_0 with
     | SavedStackNone -> _evar_0_
     | SavedStackReg v -> _evar_0_0 v
     | SavedStackStk z -> _evar_0_1 z)
  in
  let _evar_0_0 = fun v1 __top_assumption_0 ->
    let _evar_0_0 = ReflectF in
    let _evar_0_1 = fun v2 ->
      iffP (eq_op Var.coq_MvMake_var__canonical__eqtype_Equality v1 v2)
        (eqP Var.coq_MvMake_var__canonical__eqtype_Equality v1 v2)
    in
    let _evar_0_2 = fun _ -> ReflectF in
    (match __top_assumption_0 with
     | SavedStackNone -> _evar_0_0
     | SavedStackReg v -> Obj.magic _evar_0_1 v
     | SavedStackStk z -> _evar_0_2 z)
  in
  let _evar_0_1 = fun z1 __top_assumption_0 ->
    let _evar_0_1 = ReflectF in
    let _evar_0_2 = fun _ -> ReflectF in
    let _evar_0_3 = fun z2 ->
      iffP (eq_op coq_BinNums_Z__canonical__eqtype_Equality z1 z2)
        (eqP coq_BinNums_Z__canonical__eqtype_Equality z1 z2)
    in
    (match __top_assumption_0 with
     | SavedStackNone -> _evar_0_1
     | SavedStackReg v -> _evar_0_2 v
     | SavedStackStk z -> Obj.magic _evar_0_3 z)
  in
  (match __top_assumption_ with
   | SavedStackNone -> _evar_0_
   | SavedStackReg v -> Obj.magic _evar_0_0 v
   | SavedStackStk z -> Obj.magic _evar_0_1 z)

(** val coq_HB_unnamed_factory_9 : saved_stack Coq_hasDecEq.axioms_ **)

let coq_HB_unnamed_factory_9 =
  { Coq_hasDecEq.eq_op = saved_stack_beq; Coq_hasDecEq.eqP =
    saved_stack_eq_axiom }

(** val expr_saved_stack__canonical__eqtype_Equality : Equality.coq_type **)

let expr_saved_stack__canonical__eqtype_Equality =
  Obj.magic coq_HB_unnamed_factory_9

type return_address_location =
| RAnone
| RAreg of Var.var * Var.var option
| RAstack of Var.var option * Var.var option * coq_Z * Var.var option

(** val is_RAnone : return_address_location -> bool **)

let is_RAnone = function
| RAnone -> true
| _ -> false

(** val is_RAstack : return_address_location -> bool **)

let is_RAstack = function
| RAstack (_, _, _, _) -> true
| _ -> false

(** val return_address_location_beq :
    return_address_location -> return_address_location -> bool **)

let return_address_location_beq r1 r2 =
  match r1 with
  | RAnone -> (match r2 with
               | RAnone -> true
               | _ -> false)
  | RAreg (x1, o1) ->
    (match r2 with
     | RAreg (x2, o2) ->
       (&&)
         (eq_op Var.coq_MvMake_var__canonical__eqtype_Equality (Obj.magic x1)
           (Obj.magic x2))
         (eq_op
           (coq_Datatypes_option__canonical__eqtype_Equality
             Var.coq_MvMake_var__canonical__eqtype_Equality) (Obj.magic o1)
           (Obj.magic o2))
     | _ -> false)
  | RAstack (ra_call1, ra_return1, z1, o1) ->
    (match r2 with
     | RAstack (ra_call2, ra_return2, z2, o2) ->
       (&&)
         (eq_op
           (coq_Datatypes_option__canonical__eqtype_Equality
             Var.coq_MvMake_var__canonical__eqtype_Equality)
           (Obj.magic ra_call1) (Obj.magic ra_call2))
         ((&&)
           (eq_op
             (coq_Datatypes_option__canonical__eqtype_Equality
               Var.coq_MvMake_var__canonical__eqtype_Equality)
             (Obj.magic ra_return1) (Obj.magic ra_return2))
           ((&&)
             (eq_op coq_BinNums_Z__canonical__eqtype_Equality (Obj.magic z1)
               (Obj.magic z2))
             (eq_op
               (coq_Datatypes_option__canonical__eqtype_Equality
                 Var.coq_MvMake_var__canonical__eqtype_Equality)
               (Obj.magic o1) (Obj.magic o2))))
     | _ -> false)

(** val return_address_location_eq_axiom :
    return_address_location eq_axiom **)

let return_address_location_eq_axiom _top_assumption_ =
  let _evar_0_ = fun __top_assumption_ ->
    let _evar_0_ = ReflectT in
    let _evar_0_0 = fun _ _ -> ReflectF in
    let _evar_0_1 = fun _ _ _ _ -> ReflectF in
    (match __top_assumption_ with
     | RAnone -> _evar_0_
     | RAreg (v, o) -> _evar_0_0 v o
     | RAstack (o, o0, z, o1) -> _evar_0_1 o o0 z o1)
  in
  let _evar_0_0 = fun x1 o1 __top_assumption_ ->
    let _evar_0_0 = ReflectF in
    let _evar_0_1 = fun x2 o2 ->
      iffP
        ((&&) (eq_op Var.coq_MvMake_var__canonical__eqtype_Equality x1 x2)
          (eq_op
            (coq_Datatypes_option__canonical__eqtype_Equality
              Var.coq_MvMake_var__canonical__eqtype_Equality) o1 o2))
        (andP (eq_op Var.coq_MvMake_var__canonical__eqtype_Equality x1 x2)
          (eq_op
            (coq_Datatypes_option__canonical__eqtype_Equality
              Var.coq_MvMake_var__canonical__eqtype_Equality) o1 o2))
    in
    let _evar_0_2 = fun _ _ _ _ -> ReflectF in
    (match __top_assumption_ with
     | RAnone -> _evar_0_0
     | RAreg (v, o) -> Obj.magic _evar_0_1 v o
     | RAstack (o, o0, z, o2) -> _evar_0_2 o o0 z o2)
  in
  let _evar_0_1 = fun ra_call1 ra_return1 z1 o1 __top_assumption_ ->
    let _evar_0_1 = ReflectF in
    let _evar_0_2 = fun _ _ -> ReflectF in
    let _evar_0_3 = fun ra_call2 ra_return2 z2 o2 ->
      iffP
        ((&&)
          (eq_op
            (coq_Datatypes_option__canonical__eqtype_Equality
              Var.coq_MvMake_var__canonical__eqtype_Equality) ra_call1
            ra_call2)
          ((&&)
            (eq_op
              (coq_Datatypes_option__canonical__eqtype_Equality
                Var.coq_MvMake_var__canonical__eqtype_Equality) ra_return1
              ra_return2)
            ((&&) (eq_op coq_BinNums_Z__canonical__eqtype_Equality z1 z2)
              (eq_op
                (coq_Datatypes_option__canonical__eqtype_Equality
                  Var.coq_MvMake_var__canonical__eqtype_Equality) o1 o2))))
        (and4P
          (eq_op
            (coq_Datatypes_option__canonical__eqtype_Equality
              Var.coq_MvMake_var__canonical__eqtype_Equality) ra_call1
            ra_call2)
          (eq_op
            (coq_Datatypes_option__canonical__eqtype_Equality
              Var.coq_MvMake_var__canonical__eqtype_Equality) ra_return1
            ra_return2)
          (eq_op coq_BinNums_Z__canonical__eqtype_Equality z1 z2)
          (eq_op
            (coq_Datatypes_option__canonical__eqtype_Equality
              Var.coq_MvMake_var__canonical__eqtype_Equality) o1 o2))
    in
    (match __top_assumption_ with
     | RAnone -> _evar_0_1
     | RAreg (v, o) -> _evar_0_2 v o
     | RAstack (o, o0, z, o2) -> Obj.magic _evar_0_3 o o0 z o2)
  in
  (match _top_assumption_ with
   | RAnone -> _evar_0_
   | RAreg (v, o) -> Obj.magic _evar_0_0 v o
   | RAstack (o, o0, z, o1) -> Obj.magic _evar_0_1 o o0 z o1)

(** val coq_HB_unnamed_factory_11 :
    return_address_location Coq_hasDecEq.axioms_ **)

let coq_HB_unnamed_factory_11 =
  { Coq_hasDecEq.eq_op = return_address_location_beq; Coq_hasDecEq.eqP =
    return_address_location_eq_axiom }

(** val expr_return_address_location__canonical__eqtype_Equality :
    Equality.coq_type **)

let expr_return_address_location__canonical__eqtype_Equality =
  Obj.magic coq_HB_unnamed_factory_11

type stk_fun_extra = { sf_align : wsize; sf_stk_sz : coq_Z;
                       sf_stk_ioff : coq_Z; sf_stk_extra_sz : coq_Z;
                       sf_stk_max : coq_Z; sf_max_call_depth : coq_Z;
                       sf_to_save : (Var.var * coq_Z) list;
                       sf_save_stack : saved_stack;
                       sf_return_address : return_address_location;
                       sf_align_args : wsize list }

(** val sf_align : stk_fun_extra -> wsize **)

let sf_align s =
  s.sf_align

(** val sf_stk_sz : stk_fun_extra -> coq_Z **)

let sf_stk_sz s =
  s.sf_stk_sz

(** val sf_stk_ioff : stk_fun_extra -> coq_Z **)

let sf_stk_ioff s =
  s.sf_stk_ioff

(** val sf_stk_extra_sz : stk_fun_extra -> coq_Z **)

let sf_stk_extra_sz s =
  s.sf_stk_extra_sz

(** val sf_stk_max : stk_fun_extra -> coq_Z **)

let sf_stk_max s =
  s.sf_stk_max

(** val sf_max_call_depth : stk_fun_extra -> coq_Z **)

let sf_max_call_depth s =
  s.sf_max_call_depth

(** val sf_to_save : stk_fun_extra -> (Var.var * coq_Z) list **)

let sf_to_save s =
  s.sf_to_save

(** val sf_save_stack : stk_fun_extra -> saved_stack **)

let sf_save_stack s =
  s.sf_save_stack

(** val sf_return_address : stk_fun_extra -> return_address_location **)

let sf_return_address s =
  s.sf_return_address

(** val sf_align_args : stk_fun_extra -> wsize list **)

let sf_align_args s =
  s.sf_align_args

type sprog_extra = { sp_rsp : Ident.Ident.ident; sp_rip : Ident.Ident.ident;
                     sp_globs : word list;
                     sp_glob_names : ((Var.var * wsize) * coq_Z) list }

(** val sp_rsp : sprog_extra -> Ident.Ident.ident **)

let sp_rsp s =
  s.sp_rsp

(** val sp_rip : sprog_extra -> Ident.Ident.ident **)

let sp_rip s =
  s.sp_rip

(** val sp_globs : sprog_extra -> word list **)

let sp_globs s =
  s.sp_globs

(** val sp_glob_names : sprog_extra -> ((Var.var * wsize) * coq_Z) list **)

let sp_glob_names s =
  s.sp_glob_names

(** val progStack : coq_PointerData -> progT **)

let progStack _ =
  Build_progT

type 'asm_op sfundef = 'asm_op fundef

type 'asm_op sfun_decl = 'asm_op fun_decl

type 'asm_op sfun_decls = 'asm_op fun_decl list

type 'asm_op sprog = 'asm_op prog

type 'asm_op _sfundef = ('asm_op, stk_fun_extra) _fundef

type 'asm_op _sfun_decl = ('asm_op, stk_fun_extra) _fun_decl

type 'asm_op _sfun_decls = ('asm_op, stk_fun_extra) _fun_decl list

type 'asm_op _sprog = ('asm_op, stk_fun_extra, sprog_extra) _prog

(** val to_sprog : coq_PointerData -> 'a1 asmOp -> 'a1 _sprog -> 'a1 sprog **)

let to_sprog _ _ p =
  Obj.magic p

(** val with_body :
    'a1 asmOp -> ('a1, 'a2) _fundef -> 'a1 instr list -> ('a1, 'a2) _fundef **)

let with_body _ fd body =
  { f_info = fd.f_info; f_tyin = fd.f_tyin; f_params = fd.f_params; f_body =
    body; f_tyout = fd.f_tyout; f_res = fd.f_res; f_extra = fd.f_extra }

(** val swith_extra :
    coq_PointerData -> 'a1 asmOp -> coq_PointerData -> 'a1 ufundef ->
    extra_fun_t -> 'a1 sfundef **)

let swith_extra _ _ _ fd f_extra0 =
  { f_info = fd.f_info; f_tyin = fd.f_tyin; f_params = fd.f_params; f_body =
    fd.f_body; f_tyout = fd.f_tyout; f_res = fd.f_res; f_extra = f_extra0 }

(** val is_const : pexpr -> coq_Z option **)

let is_const = function
| Pconst n -> Some n
| _ -> None

(** val is_bool : pexpr -> bool option **)

let is_bool = function
| Pbool b -> Some b
| _ -> None

(** val is_Papp2 : pexpr -> ((sop2 * pexpr) * pexpr) option **)

let is_Papp2 = function
| Papp2 (op, e0, e1) -> Some ((op, e0), e1)
| _ -> None

(** val is_Pload : pexpr -> bool **)

let is_Pload = function
| Pload (_, _, _) -> true
| _ -> false

(** val is_load : pexpr -> bool **)

let is_load = function
| Pvar g ->
  let { gv = x; gs = gs0 } = g in
  (match gs0 with
   | Slocal -> is_var_in_memory x.v_var
   | Sglob -> true)
| Pget (_, _, _, _, _) -> true
| Pload (_, _, _) -> true
| _ -> false

(** val is_array_init : pexpr -> bool **)

let is_array_init = function
| Parr_init (_, _) -> true
| _ -> false

(** val cast_w : wsize -> pexpr -> pexpr **)

let rec cast_w ws e = match e with
| Papp1 (s, e') ->
  (match s with
   | Oint_of_word (sign, ws') ->
     (match sign with
      | Signed ->
        if eq_op wsize_wsize__canonical__eqtype_Equality (Obj.magic ws)
             (Obj.magic ws')
        then e'
        else Papp1 ((Oword_of_int ws), e)
      | Unsigned ->
        if cmp_le wsize_cmp ws ws' then e' else Papp1 ((Oword_of_int ws), e))
   | Oneg o ->
     (match o with
      | Op_int -> Papp1 ((Oneg (Op_w ws)), (cast_w ws e'))
      | Op_w _ -> Papp1 ((Oword_of_int ws), e))
   | _ -> Papp1 ((Oword_of_int ws), e))
| Papp2 (s, e1, e2) ->
  (match s with
   | Oadd o ->
     (match o with
      | Op_int -> Papp2 ((Oadd (Op_w ws)), (cast_w ws e1), (cast_w ws e2))
      | Op_w _ -> Papp1 ((Oword_of_int ws), e))
   | Omul o ->
     (match o with
      | Op_int -> Papp2 ((Omul (Op_w ws)), (cast_w ws e1), (cast_w ws e2))
      | Op_w _ -> Papp1 ((Oword_of_int ws), e))
   | Osub o ->
     (match o with
      | Op_int -> Papp2 ((Osub (Op_w ws)), (cast_w ws e1), (cast_w ws e2))
      | Op_w _ -> Papp1 ((Oword_of_int ws), e))
   | _ -> Papp1 ((Oword_of_int ws), e))
| _ -> Papp1 ((Oword_of_int ws), e)

(** val cast_ptr : coq_PointerData -> pexpr -> pexpr **)

let cast_ptr =
  cast_w

(** val cast_const : coq_PointerData -> coq_Z -> pexpr **)

let cast_const pd z =
  cast_ptr pd (Pconst z)

(** val eword_of_int : wsize -> coq_Z -> pexpr **)

let eword_of_int ws x =
  Papp1 ((Oword_of_int ws), (Pconst x))

(** val wconst : wsize -> word -> pexpr **)

let wconst sz n =
  Papp1 ((Oword_of_int sz), (Pconst (wunsigned sz n)))

(** val is_wconst : wsize -> pexpr -> word option **)

let is_wconst sz = function
| Papp1 (s, e0) ->
  (match s with
   | Oword_of_int sz' ->
     if cmp_le wsize_cmp sz sz'
     then Ssrfun.Option.bind (fun n -> Some (wrepr sz n)) (is_const e0)
     else None
   | _ -> None)
| _ -> None

(** val is_wconst_of_size : Equality.sort -> pexpr -> coq_Z option **)

let is_wconst_of_size sz = function
| Papp1 (s, p) ->
  (match s with
   | Oword_of_int sz' ->
     (match p with
      | Pconst z ->
        if eq_op wsize_wsize__canonical__eqtype_Equality (Obj.magic sz') sz
        then Some z
        else None
      | _ -> None)
   | _ -> None)
| _ -> None

(** val vrv_rec : SvExtra.Sv.t -> lval -> SvExtra.Sv.t **)

let vrv_rec s = function
| Lvar x -> SvExtra.Sv.add (Obj.magic x.v_var) s
| Laset (_, _, _, x, _) -> SvExtra.Sv.add (Obj.magic x.v_var) s
| Lasub (_, _, _, x, _) -> SvExtra.Sv.add (Obj.magic x.v_var) s
| _ -> s

(** val vrvs_rec : SvExtra.Sv.t -> lval list -> SvExtra.Sv.t **)

let vrvs_rec s rv =
  foldl vrv_rec s rv

(** val vrv : lval -> SvExtra.Sv.t **)

let vrv =
  vrv_rec SvExtra.Sv.empty

(** val vrvs : lval list -> SvExtra.Sv.t **)

let vrvs =
  vrvs_rec SvExtra.Sv.empty

(** val lv_write_mem : lval -> bool **)

let lv_write_mem = function
| Lmem (_, _, _, _) -> true
| _ -> false

(** val write_i_rec :
    'a1 asmOp -> SvExtra.Sv.t -> 'a1 instr_r -> SvExtra.Sv.t **)

let write_i_rec _ =
  let rec write_i_rec0 s = function
  | Cassgn (x, _, _, _) -> vrv_rec s x
  | Copn (xs, _, _, _) -> vrvs_rec s xs
  | Csyscall (xs, _, _) -> vrvs_rec s xs
  | Cassert _ -> s
  | Cif (_, c1, c2) -> foldl write_I_rec0 (foldl write_I_rec0 s c2) c1
  | Cfor (x, _, c) ->
    foldl write_I_rec0 (SvExtra.Sv.add (Obj.magic x.v_var) s) c
  | Cwhile (_, c, _, _, c') -> foldl write_I_rec0 (foldl write_I_rec0 s c') c
  | Ccall (x, _, _) -> vrvs_rec s x
  and write_I_rec0 s = function
  | MkI (_, i0) -> write_i_rec0 s i0
  in write_i_rec0

(** val write_I_rec :
    'a1 asmOp -> SvExtra.Sv.t -> 'a1 instr -> SvExtra.Sv.t **)

let write_I_rec _ =
  let rec write_i_rec0 s = function
  | Cassgn (x, _, _, _) -> vrv_rec s x
  | Copn (xs, _, _, _) -> vrvs_rec s xs
  | Csyscall (xs, _, _) -> vrvs_rec s xs
  | Cassert _ -> s
  | Cif (_, c1, c2) -> foldl write_I_rec0 (foldl write_I_rec0 s c2) c1
  | Cfor (x, _, c) ->
    foldl write_I_rec0 (SvExtra.Sv.add (Obj.magic x.v_var) s) c
  | Cwhile (_, c, _, _, c') -> foldl write_I_rec0 (foldl write_I_rec0 s c') c
  | Ccall (x, _, _) -> vrvs_rec s x
  and write_I_rec0 s = function
  | MkI (_, i0) -> write_i_rec0 s i0
  in write_I_rec0

(** val write_i : 'a1 asmOp -> 'a1 instr_r -> SvExtra.Sv.t **)

let write_i asmop i =
  write_i_rec asmop SvExtra.Sv.empty i

(** val write_I : 'a1 asmOp -> 'a1 instr -> SvExtra.Sv.t **)

let write_I asmop i =
  write_I_rec asmop SvExtra.Sv.empty i

(** val write_c_rec :
    'a1 asmOp -> SvExtra.Sv.t -> 'a1 instr list -> SvExtra.Sv.t **)

let write_c_rec asmop s c =
  foldl (write_I_rec asmop) s c

(** val write_c : 'a1 asmOp -> 'a1 instr list -> SvExtra.Sv.t **)

let write_c asmop c =
  write_c_rec asmop SvExtra.Sv.empty c

(** val use_mem : pexpr -> bool **)

let rec use_mem = function
| Pget (_, _, _, _, e0) -> use_mem e0
| Psub (_, _, _, _, e0) -> use_mem e0
| Pload (_, _, _) -> true
| Papp1 (_, e0) -> use_mem e0
| Papp2 (_, e1, e2) -> (||) (use_mem e1) (use_mem e2)
| PappN (_, es) -> has use_mem es
| Pif (_, e0, e1, e2) -> (||) ((||) (use_mem e0) (use_mem e1)) (use_mem e2)
| _ -> false

(** val read_gvar : gvar -> SvExtra.Sv.t **)

let read_gvar x =
  if is_lvar x
  then SvExtra.Sv.singleton (Obj.magic x.gv.v_var)
  else SvExtra.Sv.empty

(** val read_e_rec : SvExtra.Sv.t -> pexpr -> SvExtra.Sv.t **)

let rec read_e_rec s = function
| Pvar x -> SvExtra.Sv.union (read_gvar x) s
| Pget (_, _, _, x, e0) -> read_e_rec (SvExtra.Sv.union (read_gvar x) s) e0
| Psub (_, _, _, x, e0) -> read_e_rec (SvExtra.Sv.union (read_gvar x) s) e0
| Pload (_, _, e0) -> read_e_rec s e0
| Papp1 (_, e0) -> read_e_rec s e0
| Papp2 (_, e1, e2) -> read_e_rec (read_e_rec s e2) e1
| PappN (_, es) -> foldl read_e_rec s es
| Pif (_, t0, e1, e2) -> read_e_rec (read_e_rec (read_e_rec s e2) e1) t0
| _ -> s

(** val read_e : pexpr -> SvExtra.Sv.t **)

let read_e =
  read_e_rec SvExtra.Sv.empty

(** val read_es_rec : SvExtra.Sv.t -> pexpr list -> SvExtra.Sv.t **)

let read_es_rec =
  foldl read_e_rec

(** val read_es : pexpr list -> SvExtra.Sv.t **)

let read_es =
  read_es_rec SvExtra.Sv.empty

(** val read_rv_rec : SvExtra.Sv.t -> lval -> SvExtra.Sv.t **)

let read_rv_rec s = function
| Lmem (_, _, _, e) -> read_e_rec s e
| Laset (_, _, _, x, e) -> read_e_rec (SvExtra.Sv.add (Obj.magic x.v_var) s) e
| Lasub (_, _, _, x, e) -> read_e_rec (SvExtra.Sv.add (Obj.magic x.v_var) s) e
| _ -> s

(** val read_rv : lval -> SvExtra.Sv.t **)

let read_rv =
  read_rv_rec SvExtra.Sv.empty

(** val read_rvs_rec : SvExtra.Sv.t -> lval list -> SvExtra.Sv.t **)

let read_rvs_rec =
  foldl read_rv_rec

(** val read_rvs : lval list -> SvExtra.Sv.t **)

let read_rvs =
  read_rvs_rec SvExtra.Sv.empty

(** val read_i_rec :
    'a1 asmOp -> SvExtra.Sv.t -> 'a1 instr_r -> SvExtra.Sv.t **)

let read_i_rec _ =
  let rec read_i_rec0 s = function
  | Cassgn (x, _, _, e) -> read_rv_rec (read_e_rec s e) x
  | Copn (xs, _, _, es) -> read_es_rec (read_rvs_rec s xs) es
  | Csyscall (xs, _, es) -> read_es_rec (read_rvs_rec s xs) es
  | Cassert a -> read_e_rec s (snd a)
  | Cif (b, c1, c2) ->
    let s0 = foldl read_I_rec0 s c1 in
    let s1 = foldl read_I_rec0 s0 c2 in read_e_rec s1 b
  | Cfor (_, r, c) ->
    let (p, e2) = r in
    let (_, e1) = p in
    let s0 = foldl read_I_rec0 s c in read_e_rec (read_e_rec s0 e2) e1
  | Cwhile (_, c, e, _, c') ->
    let s0 = foldl read_I_rec0 s c in
    let s1 = foldl read_I_rec0 s0 c' in read_e_rec s1 e
  | Ccall (xs, _, es) -> read_es_rec (read_rvs_rec s xs) es
  and read_I_rec0 s = function
  | MkI (_, i0) -> read_i_rec0 s i0
  in read_i_rec0

(** val read_I_rec :
    'a1 asmOp -> SvExtra.Sv.t -> 'a1 instr -> SvExtra.Sv.t **)

let read_I_rec _ =
  let rec read_i_rec0 s = function
  | Cassgn (x, _, _, e) -> read_rv_rec (read_e_rec s e) x
  | Copn (xs, _, _, es) -> read_es_rec (read_rvs_rec s xs) es
  | Csyscall (xs, _, es) -> read_es_rec (read_rvs_rec s xs) es
  | Cassert a -> read_e_rec s (snd a)
  | Cif (b, c1, c2) ->
    let s0 = foldl read_I_rec0 s c1 in
    let s1 = foldl read_I_rec0 s0 c2 in read_e_rec s1 b
  | Cfor (_, r, c) ->
    let (p, e2) = r in
    let (_, e1) = p in
    let s0 = foldl read_I_rec0 s c in read_e_rec (read_e_rec s0 e2) e1
  | Cwhile (_, c, e, _, c') ->
    let s0 = foldl read_I_rec0 s c in
    let s1 = foldl read_I_rec0 s0 c' in read_e_rec s1 e
  | Ccall (xs, _, es) -> read_es_rec (read_rvs_rec s xs) es
  and read_I_rec0 s = function
  | MkI (_, i0) -> read_i_rec0 s i0
  in read_I_rec0

(** val read_c_rec :
    'a1 asmOp -> SvExtra.Sv.t -> 'a1 instr list -> SvExtra.Sv.t **)

let read_c_rec asmop =
  foldl (read_I_rec asmop)

(** val read_i : 'a1 asmOp -> 'a1 instr_r -> SvExtra.Sv.t **)

let read_i asmop =
  read_i_rec asmop SvExtra.Sv.empty

(** val read_I : 'a1 asmOp -> 'a1 instr -> SvExtra.Sv.t **)

let read_I asmop =
  read_I_rec asmop SvExtra.Sv.empty

(** val read_c : 'a1 asmOp -> 'a1 instr list -> SvExtra.Sv.t **)

let read_c asmop =
  read_c_rec asmop SvExtra.Sv.empty

(** val vars_I : 'a1 asmOp -> 'a1 instr -> SvExtra.Sv.t **)

let vars_I asmop i =
  SvExtra.Sv.union (read_I asmop i) (write_I asmop i)

(** val vars_c : 'a1 asmOp -> 'a1 instr list -> SvExtra.Sv.t **)

let vars_c asmop c =
  SvExtra.Sv.union (read_c asmop c) (write_c asmop c)

(** val vars_lval : lval -> SvExtra.Sv.t **)

let vars_lval l =
  SvExtra.Sv.union (read_rv l) (vrv l)

(** val vars_lvals : lval list -> SvExtra.Sv.t **)

let vars_lvals ls =
  SvExtra.Sv.union (read_rvs ls) (vrvs ls)

(** val vars_l : var_i list -> SvExtra.Sv.t **)

let rec vars_l = function
| [] -> SvExtra.Sv.empty
| h :: q -> SvExtra.Sv.add (Obj.magic h.v_var) (vars_l q)

(** val vars_fd : 'a1 asmOp -> progT -> 'a1 fundef -> SvExtra.Sv.t **)

let vars_fd asmop _ fd =
  SvExtra.Sv.union (vars_l fd.f_params)
    (SvExtra.Sv.union (vars_l fd.f_res) (vars_c asmop fd.f_body))

(** val vars_p : 'a1 asmOp -> progT -> 'a1 fun_decl list -> SvExtra.Sv.t **)

let vars_p asmop pT p =
  foldr (fun f x ->
    let (_, fd) = f in SvExtra.Sv.union x (vars_fd asmop pT fd))
    SvExtra.Sv.empty p

(** val eq_gvar : gvar -> gvar -> bool **)

let eq_gvar x x' =
  (&&)
    (eq_op expr_v_scope__canonical__eqtype_Equality (Obj.magic x.gs)
      (Obj.magic x'.gs))
    (eq_op Var.coq_MvMake_var__canonical__eqtype_Equality
      (Obj.magic x.gv.v_var) (Obj.magic x'.gv.v_var))

(** val eq_expr : pexpr -> pexpr -> bool **)

let rec eq_expr e e' =
  match e with
  | Pconst z ->
    (match e' with
     | Pconst z' ->
       eq_op coq_BinNums_Z__canonical__eqtype_Equality (Obj.magic z)
         (Obj.magic z')
     | _ -> false)
  | Pbool b ->
    (match e' with
     | Pbool b' ->
       eq_op coq_Datatypes_bool__canonical__eqtype_Equality (Obj.magic b)
         (Obj.magic b')
     | _ -> false)
  | Parr_init (ws, n) ->
    (match e' with
     | Parr_init (ws', n') ->
       (&&)
         (eq_op wsize_wsize__canonical__eqtype_Equality (Obj.magic ws)
           (Obj.magic ws'))
         (eq_op coq_BinNums_positive__canonical__eqtype_Equality
           (Obj.magic n) (Obj.magic n'))
     | _ -> false)
  | Pvar x -> (match e' with
               | Pvar x' -> eq_gvar x x'
               | _ -> false)
  | Pget (al, aa, w, x, e0) ->
    (match e' with
     | Pget (al', aa', w', x', e'0) ->
       (&&)
         ((&&)
           ((&&)
             ((&&)
               (eq_op memory_model_aligned__canonical__eqtype_Equality
                 (Obj.magic al) (Obj.magic al'))
               (eq_op warray__arr_access__canonical__eqtype_Equality
                 (Obj.magic aa) (Obj.magic aa')))
             (eq_op wsize_wsize__canonical__eqtype_Equality (Obj.magic w)
               (Obj.magic w'))) (eq_gvar x x')) (eq_expr e0 e'0)
     | _ -> false)
  | Psub (aa, w, len, x, e0) ->
    (match e' with
     | Psub (aa', w', len', x', e'0) ->
       (&&)
         ((&&)
           ((&&)
             ((&&)
               (eq_op warray__arr_access__canonical__eqtype_Equality
                 (Obj.magic aa) (Obj.magic aa'))
               (eq_op wsize_wsize__canonical__eqtype_Equality (Obj.magic w)
                 (Obj.magic w')))
             (eq_op coq_BinNums_positive__canonical__eqtype_Equality
               (Obj.magic len) (Obj.magic len'))) (eq_gvar x x'))
         (eq_expr e0 e'0)
     | _ -> false)
  | Pload (al, w, e0) ->
    (match e' with
     | Pload (al', w', e'0) ->
       (&&)
         ((&&)
           (eq_op memory_model_aligned__canonical__eqtype_Equality
             (Obj.magic al) (Obj.magic al'))
           (eq_op wsize_wsize__canonical__eqtype_Equality (Obj.magic w)
             (Obj.magic w'))) (eq_expr e0 e'0)
     | _ -> false)
  | Papp1 (o, e0) ->
    (match e' with
     | Papp1 (o', e'0) ->
       (&&)
         (eq_op operators_sop1__canonical__eqtype_Equality (Obj.magic o)
           (Obj.magic o')) (eq_expr e0 e'0)
     | _ -> false)
  | Papp2 (o, e1, e2) ->
    (match e' with
     | Papp2 (o', e1', e2') ->
       (&&)
         ((&&)
           (eq_op operators_sop2__canonical__eqtype_Equality (Obj.magic o)
             (Obj.magic o')) (eq_expr e1 e1')) (eq_expr e2 e2')
     | _ -> false)
  | PappN (o, es) ->
    (match e' with
     | PappN (o', es') ->
       (&&)
         (eq_op operators_opN__canonical__eqtype_Equality (Obj.magic o)
           (Obj.magic o')) (all2 eq_expr es es')
     | _ -> false)
  | Pif (t0, e0, e1, e2) ->
    (match e' with
     | Pif (t', e'0, e1', e2') ->
       (&&)
         ((&&)
           ((&&)
             (eq_op type_atype__canonical__eqtype_Equality (Obj.magic t0)
               (Obj.magic t')) (eq_expr e0 e'0)) (eq_expr e1 e1'))
         (eq_expr e2 e2')
     | _ -> false)

(** val eq_lval : lval -> lval -> bool **)

let eq_lval x x' =
  match x with
  | Lnone (_, ty) ->
    (match x' with
     | Lnone (_, ty') ->
       eq_op type_atype__canonical__eqtype_Equality (Obj.magic ty)
         (Obj.magic ty')
     | _ -> false)
  | Lvar v ->
    (match x' with
     | Lvar v' ->
       eq_op Var.coq_MvMake_var__canonical__eqtype_Equality
         (Obj.magic v.v_var) (Obj.magic v'.v_var)
     | _ -> false)
  | Lmem (al, w, _, e) ->
    (match x' with
     | Lmem (al', w', _, e') ->
       (&&)
         ((&&)
           (eq_op memory_model_aligned__canonical__eqtype_Equality
             (Obj.magic al) (Obj.magic al'))
           (eq_op wsize_wsize__canonical__eqtype_Equality (Obj.magic w)
             (Obj.magic w'))) (eq_expr e e')
     | _ -> false)
  | Laset (al, aa, w, v, e) ->
    (match x' with
     | Laset (al', aa', w', v', e') ->
       (&&)
         ((&&)
           ((&&)
             ((&&)
               (eq_op memory_model_aligned__canonical__eqtype_Equality
                 (Obj.magic al) (Obj.magic al'))
               (eq_op warray__arr_access__canonical__eqtype_Equality
                 (Obj.magic aa) (Obj.magic aa')))
             (eq_op wsize_wsize__canonical__eqtype_Equality (Obj.magic w)
               (Obj.magic w')))
           (eq_op Var.coq_MvMake_var__canonical__eqtype_Equality
             (Obj.magic v.v_var) (Obj.magic v'.v_var))) (eq_expr e e')
     | _ -> false)
  | Lasub (aa, w, len, v, e) ->
    (match x' with
     | Lasub (aa', w', len', v', e') ->
       (&&)
         ((&&)
           ((&&)
             ((&&)
               (eq_op warray__arr_access__canonical__eqtype_Equality
                 (Obj.magic aa) (Obj.magic aa'))
               (eq_op wsize_wsize__canonical__eqtype_Equality (Obj.magic w)
                 (Obj.magic w')))
             (eq_op coq_BinNums_positive__canonical__eqtype_Equality
               (Obj.magic len) (Obj.magic len')))
           (eq_op Var.coq_MvMake_var__canonical__eqtype_Equality
             (Obj.magic v.v_var) (Obj.magic v'.v_var))) (eq_expr e e')
     | _ -> false)

(** val eq_instr_r : 'a1 asmOp -> 'a1 instr_r -> 'a1 instr_r -> bool **)

let eq_instr_r asmop =
  let rec eq_instr_r0 i1 i2 =
    match i1 with
    | Cassgn (x1, tag1, ty1, e1) ->
      (match i2 with
       | Cassgn (x2, tag2, ty2, e2) ->
         (&&)
           ((&&)
             ((&&)
               (eq_op expr_assgn_tag__canonical__eqtype_Equality
                 (Obj.magic tag1) (Obj.magic tag2))
               (eq_op type_atype__canonical__eqtype_Equality (Obj.magic ty1)
                 (Obj.magic ty2))) (eq_lval x1 x2)) (eq_expr e1 e2)
       | _ -> false)
    | Copn (x1, tag1, o1, e1) ->
      (match i2 with
       | Copn (x2, tag2, o2, e2) ->
         (&&)
           ((&&)
             ((&&) (all2 eq_lval x1 x2)
               (eq_op expr_assgn_tag__canonical__eqtype_Equality
                 (Obj.magic tag1) (Obj.magic tag2)))
             (eq_op (sopn_sopn__canonical__eqtype_Equality asmop)
               (Obj.magic o1) (Obj.magic o2))) (all2 eq_expr e1 e2)
       | _ -> false)
    | Csyscall (xs1, o1, es1) ->
      (match i2 with
       | Csyscall (xs2, o2, es2) ->
         (&&)
           ((&&) (all2 eq_lval xs1 xs2)
             (eq_op syscall_syscall_t__canonical__eqtype_Equality
               (Obj.magic o1) (Obj.magic o2))) (all2 eq_expr es1 es2)
       | _ -> false)
    | Cassert a1 ->
      (match i2 with
       | Cassert a2 ->
         (&&)
           (eq_op coq_String_string__canonical__eqtype_Equality
             (fst (Obj.magic a1)) (fst (Obj.magic a2)))
           (eq_expr (snd a1) (snd a2))
       | _ -> false)
    | Cif (e1, c11, c12) ->
      (match i2 with
       | Cif (e2, c21, c22) ->
         (&&) ((&&) (eq_expr e1 e2) (all2 eq_instr0 c11 c21))
           (all2 eq_instr0 c12 c22)
       | _ -> false)
    | Cfor (i3, r, c1) ->
      let (p, hi1) = r in
      let (dir1, lo1) = p in
      (match i2 with
       | Cfor (i4, r0, c2) ->
         let (p0, hi2) = r0 in
         let (dir2, lo2) = p0 in
         (&&)
           ((&&)
             ((&&)
               ((&&)
                 (eq_op Var.coq_MvMake_var__canonical__eqtype_Equality
                   (Obj.magic i3.v_var) (Obj.magic i4.v_var))
                 (eq_op expr_dir__canonical__eqtype_Equality (Obj.magic dir1)
                   (Obj.magic dir2))) (eq_expr lo1 lo2)) (eq_expr hi1 hi2))
           (all2 eq_instr0 c1 c2)
       | _ -> false)
    | Cwhile (a1, c1, e1, _, c1') ->
      (match i2 with
       | Cwhile (a2, c2, e2, _, c2') ->
         (&&)
           ((&&)
             ((&&)
               (eq_op expr_align__canonical__eqtype_Equality (Obj.magic a1)
                 (Obj.magic a2)) (all2 eq_instr0 c1 c2)) (eq_expr e1 e2))
           (all2 eq_instr0 c1' c2')
       | _ -> false)
    | Ccall (x1, f1, arg1) ->
      (match i2 with
       | Ccall (x2, f2, arg2) ->
         (&&)
           ((&&) (all2 eq_lval x1 x2)
             (eq_op funname_eqType (Obj.magic f1) (Obj.magic f2)))
           (all2 eq_expr arg1 arg2)
       | _ -> false)
  and eq_instr0 i1 i2 =
    let MkI (_, i3) = i1 in let MkI (_, i4) = i2 in eq_instr_r0 i3 i4
  in eq_instr_r0

(** val eq_instr : 'a1 asmOp -> 'a1 instr -> 'a1 instr -> bool **)

let eq_instr asmop =
  let rec eq_instr_r0 i1 i2 =
    match i1 with
    | Cassgn (x1, tag1, ty1, e1) ->
      (match i2 with
       | Cassgn (x2, tag2, ty2, e2) ->
         (&&)
           ((&&)
             ((&&)
               (eq_op expr_assgn_tag__canonical__eqtype_Equality
                 (Obj.magic tag1) (Obj.magic tag2))
               (eq_op type_atype__canonical__eqtype_Equality (Obj.magic ty1)
                 (Obj.magic ty2))) (eq_lval x1 x2)) (eq_expr e1 e2)
       | _ -> false)
    | Copn (x1, tag1, o1, e1) ->
      (match i2 with
       | Copn (x2, tag2, o2, e2) ->
         (&&)
           ((&&)
             ((&&) (all2 eq_lval x1 x2)
               (eq_op expr_assgn_tag__canonical__eqtype_Equality
                 (Obj.magic tag1) (Obj.magic tag2)))
             (eq_op (sopn_sopn__canonical__eqtype_Equality asmop)
               (Obj.magic o1) (Obj.magic o2))) (all2 eq_expr e1 e2)
       | _ -> false)
    | Csyscall (xs1, o1, es1) ->
      (match i2 with
       | Csyscall (xs2, o2, es2) ->
         (&&)
           ((&&) (all2 eq_lval xs1 xs2)
             (eq_op syscall_syscall_t__canonical__eqtype_Equality
               (Obj.magic o1) (Obj.magic o2))) (all2 eq_expr es1 es2)
       | _ -> false)
    | Cassert a1 ->
      (match i2 with
       | Cassert a2 ->
         (&&)
           (eq_op coq_String_string__canonical__eqtype_Equality
             (fst (Obj.magic a1)) (fst (Obj.magic a2)))
           (eq_expr (snd a1) (snd a2))
       | _ -> false)
    | Cif (e1, c11, c12) ->
      (match i2 with
       | Cif (e2, c21, c22) ->
         (&&) ((&&) (eq_expr e1 e2) (all2 eq_instr0 c11 c21))
           (all2 eq_instr0 c12 c22)
       | _ -> false)
    | Cfor (i3, r, c1) ->
      let (p, hi1) = r in
      let (dir1, lo1) = p in
      (match i2 with
       | Cfor (i4, r0, c2) ->
         let (p0, hi2) = r0 in
         let (dir2, lo2) = p0 in
         (&&)
           ((&&)
             ((&&)
               ((&&)
                 (eq_op Var.coq_MvMake_var__canonical__eqtype_Equality
                   (Obj.magic i3.v_var) (Obj.magic i4.v_var))
                 (eq_op expr_dir__canonical__eqtype_Equality (Obj.magic dir1)
                   (Obj.magic dir2))) (eq_expr lo1 lo2)) (eq_expr hi1 hi2))
           (all2 eq_instr0 c1 c2)
       | _ -> false)
    | Cwhile (a1, c1, e1, _, c1') ->
      (match i2 with
       | Cwhile (a2, c2, e2, _, c2') ->
         (&&)
           ((&&)
             ((&&)
               (eq_op expr_align__canonical__eqtype_Equality (Obj.magic a1)
                 (Obj.magic a2)) (all2 eq_instr0 c1 c2)) (eq_expr e1 e2))
           (all2 eq_instr0 c1' c2')
       | _ -> false)
    | Ccall (x1, f1, arg1) ->
      (match i2 with
       | Ccall (x2, f2, arg2) ->
         (&&)
           ((&&) (all2 eq_lval x1 x2)
             (eq_op funname_eqType (Obj.magic f1) (Obj.magic f2)))
           (all2 eq_expr arg1 arg2)
       | _ -> false)
  and eq_instr0 i1 i2 =
    let MkI (_, i3) = i1 in let MkI (_, i4) = i2 in eq_instr_r0 i3 i4
  in eq_instr0

(** val eq_cmd : 'a1 asmOp -> 'a1 instr list -> 'a1 instr list -> bool **)

let eq_cmd asmop c1 c2 =
  all2 (eq_instr asmop) c1 c2

(** val to_lvals : Var.var list -> lval list **)

let to_lvals l =
  map (fun x -> Lvar (mk_var_i x)) l

(** val is_false : pexpr -> bool **)

let is_false = function
| Pbool b -> if b then false else true
| _ -> false

(** val is_zero : Equality.sort -> pexpr -> bool **)

let is_zero sz = function
| Papp1 (s, p) ->
  (match s with
   | Oword_of_int sz' ->
     (match p with
      | Pconst z ->
        (match z with
         | Z0 ->
           eq_op wsize_wsize__canonical__eqtype_Equality (Obj.magic sz') sz
         | _ -> false)
      | _ -> false)
   | _ -> false)
| _ -> false

(** val instr_of_copn_args :
    'a1 asmOp -> assgn_tag -> ((lval list * 'a1 sopn) * pexpr list) -> 'a1
    instr_r **)

let instr_of_copn_args _ tg args =
  Copn ((fst (fst args)), tg, (snd (fst args)), (snd args))
