(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open Datatypes
open Eqtype
open Ssrbool
open Ssrfun
open Ssrnat

type __ = Obj.t

module Coq_hasChoice =
 struct
  type 't axioms_ =
    't pred -> nat -> 't option
    (* singleton inductive, whose constructor was Axioms_ *)

  (** val find_subdef : 'a1 axioms_ -> 'a1 pred -> nat -> 'a1 option **)

  let find_subdef record =
    record

  type 't phant_axioms = 't axioms_
 end

module Choice =
 struct
  type 't axioms_ = { choice_hasChoice_mixin : 't Coq_hasChoice.axioms_;
                      eqtype_hasDecEq_mixin : 't Coq_hasDecEq.axioms_ }

  (** val choice_hasChoice_mixin :
      'a1 axioms_ -> 'a1 Coq_hasChoice.axioms_ **)

  let choice_hasChoice_mixin record =
    record.choice_hasChoice_mixin

  type coq_type =
    __ axioms_
    (* singleton inductive, whose constructor was Pack *)

  type sort = __

  (** val coq_class : coq_type -> sort axioms_ **)

  let coq_class record =
    record
 end

(** val find_subdef :
    Choice.coq_type -> Choice.sort pred -> nat -> Choice.sort option **)

let find_subdef s x x0 =
  s.Choice.choice_hasChoice_mixin x x0

(** val coq_PCanHasChoice :
    Choice.coq_type -> ('a1 -> Choice.sort) -> (Choice.sort -> 'a1 option) ->
    'a1 Coq_hasChoice.phant_axioms **)

let coq_PCanHasChoice t _ f' =
  let liftP = fun sP -> coq_SimplPred (fun x -> Option.apply sP false (f' x))
  in
  let sf = fun sP n ->
    Option.bind f' (find_subdef t (PredOfSimpl.coerce (liftP sP)) n)
  in
  (fun sP -> fun_of_simpl (sf sP))

(** val coq_HB_unnamed_factory_6 :
    Choice.coq_type -> ('a1 -> Choice.sort) -> (Choice.sort -> 'a1 option) ->
    ('a1, Choice.sort) pcan_type Coq_hasChoice.phant_axioms **)

let coq_HB_unnamed_factory_6 =
  coq_PCanHasChoice

(** val nat_hasChoice : nat Coq_hasChoice.phant_axioms **)

let nat_hasChoice =
  let f = fun p n -> if p n then Some n else None in
  (fun p -> fun_of_simpl (f p))

(** val coq_HB_unnamed_factory_20 : nat Coq_hasChoice.phant_axioms **)

let coq_HB_unnamed_factory_20 =
  nat_hasChoice

(** val coq_Datatypes_nat__canonical__choice_Choice : Choice.coq_type **)

let coq_Datatypes_nat__canonical__choice_Choice =
  { Choice.choice_hasChoice_mixin = (Obj.magic coq_HB_unnamed_factory_20);
    Choice.eqtype_hasDecEq_mixin = (Obj.magic coq_HB_unnamed_factory_1) }

module Choice_isCountable =
 struct
  type 't axioms_ = { pickle : ('t -> nat); unpickle : (nat -> 't option) }

  (** val pickle : 'a1 axioms_ -> 'a1 -> nat **)

  let pickle record =
    record.pickle

  (** val unpickle : 'a1 axioms_ -> nat -> 'a1 option **)

  let unpickle record =
    record.unpickle

  (** val phant_Build : ('a1 -> nat) -> (nat -> 'a1 option) -> 'a1 axioms_ **)

  let phant_Build pickle0 unpickle0 =
    { pickle = pickle0; unpickle = unpickle0 }
 end

module Countable =
 struct
  type 't axioms_ = { choice_hasChoice_mixin : 't Coq_hasChoice.axioms_;
                      eqtype_hasDecEq_mixin : 't Coq_hasDecEq.axioms_;
                      choice_Choice_isCountable_mixin : 't
                                                        Choice_isCountable.axioms_ }

  (** val choice_hasChoice_mixin :
      'a1 axioms_ -> 'a1 Coq_hasChoice.axioms_ **)

  let choice_hasChoice_mixin record =
    record.choice_hasChoice_mixin

  (** val eqtype_hasDecEq_mixin : 'a1 axioms_ -> 'a1 Coq_hasDecEq.axioms_ **)

  let eqtype_hasDecEq_mixin record =
    record.eqtype_hasDecEq_mixin

  (** val choice_Choice_isCountable_mixin :
      'a1 axioms_ -> 'a1 Choice_isCountable.axioms_ **)

  let choice_Choice_isCountable_mixin record =
    record.choice_Choice_isCountable_mixin

  type coq_type =
    __ axioms_
    (* singleton inductive, whose constructor was Pack *)

  type sort = __

  (** val coq_class : coq_type -> sort axioms_ **)

  let coq_class record =
    record

  module Exports =
   struct
    (** val choice_Countable_class__to__eqtype_Equality_class :
        'a1 axioms_ -> 'a1 Equality.axioms_ **)

    let choice_Countable_class__to__eqtype_Equality_class c =
      c.eqtype_hasDecEq_mixin

    (** val choice_Countable__to__eqtype_Equality :
        coq_type -> Equality.coq_type **)

    let choice_Countable__to__eqtype_Equality =
      choice_Countable_class__to__eqtype_Equality_class

    (** val choice_Countable_class__to__choice_Choice_class :
        'a1 axioms_ -> 'a1 Choice.axioms_ **)

    let choice_Countable_class__to__choice_Choice_class c =
      { Choice.choice_hasChoice_mixin = c.choice_hasChoice_mixin;
        Choice.eqtype_hasDecEq_mixin = c.eqtype_hasDecEq_mixin }

    (** val choice_Countable__to__choice_Choice :
        coq_type -> Choice.coq_type **)

    let choice_Countable__to__choice_Choice =
      choice_Countable_class__to__choice_Choice_class
   end
 end

(** val pickle : Countable.coq_type -> Countable.sort -> nat **)

let pickle s x =
  s.Countable.choice_Choice_isCountable_mixin.Choice_isCountable.pickle x

(** val unpickle : Countable.coq_type -> nat -> Countable.sort option **)

let unpickle s x =
  s.Countable.choice_Choice_isCountable_mixin.Choice_isCountable.unpickle x

module Coq_isCountable =
 struct
  type 't axioms_ = { pickle : ('t -> nat); unpickle : (nat -> 't option) }

  (** val pickle : 'a1 axioms_ -> 'a1 -> nat **)

  let pickle record =
    record.pickle

  (** val unpickle : 'a1 axioms_ -> nat -> 'a1 option **)

  let unpickle record =
    record.unpickle

  (** val phant_Build : ('a1 -> nat) -> (nat -> 'a1 option) -> 'a1 axioms_ **)

  let phant_Build pickle0 unpickle0 =
    { pickle = pickle0; unpickle = unpickle0 }

  type 't phant_axioms = 't axioms_
 end

module Builders_77 =
 struct
  (** val coq_HB_unnamed_factory_81 :
      'a1 Coq_isCountable.phant_axioms -> 'a1 Coq_hasChoice.phant_axioms **)

  let coq_HB_unnamed_factory_81 fresh_name_78 =
    coq_PCanHasChoice coq_Datatypes_nat__canonical__choice_Choice
      (Obj.magic fresh_name_78.Coq_isCountable.pickle)
      (Obj.magic fresh_name_78.Coq_isCountable.unpickle)

  (** val coq_HB_unnamed_factory_83 :
      'a1 Coq_isCountable.phant_axioms -> 'a1 Choice_isCountable.axioms_ **)

  let coq_HB_unnamed_factory_83 fresh_name_78 =
    Choice_isCountable.phant_Build fresh_name_78.Coq_isCountable.pickle
      fresh_name_78.Coq_isCountable.unpickle
 end

(** val coq_PCanIsCountable :
    Countable.coq_type -> ('a1 -> Countable.sort) -> (Countable.sort -> 'a1
    option) -> 'a1 Coq_isCountable.axioms_ **)

let coq_PCanIsCountable t f f' =
  Coq_isCountable.phant_Build (comp (pickle t) f) (pcomp f' (unpickle t))

(** val coq_HB_unnamed_factory_87 :
    Countable.coq_type -> ('a1 -> Countable.sort) -> (Countable.sort -> 'a1
    option) -> ('a1, Countable.sort) pcan_type Coq_isCountable.phant_axioms **)

let coq_HB_unnamed_factory_87 =
  coq_PCanIsCountable

(** val coq_HB_unnamed_mixin_91 :
    Countable.coq_type -> ('a1 -> Countable.sort) -> (Countable.sort -> 'a1
    option) -> ('a1, Countable.sort) pcan_type Choice_isCountable.axioms_ **)

let coq_HB_unnamed_mixin_91 t f f' =
  Builders_77.coq_HB_unnamed_factory_83 (coq_HB_unnamed_factory_87 t f f')

(** val eqtype_pcan_type__canonical__choice_Countable :
    Countable.coq_type -> ('a1 -> Countable.sort) -> (Countable.sort -> 'a1
    option) -> Countable.coq_type **)

let eqtype_pcan_type__canonical__choice_Countable t f f' =
  { Countable.choice_hasChoice_mixin =
    (coq_HB_unnamed_factory_6
      (Countable.Exports.choice_Countable__to__choice_Choice t) (Obj.magic f)
      (Obj.magic f')); Countable.eqtype_hasDecEq_mixin =
    (coq_HB_unnamed_mixin_14
      (Countable.Exports.choice_Countable__to__eqtype_Equality t)
      (Obj.magic f) (Obj.magic f'));
    Countable.choice_Choice_isCountable_mixin =
    (coq_HB_unnamed_mixin_91 t (Obj.magic f) (Obj.magic f')) }

(** val coq_HB_unnamed_mixin_106 :
    Countable.coq_type -> Countable.sort pred -> Countable.sort
    SubType.coq_type -> Choice.sort SubType.sort Coq_hasChoice.phant_axioms **)

let coq_HB_unnamed_mixin_106 t p sT =
  coq_PCanHasChoice (Countable.Exports.choice_Countable__to__choice_Choice t)
    (SubType.phant_on_ p sT).Coq_isSub.val_subdef (insub p sT)

(** val coq_HB_unnamed_mixin_107 :
    Countable.coq_type -> Countable.sort pred -> Countable.sort
    SubType.coq_type -> (Equality.sort SubType.sort, Equality.sort) inj_type
    Coq_hasDecEq.axioms_ **)

let coq_HB_unnamed_mixin_107 t p sT =
  { Coq_hasDecEq.eq_op = (fun x y ->
    eq_op (Countable.Exports.choice_Countable__to__eqtype_Equality t)
      ((SubType.phant_on_ p sT).Coq_isSub.val_subdef x)
      ((SubType.phant_on_ p sT).Coq_isSub.val_subdef y)); Coq_hasDecEq.eqP =
    (inj_eqAxiom (Countable.Exports.choice_Countable__to__eqtype_Equality t)
      (SubType.phant_on_ p sT).Coq_isSub.val_subdef) }

(** val coq_HB_unnamed_mixin_109 :
    Countable.coq_type -> Countable.sort pred -> Countable.sort
    SubType.coq_type -> (Countable.sort SubType.sort, Countable.sort)
    pcan_type Choice_isCountable.axioms_ **)

let coq_HB_unnamed_mixin_109 t p sT =
  { Choice_isCountable.pickle =
    (coq_HB_unnamed_factory_87 t
      (SubType.phant_on_ p sT).Coq_isSub.val_subdef (insub p sT)).Coq_isCountable.pickle;
    Choice_isCountable.unpickle =
    (coq_HB_unnamed_factory_87 t
      (SubType.phant_on_ p sT).Coq_isSub.val_subdef (insub p sT)).Coq_isCountable.unpickle }

(** val eqtype_sub_type__canonical__choice_Countable :
    Countable.coq_type -> Countable.sort pred -> Countable.sort
    SubType.coq_type -> Countable.coq_type **)

let eqtype_sub_type__canonical__choice_Countable t p sT =
  { Countable.choice_hasChoice_mixin = (coq_HB_unnamed_mixin_106 t p sT);
    Countable.eqtype_hasDecEq_mixin = (coq_HB_unnamed_mixin_107 t p sT);
    Countable.choice_Choice_isCountable_mixin =
    (coq_HB_unnamed_mixin_109 t p sT) }

(** val coq_HB_unnamed_factory_120 : nat Choice_isCountable.axioms_ **)

let coq_HB_unnamed_factory_120 =
  { Choice_isCountable.pickle = (fun x -> x); Choice_isCountable.unpickle =
    (fun x -> Some x) }

(** val coq_Datatypes_nat__canonical__choice_Countable :
    Countable.coq_type **)

let coq_Datatypes_nat__canonical__choice_Countable =
  { Countable.choice_hasChoice_mixin = (Obj.magic coq_HB_unnamed_factory_20);
    Countable.eqtype_hasDecEq_mixin = (Obj.magic coq_HB_unnamed_factory_1);
    Countable.choice_Choice_isCountable_mixin =
    (Obj.magic coq_HB_unnamed_factory_120) }
