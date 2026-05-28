(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open Bool
open Datatypes
open Ssrbool
open Ssrfun

type __ = Obj.t
let __ = let rec f _ = Obj.repr f in Obj.repr f

type 't eq_axiom = 't -> 't -> reflect

module Coq_hasDecEq =
 struct
  type 't axioms_ = { eq_op : 't rel; eqP : 't eq_axiom }

  (** val eq_op : 'a1 axioms_ -> 'a1 rel **)

  let eq_op record =
    record.eq_op

  (** val eqP : 'a1 axioms_ -> 'a1 eq_axiom **)

  let eqP record =
    record.eqP
 end

module Equality =
 struct
  type 't axioms_ =
    't Coq_hasDecEq.axioms_
    (* singleton inductive, whose constructor was Class *)

  (** val eqtype_hasDecEq_mixin : 'a1 axioms_ -> 'a1 Coq_hasDecEq.axioms_ **)

  let eqtype_hasDecEq_mixin record =
    record

  type coq_type =
    __ axioms_
    (* singleton inductive, whose constructor was Pack *)

  type sort = __

  (** val coq_class : coq_type -> sort axioms_ **)

  let coq_class record =
    record
 end

(** val eq_op : Equality.coq_type -> Equality.sort rel **)

let eq_op s =
  s.Coq_hasDecEq.eq_op

(** val eqP : Equality.coq_type -> Equality.sort eq_axiom **)

let eqP s =
  s.Coq_hasDecEq.eqP

(** val unit_eqP : unit eq_axiom **)

let unit_eqP _ _ =
  ReflectT

(** val coq_HB_unnamed_factory_1 : unit Coq_hasDecEq.axioms_ **)

let coq_HB_unnamed_factory_1 =
  { Coq_hasDecEq.eq_op = (fun _ _ -> true); Coq_hasDecEq.eqP = unit_eqP }

(** val coq_Datatypes_unit__canonical__eqtype_Equality : Equality.coq_type **)

let coq_Datatypes_unit__canonical__eqtype_Equality =
  Obj.magic coq_HB_unnamed_factory_1

(** val eqb : bool -> bool -> bool **)

let eqb b =
  addb (negb b)

(** val eqbP : bool eq_axiom **)

let eqbP __top_assumption_ =
  let _evar_0_ = fun __top_assumption_0 ->
    let _evar_0_ = ReflectT in
    let _evar_0_0 = ReflectF in
    if __top_assumption_0 then _evar_0_ else _evar_0_0
  in
  let _evar_0_0 = fun __top_assumption_0 ->
    let _evar_0_0 = ReflectF in
    let _evar_0_1 = ReflectT in
    if __top_assumption_0 then _evar_0_0 else _evar_0_1
  in
  if __top_assumption_ then _evar_0_ else _evar_0_0

(** val coq_HB_unnamed_factory_3 : bool Coq_hasDecEq.axioms_ **)

let coq_HB_unnamed_factory_3 =
  { Coq_hasDecEq.eq_op = eqb; Coq_hasDecEq.eqP = eqbP }

(** val coq_Datatypes_bool__canonical__eqtype_Equality : Equality.coq_type **)

let coq_Datatypes_bool__canonical__eqtype_Equality =
  Obj.magic coq_HB_unnamed_factory_3

(** val pred1 :
    Equality.coq_type -> Equality.sort -> Equality.sort simpl_pred **)

let pred1 t a1 =
  coq_SimplPred (fun x -> eq_op t x a1)

module Coq_isSub =
 struct
  type ('t, 'sub_sort) axioms_ = { val_subdef : ('sub_sort -> 't);
                                   coq_Sub : ('t -> __ -> 'sub_sort);
                                   coq_Sub_rect : (__ -> ('t -> __ -> __) ->
                                                  'sub_sort -> __) }

  (** val val_subdef : 'a1 pred -> ('a1, 'a2) axioms_ -> 'a2 -> 'a1 **)

  let val_subdef _ record =
    record.val_subdef

  (** val coq_Sub : 'a1 pred -> ('a1, 'a2) axioms_ -> 'a1 -> 'a2 **)

  let coq_Sub _ record x =
    record.coq_Sub x __
 end

module SubType =
 struct
  type ('t, 's) axioms_ =
    ('t, 's) Coq_isSub.axioms_
    (* singleton inductive, whose constructor was Class *)

  (** val eqtype_isSub_mixin :
      'a1 pred -> ('a1, 'a2) axioms_ -> ('a1, 'a2) Coq_isSub.axioms_ **)

  let eqtype_isSub_mixin _ record =
    record

  type 't coq_type =
    ('t, __) axioms_
    (* singleton inductive, whose constructor was Pack *)

  type 't sort = __

  (** val coq_class : 'a1 pred -> 'a1 coq_type -> ('a1, 'a1 sort) axioms_ **)

  let coq_class _ record =
    record

  (** val phant_on_ : 'a1 pred -> 'a1 coq_type -> ('a1, 'a1 sort) axioms_ **)

  let phant_on_ _ s =
    s
 end

(** val coq_Sub :
    'a1 pred -> 'a1 SubType.coq_type -> 'a1 -> 'a1 SubType.sort **)

let coq_Sub =
  Coq_isSub.coq_Sub

(** val insub :
    'a1 pred -> 'a1 SubType.coq_type -> 'a1 -> 'a1 SubType.sort option **)

let insub p sT x =
  if p x then Some (coq_Sub p sT x) else None

type ('t, 'x) inj_type = 't

type ('t, 'x) pcan_type = 't

(** val inj_eqAxiom :
    Equality.coq_type -> ('a1 -> Equality.sort) -> 'a1 eq_axiom **)

let inj_eqAxiom eT f x y =
  iffP (eq_op eT (f x) (f y)) (eqP eT (f x) (f y))

(** val coq_HB_unnamed_factory_9 :
    Equality.coq_type -> ('a1 -> Equality.sort) -> ('a1, Equality.sort)
    inj_type Coq_hasDecEq.axioms_ **)

let coq_HB_unnamed_factory_9 eT f =
  { Coq_hasDecEq.eq_op = (fun x y -> eq_op eT (f x) (f y));
    Coq_hasDecEq.eqP = (inj_eqAxiom eT f) }

(** val eqtype_inj_type__canonical__eqtype_Equality :
    Equality.coq_type -> ('a1 -> Equality.sort) -> Equality.coq_type **)

let eqtype_inj_type__canonical__eqtype_Equality eT f =
  coq_HB_unnamed_factory_9 eT (Obj.magic f)

(** val coq_HB_unnamed_factory_12 :
    Equality.coq_type -> ('a1 -> Equality.sort) -> (Equality.sort -> 'a1
    option) -> ('a1, Equality.sort) pcan_type Equality.axioms_ **)

let coq_HB_unnamed_factory_12 eT f _ =
  Obj.magic eqtype_inj_type__canonical__eqtype_Equality eT f

(** val coq_HB_unnamed_mixin_14 :
    Equality.coq_type -> ('a1 -> Equality.sort) -> (Equality.sort -> 'a1
    option) -> ('a1, Equality.sort) pcan_type Coq_hasDecEq.axioms_ **)

let coq_HB_unnamed_mixin_14 =
  coq_HB_unnamed_factory_12

(** val coq_HB_unnamed_mixin_27 :
    Equality.coq_type -> Equality.sort pred -> Equality.sort SubType.coq_type
    -> (Equality.sort SubType.sort, Equality.sort) inj_type
    Coq_hasDecEq.axioms_ **)

let coq_HB_unnamed_mixin_27 t p sT =
  { Coq_hasDecEq.eq_op = (fun x y ->
    eq_op t ((SubType.phant_on_ p sT).Coq_isSub.val_subdef x)
      ((SubType.phant_on_ p sT).Coq_isSub.val_subdef y)); Coq_hasDecEq.eqP =
    (inj_eqAxiom t (SubType.phant_on_ p sT).Coq_isSub.val_subdef) }

(** val eqtype_sub_type__canonical__eqtype_Equality :
    Equality.coq_type -> Equality.sort pred -> Equality.sort SubType.coq_type
    -> Equality.coq_type **)

let eqtype_sub_type__canonical__eqtype_Equality =
  coq_HB_unnamed_mixin_27

(** val pair_eq :
    Equality.coq_type -> Equality.coq_type -> (Equality.sort * Equality.sort)
    rel **)

let pair_eq t1 t2 u v =
  (&&) (eq_op t1 (fst u) (fst v)) (eq_op t2 (snd u) (snd v))

(** val pair_eqP :
    Equality.coq_type -> Equality.coq_type -> (Equality.sort * Equality.sort)
    eq_axiom **)

let pair_eqP t1 t2 __top_assumption_ =
  let _evar_0_ = fun x1 x2 __top_assumption_0 ->
    let _evar_0_ = fun y1 y2 ->
      iffP
        ((&&) (eq_op t1 (fst (x1, x2)) (fst (y1, y2)))
          (eq_op t2 (snd (x1, x2)) (snd (y1, y2))))
        (andP (eq_op t1 (fst (x1, x2)) (fst (y1, y2)))
          (eq_op t2 (snd (x1, x2)) (snd (y1, y2))))
    in
    let (a, b) = __top_assumption_0 in _evar_0_ a b
  in
  let (a, b) = __top_assumption_ in _evar_0_ a b

(** val coq_HB_unnamed_factory_38 :
    Equality.coq_type -> Equality.coq_type -> (Equality.sort * Equality.sort)
    Coq_hasDecEq.axioms_ **)

let coq_HB_unnamed_factory_38 t1 t2 =
  { Coq_hasDecEq.eq_op = (pair_eq t1 t2); Coq_hasDecEq.eqP =
    (pair_eqP t1 t2) }

(** val coq_Datatypes_prod__canonical__eqtype_Equality :
    Equality.coq_type -> Equality.coq_type -> Equality.coq_type **)

let coq_Datatypes_prod__canonical__eqtype_Equality t1 t2 =
  Obj.magic coq_HB_unnamed_factory_38 t1 t2

(** val opt_eq :
    Equality.coq_type -> Equality.sort option -> Equality.sort option -> bool **)

let opt_eq t u v =
  Option.apply (fun x -> Option.apply (eq_op t x) false v) (negb (isSome v)) u

(** val opt_eqP : Equality.coq_type -> Equality.sort option eq_axiom **)

let opt_eqP t _top_assumption_ =
  let _evar_0_ = fun x __top_assumption_ ->
    let _evar_0_ = fun y -> iffP (eq_op t x y) (eqP t x y) in
    let _evar_0_0 = ReflectF in
    (match __top_assumption_ with
     | Some a -> _evar_0_ a
     | None -> _evar_0_0)
  in
  let _evar_0_0 = fun __top_assumption_ ->
    let _evar_0_0 = fun _ -> ReflectF in
    let _evar_0_1 = ReflectT in
    (match __top_assumption_ with
     | Some a -> _evar_0_0 a
     | None -> _evar_0_1)
  in
  (match _top_assumption_ with
   | Some a -> _evar_0_ a
   | None -> _evar_0_0)

(** val coq_HB_unnamed_factory_40 :
    Equality.coq_type -> Equality.sort option Coq_hasDecEq.axioms_ **)

let coq_HB_unnamed_factory_40 t =
  { Coq_hasDecEq.eq_op = (opt_eq t); Coq_hasDecEq.eqP = (opt_eqP t) }

(** val coq_Datatypes_option__canonical__eqtype_Equality :
    Equality.coq_type -> Equality.coq_type **)

let coq_Datatypes_option__canonical__eqtype_Equality t =
  Obj.magic coq_HB_unnamed_factory_40 t
