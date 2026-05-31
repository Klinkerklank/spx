(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open Memory_example
open Memory_model
open Wsize

module Memory :
 sig
  type mem = MemoryI.mem

  val coq_CM : coq_PointerData -> mem coreMem

  val coq_M : coq_PointerData -> mem memory
 end
