(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)


module type DecidableType =
 sig
  type t

  val eq_dec : t -> t -> bool
 end

module type DecidableTypeOrig =
 sig
  type t

  val eq_dec : t -> t -> bool
 end
