(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open Datatypes
open Eqtype
open Ssrbool
open Ssrfun
open Ssrnat

type __ = Obj.t

module Coq_hasChoice :
 sig
  type 't axioms_ =
    't pred -> nat -> 't option
    (* singleton inductive, whose constructor was Axioms_ *)

  val find_subdef : 'a1 axioms_ -> 'a1 pred -> nat -> 'a1 option

  type 't phant_axioms = 't axioms_
 end

module Choice :
 sig
  type 't axioms_ = { choice_hasChoice_mixin : 't Coq_hasChoice.axioms_;
                      eqtype_hasDecEq_mixin : 't Coq_hasDecEq.axioms_ }

  val choice_hasChoice_mixin : 'a1 axioms_ -> 'a1 Coq_hasChoice.axioms_

  type coq_type =
    __ axioms_
    (* singleton inductive, whose constructor was Pack *)

  type sort = __

  val coq_class : coq_type -> sort axioms_
 end

val find_subdef :
  Choice.coq_type -> Choice.sort pred -> nat -> Choice.sort option

val coq_PCanHasChoice :
  Choice.coq_type -> ('a1 -> Choice.sort) -> (Choice.sort -> 'a1 option) ->
  'a1 Coq_hasChoice.phant_axioms

val coq_HB_unnamed_factory_6 :
  Choice.coq_type -> ('a1 -> Choice.sort) -> (Choice.sort -> 'a1 option) ->
  ('a1, Choice.sort) pcan_type Coq_hasChoice.phant_axioms

val nat_hasChoice : nat Coq_hasChoice.phant_axioms

val coq_HB_unnamed_factory_20 : nat Coq_hasChoice.phant_axioms

val coq_Datatypes_nat__canonical__choice_Choice : Choice.coq_type

module Choice_isCountable :
 sig
  type 't axioms_ = { pickle : ('t -> nat); unpickle : (nat -> 't option) }

  val pickle : 'a1 axioms_ -> 'a1 -> nat

  val unpickle : 'a1 axioms_ -> nat -> 'a1 option

  val phant_Build : ('a1 -> nat) -> (nat -> 'a1 option) -> 'a1 axioms_
 end

module Countable :
 sig
  type 't axioms_ = { choice_hasChoice_mixin : 't Coq_hasChoice.axioms_;
                      eqtype_hasDecEq_mixin : 't Coq_hasDecEq.axioms_;
                      choice_Choice_isCountable_mixin : 't
                                                        Choice_isCountable.axioms_ }

  val choice_hasChoice_mixin : 'a1 axioms_ -> 'a1 Coq_hasChoice.axioms_

  val eqtype_hasDecEq_mixin : 'a1 axioms_ -> 'a1 Coq_hasDecEq.axioms_

  val choice_Choice_isCountable_mixin :
    'a1 axioms_ -> 'a1 Choice_isCountable.axioms_

  type coq_type =
    __ axioms_
    (* singleton inductive, whose constructor was Pack *)

  type sort = __

  val coq_class : coq_type -> sort axioms_

  module Exports :
   sig
    val choice_Countable_class__to__eqtype_Equality_class :
      'a1 axioms_ -> 'a1 Equality.axioms_

    val choice_Countable__to__eqtype_Equality : coq_type -> Equality.coq_type

    val choice_Countable_class__to__choice_Choice_class :
      'a1 axioms_ -> 'a1 Choice.axioms_

    val choice_Countable__to__choice_Choice : coq_type -> Choice.coq_type
   end
 end

val pickle : Countable.coq_type -> Countable.sort -> nat

val unpickle : Countable.coq_type -> nat -> Countable.sort option

module Coq_isCountable :
 sig
  type 't axioms_ = { pickle : ('t -> nat); unpickle : (nat -> 't option) }

  val pickle : 'a1 axioms_ -> 'a1 -> nat

  val unpickle : 'a1 axioms_ -> nat -> 'a1 option

  val phant_Build : ('a1 -> nat) -> (nat -> 'a1 option) -> 'a1 axioms_

  type 't phant_axioms = 't axioms_
 end

module Builders_77 :
 sig
  val coq_HB_unnamed_factory_81 :
    'a1 Coq_isCountable.phant_axioms -> 'a1 Coq_hasChoice.phant_axioms

  val coq_HB_unnamed_factory_83 :
    'a1 Coq_isCountable.phant_axioms -> 'a1 Choice_isCountable.axioms_
 end

val coq_PCanIsCountable :
  Countable.coq_type -> ('a1 -> Countable.sort) -> (Countable.sort -> 'a1
  option) -> 'a1 Coq_isCountable.axioms_

val coq_HB_unnamed_factory_87 :
  Countable.coq_type -> ('a1 -> Countable.sort) -> (Countable.sort -> 'a1
  option) -> ('a1, Countable.sort) pcan_type Coq_isCountable.phant_axioms

val coq_HB_unnamed_mixin_91 :
  Countable.coq_type -> ('a1 -> Countable.sort) -> (Countable.sort -> 'a1
  option) -> ('a1, Countable.sort) pcan_type Choice_isCountable.axioms_

val eqtype_pcan_type__canonical__choice_Countable :
  Countable.coq_type -> ('a1 -> Countable.sort) -> (Countable.sort -> 'a1
  option) -> Countable.coq_type

val coq_HB_unnamed_mixin_106 :
  Countable.coq_type -> Countable.sort pred -> Countable.sort
  SubType.coq_type -> Choice.sort SubType.sort Coq_hasChoice.phant_axioms

val coq_HB_unnamed_mixin_107 :
  Countable.coq_type -> Countable.sort pred -> Countable.sort
  SubType.coq_type -> (Equality.sort SubType.sort, Equality.sort) inj_type
  Coq_hasDecEq.axioms_

val coq_HB_unnamed_mixin_109 :
  Countable.coq_type -> Countable.sort pred -> Countable.sort
  SubType.coq_type -> (Countable.sort SubType.sort, Countable.sort) pcan_type
  Choice_isCountable.axioms_

val eqtype_sub_type__canonical__choice_Countable :
  Countable.coq_type -> Countable.sort pred -> Countable.sort
  SubType.coq_type -> Countable.coq_type

val coq_HB_unnamed_factory_120 : nat Choice_isCountable.axioms_

val coq_Datatypes_nat__canonical__choice_Countable : Countable.coq_type
