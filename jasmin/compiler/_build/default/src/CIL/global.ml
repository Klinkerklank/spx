(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open BinNums
open Var0
open Warray_
open Word0
open Wsize

type glob_value =
| Gword of wsize * word
| Garr of positive * WArray.array

type glob_decl = Var.var * glob_value
