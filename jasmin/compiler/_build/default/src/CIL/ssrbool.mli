(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open Bool
open Datatypes
open Ssrfun

type __ = Obj.t

val addb : bool -> bool -> bool

val isSome : 'a1 option -> bool

val iffP : bool -> reflect -> reflect

val equivP : bool -> reflect -> reflect

type alt_spec =
| AltTrue
| AltFalse

val altP : bool -> reflect -> alt_spec

val boolP : bool -> alt_spec

val andP : bool -> bool -> reflect

val and3P : bool -> bool -> bool -> reflect

val and4P : bool -> bool -> bool -> bool -> reflect

val andPP : bool -> bool -> reflect -> reflect -> reflect

type 't pred = 't -> bool

type 't predType =
  __ -> 't pred
  (* singleton inductive, whose constructor was PredType *)

type 't pred_sort = __

val predPredType : 'a1 predType

type 't simpl_pred = ('t, bool) simpl_fun

val coq_SimplPred : 'a1 pred -> 'a1 simpl_pred

module PredOfSimpl :
 sig
  val coerce : 'a1 simpl_pred -> 'a1 pred
 end

type 't rel = 't -> 't pred

type 't mem_pred = 't pred
  (* singleton inductive, whose constructor was Mem *)

val pred_of_mem : 'a1 mem_pred -> 'a1 pred_sort

val in_mem : 'a1 -> 'a1 mem_pred -> bool

val simpl_of_mem : 'a1 mem_pred -> 'a1 simpl_pred

val mem : 'a1 predType -> 'a1 pred_sort -> 'a1 mem_pred
