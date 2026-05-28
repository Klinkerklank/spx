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

val nat7 : nat

val nat15 : nat

val nat31 : nat

val nat63 : nat

val nat127 : nat

val nat255 : nat

val wsize_size_minus_1 : wsize -> nat

val nat_of_wsize : wsize -> nat

val wsize_bits : wsize -> coq_Z

val wsize_log2 : wsize -> nat

val wbase : wsize -> coq_Z

val nat_of_pelem : pelem -> nat

type word = Word.word

val coq_HB_unnamed_factory_2 : wsize -> word Equality.axioms_

val coq_HB_unnamed_mixin_4 : wsize -> word Coq_hasDecEq.axioms_

val word_word__canonical__eqtype_Equality : wsize -> Equality.coq_type

val winit : wsize -> (nat -> bool) -> word

val add_word : wsize -> word -> word -> word

val sub_word : wsize -> word -> word -> word

val mul_word : wsize -> word -> word -> word

val opp_word : wsize -> word -> word

val word0 : wsize -> word

val word1 : wsize -> word

val wand : wsize -> word -> word -> word

val wor : wsize -> word -> word -> word

val wxor : wsize -> word -> word -> word

val wlt : wsize -> signedness -> word -> word -> bool

val wle : wsize -> signedness -> word -> word -> bool

val wnot : wsize -> word -> word

val wandn : wsize -> word -> word -> word

val wunsigned : wsize -> word -> coq_Z

val wsigned : wsize -> word -> coq_Z

val wrepr : wsize -> coq_Z -> word

val wshr : wsize -> word -> coq_Z -> word

val wshl : wsize -> word -> coq_Z -> word

val wsar : wsize -> word -> coq_Z -> word

val high_bits : wsize -> coq_Z -> word

val wmulhu : wsize -> word -> word -> word

val wmulhs : wsize -> word -> word -> word

val wmulhsu : wsize -> word -> word -> word

val wmulhrs : wsize -> word -> word -> word

val wmax_unsigned : wsize -> coq_Z

val half_modulus : wsize -> coq_Z

val wmin_signed : wsize -> coq_Z

val wmax_signed : wsize -> coq_Z

val wbit_n : wsize -> word -> nat -> bool

val lsb : wsize -> word -> bool

val msb : wsize -> word -> bool

val wdwordu : wsize -> word -> word -> coq_Z

val wdwords : wsize -> word -> word -> coq_Z

val waddcarry : wsize -> word -> word -> bool -> bool * word

val wdaddu : wsize -> word -> word -> word -> word -> word * word

val wdadds : wsize -> word -> word -> word -> word -> word * word

val wsubcarry : wsize -> word -> word -> bool -> bool * word

val wumul : wsize -> word -> word -> word * word

val wsmul : wsize -> word -> word -> word * word

val wdiv : wsize -> word -> word -> word

val wdivi : wsize -> word -> word -> word

val wmod : wsize -> word -> word -> word

val wmodi : wsize -> word -> word -> word

val zero_extend : wsize -> wsize -> word -> word

val sign_extend : wsize -> wsize -> word -> word

val truncate_word : wsize -> wsize -> word -> word exec

val wbit : wsize -> word -> word -> bool

val wror : wsize -> word -> coq_Z -> word

val wrol : wsize -> word -> coq_Z -> word

val check_scale : coq_Z -> bool

val split_vec : wsize -> nat -> word -> Word.word list

val make_vec : wsize -> wsize -> word list -> word

val lift1_vec' :
  wsize -> wsize -> (word -> word) -> wsize -> wsize -> word -> word

val lift1_vec : wsize -> (word -> word) -> wsize -> word -> word

val lift2_vec :
  wsize -> (word -> word -> word) -> wsize -> word -> word -> word

val wbswap : wsize -> word -> word

val popcnt : wsize -> word -> word

val pextr : wsize -> word -> word -> word

val bitpdep : wsize -> word -> nat -> bitseq -> bool list

val pdep : wsize -> word -> word -> word

val leading_zero_aux : coq_Z -> nat -> nat -> nat

val leading_zero : wsize -> word -> word

val trailing_zero_aux : coq_Z -> nat -> nat

val trailing_zero : wsize -> word -> word

val halve_list : 'a1 list -> 'a1 list

val wpmul : wsize -> word -> word -> word

val wpmulu : wsize -> word -> word -> word

val wpshufb1 : word list -> word -> word

val wpshufb : wsize -> word -> word -> word

val wpshufd1 : word -> word -> nat -> Word.word

val wpshufd_128 : word -> coq_Z -> word

val wpshufd_256 : word -> coq_Z -> word

val wpshufd : wsize -> word -> coq_Z -> word

val wpshufl_u64 : word -> coq_Z -> word

val wpshufl_u128 : word -> coq_Z -> word

val wpshufh_u128 : word -> coq_Z -> word

val wpshufl_u256 : word -> coq_Z -> word

val wpshufh_u256 : word -> coq_Z -> word

val wpshuflw : wsize -> word -> coq_Z -> word

val wpshufhw : wsize -> word -> coq_Z -> word

val interleave : 'a1 list -> 'a1 list -> 'a1 list

val interleave_gen : (word -> word) -> velem -> word -> word -> word

val wpunpckl_128 : velem -> word -> word -> word

val wpunpckl_256 : velem -> word -> word -> word

val wpunpckh_128 : velem -> word -> word -> word

val wpunpckh_256 : velem -> word -> word -> word

val wpunpckl : wsize -> velem -> word -> word -> word

val wpunpckh : wsize -> velem -> word -> word -> word

val update_at : 'a1 -> 'a1 list -> nat -> 'a1 list

val wpinsr : wsize -> word -> word -> word -> word

val winserti128 : word -> word -> word -> word

val wpblendd : wsize -> word -> word -> word -> word

val wpbroadcast : wsize -> wsize -> word -> word

val seq_dup_hi : 'a1 list -> 'a1 list

val seq_dup_lo : 'a1 list -> 'a1 list

val wdup_hi : wsize -> wsize -> word -> word

val wdup_lo : wsize -> wsize -> word -> word

val wperm2i128 : word -> word -> word -> word

val wpermd1 : word list -> word -> word

val wpermd : wsize -> word -> word -> word

val wpermq : word -> word -> word

val wpsxldq : (word -> coq_Z -> word) -> wsize -> word -> word -> word

val wpslldq : wsize -> word -> word -> word

val wpsrldq : wsize -> word -> word -> word

val wpcmps1 : (coq_Z -> coq_Z -> bool) -> wsize -> word -> word -> word

val wpcmpeq : wsize -> wsize -> word -> word -> word

val wpcmpgt : wsize -> wsize -> word -> word -> word

val wminmax1 : wsize -> (word -> word -> bool) -> word -> word -> word

val wmin : signedness -> wsize -> wsize -> word -> word -> word

val wmax : signedness -> wsize -> wsize -> word -> word -> word

val wabs : velem -> wsize -> word -> word

val saturated_signed : wsize -> coq_Z -> coq_Z

val wrepr_saturated_signed : wsize -> coq_Z -> word

val add_pairs : coq_Z list -> coq_Z list

val wpmaddubsw : wsize -> word -> word -> word

val wpmaddwd : wsize -> word -> word -> word

val wpack : wsize -> nat -> coq_Z list -> word

val movemask : velem -> wsize -> word -> word

val blendv : velem -> wsize -> word -> word -> word -> word

val align_word : wsize -> wsize -> word -> word

val in_uint_range : wsize -> coq_Z -> bool

val in_sint_range : wsize -> coq_Z -> bool

val signed : 'a1 -> 'a1 -> signedness -> 'a1

val in_wint_range : signedness -> wsize -> coq_Z -> (error, unit) result

val wint_of_int : signedness -> wsize -> coq_Z -> (error, word) result

val int_of_word : signedness -> wsize -> word -> coq_Z

val sem_word_extend : signedness -> wsize -> wsize -> word -> word
