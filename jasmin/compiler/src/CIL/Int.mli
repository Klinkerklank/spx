(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open BinInt
open BinNums

module type Int =
 sig
  type t

  val i2z : t -> coq_Z

  val _0 : t

  val _1 : t

  val _2 : t

  val _3 : t

  val add : t -> t -> t

  val opp : t -> t

  val sub : t -> t -> t

  val mul : t -> t -> t

  val max : t -> t -> t

  val eqb : t -> t -> bool

  val ltb : t -> t -> bool

  val leb : t -> t -> bool

  val gt_le_dec : t -> t -> bool

  val ge_lt_dec : t -> t -> bool

  val eq_dec : t -> t -> bool
 end

module Z_as_Int :
 sig
  type t = coq_Z

  val _0 : coq_Z

  val _1 : coq_Z

  val _2 : coq_Z

  val _3 : coq_Z

  val add : coq_Z -> coq_Z -> coq_Z

  val opp : coq_Z -> coq_Z

  val sub : coq_Z -> coq_Z -> coq_Z

  val mul : coq_Z -> coq_Z -> coq_Z

  val max : coq_Z -> coq_Z -> coq_Z

  val eqb : coq_Z -> coq_Z -> bool

  val ltb : coq_Z -> coq_Z -> bool

  val leb : coq_Z -> coq_Z -> bool

  val eq_dec : coq_Z -> coq_Z -> bool

  val gt_le_dec : coq_Z -> coq_Z -> bool

  val ge_lt_dec : coq_Z -> coq_Z -> bool

  val i2z : t -> coq_Z
 end
