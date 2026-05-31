(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open BinNums
open Var0

type label_kind =
| InternalLabel
| ExternalLabel

type label = positive

type remote_label = funname * label
