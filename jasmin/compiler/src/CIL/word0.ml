(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open BinInt
open BinNums
open BinPos
open Datatypes
open Nat0
open Div
open Eqtype
open Seq
open Ssrnat
open Tuple
open Utils0
open Word
open Word_ssrZ
open Wsize

(** val nat7 : nat **)

let nat7 =
  S (S (S (S (S (S (S O))))))

(** val nat15 : nat **)

let nat15 =
  S (S (S (S (S (S (S (S nat7)))))))

(** val nat31 : nat **)

let nat31 =
  S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S nat15)))))))))))))))

(** val nat63 : nat **)

let nat63 =
  S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S
    (S (S (S (S (S (S (S nat31)))))))))))))))))))))))))))))))

(** val nat127 : nat **)

let nat127 =
  S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S
    (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S
    (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S
    nat63)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

(** val nat255 : nat **)

let nat255 =
  S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S
    (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S
    (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S
    (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S
    (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S
    (S (S (S (S (S (S (S
    nat127)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

(** val wsize_size_minus_1 : wsize -> nat **)

let wsize_size_minus_1 = function
| U8 -> nat7
| U16 -> nat15
| U32 -> nat31
| U64 -> nat63
| U128 -> nat127
| U256 -> nat255

(** val nat_of_wsize : wsize -> nat **)

let nat_of_wsize sz =
  S (wsize_size_minus_1 sz)

(** val wsize_bits : wsize -> coq_Z **)

let wsize_bits s =
  Zpos (Pos.of_succ_nat (wsize_size_minus_1 s))

(** val wsize_log2 : wsize -> nat **)

let wsize_log2 = function
| U8 -> O
| U16 -> S O
| U32 -> S (S O)
| U64 -> S (S (S O))
| U128 -> S (S (S (S O)))
| U256 -> S (S (S (S (S O))))

(** val wbase : wsize -> coq_Z **)

let wbase s =
  modulus (S (wsize_size_minus_1 s))

(** val nat_of_pelem : pelem -> nat **)

let nat_of_pelem = function
| PE1 -> S O
| PE2 -> S (S O)
| PE4 -> S (S (S (S O)))
| PE8 -> nat_of_wsize U8
| PE16 -> nat_of_wsize U16
| PE32 -> nat_of_wsize U32
| PE64 -> nat_of_wsize U64
| PE128 -> nat_of_wsize U128

type word = Word.word

(** val coq_HB_unnamed_factory_2 : wsize -> word Equality.axioms_ **)

let coq_HB_unnamed_factory_2 sz =
  Obj.magic word_word__canonical__eqtype_Equality (S (wsize_size_minus_1 sz))

(** val coq_HB_unnamed_mixin_4 : wsize -> word Coq_hasDecEq.axioms_ **)

let coq_HB_unnamed_mixin_4 =
  coq_HB_unnamed_factory_2

(** val word_word__canonical__eqtype_Equality : wsize -> Equality.coq_type **)

let word_word__canonical__eqtype_Equality sz =
  Obj.magic coq_HB_unnamed_mixin_4 sz

(** val winit : wsize -> (nat -> bool) -> word **)

let winit ws f =
  let bits = map f (iota O (S (wsize_size_minus_1 ws))) in
  t2w (S (wsize_size_minus_1 ws)) bits

(** val add_word : wsize -> word -> word -> word **)

let add_word s x y =
  add_word (S (wsize_size_minus_1 s)) x y

(** val sub_word : wsize -> word -> word -> word **)

let sub_word s x y =
  sub_word (S (wsize_size_minus_1 s)) x y

(** val mul_word : wsize -> word -> word -> word **)

let mul_word s x y =
  mul_word (S (wsize_size_minus_1 s)) x y

(** val opp_word : wsize -> word -> word **)

let opp_word s x =
  opp_word (S (wsize_size_minus_1 s)) x

(** val word0 : wsize -> word **)

let word0 s =
  word0 (S (wsize_size_minus_1 s))

(** val word1 : wsize -> word **)

let word1 s =
  word1 (wsize_size_minus_1 s)

(** val wand : wsize -> word -> word -> word **)

let wand s x y =
  wand (S (wsize_size_minus_1 s)) x y

(** val wor : wsize -> word -> word -> word **)

let wor s x y =
  wor (S (wsize_size_minus_1 s)) x y

(** val wxor : wsize -> word -> word -> word **)

let wxor s x y =
  wxor (S (wsize_size_minus_1 s)) x y

(** val wlt : wsize -> signedness -> word -> word -> bool **)

let wlt sz sg x y =
  match sg with
  | Signed ->
    Z.ltb (srepr (S (wsize_size_minus_1 sz)) x)
      (srepr (S (wsize_size_minus_1 sz)) y)
  | Unsigned ->
    Z.ltb (urepr (S (wsize_size_minus_1 sz)) x)
      (urepr (S (wsize_size_minus_1 sz)) y)

(** val wle : wsize -> signedness -> word -> word -> bool **)

let wle sz sg x y =
  match sg with
  | Signed ->
    Z.leb (srepr (S (wsize_size_minus_1 sz)) x)
      (srepr (S (wsize_size_minus_1 sz)) y)
  | Unsigned ->
    Z.leb (urepr (S (wsize_size_minus_1 sz)) x)
      (urepr (S (wsize_size_minus_1 sz)) y)

(** val wnot : wsize -> word -> word **)

let wnot sz w =
  wxor sz w (opp_word sz (word1 sz))

(** val wandn : wsize -> word -> word -> word **)

let wandn sz x y =
  wand sz (wnot sz x) y

(** val wunsigned : wsize -> word -> coq_Z **)

let wunsigned s w =
  urepr (S (wsize_size_minus_1 s)) w

(** val wsigned : wsize -> word -> coq_Z **)

let wsigned s w =
  srepr (S (wsize_size_minus_1 s)) w

(** val wrepr : wsize -> coq_Z -> word **)

let wrepr s z =
  mkword (S (wsize_size_minus_1 s)) z

(** val wshr : wsize -> word -> coq_Z -> word **)

let wshr sz x n =
  mkword (nat_of_wsize sz)
    (Z.shiftr (wunsigned sz x) (Z.min (wsize_bits sz) n))

(** val wshl : wsize -> word -> coq_Z -> word **)

let wshl sz x n =
  mkword (nat_of_wsize sz)
    (Z.shiftl (wunsigned sz x) (Z.min (wsize_bits sz) n))

(** val wsar : wsize -> word -> coq_Z -> word **)

let wsar sz x n =
  mkword (nat_of_wsize sz) (Z.shiftr (wsigned sz x) (Z.min (wsize_bits sz) n))

(** val high_bits : wsize -> coq_Z -> word **)

let high_bits sz n =
  wrepr sz (Z.shiftr n (wsize_bits sz))

(** val wmulhu : wsize -> word -> word -> word **)

let wmulhu sz x y =
  high_bits sz (Z.mul (wunsigned sz x) (wunsigned sz y))

(** val wmulhs : wsize -> word -> word -> word **)

let wmulhs sz x y =
  high_bits sz (Z.mul (wsigned sz x) (wsigned sz y))

(** val wmulhsu : wsize -> word -> word -> word **)

let wmulhsu sz x y =
  high_bits sz (Z.mul (wsigned sz x) (wunsigned sz y))

(** val wmulhrs : wsize -> word -> word -> word **)

let wmulhrs sz x y =
  wrepr sz
    (Z.shiftr
      (Z.add
        (Z.shiftr (Z.mul (wsigned sz x) (wsigned sz y))
          (Z.of_nat (pred (wsize_size_minus_1 sz)))) (Zpos Coq_xH)) (Zpos
      Coq_xH))

(** val wmax_unsigned : wsize -> coq_Z **)

let wmax_unsigned sz =
  Z.sub (wbase sz) (Zpos Coq_xH)

(** val half_modulus : wsize -> coq_Z **)

let half_modulus sz =
  modulus (wsize_size_minus_1 sz)

(** val wmin_signed : wsize -> coq_Z **)

let wmin_signed sz =
  Z.opp (half_modulus sz)

(** val wmax_signed : wsize -> coq_Z **)

let wmax_signed sz =
  Z.sub (half_modulus sz) (Zpos Coq_xH)

(** val wbit_n : wsize -> word -> nat -> bool **)

let wbit_n sz w n =
  wbit (wunsigned sz w) n

(** val lsb : wsize -> word -> bool **)

let lsb s w =
  wbit_n s w O

(** val msb : wsize -> word -> bool **)

let msb s w =
  wbit_n s w (wsize_size_minus_1 s)

(** val wdwordu : wsize -> word -> word -> coq_Z **)

let wdwordu sz hi lo =
  Z.add (Z.mul (wbase sz) (wunsigned sz hi)) (wunsigned sz lo)

(** val wdwords : wsize -> word -> word -> coq_Z **)

let wdwords sz hi lo =
  Z.add (Z.mul (wbase sz) (wsigned sz hi)) (wunsigned sz lo)

(** val waddcarry : wsize -> word -> word -> bool -> bool * word **)

let waddcarry sz x y c =
  let n = Z.add (Z.add (wunsigned sz x) (wunsigned sz y)) (Z.b2z c) in
  ((Z.leb (wbase sz) n), (wrepr sz n))

(** val wdaddu : wsize -> word -> word -> word -> word -> word * word **)

let wdaddu sz hi_1 lo_1 hi_2 lo_2 =
  let n = Z.add (wdwordu sz hi_1 lo_1) (wdwordu sz hi_2 lo_2) in
  ((wrepr sz n), (high_bits sz n))

(** val wdadds : wsize -> word -> word -> word -> word -> word * word **)

let wdadds sz hi_1 lo_1 hi_2 lo_2 =
  let n = Z.add (wdwords sz hi_1 lo_1) (wdwords sz hi_2 lo_2) in
  ((wrepr sz n), (high_bits sz n))

(** val wsubcarry : wsize -> word -> word -> bool -> bool * word **)

let wsubcarry sz x y c =
  let n = Z.sub (Z.sub (wunsigned sz x) (wunsigned sz y)) (Z.b2z c) in
  ((Z.ltb n Z0), (wrepr sz n))

(** val wumul : wsize -> word -> word -> word * word **)

let wumul sz x y =
  let n = Z.mul (wunsigned sz x) (wunsigned sz y) in
  ((high_bits sz n), (wrepr sz n))

(** val wsmul : wsize -> word -> word -> word * word **)

let wsmul sz x y =
  let n = Z.mul (wsigned sz x) (wsigned sz y) in
  ((high_bits sz n), (wrepr sz n))

(** val wdiv : wsize -> word -> word -> word **)

let wdiv sz p q =
  let p0 = wunsigned sz p in let q0 = wunsigned sz q in wrepr sz (Z.div p0 q0)

(** val wdivi : wsize -> word -> word -> word **)

let wdivi sz p q =
  let p0 = wsigned sz p in let q0 = wsigned sz q in wrepr sz (Z.quot p0 q0)

(** val wmod : wsize -> word -> word -> word **)

let wmod sz p q =
  let p0 = wunsigned sz p in
  let q0 = wunsigned sz q in wrepr sz (Z.modulo p0 q0)

(** val wmodi : wsize -> word -> word -> word **)

let wmodi sz p q =
  let p0 = wsigned sz p in let q0 = wsigned sz q in wrepr sz (Z.rem p0 q0)

(** val zero_extend : wsize -> wsize -> word -> word **)

let zero_extend sz sz' w =
  wrepr sz (wunsigned sz' w)

(** val sign_extend : wsize -> wsize -> word -> word **)

let sign_extend sz sz' w =
  wrepr sz (wsigned sz' w)

(** val truncate_word : wsize -> wsize -> word -> word exec **)

let truncate_word s s' w =
  match gcmp wsize_cmp s s' with
  | Eq -> Ok w
  | Lt -> Ok (zero_extend s s' w)
  | Gt -> type_error

(** val wbit : wsize -> word -> word -> bool **)

let wbit sz w i =
  wbit_n sz w (Z.to_nat (Z.modulo (wunsigned sz i) (wsize_bits sz)))

(** val wror : wsize -> word -> coq_Z -> word **)

let wror sz w z =
  let i = Z.modulo z (wsize_bits sz) in
  wor sz (wshr sz w i) (wshl sz w (Z.sub (wsize_bits sz) i))

(** val wrol : wsize -> word -> coq_Z -> word **)

let wrol sz w z =
  let i = Z.modulo z (wsize_bits sz) in
  wor sz (wshl sz w i) (wshr sz w (Z.sub (wsize_bits sz) i))

(** val check_scale : coq_Z -> bool **)

let check_scale s =
  (||)
    ((||)
      ((||)
        (eq_op coq_BinNums_Z__canonical__eqtype_Equality (Obj.magic s)
          (Obj.magic (Zpos Coq_xH)))
        (eq_op coq_BinNums_Z__canonical__eqtype_Equality (Obj.magic s)
          (Obj.magic (Zpos (Coq_xO Coq_xH)))))
      (eq_op coq_BinNums_Z__canonical__eqtype_Equality (Obj.magic s)
        (Obj.magic (Zpos (Coq_xO (Coq_xO Coq_xH))))))
    (eq_op coq_BinNums_Z__canonical__eqtype_Equality (Obj.magic s)
      (Obj.magic (Zpos (Coq_xO (Coq_xO (Coq_xO Coq_xH))))))

(** val split_vec : wsize -> nat -> word -> Word.word list **)

let split_vec sz ve w =
  let wsz = addn (divn (nat_of_wsize sz) ve) (modn (nat_of_wsize sz) ve) in
  map (fun i -> subword (S (wsize_size_minus_1 sz)) (muln i ve) ve w)
    (iota O wsz)

(** val make_vec : wsize -> wsize -> word list -> word **)

let make_vec sz sz' s =
  wrepr sz' (wcat_r (S (wsize_size_minus_1 sz)) s)

(** val lift1_vec' :
    wsize -> wsize -> (word -> word) -> wsize -> wsize -> word -> word **)

let lift1_vec' ve ve' op sz sz' w =
  make_vec ve' sz' (map op (split_vec sz (nat_of_wsize ve) w))

(** val lift1_vec : wsize -> (word -> word) -> wsize -> word -> word **)

let lift1_vec ve op sz w =
  lift1_vec' ve ve op sz sz w

(** val lift2_vec :
    wsize -> (word -> word -> word) -> wsize -> word -> word -> word **)

let lift2_vec ve op sz w1 w2 =
  make_vec ve sz
    (map2 op (split_vec sz (nat_of_wsize ve) w1)
      (split_vec sz (nat_of_wsize ve) w2))

(** val wbswap : wsize -> word -> word **)

let wbswap sz w =
  make_vec U8 sz (rev (split_vec sz (nat_of_wsize U8) w))

(** val popcnt : wsize -> word -> word **)

let popcnt sz w =
  wrepr sz (Z.of_nat (count (fun x -> x) (w2t (S (wsize_size_minus_1 sz)) w)))

(** val pextr : wsize -> word -> word -> word **)

let pextr sz w1 w2 =
  wrepr sz
    (t2w
      (size
        (mask (w2t (S (wsize_size_minus_1 sz)) w2)
          (w2t (S (wsize_size_minus_1 sz)) w1)))
      (in_tuple
        (mask (w2t (S (wsize_size_minus_1 sz)) w2)
          (w2t (S (wsize_size_minus_1 sz)) w1))))

(** val bitpdep : wsize -> word -> nat -> bitseq -> bool list **)

let rec bitpdep sz w i = function
| [] -> []
| b :: mask1 ->
  if b
  then (wbit_n sz w i) :: (bitpdep sz w (S i) mask1)
  else false :: (bitpdep sz w i mask1)

(** val pdep : wsize -> word -> word -> word **)

let pdep sz w1 w2 =
  wrepr sz
    (t2w (size (bitpdep sz w1 O (w2t (S (wsize_size_minus_1 sz)) w2)))
      (in_tuple (bitpdep sz w1 O (w2t (S (wsize_size_minus_1 sz)) w2))))

(** val leading_zero_aux : coq_Z -> nat -> nat -> nat **)

let rec leading_zero_aux n res sz =
  if Z.ltb n (Z.pow (Zpos (Coq_xO Coq_xH)) (Z.of_nat (subn sz res)))
  then res
  else (match res with
        | O -> O
        | S res' -> leading_zero_aux n res' sz)

(** val leading_zero : wsize -> word -> word **)

let leading_zero sz w =
  wrepr sz
    (Z.of_nat
      (leading_zero_aux (wunsigned sz w) (nat_of_wsize sz) (nat_of_wsize sz)))

(** val trailing_zero_aux : coq_Z -> nat -> nat **)

let trailing_zero_aux n bits =
  match n with
  | Zpos p ->
    let rec tzcnt acc = function
    | Coq_xO q -> tzcnt (S acc) q
    | _ -> acc
    in tzcnt O p
  | _ -> bits

(** val trailing_zero : wsize -> word -> word **)

let trailing_zero sz w =
  wrepr sz (Z.of_nat (trailing_zero_aux (wunsigned sz w) (nat_of_wsize sz)))

(** val halve_list : 'a1 list -> 'a1 list **)

let rec halve_list m = match m with
| [] -> m
| a :: l -> (match l with
             | [] -> m
             | _ :: m' -> a :: (halve_list m'))

(** val wpmul : wsize -> word -> word -> word **)

let wpmul sz x y =
  let xs = halve_list (split_vec sz (nat_of_wsize U32) x) in
  let ys = halve_list (split_vec sz (nat_of_wsize U32) y) in
  let f = fun a b -> wrepr U64 (Z.mul (wsigned U32 a) (wsigned U32 b)) in
  make_vec U64 sz (map2 f xs ys)

(** val wpmulu : wsize -> word -> word -> word **)

let wpmulu sz x y =
  let xs = halve_list (split_vec sz (nat_of_wsize U32) x) in
  let ys = halve_list (split_vec sz (nat_of_wsize U32) y) in
  let f = fun a b -> wrepr U64 (Z.mul (wunsigned U32 a) (wunsigned U32 b)) in
  make_vec U64 sz (map2 f xs ys)

(** val wpshufb1 : word list -> word -> word **)

let wpshufb1 s idx =
  if msb U8 idx
  then word0 U8
  else let off =
         wunsigned U8
           (wand U8 idx
             (sub_word U8
               (wshl U8 (word1 U8) (Zpos (Coq_xO (Coq_xO Coq_xH))))
               (word1 U8)))
       in
       nth (word0 U8) s (Z.to_nat off)

(** val wpshufb : wsize -> word -> word -> word **)

let wpshufb sz w idx =
  let s = split_vec sz (S (S (S (S (S (S (S (S O)))))))) w in
  let i = split_vec sz (S (S (S (S (S (S (S (S O)))))))) idx in
  let r = map (wpshufb1 s) i in make_vec U8 sz r

(** val wpshufd1 : word -> word -> nat -> Word.word **)

let wpshufd1 s o i =
  subword (S (wsize_size_minus_1 U128)) O (S (S (S (S (S (S (S (S (S (S (S (S
    (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S
    O))))))))))))))))))))))))))))))))
    (wshr U128 s
      (Z.mul (Zpos (Coq_xO (Coq_xO (Coq_xO (Coq_xO (Coq_xO Coq_xH))))))
        (urepr (S (S O))
          (subword (S (wsize_size_minus_1 U8)) (muln (S (S O)) i) (S (S O)) o))))

(** val wpshufd_128 : word -> coq_Z -> word **)

let wpshufd_128 s o =
  let o0 = wrepr U8 o in
  let d = map (fun i -> wpshufd1 s o0 i) (iota O (S (S (S (S O))))) in
  wrepr U128
    (wcat_r (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S
      (S (S (S (S (S (S (S (S (S (S O)))))))))))))))))))))))))))))))) d)

(** val wpshufd_256 : word -> coq_Z -> word **)

let wpshufd_256 s o =
  make_vec U128 U256
    (map (fun w -> wpshufd_128 w o) (split_vec U256 (nat_of_wsize U128) s))

(** val wpshufd : wsize -> word -> coq_Z -> word **)

let wpshufd = function
| U128 -> wpshufd_128
| U256 -> wpshufd_256
| _ -> (fun w _ -> w)

(** val wpshufl_u64 : word -> coq_Z -> word **)

let wpshufl_u64 w z =
  let v = split_vec U64 (nat_of_wsize U16) w in
  let j = split_vec U8 (S (S O)) (wrepr U8 z) in
  make_vec U16 U64
    (map (fun n -> nth (word0 U16) v (Z.to_nat (urepr (S (S O)) n))) j)

(** val wpshufl_u128 : word -> coq_Z -> word **)

let wpshufl_u128 w z =
  match split_vec U128 (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S
          (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S
          (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S
          (S (S
          O)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) w with
  | [] -> w
  | l :: l0 ->
    (match l0 with
     | [] -> w
     | h :: l1 ->
       (match l1 with
        | [] -> make_vec U64 U128 ((wpshufl_u64 l z) :: (h :: []))
        | _ :: _ -> w))

(** val wpshufh_u128 : word -> coq_Z -> word **)

let wpshufh_u128 w z =
  match split_vec U128 (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S
          (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S
          (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S
          (S (S
          O)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) w with
  | [] -> w
  | l :: l0 ->
    (match l0 with
     | [] -> w
     | h :: l1 ->
       (match l1 with
        | [] -> make_vec U64 U128 (l :: ((wpshufl_u64 h z) :: []))
        | _ :: _ -> w))

(** val wpshufl_u256 : word -> coq_Z -> word **)

let wpshufl_u256 s z =
  make_vec U128 U256
    (map (fun w -> wpshufl_u128 w z) (split_vec U256 (nat_of_wsize U128) s))

(** val wpshufh_u256 : word -> coq_Z -> word **)

let wpshufh_u256 s z =
  make_vec U128 U256
    (map (fun w -> wpshufh_u128 w z) (split_vec U256 (nat_of_wsize U128) s))

(** val wpshuflw : wsize -> word -> coq_Z -> word **)

let wpshuflw = function
| U128 -> wpshufl_u128
| U256 -> wpshufl_u256
| _ -> (fun w _ -> w)

(** val wpshufhw : wsize -> word -> coq_Z -> word **)

let wpshufhw = function
| U128 -> wpshufh_u128
| U256 -> wpshufh_u256
| _ -> (fun w _ -> w)

(** val interleave : 'a1 list -> 'a1 list -> 'a1 list **)

let rec interleave l1 l2 =
  match l1 with
  | [] -> l2
  | a1 :: l3 ->
    (match l2 with
     | [] -> l1
     | a2 :: l4 -> a1 :: (a2 :: (interleave l3 l4)))

(** val interleave_gen : (word -> word) -> velem -> word -> word -> word **)

let interleave_gen get ve src1 src2 =
  let ve0 = nat_of_wsize (wsize_of_velem ve) in
  let l1 = split_vec U64 ve0 (get src1) in
  let l2 = split_vec U64 ve0 (get src2) in
  make_vec (wsize_of_velem ve) U128 (interleave l1 l2)

(** val wpunpckl_128 : velem -> word -> word -> word **)

let wpunpckl_128 =
  interleave_gen
    (subword (S (wsize_size_minus_1 U128)) O (S (S (S (S (S (S (S (S (S (S (S
      (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S
      (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S
      (S (S (S (S (S
      O)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

(** val wpunpckl_256 : velem -> word -> word -> word **)

let wpunpckl_256 ve src1 src2 =
  make_vec U128 U256
    (map2 (wpunpckl_128 ve) (split_vec U256 (nat_of_wsize U128) src1)
      (split_vec U256 (nat_of_wsize U128) src2))

(** val wpunpckh_128 : velem -> word -> word -> word **)

let wpunpckh_128 =
  interleave_gen
    (subword (S (wsize_size_minus_1 U128)) (S (S (S (S (S (S (S (S (S (S (S
      (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S
      (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S
      (S (S (S (S (S
      O)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))) (S (S
      (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S
      (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S (S
      (S (S (S (S (S (S (S (S (S (S (S (S (S (S
      O)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

(** val wpunpckh_256 : velem -> word -> word -> word **)

let wpunpckh_256 ve src1 src2 =
  make_vec U128 U256
    (map2 (wpunpckh_128 ve) (split_vec U256 (nat_of_wsize U128) src1)
      (split_vec U256 (nat_of_wsize U128) src2))

(** val wpunpckl : wsize -> velem -> word -> word -> word **)

let wpunpckl = function
| U128 -> wpunpckl_128
| U256 -> wpunpckl_256
| _ -> (fun _ w1 _ -> w1)

(** val wpunpckh : wsize -> velem -> word -> word -> word **)

let wpunpckh = function
| U128 -> wpunpckh_128
| U256 -> wpunpckh_256
| _ -> (fun _ w1 _ -> w1)

(** val update_at : 'a1 -> 'a1 list -> nat -> 'a1 list **)

let rec update_at t xs i =
  match xs with
  | [] -> []
  | x :: xs' ->
    (match i with
     | O -> t :: xs'
     | S i' -> x :: (update_at t xs' i'))

(** val wpinsr : wsize -> word -> word -> word -> word **)

let wpinsr ve v w i =
  let v0 = split_vec U128 (nat_of_wsize ve) v in
  let i0 = Z.to_nat (wunsigned U8 i) in make_vec ve U128 (update_at w v0 i0)

(** val winserti128 : word -> word -> word -> word **)

let winserti128 v w i =
  let v0 = split_vec U256 (nat_of_wsize U128) v in
  make_vec U128 U256
    (if lsb U8 i
     then (nth (word0 U128) v0 O) :: (w :: [])
     else w :: ((nth (word0 U128) v0 (S O)) :: []))

(** val wpblendd : wsize -> word -> word -> word -> word **)

let wpblendd sz w1 w2 m =
  let v1 = split_vec sz (nat_of_wsize U32) w1 in
  let v2 = split_vec sz (nat_of_wsize U32) w2 in
  let b = split_vec U8 (S O) m in
  let r =
    map3 (fun b0 v3 v4 ->
      if eq_op (Word.word_word__canonical__eqtype_Equality (S O))
           (Obj.magic b0) (Obj.magic Word.word1 O)
      then v4
      else v3) b v1 v2
  in
  make_vec U32 sz r

(** val wpbroadcast : wsize -> wsize -> word -> word **)

let wpbroadcast ve sz w =
  let r = nseq (divn (nat_of_wsize sz) (nat_of_wsize ve)) w in
  make_vec ve sz r

(** val seq_dup_hi : 'a1 list -> 'a1 list **)

let rec seq_dup_hi = function
| [] -> []
| _ :: l -> (match l with
             | [] -> []
             | a :: m' -> a :: (a :: (seq_dup_hi m')))

(** val seq_dup_lo : 'a1 list -> 'a1 list **)

let rec seq_dup_lo = function
| [] -> []
| a :: l -> (match l with
             | [] -> []
             | _ :: m' -> a :: (a :: (seq_dup_lo m')))

(** val wdup_hi : wsize -> wsize -> word -> word **)

let wdup_hi ve sz w =
  let v = split_vec sz (nat_of_wsize ve) w in make_vec ve sz (seq_dup_hi v)

(** val wdup_lo : wsize -> wsize -> word -> word **)

let wdup_lo ve sz w =
  let v = split_vec sz (nat_of_wsize ve) w in make_vec ve sz (seq_dup_lo v)

(** val wperm2i128 : word -> word -> word -> word **)

let wperm2i128 w1 w2 i =
  let choose = fun n ->
    match urepr (S (S O)) (subword (S (wsize_size_minus_1 U8)) n (S (S O)) i) with
    | Z0 -> subword (S (wsize_size_minus_1 U256)) O (nat_of_wsize U128) w1
    | Zpos p ->
      (match p with
       | Coq_xI _ ->
         subword (S (wsize_size_minus_1 U256)) (nat_of_wsize U128)
           (nat_of_wsize U128) w2
       | Coq_xO p0 ->
         (match p0 with
          | Coq_xH ->
            subword (S (wsize_size_minus_1 U256)) O (nat_of_wsize U128) w2
          | _ ->
            subword (S (wsize_size_minus_1 U256)) (nat_of_wsize U128)
              (nat_of_wsize U128) w2)
       | Coq_xH ->
         subword (S (wsize_size_minus_1 U256)) (nat_of_wsize U128)
           (nat_of_wsize U128) w1)
    | Zneg _ ->
      subword (S (wsize_size_minus_1 U256)) (nat_of_wsize U128)
        (nat_of_wsize U128) w2
  in
  let lo = if wbit_n U8 i (S (S (S O))) then word0 U128 else choose O in
  let hi =
    if wbit_n U8 i (S (S (S (S (S (S (S O)))))))
    then word0 U128
    else choose (S (S (S (S O))))
  in
  make_vec U128 U256 (lo :: (hi :: []))

(** val wpermd1 : word list -> word -> word **)

let wpermd1 v idx =
  let off =
    Z.modulo (wunsigned U32 idx) (Zpos (Coq_xO (Coq_xO (Coq_xO Coq_xH))))
  in
  nth (word0 U32) v (Z.to_nat off)

(** val wpermd : wsize -> word -> word -> word **)

let wpermd sz idx w =
  let v = split_vec sz (nat_of_wsize U32) w in
  let i = split_vec sz (nat_of_wsize U32) idx in
  make_vec U32 sz (map (wpermd1 v) i)

(** val wpermq : word -> word -> word **)

let wpermq w i =
  let v = split_vec U256 (nat_of_wsize U64) w in
  let j = split_vec U8 (S (S O)) i in
  make_vec U64 U256
    (map (fun n -> nth (word0 U64) v (Z.to_nat (urepr (S (S O)) n))) j)

(** val wpsxldq : (word -> coq_Z -> word) -> wsize -> word -> word -> word **)

let wpsxldq op sz w i =
  let n =
    Z.mul
      (Z.min (Zpos (Coq_xO (Coq_xO (Coq_xO (Coq_xO Coq_xH)))))
        (wunsigned U8 i)) (Zpos (Coq_xO (Coq_xO (Coq_xO Coq_xH))))
  in
  lift1_vec U128 (fun w0 -> op w0 n) sz w

(** val wpslldq : wsize -> word -> word -> word **)

let wpslldq =
  wpsxldq (wshl U128)

(** val wpsrldq : wsize -> word -> word -> word **)

let wpsrldq =
  wpsxldq (wshr U128)

(** val wpcmps1 :
    (coq_Z -> coq_Z -> bool) -> wsize -> word -> word -> word **)

let wpcmps1 cmp ve x y =
  if cmp (wsigned ve x) (wsigned ve y)
  then opp_word ve (word1 ve)
  else word0 ve

(** val wpcmpeq : wsize -> wsize -> word -> word -> word **)

let wpcmpeq ve sz w1 w2 =
  lift2_vec ve (wpcmps1 Z.eqb ve) sz w1 w2

(** val wpcmpgt : wsize -> wsize -> word -> word -> word **)

let wpcmpgt ve sz w1 w2 =
  lift2_vec ve (wpcmps1 Z.gtb ve) sz w1 w2

(** val wminmax1 : wsize -> (word -> word -> bool) -> word -> word -> word **)

let wminmax1 _ cmp x y =
  if cmp x y then x else y

(** val wmin : signedness -> wsize -> wsize -> word -> word -> word **)

let wmin sg ve sz x y =
  lift2_vec ve (wminmax1 ve (wlt ve sg)) sz x y

(** val wmax : signedness -> wsize -> wsize -> word -> word -> word **)

let wmax sg ve sz x y =
  lift2_vec ve (wminmax1 ve (fun u v -> wlt ve sg v u)) sz x y

(** val wabs : velem -> wsize -> word -> word **)

let wabs ve =
  lift1_vec (wsize_of_velem ve) (fun x ->
    wrepr (wsize_of_velem ve) (Z.abs (wsigned (wsize_of_velem ve) x)))

(** val saturated_signed : wsize -> coq_Z -> coq_Z **)

let saturated_signed sz x =
  Z.max (wmin_signed sz) (Z.min (wmax_signed sz) x)

(** val wrepr_saturated_signed : wsize -> coq_Z -> word **)

let wrepr_saturated_signed sz x =
  wrepr sz (saturated_signed sz x)

(** val add_pairs : coq_Z list -> coq_Z list **)

let rec add_pairs = function
| [] -> []
| x :: l -> (match l with
             | [] -> []
             | y :: z -> (Z.add x y) :: (add_pairs z))

(** val wpmaddubsw : wsize -> word -> word -> word **)

let wpmaddubsw sz v1 v2 =
  let w1 = map (wunsigned U8) (split_vec sz (nat_of_wsize U8) v1) in
  let w2 = map (wsigned U8) (split_vec sz (nat_of_wsize U8) v2) in
  let result0 =
    map (fun z -> wrepr_saturated_signed U16 z) (add_pairs (map2 Z.mul w1 w2))
  in
  make_vec U16 sz result0

(** val wpmaddwd : wsize -> word -> word -> word **)

let wpmaddwd sz v1 v2 =
  let w1 = map (wsigned U16) (split_vec sz (nat_of_wsize U16) v1) in
  let w2 = map (wsigned U16) (split_vec sz (nat_of_wsize U16) v2) in
  let result0 = map (fun z -> wrepr U32 z) (add_pairs (map2 Z.mul w1 w2)) in
  make_vec U32 sz result0

(** val wpack : wsize -> nat -> coq_Z list -> word **)

let wpack sz pe arg =
  let w = map (mkword pe) arg in wrepr sz (wcat_r pe w)

(** val movemask : velem -> wsize -> word -> word **)

let movemask ve ssz w =
  wrepr U32
    (t2w_def
      (addn (divn (nat_of_wsize ssz) (nat_of_wsize (wsize_of_velem ve)))
        (modn (nat_of_wsize ssz) (nat_of_wsize (wsize_of_velem ve))))
      (tuple
        (addn (divn (nat_of_wsize ssz) (nat_of_wsize (wsize_of_velem ve)))
          (modn (nat_of_wsize ssz) (nat_of_wsize (wsize_of_velem ve))))
        (map_tuple
          (addn (divn (nat_of_wsize ssz) (nat_of_wsize (wsize_of_velem ve)))
            (modn (nat_of_wsize ssz) (nat_of_wsize (wsize_of_velem ve))))
          (msb (wsize_of_velem ve))
          (map_tuple
            (addn
              (divn (nat_of_wsize ssz) (nat_of_wsize (wsize_of_velem ve)))
              (modn (nat_of_wsize ssz) (nat_of_wsize (wsize_of_velem ve))))
            (fun i ->
            subword (S (wsize_size_minus_1 ssz))
              (muln i (nat_of_wsize (wsize_of_velem ve)))
              (nat_of_wsize (wsize_of_velem ve)) w)
            (iota_tuple
              (addn
                (divn (nat_of_wsize ssz) (nat_of_wsize (wsize_of_velem ve)))
                (modn (nat_of_wsize ssz) (nat_of_wsize (wsize_of_velem ve))))
              O))) (fun _ ->
        map (msb (wsize_of_velem ve))
          (split_vec ssz (nat_of_wsize (wsize_of_velem ve)) w))))

(** val blendv : velem -> wsize -> word -> word -> word -> word **)

let blendv ve sz w1 w2 m =
  let v1 = split_vec sz (nat_of_wsize (wsize_of_velem ve)) w1 in
  let v2 = split_vec sz (nat_of_wsize (wsize_of_velem ve)) w2 in
  let b =
    map (msb (wsize_of_velem ve))
      (split_vec sz (nat_of_wsize (wsize_of_velem ve)) m)
  in
  let r = map3 (fun bi v1i v2i -> if bi then v2i else v1i) b v1 v2 in
  make_vec (wsize_of_velem ve) sz r

(** val align_word : wsize -> wsize -> word -> word **)

let align_word sz sz' p =
  wand sz p (wrepr sz (Z.opp (wsize_size sz')))

(** val in_uint_range : wsize -> coq_Z -> bool **)

let in_uint_range sz z =
  (&&) (Z.leb Z0 z) (Z.leb z (wmax_unsigned sz))

(** val in_sint_range : wsize -> coq_Z -> bool **)

let in_sint_range sz z =
  (&&) (Z.leb (wmin_signed sz) z) (Z.leb z (wmax_signed sz))

(** val signed : 'a1 -> 'a1 -> signedness -> 'a1 **)

let signed fu fs = function
| Signed -> fs
| Unsigned -> fu

(** val in_wint_range :
    signedness -> wsize -> coq_Z -> (error, unit) result **)

let in_wint_range s sz z =
  if signed in_uint_range in_sint_range s sz z then Ok () else Error ErrArith

(** val wint_of_int : signedness -> wsize -> coq_Z -> (error, word) result **)

let wint_of_int s sz z =
  match in_wint_range s sz z with
  | Ok _ -> Ok (wrepr sz z)
  | Error s0 -> Error s0

(** val int_of_word : signedness -> wsize -> word -> coq_Z **)

let int_of_word s sz w =
  signed (wunsigned sz) (wsigned sz) s w

(** val sem_word_extend : signedness -> wsize -> wsize -> word -> word **)

let sem_word_extend s szo szi =
  signed (zero_extend szo szi) (sign_extend szo szi) s
