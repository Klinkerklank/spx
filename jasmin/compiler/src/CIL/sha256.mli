(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open BinNums
open Datatypes
open Seq
open Utils0
open Word0
open Wsize

val ch : word -> word -> word -> word

val maj : word -> word -> word -> word

val _UU03a3__UU2080_ : word -> word

val _UU03a3__UU2081_ : word -> word

val _UU03c3__UU2080_ : word -> word

val _UU03c3__UU2081_ : word -> word

val sha256msg1 : word -> word -> word

val sha256msg2 : word -> word -> word

val sha256rnds2 : word -> word -> word -> word
