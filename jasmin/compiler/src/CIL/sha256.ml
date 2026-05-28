(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open BinNums
open Datatypes
open Seq
open Utils0
open Word0
open Wsize

(** val ch : word -> word -> word -> word **)

let ch e f g =
  wxor U32 (wand U32 e f) (wand U32 (wnot U32 e) g)

(** val maj : word -> word -> word -> word **)

let maj a b c =
  wxor U32 (wand U32 a b) (wxor U32 (wand U32 a c) (wand U32 b c))

(** val _UU03a3__UU2080_ : word -> word **)

let _UU03a3__UU2080_ a =
  wxor U32 (wror U32 a (Zpos (Coq_xO Coq_xH)))
    (wxor U32 (wror U32 a (Zpos (Coq_xI (Coq_xO (Coq_xI Coq_xH)))))
      (wror U32 a (Zpos (Coq_xO (Coq_xI (Coq_xI (Coq_xO Coq_xH)))))))

(** val _UU03a3__UU2081_ : word -> word **)

let _UU03a3__UU2081_ e =
  wxor U32 (wror U32 e (Zpos (Coq_xO (Coq_xI Coq_xH))))
    (wxor U32 (wror U32 e (Zpos (Coq_xI (Coq_xI (Coq_xO Coq_xH)))))
      (wror U32 e (Zpos (Coq_xI (Coq_xO (Coq_xO (Coq_xI Coq_xH)))))))

(** val _UU03c3__UU2080_ : word -> word **)

let _UU03c3__UU2080_ w =
  wxor U32 (wror U32 w (Zpos (Coq_xI (Coq_xI Coq_xH))))
    (wxor U32 (wror U32 w (Zpos (Coq_xO (Coq_xI (Coq_xO (Coq_xO Coq_xH))))))
      (wshr U32 w (Zpos (Coq_xI Coq_xH))))

(** val _UU03c3__UU2081_ : word -> word **)

let _UU03c3__UU2081_ w =
  wxor U32 (wror U32 w (Zpos (Coq_xI (Coq_xO (Coq_xO (Coq_xO Coq_xH))))))
    (wxor U32 (wror U32 w (Zpos (Coq_xI (Coq_xI (Coq_xO (Coq_xO Coq_xH))))))
      (wshr U32 w (Zpos (Coq_xO (Coq_xI (Coq_xO Coq_xH))))))

(** val sha256msg1 : word -> word -> word **)

let sha256msg1 m_UU2081_ m_UU2082_ =
  let s = split_vec U128 (nat_of_wsize (wsize_of_velem VE32)) m_UU2081_ in
  make_vec U32 U128
    (map2 (fun x y -> add_word U32 x (_UU03c3__UU2080_ y)) s
      (rcons (behead s) (zero_extend U32 U128 m_UU2082_)))

(** val sha256msg2 : word -> word -> word **)

let sha256msg2 m_UU2081_ m_UU2082_ =
  let src_UU2081_ =
    split_vec U128 (nat_of_wsize (wsize_of_velem VE32)) m_UU2081_
  in
  let src_UU2082_ =
    split_vec U128 (nat_of_wsize (wsize_of_velem VE32)) m_UU2082_
  in
  let w14 = nth (word0 U32) src_UU2082_ (S (S O)) in
  let w15 = nth (word0 U32) src_UU2082_ (S (S (S O))) in
  let w16 =
    add_word U32 (nth (word0 U32) src_UU2081_ O) (_UU03c3__UU2081_ w14)
  in
  let w17 =
    add_word U32 (nth (word0 U32) src_UU2081_ (S O)) (_UU03c3__UU2081_ w15)
  in
  let w18 =
    add_word U32 (nth (word0 U32) src_UU2081_ (S (S O)))
      (_UU03c3__UU2081_ w16)
  in
  let w19 =
    add_word U32 (nth (word0 U32) src_UU2081_ (S (S (S O))))
      (_UU03c3__UU2081_ w17)
  in
  make_vec U32 U128 (w16 :: (w17 :: (w18 :: (w19 :: []))))

(** val sha256rnds2 : word -> word -> word -> word **)

let sha256rnds2 x y z =
  let x0 = split_vec U128 (nat_of_wsize (wsize_of_velem VE32)) x in
  let y0 = split_vec U128 (nat_of_wsize (wsize_of_velem VE32)) y in
  let z0 = split_vec U128 (nat_of_wsize (wsize_of_velem VE32)) z in
  let p = (x0, y0) in
  let (l0, l1) = p in
  (match l0 with
   | [] -> word0 U128
   | h_UU2080_ :: l2 ->
     (match l2 with
      | [] -> word0 U128
      | g_UU2080_ :: l3 ->
        (match l3 with
         | [] -> word0 U128
         | d_UU2080_ :: l4 ->
           (match l4 with
            | [] -> word0 U128
            | c_UU2080_ :: l5 ->
              (match l5 with
               | [] ->
                 (match l1 with
                  | [] -> word0 U128
                  | f_UU2080_ :: l6 ->
                    (match l6 with
                     | [] -> word0 U128
                     | e_UU2080_ :: l7 ->
                       (match l7 with
                        | [] -> word0 U128
                        | b_UU2080_ :: l8 ->
                          (match l8 with
                           | [] -> word0 U128
                           | a_UU2080_ :: l9 ->
                             (match l9 with
                              | [] ->
                                (match z0 with
                                 | [] -> word0 U128
                                 | wk_UU2080_ :: l10 ->
                                   (match l10 with
                                    | [] -> word0 U128
                                    | wk_UU2081_ :: l11 ->
                                      (match l11 with
                                       | [] -> word0 U128
                                       | _ :: l12 ->
                                         (match l12 with
                                          | [] -> word0 U128
                                          | _ :: l13 ->
                                            (match l13 with
                                             | [] ->
                                               let t_UU2080_ =
                                                 add_word U32
                                                   (add_word U32
                                                     (add_word U32
                                                       (ch e_UU2080_
                                                         f_UU2080_ g_UU2080_)
                                                       (_UU03a3__UU2081_
                                                         e_UU2080_))
                                                     wk_UU2080_) h_UU2080_
                                               in
                                               let a_UU2081_ =
                                                 add_word U32
                                                   (add_word U32 t_UU2080_
                                                     (maj a_UU2080_ b_UU2080_
                                                       c_UU2080_))
                                                   (_UU03a3__UU2080_
                                                     a_UU2080_)
                                               in
                                               let e_UU2081_ =
                                                 add_word U32 t_UU2080_
                                                   d_UU2080_
                                               in
                                               let t_UU2081_ =
                                                 add_word U32
                                                   (add_word U32
                                                     (add_word U32
                                                       (ch e_UU2081_
                                                         e_UU2080_ f_UU2080_)
                                                       (_UU03a3__UU2081_
                                                         e_UU2081_))
                                                     wk_UU2081_) g_UU2080_
                                               in
                                               let a_UU2082_ =
                                                 add_word U32
                                                   (add_word U32 t_UU2081_
                                                     (maj a_UU2081_ a_UU2080_
                                                       b_UU2080_))
                                                   (_UU03a3__UU2080_
                                                     a_UU2081_)
                                               in
                                               let e_UU2082_ =
                                                 add_word U32 t_UU2081_
                                                   c_UU2080_
                                               in
                                               make_vec U32 U128
                                                 (e_UU2081_ :: (e_UU2082_ :: (a_UU2081_ :: (a_UU2082_ :: []))))
                                             | _ :: _ -> word0 U128)))))
                              | _ :: _ -> word0 U128)))))
               | _ :: _ -> word0 U128)))))
