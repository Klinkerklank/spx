(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open BinInt
open BinNums
open Bool
open Datatypes
open Sumbool
open Eqtype
open Gen_map
open Memory_model
open Seq
open Ssrfun
open Utils0
open Word0
open Wsize

type __ = Obj.t

module MemoryI :
 MemoryT
