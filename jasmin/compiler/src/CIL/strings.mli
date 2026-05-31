(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open BinNums
open Bool
open Eqb_core_defs
open Eqtype

type __ = Obj.t

val ascii_eqb : char -> char -> bool

val string_tag : string -> positive

type box_string_EmptyString =
| Box_string_EmptyString

type box_string_String = { coq_Box_string_String_0 : char;
                           coq_Box_string_String_1 : string }

type string_fields_t = __

val string_fields : string -> string_fields_t

val string_eqb_fields :
  (string -> string -> bool) -> positive -> string_fields_t ->
  string_fields_t -> bool

val string_eqb : string -> string -> bool

val string_eqb_OK : string -> string -> reflect

val coq_HB_unnamed_factory_9 : string Coq_hasDecEq.axioms_

val coq_String_string__canonical__eqtype_Equality : Equality.coq_type
