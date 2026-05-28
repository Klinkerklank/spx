(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open BinNums
open Bool
open Eqb_core_defs
open Eqtype
open Utils0
open Wsize

type __ = Obj.t

type cmp_kind =
| Cmp_int
| Cmp_w of signedness * wsize

(** val cmp_kind_tag : cmp_kind -> positive **)

let cmp_kind_tag = function
| Cmp_int -> Coq_xH
| Cmp_w (_, _) -> Coq_xO Coq_xH

type box_cmp_kind_Cmp_int =
| Box_cmp_kind_Cmp_int

type box_cmp_kind_Cmp_w = { coq_Box_cmp_kind_Cmp_w_0 : signedness;
                            coq_Box_cmp_kind_Cmp_w_1 : wsize }

type cmp_kind_fields_t = __

(** val cmp_kind_fields : cmp_kind -> cmp_kind_fields_t **)

let cmp_kind_fields = function
| Cmp_int -> Obj.magic Box_cmp_kind_Cmp_int
| Cmp_w (h, h0) ->
  Obj.magic { coq_Box_cmp_kind_Cmp_w_0 = h; coq_Box_cmp_kind_Cmp_w_1 = h0 }

(** val cmp_kind_eqb_fields :
    (cmp_kind -> cmp_kind -> bool) -> positive -> cmp_kind_fields_t ->
    cmp_kind_fields_t -> bool **)

let cmp_kind_eqb_fields _ x x0 x1 =
  match x with
  | Coq_xO _ ->
    let { coq_Box_cmp_kind_Cmp_w_0 = box_cmp_kind_Cmp_w_0;
      coq_Box_cmp_kind_Cmp_w_1 = box_cmp_kind_Cmp_w_1 } = Obj.magic x0
    in
    let { coq_Box_cmp_kind_Cmp_w_0 = box_cmp_kind_Cmp_w_2;
      coq_Box_cmp_kind_Cmp_w_1 = box_cmp_kind_Cmp_w_3 } = Obj.magic x1
    in
    (&&) (signedness_eqb box_cmp_kind_Cmp_w_0 box_cmp_kind_Cmp_w_2)
      ((&&) (wsize_eqb box_cmp_kind_Cmp_w_1 box_cmp_kind_Cmp_w_3) true)
  | _ -> true

(** val cmp_kind_eqb : cmp_kind -> cmp_kind -> bool **)

let cmp_kind_eqb x1 x2 =
  match x1 with
  | Cmp_int ->
    eqb_body cmp_kind_tag cmp_kind_fields
      (Obj.magic cmp_kind_eqb_fields (fun _ _ -> true))
      (cmp_kind_tag Cmp_int) Box_cmp_kind_Cmp_int x2
  | Cmp_w (h, h0) ->
    eqb_body cmp_kind_tag cmp_kind_fields
      (Obj.magic cmp_kind_eqb_fields (fun _ _ -> true))
      (cmp_kind_tag (Cmp_w (h, h0))) { coq_Box_cmp_kind_Cmp_w_0 = h;
      coq_Box_cmp_kind_Cmp_w_1 = h0 } x2

type op_kind =
| Op_int
| Op_w of wsize

(** val op_kind_tag : op_kind -> positive **)

let op_kind_tag = function
| Op_int -> Coq_xH
| Op_w _ -> Coq_xO Coq_xH

type box_op_kind_Op_int =
| Box_op_kind_Op_int

type op_kind_fields_t = __

(** val op_kind_fields : op_kind -> op_kind_fields_t **)

let op_kind_fields = function
| Op_int -> Obj.magic Box_op_kind_Op_int
| Op_w h -> Obj.magic h

(** val op_kind_eqb_fields :
    (op_kind -> op_kind -> bool) -> positive -> op_kind_fields_t ->
    op_kind_fields_t -> bool **)

let op_kind_eqb_fields _ x x0 x1 =
  match x with
  | Coq_xO _ -> (&&) (wsize_eqb (Obj.magic x0) (Obj.magic x1)) true
  | _ -> true

(** val op_kind_eqb : op_kind -> op_kind -> bool **)

let op_kind_eqb x1 x2 =
  match x1 with
  | Op_int ->
    eqb_body op_kind_tag op_kind_fields
      (Obj.magic op_kind_eqb_fields (fun _ _ -> true)) (op_kind_tag Op_int)
      Box_op_kind_Op_int x2
  | Op_w h ->
    eqb_body op_kind_tag op_kind_fields
      (Obj.magic op_kind_eqb_fields (fun _ _ -> true)) (op_kind_tag (Op_w h))
      h x2

(** val op_kind_eqb_OK : op_kind -> op_kind -> reflect **)

let op_kind_eqb_OK =
  iffP2 op_kind_eqb

type wiop1 =
| WIwint_of_int of wsize
| WIint_of_wint of wsize
| WIword_of_wint of wsize
| WIwint_of_word of wsize
| WIwint_ext of wsize * wsize
| WIneg of wsize

(** val wiop1_tag : wiop1 -> positive **)

let wiop1_tag = function
| WIwint_of_int _ -> Coq_xH
| WIint_of_wint _ -> Coq_xO Coq_xH
| WIword_of_wint _ -> Coq_xI Coq_xH
| WIwint_of_word _ -> Coq_xO (Coq_xO Coq_xH)
| WIwint_ext (_, _) -> Coq_xI (Coq_xO Coq_xH)
| WIneg _ -> Coq_xO (Coq_xI Coq_xH)

type box_wiop1_WIwint_ext = { coq_Box_wiop1_WIwint_ext_0 : wsize;
                              coq_Box_wiop1_WIwint_ext_1 : wsize }

type wiop1_fields_t = __

(** val wiop1_fields : wiop1 -> wiop1_fields_t **)

let wiop1_fields = function
| WIwint_of_int h -> Obj.magic h
| WIint_of_wint h -> Obj.magic h
| WIword_of_wint h -> Obj.magic h
| WIwint_of_word h -> Obj.magic h
| WIwint_ext (h, h0) ->
  Obj.magic { coq_Box_wiop1_WIwint_ext_0 = h; coq_Box_wiop1_WIwint_ext_1 =
    h0 }
| WIneg h -> Obj.magic h

(** val wiop1_eqb_fields :
    (wiop1 -> wiop1 -> bool) -> positive -> wiop1_fields_t -> wiop1_fields_t
    -> bool **)

let wiop1_eqb_fields _ x x0 x1 =
  match x with
  | Coq_xI x2 ->
    (match x2 with
     | Coq_xI _ -> true
     | Coq_xO _ ->
       let { coq_Box_wiop1_WIwint_ext_0 = box_wiop1_WIwint_ext_0;
         coq_Box_wiop1_WIwint_ext_1 = box_wiop1_WIwint_ext_1 } = Obj.magic x0
       in
       let { coq_Box_wiop1_WIwint_ext_0 = box_wiop1_WIwint_ext_2;
         coq_Box_wiop1_WIwint_ext_1 = box_wiop1_WIwint_ext_3 } = Obj.magic x1
       in
       (&&) (wsize_eqb box_wiop1_WIwint_ext_0 box_wiop1_WIwint_ext_2)
         ((&&) (wsize_eqb box_wiop1_WIwint_ext_1 box_wiop1_WIwint_ext_3) true)
     | Coq_xH -> (&&) (wsize_eqb (Obj.magic x0) (Obj.magic x1)) true)
  | _ -> (&&) (wsize_eqb (Obj.magic x0) (Obj.magic x1)) true

(** val wiop1_eqb : wiop1 -> wiop1 -> bool **)

let wiop1_eqb x1 x2 =
  match x1 with
  | WIwint_of_int h ->
    eqb_body wiop1_tag wiop1_fields
      (Obj.magic wiop1_eqb_fields (fun _ _ -> true))
      (wiop1_tag (WIwint_of_int h)) h x2
  | WIint_of_wint h ->
    eqb_body wiop1_tag wiop1_fields
      (Obj.magic wiop1_eqb_fields (fun _ _ -> true))
      (wiop1_tag (WIint_of_wint h)) h x2
  | WIword_of_wint h ->
    eqb_body wiop1_tag wiop1_fields
      (Obj.magic wiop1_eqb_fields (fun _ _ -> true))
      (wiop1_tag (WIword_of_wint h)) h x2
  | WIwint_of_word h ->
    eqb_body wiop1_tag wiop1_fields
      (Obj.magic wiop1_eqb_fields (fun _ _ -> true))
      (wiop1_tag (WIwint_of_word h)) h x2
  | WIwint_ext (h, h0) ->
    eqb_body wiop1_tag wiop1_fields
      (Obj.magic wiop1_eqb_fields (fun _ _ -> true))
      (wiop1_tag (WIwint_ext (h, h0))) { coq_Box_wiop1_WIwint_ext_0 = h;
      coq_Box_wiop1_WIwint_ext_1 = h0 } x2
  | WIneg h ->
    eqb_body wiop1_tag wiop1_fields
      (Obj.magic wiop1_eqb_fields (fun _ _ -> true)) (wiop1_tag (WIneg h)) h
      x2

type sop1 =
| Oword_of_int of wsize
| Oint_of_word of signedness * wsize
| Osignext of wsize * wsize
| Ozeroext of wsize * wsize
| Onot
| Olnot of wsize
| Oneg of op_kind
| Owi1 of signedness * wiop1

(** val sop1_tag : sop1 -> positive **)

let sop1_tag = function
| Oword_of_int _ -> Coq_xH
| Oint_of_word (_, _) -> Coq_xO Coq_xH
| Osignext (_, _) -> Coq_xI Coq_xH
| Ozeroext (_, _) -> Coq_xO (Coq_xO Coq_xH)
| Onot -> Coq_xI (Coq_xO Coq_xH)
| Olnot _ -> Coq_xO (Coq_xI Coq_xH)
| Oneg _ -> Coq_xI (Coq_xI Coq_xH)
| Owi1 (_, _) -> Coq_xO (Coq_xO (Coq_xO Coq_xH))

type box_sop1_Oint_of_word = { coq_Box_sop1_Oint_of_word_0 : signedness;
                               coq_Box_sop1_Oint_of_word_1 : wsize }

type box_sop1_Osignext = { coq_Box_sop1_Osignext_0 : wsize;
                           coq_Box_sop1_Osignext_1 : wsize }

type box_sop1_Onot =
| Box_sop1_Onot

type box_sop1_Owi1 = { coq_Box_sop1_Owi1_0 : signedness;
                       coq_Box_sop1_Owi1_1 : wiop1 }

type sop1_fields_t = __

(** val sop1_fields : sop1 -> sop1_fields_t **)

let sop1_fields = function
| Oword_of_int h -> Obj.magic h
| Oint_of_word (h, h0) ->
  Obj.magic { coq_Box_sop1_Oint_of_word_0 = h; coq_Box_sop1_Oint_of_word_1 =
    h0 }
| Osignext (h, h0) ->
  Obj.magic { coq_Box_sop1_Osignext_0 = h; coq_Box_sop1_Osignext_1 = h0 }
| Ozeroext (h, h0) ->
  Obj.magic { coq_Box_sop1_Osignext_0 = h; coq_Box_sop1_Osignext_1 = h0 }
| Onot -> Obj.magic Box_sop1_Onot
| Olnot h -> Obj.magic h
| Oneg h -> Obj.magic h
| Owi1 (h, h0) ->
  Obj.magic { coq_Box_sop1_Owi1_0 = h; coq_Box_sop1_Owi1_1 = h0 }

(** val sop1_eqb_fields :
    (sop1 -> sop1 -> bool) -> positive -> sop1_fields_t -> sop1_fields_t ->
    bool **)

let sop1_eqb_fields _ x a b =
  match x with
  | Coq_xI x0 ->
    (match x0 with
     | Coq_xI _ -> (&&) (op_kind_eqb (Obj.magic a) (Obj.magic b)) true
     | Coq_xO _ -> true
     | Coq_xH ->
       let { coq_Box_sop1_Osignext_0 = box_sop1_Osignext_0;
         coq_Box_sop1_Osignext_1 = box_sop1_Osignext_1 } = Obj.magic a
       in
       let { coq_Box_sop1_Osignext_0 = box_sop1_Osignext_2;
         coq_Box_sop1_Osignext_1 = box_sop1_Osignext_3 } = Obj.magic b
       in
       (&&) (wsize_eqb box_sop1_Osignext_0 box_sop1_Osignext_2)
         ((&&) (wsize_eqb box_sop1_Osignext_1 box_sop1_Osignext_3) true))
  | Coq_xO x0 ->
    (match x0 with
     | Coq_xI _ -> (&&) (wsize_eqb (Obj.magic a) (Obj.magic b)) true
     | Coq_xO x1 ->
       (match x1 with
        | Coq_xI _ -> true
        | Coq_xO _ ->
          let { coq_Box_sop1_Owi1_0 = box_sop1_Owi1_0; coq_Box_sop1_Owi1_1 =
            box_sop1_Owi1_1 } = Obj.magic a
          in
          let { coq_Box_sop1_Owi1_0 = box_sop1_Owi1_2; coq_Box_sop1_Owi1_1 =
            box_sop1_Owi1_3 } = Obj.magic b
          in
          (&&) (signedness_eqb box_sop1_Owi1_0 box_sop1_Owi1_2)
            ((&&) (wiop1_eqb box_sop1_Owi1_1 box_sop1_Owi1_3) true)
        | Coq_xH ->
          let { coq_Box_sop1_Osignext_0 = box_sop1_Osignext_0;
            coq_Box_sop1_Osignext_1 = box_sop1_Osignext_1 } = Obj.magic a
          in
          let { coq_Box_sop1_Osignext_0 = box_sop1_Osignext_2;
            coq_Box_sop1_Osignext_1 = box_sop1_Osignext_3 } = Obj.magic b
          in
          (&&) (wsize_eqb box_sop1_Osignext_0 box_sop1_Osignext_2)
            ((&&) (wsize_eqb box_sop1_Osignext_1 box_sop1_Osignext_3) true))
     | Coq_xH ->
       let { coq_Box_sop1_Oint_of_word_0 = box_sop1_Oint_of_word_0;
         coq_Box_sop1_Oint_of_word_1 = box_sop1_Oint_of_word_1 } = Obj.magic a
       in
       let { coq_Box_sop1_Oint_of_word_0 = box_sop1_Oint_of_word_2;
         coq_Box_sop1_Oint_of_word_1 = box_sop1_Oint_of_word_3 } = Obj.magic b
       in
       (&&) (signedness_eqb box_sop1_Oint_of_word_0 box_sop1_Oint_of_word_2)
         ((&&) (wsize_eqb box_sop1_Oint_of_word_1 box_sop1_Oint_of_word_3)
           true))
  | Coq_xH -> (&&) (wsize_eqb (Obj.magic a) (Obj.magic b)) true

(** val sop1_eqb : sop1 -> sop1 -> bool **)

let sop1_eqb x1 x2 =
  match x1 with
  | Oword_of_int h ->
    eqb_body sop1_tag sop1_fields
      (Obj.magic sop1_eqb_fields (fun _ _ -> true))
      (sop1_tag (Oword_of_int h)) h x2
  | Oint_of_word (h, h0) ->
    eqb_body sop1_tag sop1_fields
      (Obj.magic sop1_eqb_fields (fun _ _ -> true))
      (sop1_tag (Oint_of_word (h, h0))) { coq_Box_sop1_Oint_of_word_0 = h;
      coq_Box_sop1_Oint_of_word_1 = h0 } x2
  | Osignext (h, h0) ->
    eqb_body sop1_tag sop1_fields
      (Obj.magic sop1_eqb_fields (fun _ _ -> true))
      (sop1_tag (Osignext (h, h0))) { coq_Box_sop1_Osignext_0 = h;
      coq_Box_sop1_Osignext_1 = h0 } x2
  | Ozeroext (h, h0) ->
    eqb_body sop1_tag sop1_fields
      (Obj.magic sop1_eqb_fields (fun _ _ -> true))
      (sop1_tag (Ozeroext (h, h0))) { coq_Box_sop1_Osignext_0 = h;
      coq_Box_sop1_Osignext_1 = h0 } x2
  | Onot ->
    eqb_body sop1_tag sop1_fields
      (Obj.magic sop1_eqb_fields (fun _ _ -> true)) (sop1_tag Onot)
      Box_sop1_Onot x2
  | Olnot h ->
    eqb_body sop1_tag sop1_fields
      (Obj.magic sop1_eqb_fields (fun _ _ -> true)) (sop1_tag (Olnot h)) h x2
  | Oneg h ->
    eqb_body sop1_tag sop1_fields
      (Obj.magic sop1_eqb_fields (fun _ _ -> true)) (sop1_tag (Oneg h)) h x2
  | Owi1 (h, h0) ->
    eqb_body sop1_tag sop1_fields
      (Obj.magic sop1_eqb_fields (fun _ _ -> true)) (sop1_tag (Owi1 (h, h0)))
      { coq_Box_sop1_Owi1_0 = h; coq_Box_sop1_Owi1_1 = h0 } x2

(** val sop1_eqb_OK : sop1 -> sop1 -> reflect **)

let sop1_eqb_OK =
  iffP2 sop1_eqb

type wiop2 =
| WIadd
| WImul
| WIsub
| WIdiv
| WImod
| WIshl
| WIshr
| WIeq
| WIneq
| WIlt
| WIle
| WIgt
| WIge

(** val wiop2_tag : wiop2 -> positive **)

let wiop2_tag = function
| WIadd -> Coq_xH
| WImul -> Coq_xO Coq_xH
| WIsub -> Coq_xI Coq_xH
| WIdiv -> Coq_xO (Coq_xO Coq_xH)
| WImod -> Coq_xI (Coq_xO Coq_xH)
| WIshl -> Coq_xO (Coq_xI Coq_xH)
| WIshr -> Coq_xI (Coq_xI Coq_xH)
| WIeq -> Coq_xO (Coq_xO (Coq_xO Coq_xH))
| WIneq -> Coq_xI (Coq_xO (Coq_xO Coq_xH))
| WIlt -> Coq_xO (Coq_xI (Coq_xO Coq_xH))
| WIle -> Coq_xI (Coq_xI (Coq_xO Coq_xH))
| WIgt -> Coq_xO (Coq_xO (Coq_xI Coq_xH))
| WIge -> Coq_xI (Coq_xO (Coq_xI Coq_xH))

type box_wiop2_WIadd =
| Box_wiop2_WIadd

type wiop2_fields_t = __

(** val wiop2_fields : wiop2 -> wiop2_fields_t **)

let wiop2_fields _ =
  Obj.magic Box_wiop2_WIadd

(** val wiop2_eqb_fields :
    (wiop2 -> wiop2 -> bool) -> positive -> wiop2_fields_t -> wiop2_fields_t
    -> bool **)

let wiop2_eqb_fields _ _ _ _ =
  true

(** val wiop2_eqb : wiop2 -> wiop2 -> bool **)

let wiop2_eqb x1 x2 =
  eqb_body wiop2_tag wiop2_fields
    (Obj.magic wiop2_eqb_fields (fun _ _ -> true)) (wiop2_tag x1)
    Box_wiop2_WIadd x2

type sop2 =
| Obeq
| Oand
| Oor
| Oadd of op_kind
| Omul of op_kind
| Osub of op_kind
| Odiv of signedness * op_kind
| Omod of signedness * op_kind
| Oland of wsize
| Olor of wsize
| Olxor of wsize
| Olsr of wsize
| Olsl of op_kind
| Oasr of op_kind
| Oror of wsize
| Orol of wsize
| Oeq of op_kind
| Oneq of op_kind
| Olt of cmp_kind
| Ole of cmp_kind
| Ogt of cmp_kind
| Oge of cmp_kind
| Ovadd of velem * wsize
| Ovsub of velem * wsize
| Ovmul of velem * wsize
| Ovlsr of velem * wsize
| Ovlsl of velem * wsize
| Ovasr of velem * wsize
| Owi2 of signedness * wsize * wiop2

(** val sop2_tag : sop2 -> positive **)

let sop2_tag = function
| Obeq -> Coq_xH
| Oand -> Coq_xO Coq_xH
| Oor -> Coq_xI Coq_xH
| Oadd _ -> Coq_xO (Coq_xO Coq_xH)
| Omul _ -> Coq_xI (Coq_xO Coq_xH)
| Osub _ -> Coq_xO (Coq_xI Coq_xH)
| Odiv (_, _) -> Coq_xI (Coq_xI Coq_xH)
| Omod (_, _) -> Coq_xO (Coq_xO (Coq_xO Coq_xH))
| Oland _ -> Coq_xI (Coq_xO (Coq_xO Coq_xH))
| Olor _ -> Coq_xO (Coq_xI (Coq_xO Coq_xH))
| Olxor _ -> Coq_xI (Coq_xI (Coq_xO Coq_xH))
| Olsr _ -> Coq_xO (Coq_xO (Coq_xI Coq_xH))
| Olsl _ -> Coq_xI (Coq_xO (Coq_xI Coq_xH))
| Oasr _ -> Coq_xO (Coq_xI (Coq_xI Coq_xH))
| Oror _ -> Coq_xI (Coq_xI (Coq_xI Coq_xH))
| Orol _ -> Coq_xO (Coq_xO (Coq_xO (Coq_xO Coq_xH)))
| Oeq _ -> Coq_xI (Coq_xO (Coq_xO (Coq_xO Coq_xH)))
| Oneq _ -> Coq_xO (Coq_xI (Coq_xO (Coq_xO Coq_xH)))
| Olt _ -> Coq_xI (Coq_xI (Coq_xO (Coq_xO Coq_xH)))
| Ole _ -> Coq_xO (Coq_xO (Coq_xI (Coq_xO Coq_xH)))
| Ogt _ -> Coq_xI (Coq_xO (Coq_xI (Coq_xO Coq_xH)))
| Oge _ -> Coq_xO (Coq_xI (Coq_xI (Coq_xO Coq_xH)))
| Ovadd (_, _) -> Coq_xI (Coq_xI (Coq_xI (Coq_xO Coq_xH)))
| Ovsub (_, _) -> Coq_xO (Coq_xO (Coq_xO (Coq_xI Coq_xH)))
| Ovmul (_, _) -> Coq_xI (Coq_xO (Coq_xO (Coq_xI Coq_xH)))
| Ovlsr (_, _) -> Coq_xO (Coq_xI (Coq_xO (Coq_xI Coq_xH)))
| Ovlsl (_, _) -> Coq_xI (Coq_xI (Coq_xO (Coq_xI Coq_xH)))
| Ovasr (_, _) -> Coq_xO (Coq_xO (Coq_xI (Coq_xI Coq_xH)))
| Owi2 (_, _, _) -> Coq_xI (Coq_xO (Coq_xI (Coq_xI Coq_xH)))

type box_sop2_Obeq =
| Box_sop2_Obeq

type box_sop2_Odiv = { coq_Box_sop2_Odiv_0 : signedness;
                       coq_Box_sop2_Odiv_1 : op_kind }

type box_sop2_Ovadd = { coq_Box_sop2_Ovadd_0 : velem;
                        coq_Box_sop2_Ovadd_1 : wsize }

type box_sop2_Owi2 = { coq_Box_sop2_Owi2_0 : signedness;
                       coq_Box_sop2_Owi2_1 : wsize;
                       coq_Box_sop2_Owi2_2 : wiop2 }

type sop2_fields_t = __

(** val sop2_fields : sop2 -> sop2_fields_t **)

let sop2_fields = function
| Oadd h -> Obj.magic h
| Omul h -> Obj.magic h
| Osub h -> Obj.magic h
| Odiv (h, h0) ->
  Obj.magic { coq_Box_sop2_Odiv_0 = h; coq_Box_sop2_Odiv_1 = h0 }
| Omod (h, h0) ->
  Obj.magic { coq_Box_sop2_Odiv_0 = h; coq_Box_sop2_Odiv_1 = h0 }
| Oland h -> Obj.magic h
| Olor h -> Obj.magic h
| Olxor h -> Obj.magic h
| Olsr h -> Obj.magic h
| Olsl h -> Obj.magic h
| Oasr h -> Obj.magic h
| Oror h -> Obj.magic h
| Orol h -> Obj.magic h
| Oeq h -> Obj.magic h
| Oneq h -> Obj.magic h
| Olt h -> Obj.magic h
| Ole h -> Obj.magic h
| Ogt h -> Obj.magic h
| Oge h -> Obj.magic h
| Ovadd (h, h0) ->
  Obj.magic { coq_Box_sop2_Ovadd_0 = h; coq_Box_sop2_Ovadd_1 = h0 }
| Ovsub (h, h0) ->
  Obj.magic { coq_Box_sop2_Ovadd_0 = h; coq_Box_sop2_Ovadd_1 = h0 }
| Ovmul (h, h0) ->
  Obj.magic { coq_Box_sop2_Ovadd_0 = h; coq_Box_sop2_Ovadd_1 = h0 }
| Ovlsr (h, h0) ->
  Obj.magic { coq_Box_sop2_Ovadd_0 = h; coq_Box_sop2_Ovadd_1 = h0 }
| Ovlsl (h, h0) ->
  Obj.magic { coq_Box_sop2_Ovadd_0 = h; coq_Box_sop2_Ovadd_1 = h0 }
| Ovasr (h, h0) ->
  Obj.magic { coq_Box_sop2_Ovadd_0 = h; coq_Box_sop2_Ovadd_1 = h0 }
| Owi2 (h, h0, h1) ->
  Obj.magic { coq_Box_sop2_Owi2_0 = h; coq_Box_sop2_Owi2_1 = h0;
    coq_Box_sop2_Owi2_2 = h1 }
| _ -> Obj.magic Box_sop2_Obeq

(** val sop2_eqb_fields :
    (sop2 -> sop2 -> bool) -> positive -> sop2_fields_t -> sop2_fields_t ->
    bool **)

let sop2_eqb_fields _ x x0 x1 =
  match x with
  | Coq_xI x2 ->
    (match x2 with
     | Coq_xI x3 ->
       (match x3 with
        | Coq_xI x4 ->
          (match x4 with
           | Coq_xI _ -> true
           | Coq_xO _ ->
             let { coq_Box_sop2_Ovadd_0 = box_sop2_Ovadd_0;
               coq_Box_sop2_Ovadd_1 = box_sop2_Ovadd_1 } = Obj.magic x0
             in
             let { coq_Box_sop2_Ovadd_0 = box_sop2_Ovadd_2;
               coq_Box_sop2_Ovadd_1 = box_sop2_Ovadd_3 } = Obj.magic x1
             in
             (&&) (velem_eqb box_sop2_Ovadd_0 box_sop2_Ovadd_2)
               ((&&) (wsize_eqb box_sop2_Ovadd_1 box_sop2_Ovadd_3) true)
           | Coq_xH -> (&&) (wsize_eqb (Obj.magic x0) (Obj.magic x1)) true)
        | Coq_xO x4 ->
          (match x4 with
           | Coq_xI _ ->
             let { coq_Box_sop2_Ovadd_0 = box_sop2_Ovadd_0;
               coq_Box_sop2_Ovadd_1 = box_sop2_Ovadd_1 } = Obj.magic x0
             in
             let { coq_Box_sop2_Ovadd_0 = box_sop2_Ovadd_2;
               coq_Box_sop2_Ovadd_1 = box_sop2_Ovadd_3 } = Obj.magic x1
             in
             (&&) (velem_eqb box_sop2_Ovadd_0 box_sop2_Ovadd_2)
               ((&&) (wsize_eqb box_sop2_Ovadd_1 box_sop2_Ovadd_3) true)
           | Coq_xO _ ->
             (&&) (cmp_kind_eqb (Obj.magic x0) (Obj.magic x1)) true
           | Coq_xH -> (&&) (wsize_eqb (Obj.magic x0) (Obj.magic x1)) true)
        | Coq_xH ->
          let { coq_Box_sop2_Odiv_0 = box_sop2_Odiv_0; coq_Box_sop2_Odiv_1 =
            box_sop2_Odiv_1 } = Obj.magic x0
          in
          let { coq_Box_sop2_Odiv_0 = box_sop2_Odiv_2; coq_Box_sop2_Odiv_1 =
            box_sop2_Odiv_3 } = Obj.magic x1
          in
          (&&) (signedness_eqb box_sop2_Odiv_0 box_sop2_Odiv_2)
            ((&&) (op_kind_eqb box_sop2_Odiv_1 box_sop2_Odiv_3) true))
     | Coq_xO x3 ->
       (match x3 with
        | Coq_xI x4 ->
          (match x4 with
           | Coq_xI _ ->
             let { coq_Box_sop2_Owi2_0 = box_sop2_Owi2_0;
               coq_Box_sop2_Owi2_1 = box_sop2_Owi2_1; coq_Box_sop2_Owi2_2 =
               box_sop2_Owi2_2 } = Obj.magic x0
             in
             let { coq_Box_sop2_Owi2_0 = box_sop2_Owi2_3;
               coq_Box_sop2_Owi2_1 = box_sop2_Owi2_4; coq_Box_sop2_Owi2_2 =
               box_sop2_Owi2_5 } = Obj.magic x1
             in
             (&&) (signedness_eqb box_sop2_Owi2_0 box_sop2_Owi2_3)
               ((&&) (wsize_eqb box_sop2_Owi2_1 box_sop2_Owi2_4)
                 ((&&) (wiop2_eqb box_sop2_Owi2_2 box_sop2_Owi2_5) true))
           | Coq_xO _ ->
             (&&) (cmp_kind_eqb (Obj.magic x0) (Obj.magic x1)) true
           | Coq_xH -> (&&) (op_kind_eqb (Obj.magic x0) (Obj.magic x1)) true)
        | Coq_xO x4 ->
          (match x4 with
           | Coq_xI _ ->
             let { coq_Box_sop2_Ovadd_0 = box_sop2_Ovadd_0;
               coq_Box_sop2_Ovadd_1 = box_sop2_Ovadd_1 } = Obj.magic x0
             in
             let { coq_Box_sop2_Ovadd_0 = box_sop2_Ovadd_2;
               coq_Box_sop2_Ovadd_1 = box_sop2_Ovadd_3 } = Obj.magic x1
             in
             (&&) (velem_eqb box_sop2_Ovadd_0 box_sop2_Ovadd_2)
               ((&&) (wsize_eqb box_sop2_Ovadd_1 box_sop2_Ovadd_3) true)
           | Coq_xO _ -> (&&) (op_kind_eqb (Obj.magic x0) (Obj.magic x1)) true
           | Coq_xH -> (&&) (wsize_eqb (Obj.magic x0) (Obj.magic x1)) true)
        | Coq_xH -> (&&) (op_kind_eqb (Obj.magic x0) (Obj.magic x1)) true)
     | Coq_xH -> true)
  | Coq_xO x2 ->
    (match x2 with
     | Coq_xI x3 ->
       (match x3 with
        | Coq_xI x4 ->
          (match x4 with
           | Coq_xI _ -> true
           | Coq_xO _ ->
             (&&) (cmp_kind_eqb (Obj.magic x0) (Obj.magic x1)) true
           | Coq_xH -> (&&) (op_kind_eqb (Obj.magic x0) (Obj.magic x1)) true)
        | Coq_xO x4 ->
          (match x4 with
           | Coq_xI _ ->
             let { coq_Box_sop2_Ovadd_0 = box_sop2_Ovadd_0;
               coq_Box_sop2_Ovadd_1 = box_sop2_Ovadd_1 } = Obj.magic x0
             in
             let { coq_Box_sop2_Ovadd_0 = box_sop2_Ovadd_2;
               coq_Box_sop2_Ovadd_1 = box_sop2_Ovadd_3 } = Obj.magic x1
             in
             (&&) (velem_eqb box_sop2_Ovadd_0 box_sop2_Ovadd_2)
               ((&&) (wsize_eqb box_sop2_Ovadd_1 box_sop2_Ovadd_3) true)
           | Coq_xO _ -> (&&) (op_kind_eqb (Obj.magic x0) (Obj.magic x1)) true
           | Coq_xH -> (&&) (wsize_eqb (Obj.magic x0) (Obj.magic x1)) true)
        | Coq_xH -> (&&) (op_kind_eqb (Obj.magic x0) (Obj.magic x1)) true)
     | Coq_xO x3 ->
       (match x3 with
        | Coq_xI x4 ->
          (match x4 with
           | Coq_xI _ ->
             let { coq_Box_sop2_Ovadd_0 = box_sop2_Ovadd_0;
               coq_Box_sop2_Ovadd_1 = box_sop2_Ovadd_1 } = Obj.magic x0
             in
             let { coq_Box_sop2_Ovadd_0 = box_sop2_Ovadd_2;
               coq_Box_sop2_Ovadd_1 = box_sop2_Ovadd_3 } = Obj.magic x1
             in
             (&&) (velem_eqb box_sop2_Ovadd_0 box_sop2_Ovadd_2)
               ((&&) (wsize_eqb box_sop2_Ovadd_1 box_sop2_Ovadd_3) true)
           | Coq_xO _ ->
             (&&) (cmp_kind_eqb (Obj.magic x0) (Obj.magic x1)) true
           | Coq_xH -> (&&) (wsize_eqb (Obj.magic x0) (Obj.magic x1)) true)
        | Coq_xO x4 ->
          (match x4 with
           | Coq_xI _ ->
             let { coq_Box_sop2_Ovadd_0 = box_sop2_Ovadd_0;
               coq_Box_sop2_Ovadd_1 = box_sop2_Ovadd_1 } = Obj.magic x0
             in
             let { coq_Box_sop2_Ovadd_0 = box_sop2_Ovadd_2;
               coq_Box_sop2_Ovadd_1 = box_sop2_Ovadd_3 } = Obj.magic x1
             in
             (&&) (velem_eqb box_sop2_Ovadd_0 box_sop2_Ovadd_2)
               ((&&) (wsize_eqb box_sop2_Ovadd_1 box_sop2_Ovadd_3) true)
           | Coq_xO _ -> (&&) (wsize_eqb (Obj.magic x0) (Obj.magic x1)) true
           | Coq_xH ->
             let { coq_Box_sop2_Odiv_0 = box_sop2_Odiv_0;
               coq_Box_sop2_Odiv_1 = box_sop2_Odiv_1 } = Obj.magic x0
             in
             let { coq_Box_sop2_Odiv_0 = box_sop2_Odiv_2;
               coq_Box_sop2_Odiv_1 = box_sop2_Odiv_3 } = Obj.magic x1
             in
             (&&) (signedness_eqb box_sop2_Odiv_0 box_sop2_Odiv_2)
               ((&&) (op_kind_eqb box_sop2_Odiv_1 box_sop2_Odiv_3) true))
        | Coq_xH -> (&&) (op_kind_eqb (Obj.magic x0) (Obj.magic x1)) true)
     | Coq_xH -> true)
  | Coq_xH -> true

(** val sop2_eqb : sop2 -> sop2 -> bool **)

let sop2_eqb x1 x2 =
  match x1 with
  | Oadd h ->
    eqb_body sop2_tag sop2_fields
      (Obj.magic sop2_eqb_fields (fun _ _ -> true)) (sop2_tag (Oadd h)) h x2
  | Omul h ->
    eqb_body sop2_tag sop2_fields
      (Obj.magic sop2_eqb_fields (fun _ _ -> true)) (sop2_tag (Omul h)) h x2
  | Osub h ->
    eqb_body sop2_tag sop2_fields
      (Obj.magic sop2_eqb_fields (fun _ _ -> true)) (sop2_tag (Osub h)) h x2
  | Odiv (h, h0) ->
    eqb_body sop2_tag sop2_fields
      (Obj.magic sop2_eqb_fields (fun _ _ -> true)) (sop2_tag (Odiv (h, h0)))
      { coq_Box_sop2_Odiv_0 = h; coq_Box_sop2_Odiv_1 = h0 } x2
  | Omod (h, h0) ->
    eqb_body sop2_tag sop2_fields
      (Obj.magic sop2_eqb_fields (fun _ _ -> true)) (sop2_tag (Omod (h, h0)))
      { coq_Box_sop2_Odiv_0 = h; coq_Box_sop2_Odiv_1 = h0 } x2
  | Oland h ->
    eqb_body sop2_tag sop2_fields
      (Obj.magic sop2_eqb_fields (fun _ _ -> true)) (sop2_tag (Oland h)) h x2
  | Olor h ->
    eqb_body sop2_tag sop2_fields
      (Obj.magic sop2_eqb_fields (fun _ _ -> true)) (sop2_tag (Olor h)) h x2
  | Olxor h ->
    eqb_body sop2_tag sop2_fields
      (Obj.magic sop2_eqb_fields (fun _ _ -> true)) (sop2_tag (Olxor h)) h x2
  | Olsr h ->
    eqb_body sop2_tag sop2_fields
      (Obj.magic sop2_eqb_fields (fun _ _ -> true)) (sop2_tag (Olsr h)) h x2
  | Olsl h ->
    eqb_body sop2_tag sop2_fields
      (Obj.magic sop2_eqb_fields (fun _ _ -> true)) (sop2_tag (Olsl h)) h x2
  | Oasr h ->
    eqb_body sop2_tag sop2_fields
      (Obj.magic sop2_eqb_fields (fun _ _ -> true)) (sop2_tag (Oasr h)) h x2
  | Oror h ->
    eqb_body sop2_tag sop2_fields
      (Obj.magic sop2_eqb_fields (fun _ _ -> true)) (sop2_tag (Oror h)) h x2
  | Orol h ->
    eqb_body sop2_tag sop2_fields
      (Obj.magic sop2_eqb_fields (fun _ _ -> true)) (sop2_tag (Orol h)) h x2
  | Oeq h ->
    eqb_body sop2_tag sop2_fields
      (Obj.magic sop2_eqb_fields (fun _ _ -> true)) (sop2_tag (Oeq h)) h x2
  | Oneq h ->
    eqb_body sop2_tag sop2_fields
      (Obj.magic sop2_eqb_fields (fun _ _ -> true)) (sop2_tag (Oneq h)) h x2
  | Olt h ->
    eqb_body sop2_tag sop2_fields
      (Obj.magic sop2_eqb_fields (fun _ _ -> true)) (sop2_tag (Olt h)) h x2
  | Ole h ->
    eqb_body sop2_tag sop2_fields
      (Obj.magic sop2_eqb_fields (fun _ _ -> true)) (sop2_tag (Ole h)) h x2
  | Ogt h ->
    eqb_body sop2_tag sop2_fields
      (Obj.magic sop2_eqb_fields (fun _ _ -> true)) (sop2_tag (Ogt h)) h x2
  | Oge h ->
    eqb_body sop2_tag sop2_fields
      (Obj.magic sop2_eqb_fields (fun _ _ -> true)) (sop2_tag (Oge h)) h x2
  | Ovadd (h, h0) ->
    eqb_body sop2_tag sop2_fields
      (Obj.magic sop2_eqb_fields (fun _ _ -> true))
      (sop2_tag (Ovadd (h, h0))) { coq_Box_sop2_Ovadd_0 = h;
      coq_Box_sop2_Ovadd_1 = h0 } x2
  | Ovsub (h, h0) ->
    eqb_body sop2_tag sop2_fields
      (Obj.magic sop2_eqb_fields (fun _ _ -> true))
      (sop2_tag (Ovsub (h, h0))) { coq_Box_sop2_Ovadd_0 = h;
      coq_Box_sop2_Ovadd_1 = h0 } x2
  | Ovmul (h, h0) ->
    eqb_body sop2_tag sop2_fields
      (Obj.magic sop2_eqb_fields (fun _ _ -> true))
      (sop2_tag (Ovmul (h, h0))) { coq_Box_sop2_Ovadd_0 = h;
      coq_Box_sop2_Ovadd_1 = h0 } x2
  | Ovlsr (h, h0) ->
    eqb_body sop2_tag sop2_fields
      (Obj.magic sop2_eqb_fields (fun _ _ -> true))
      (sop2_tag (Ovlsr (h, h0))) { coq_Box_sop2_Ovadd_0 = h;
      coq_Box_sop2_Ovadd_1 = h0 } x2
  | Ovlsl (h, h0) ->
    eqb_body sop2_tag sop2_fields
      (Obj.magic sop2_eqb_fields (fun _ _ -> true))
      (sop2_tag (Ovlsl (h, h0))) { coq_Box_sop2_Ovadd_0 = h;
      coq_Box_sop2_Ovadd_1 = h0 } x2
  | Ovasr (h, h0) ->
    eqb_body sop2_tag sop2_fields
      (Obj.magic sop2_eqb_fields (fun _ _ -> true))
      (sop2_tag (Ovasr (h, h0))) { coq_Box_sop2_Ovadd_0 = h;
      coq_Box_sop2_Ovadd_1 = h0 } x2
  | Owi2 (h, h0, h1) ->
    eqb_body sop2_tag sop2_fields
      (Obj.magic sop2_eqb_fields (fun _ _ -> true))
      (sop2_tag (Owi2 (h, h0, h1))) { coq_Box_sop2_Owi2_0 = h;
      coq_Box_sop2_Owi2_1 = h0; coq_Box_sop2_Owi2_2 = h1 } x2
  | x ->
    eqb_body sop2_tag sop2_fields
      (Obj.magic sop2_eqb_fields (fun _ _ -> true)) (sop2_tag x)
      Box_sop2_Obeq x2

(** val sop2_eqb_OK : sop2 -> sop2 -> reflect **)

let sop2_eqb_OK =
  iffP2 sop2_eqb

type combine_flags =
| CF_LT of signedness
| CF_LE of signedness
| CF_EQ
| CF_NEQ
| CF_GE of signedness
| CF_GT of signedness

(** val combine_flags_tag : combine_flags -> positive **)

let combine_flags_tag = function
| CF_LT _ -> Coq_xH
| CF_LE _ -> Coq_xO Coq_xH
| CF_EQ -> Coq_xI Coq_xH
| CF_NEQ -> Coq_xO (Coq_xO Coq_xH)
| CF_GE _ -> Coq_xI (Coq_xO Coq_xH)
| CF_GT _ -> Coq_xO (Coq_xI Coq_xH)

type box_combine_flags_CF_EQ =
| Box_combine_flags_CF_EQ

type combine_flags_fields_t = __

(** val combine_flags_fields : combine_flags -> combine_flags_fields_t **)

let combine_flags_fields = function
| CF_LT h -> Obj.magic h
| CF_LE h -> Obj.magic h
| CF_GE h -> Obj.magic h
| CF_GT h -> Obj.magic h
| _ -> Obj.magic Box_combine_flags_CF_EQ

(** val combine_flags_eqb_fields :
    (combine_flags -> combine_flags -> bool) -> positive ->
    combine_flags_fields_t -> combine_flags_fields_t -> bool **)

let combine_flags_eqb_fields _ x x0 x1 =
  match x with
  | Coq_xI x2 ->
    (match x2 with
     | Coq_xO _ -> (&&) (signedness_eqb (Obj.magic x0) (Obj.magic x1)) true
     | _ -> true)
  | Coq_xO x2 ->
    (match x2 with
     | Coq_xO _ -> true
     | _ -> (&&) (signedness_eqb (Obj.magic x0) (Obj.magic x1)) true)
  | Coq_xH -> (&&) (signedness_eqb (Obj.magic x0) (Obj.magic x1)) true

(** val combine_flags_eqb : combine_flags -> combine_flags -> bool **)

let combine_flags_eqb x1 x2 =
  match x1 with
  | CF_LT h ->
    eqb_body combine_flags_tag combine_flags_fields
      (Obj.magic combine_flags_eqb_fields (fun _ _ -> true))
      (combine_flags_tag (CF_LT h)) h x2
  | CF_LE h ->
    eqb_body combine_flags_tag combine_flags_fields
      (Obj.magic combine_flags_eqb_fields (fun _ _ -> true))
      (combine_flags_tag (CF_LE h)) h x2
  | CF_GE h ->
    eqb_body combine_flags_tag combine_flags_fields
      (Obj.magic combine_flags_eqb_fields (fun _ _ -> true))
      (combine_flags_tag (CF_GE h)) h x2
  | CF_GT h ->
    eqb_body combine_flags_tag combine_flags_fields
      (Obj.magic combine_flags_eqb_fields (fun _ _ -> true))
      (combine_flags_tag (CF_GT h)) h x2
  | x ->
    eqb_body combine_flags_tag combine_flags_fields
      (Obj.magic combine_flags_eqb_fields (fun _ _ -> true))
      (combine_flags_tag x) Box_combine_flags_CF_EQ x2

type opN =
| Opack of wsize * pelem
| Oarray of positive
| Ocombine_flags of combine_flags

(** val opN_tag : opN -> positive **)

let opN_tag = function
| Opack (_, _) -> Coq_xH
| Oarray _ -> Coq_xO Coq_xH
| Ocombine_flags _ -> Coq_xI Coq_xH

type box_opN_Opack = { coq_Box_opN_Opack_0 : wsize;
                       coq_Box_opN_Opack_1 : pelem }

type opN_fields_t = __

(** val opN_fields : opN -> opN_fields_t **)

let opN_fields = function
| Opack (h, h0) ->
  Obj.magic { coq_Box_opN_Opack_0 = h; coq_Box_opN_Opack_1 = h0 }
| Oarray h -> Obj.magic h
| Ocombine_flags h -> Obj.magic h

(** val opN_eqb_fields :
    (opN -> opN -> bool) -> positive -> opN_fields_t -> opN_fields_t -> bool **)

let opN_eqb_fields _ x a b =
  match x with
  | Coq_xI _ -> (&&) (combine_flags_eqb (Obj.magic a) (Obj.magic b)) true
  | Coq_xO _ -> (&&) (positive_eqb (Obj.magic a) (Obj.magic b)) true
  | Coq_xH ->
    let { coq_Box_opN_Opack_0 = box_opN_Opack_0; coq_Box_opN_Opack_1 =
      box_opN_Opack_1 } = Obj.magic a
    in
    let { coq_Box_opN_Opack_0 = box_opN_Opack_2; coq_Box_opN_Opack_1 =
      box_opN_Opack_3 } = Obj.magic b
    in
    (&&) (wsize_eqb box_opN_Opack_0 box_opN_Opack_2)
      ((&&) (pelem_eqb box_opN_Opack_1 box_opN_Opack_3) true)

(** val opN_eqb : opN -> opN -> bool **)

let opN_eqb x1 x2 =
  match x1 with
  | Opack (h, h0) ->
    eqb_body opN_tag opN_fields (Obj.magic opN_eqb_fields (fun _ _ -> true))
      (opN_tag (Opack (h, h0))) { coq_Box_opN_Opack_0 = h;
      coq_Box_opN_Opack_1 = h0 } x2
  | Oarray h ->
    eqb_body opN_tag opN_fields (Obj.magic opN_eqb_fields (fun _ _ -> true))
      (opN_tag (Oarray h)) h x2
  | Ocombine_flags h ->
    eqb_body opN_tag opN_fields (Obj.magic opN_eqb_fields (fun _ _ -> true))
      (opN_tag (Ocombine_flags h)) h x2

(** val opN_eqb_OK : opN -> opN -> reflect **)

let opN_eqb_OK =
  iffP2 opN_eqb

(** val coq_HB_unnamed_factory_1 : op_kind Coq_hasDecEq.axioms_ **)

let coq_HB_unnamed_factory_1 =
  { Coq_hasDecEq.eq_op = op_kind_eqb; Coq_hasDecEq.eqP = op_kind_eqb_OK }

(** val operators_op_kind__canonical__eqtype_Equality : Equality.coq_type **)

let operators_op_kind__canonical__eqtype_Equality =
  Obj.magic coq_HB_unnamed_factory_1

(** val coq_HB_unnamed_factory_3 : sop1 Coq_hasDecEq.axioms_ **)

let coq_HB_unnamed_factory_3 =
  { Coq_hasDecEq.eq_op = sop1_eqb; Coq_hasDecEq.eqP = sop1_eqb_OK }

(** val operators_sop1__canonical__eqtype_Equality : Equality.coq_type **)

let operators_sop1__canonical__eqtype_Equality =
  Obj.magic coq_HB_unnamed_factory_3

(** val coq_HB_unnamed_factory_5 : sop2 Coq_hasDecEq.axioms_ **)

let coq_HB_unnamed_factory_5 =
  { Coq_hasDecEq.eq_op = sop2_eqb; Coq_hasDecEq.eqP = sop2_eqb_OK }

(** val operators_sop2__canonical__eqtype_Equality : Equality.coq_type **)

let operators_sop2__canonical__eqtype_Equality =
  Obj.magic coq_HB_unnamed_factory_5

(** val coq_HB_unnamed_factory_7 : opN Coq_hasDecEq.axioms_ **)

let coq_HB_unnamed_factory_7 =
  { Coq_hasDecEq.eq_op = opN_eqb; Coq_hasDecEq.eqP = opN_eqb_OK }

(** val operators_opN__canonical__eqtype_Equality : Equality.coq_type **)

let operators_opN__canonical__eqtype_Equality =
  Obj.magic coq_HB_unnamed_factory_7
