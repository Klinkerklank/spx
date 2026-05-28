(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open BinNums

module Pos :
 sig
  type mask =
  | IsNul
  | IsPos of positive
  | IsNeg
 end
