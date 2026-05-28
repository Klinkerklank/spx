(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open Fintype
open Seq
open Ssreflect
open Ssrfun

type __ = Obj.t

type ('r, 'i) bigbody =
| BigBody of 'i * ('r -> 'r -> 'r) * bool * 'r

val applybig : ('a1, 'a2) bigbody -> 'a1 -> 'a1

val reducebig : 'a1 -> 'a2 list -> ('a2 -> ('a1, 'a2) bigbody) -> 'a1

module type Coq_bigop_Locked =
 sig
  val body : 'a1 -> 'a2 list -> ('a2 -> ('a1, 'a2) bigbody) -> 'a1
 end

module Coq_bigop :
 Coq_bigop_Locked

val index_enum_key : unit

val index_enum : Finite.coq_type -> Finite.sort list
