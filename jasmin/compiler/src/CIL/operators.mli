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

val cmp_kind_tag : cmp_kind -> positive

type box_cmp_kind_Cmp_int =
| Box_cmp_kind_Cmp_int

type box_cmp_kind_Cmp_w = { coq_Box_cmp_kind_Cmp_w_0 : signedness;
                            coq_Box_cmp_kind_Cmp_w_1 : wsize }

type cmp_kind_fields_t = __

val cmp_kind_fields : cmp_kind -> cmp_kind_fields_t

val cmp_kind_eqb_fields :
  (cmp_kind -> cmp_kind -> bool) -> positive -> cmp_kind_fields_t ->
  cmp_kind_fields_t -> bool

val cmp_kind_eqb : cmp_kind -> cmp_kind -> bool

type op_kind =
| Op_int
| Op_w of wsize

val op_kind_tag : op_kind -> positive

type box_op_kind_Op_int =
| Box_op_kind_Op_int

type op_kind_fields_t = __

val op_kind_fields : op_kind -> op_kind_fields_t

val op_kind_eqb_fields :
  (op_kind -> op_kind -> bool) -> positive -> op_kind_fields_t ->
  op_kind_fields_t -> bool

val op_kind_eqb : op_kind -> op_kind -> bool

val op_kind_eqb_OK : op_kind -> op_kind -> reflect

type wiop1 =
| WIwint_of_int of wsize
| WIint_of_wint of wsize
| WIword_of_wint of wsize
| WIwint_of_word of wsize
| WIwint_ext of wsize * wsize
| WIneg of wsize

val wiop1_tag : wiop1 -> positive

type box_wiop1_WIwint_ext = { coq_Box_wiop1_WIwint_ext_0 : wsize;
                              coq_Box_wiop1_WIwint_ext_1 : wsize }

type wiop1_fields_t = __

val wiop1_fields : wiop1 -> wiop1_fields_t

val wiop1_eqb_fields :
  (wiop1 -> wiop1 -> bool) -> positive -> wiop1_fields_t -> wiop1_fields_t ->
  bool

val wiop1_eqb : wiop1 -> wiop1 -> bool

type sop1 =
| Oword_of_int of wsize
| Oint_of_word of signedness * wsize
| Osignext of wsize * wsize
| Ozeroext of wsize * wsize
| Onot
| Olnot of wsize
| Oneg of op_kind
| Owi1 of signedness * wiop1

val sop1_tag : sop1 -> positive

type box_sop1_Oint_of_word = { coq_Box_sop1_Oint_of_word_0 : signedness;
                               coq_Box_sop1_Oint_of_word_1 : wsize }

type box_sop1_Osignext = { coq_Box_sop1_Osignext_0 : wsize;
                           coq_Box_sop1_Osignext_1 : wsize }

type box_sop1_Onot =
| Box_sop1_Onot

type box_sop1_Owi1 = { coq_Box_sop1_Owi1_0 : signedness;
                       coq_Box_sop1_Owi1_1 : wiop1 }

type sop1_fields_t = __

val sop1_fields : sop1 -> sop1_fields_t

val sop1_eqb_fields :
  (sop1 -> sop1 -> bool) -> positive -> sop1_fields_t -> sop1_fields_t -> bool

val sop1_eqb : sop1 -> sop1 -> bool

val sop1_eqb_OK : sop1 -> sop1 -> reflect

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

val wiop2_tag : wiop2 -> positive

type box_wiop2_WIadd =
| Box_wiop2_WIadd

type wiop2_fields_t = __

val wiop2_fields : wiop2 -> wiop2_fields_t

val wiop2_eqb_fields :
  (wiop2 -> wiop2 -> bool) -> positive -> wiop2_fields_t -> wiop2_fields_t ->
  bool

val wiop2_eqb : wiop2 -> wiop2 -> bool

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

val sop2_tag : sop2 -> positive

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

val sop2_fields : sop2 -> sop2_fields_t

val sop2_eqb_fields :
  (sop2 -> sop2 -> bool) -> positive -> sop2_fields_t -> sop2_fields_t -> bool

val sop2_eqb : sop2 -> sop2 -> bool

val sop2_eqb_OK : sop2 -> sop2 -> reflect

type combine_flags =
| CF_LT of signedness
| CF_LE of signedness
| CF_EQ
| CF_NEQ
| CF_GE of signedness
| CF_GT of signedness

val combine_flags_tag : combine_flags -> positive

type box_combine_flags_CF_EQ =
| Box_combine_flags_CF_EQ

type combine_flags_fields_t = __

val combine_flags_fields : combine_flags -> combine_flags_fields_t

val combine_flags_eqb_fields :
  (combine_flags -> combine_flags -> bool) -> positive ->
  combine_flags_fields_t -> combine_flags_fields_t -> bool

val combine_flags_eqb : combine_flags -> combine_flags -> bool

type opN =
| Opack of wsize * pelem
| Oarray of positive
| Ocombine_flags of combine_flags

val opN_tag : opN -> positive

type box_opN_Opack = { coq_Box_opN_Opack_0 : wsize;
                       coq_Box_opN_Opack_1 : pelem }

type opN_fields_t = __

val opN_fields : opN -> opN_fields_t

val opN_eqb_fields :
  (opN -> opN -> bool) -> positive -> opN_fields_t -> opN_fields_t -> bool

val opN_eqb : opN -> opN -> bool

val opN_eqb_OK : opN -> opN -> reflect

val coq_HB_unnamed_factory_1 : op_kind Coq_hasDecEq.axioms_

val operators_op_kind__canonical__eqtype_Equality : Equality.coq_type

val coq_HB_unnamed_factory_3 : sop1 Coq_hasDecEq.axioms_

val operators_sop1__canonical__eqtype_Equality : Equality.coq_type

val coq_HB_unnamed_factory_5 : sop2 Coq_hasDecEq.axioms_

val operators_sop2__canonical__eqtype_Equality : Equality.coq_type

val coq_HB_unnamed_factory_7 : opN Coq_hasDecEq.axioms_

val operators_opN__canonical__eqtype_Equality : Equality.coq_type
