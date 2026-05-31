(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open Datatypes
open Ssrfun

val onth : 'a1 list -> nat -> 'a1 option

val omap : ('a1 -> 'a2 option) -> 'a1 list -> 'a2 list option
