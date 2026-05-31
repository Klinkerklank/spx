(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open Bool
open Datatypes
open Nat0
open Eqtype
open Ssrbool

(** val eqn : nat -> nat -> bool **)

let rec eqn m n =
  match m with
  | O -> (match n with
          | O -> true
          | S _ -> false)
  | S m' -> (match n with
             | O -> false
             | S n' -> eqn m' n')

(** val eqnP : nat eq_axiom **)

let eqnP n m =
  iffP (eqn n m) (if eqn n m then ReflectT else ReflectF)

(** val coq_HB_unnamed_factory_1 : nat Coq_hasDecEq.axioms_ **)

let coq_HB_unnamed_factory_1 =
  { Coq_hasDecEq.eq_op = eqn; Coq_hasDecEq.eqP = eqnP }

(** val coq_Datatypes_nat__canonical__eqtype_Equality : Equality.coq_type **)

let coq_Datatypes_nat__canonical__eqtype_Equality =
  Obj.magic coq_HB_unnamed_factory_1

(** val addn_rec : nat -> nat -> nat **)

let addn_rec =
  add

(** val addn : nat -> nat -> nat **)

let addn =
  addn_rec

(** val subn_rec : nat -> nat -> nat **)

let subn_rec =
  sub

(** val subn : nat -> nat -> nat **)

let subn =
  subn_rec

(** val leq : nat -> nat -> bool **)

let leq m n =
  eq_op coq_Datatypes_nat__canonical__eqtype_Equality (Obj.magic subn m n)
    (Obj.magic O)

(** val iter : nat -> ('a1 -> 'a1) -> 'a1 -> 'a1 **)

let rec iter n f x =
  match n with
  | O -> x
  | S i -> f (iter i f x)

(** val muln_rec : nat -> nat -> nat **)

let muln_rec =
  mul

(** val muln : nat -> nat -> nat **)

let muln =
  muln_rec

(** val nat_of_bool : bool -> nat **)

let nat_of_bool = function
| true -> S O
| false -> O
