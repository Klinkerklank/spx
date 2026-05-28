(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open Param1

module Coq_exports =
 struct
  (** val is_bool_inhab : bool -> Coq_exports.is_bool **)

  let is_bool_inhab = function
  | true -> Coq_exports.Coq_is_true
  | false -> Coq_exports.Coq_is_false
 end
