(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open BinNums
open Bool
open Eqb_core_defs
open Eqtype

type __ = Obj.t

(** val ascii_eqb : char -> char -> bool **)

let ascii_eqb = Char.equal

(** val string_tag : string -> positive **)

let string_tag i =
  (* If this appears, you're using String internals. Please don't *)
 (fun f0 f1 s ->
    let l = String.length s in
    if l = 0 then f0 () else f1 (String.get s 0) (String.sub s 1 (l-1)))

    (fun _ -> Coq_xH)
    (fun _ _ -> Coq_xO Coq_xH)
    i

type box_string_EmptyString =
| Box_string_EmptyString

type box_string_String = { coq_Box_string_String_0 : char;
                           coq_Box_string_String_1 : string }

type string_fields_t = __

(** val string_fields : string -> string_fields_t **)

let string_fields i =
  (* If this appears, you're using String internals. Please don't *)
 (fun f0 f1 s ->
    let l = String.length s in
    if l = 0 then f0 () else f1 (String.get s 0) (String.sub s 1 (l-1)))

    (fun _ -> Obj.magic Box_string_EmptyString)
    (fun h h0 ->
    Obj.magic { coq_Box_string_String_0 = h; coq_Box_string_String_1 = h0 })
    i

(** val string_eqb_fields :
    (string -> string -> bool) -> positive -> string_fields_t ->
    string_fields_t -> bool **)

let string_eqb_fields rec0 x x0 x1 =
  match x with
  | Coq_xO _ ->
    let { coq_Box_string_String_0 = box_string_String_0;
      coq_Box_string_String_1 = box_string_String_1 } = Obj.magic x0
    in
    let { coq_Box_string_String_0 = box_string_String_2;
      coq_Box_string_String_1 = box_string_String_3 } = Obj.magic x1
    in
    (&&) (ascii_eqb box_string_String_0 box_string_String_2)
      ((&&) (rec0 box_string_String_1 box_string_String_3) true)
  | _ -> true

(** val string_eqb : string -> string -> bool **)

let rec string_eqb x1 x2 =
  (* If this appears, you're using String internals. Please don't *)
 (fun f0 f1 s ->
    let l = String.length s in
    if l = 0 then f0 () else f1 (String.get s 0) (String.sub s 1 (l-1)))

    (fun _ ->
    eqb_body string_tag string_fields
      (Obj.magic string_eqb_fields string_eqb) (string_tag "")
      Box_string_EmptyString x2)
    (fun h h0 ->
    eqb_body string_tag string_fields
      (Obj.magic string_eqb_fields string_eqb)
      (string_tag
        ((* If this appears, you're using String internals. Please don't *)
  (fun (c, s) -> String.make 1 c ^ s)

        (h, h0))) { coq_Box_string_String_0 = h; coq_Box_string_String_1 =
      h0 } x2)
    x1

(** val string_eqb_OK : string -> string -> reflect **)

let string_eqb_OK =
  iffP2 string_eqb

(** val coq_HB_unnamed_factory_9 : string Coq_hasDecEq.axioms_ **)

let coq_HB_unnamed_factory_9 =
  { Coq_hasDecEq.eq_op = string_eqb; Coq_hasDecEq.eqP = string_eqb_OK }

(** val coq_String_string__canonical__eqtype_Equality : Equality.coq_type **)

let coq_String_string__canonical__eqtype_Equality =
  Obj.magic coq_HB_unnamed_factory_9
