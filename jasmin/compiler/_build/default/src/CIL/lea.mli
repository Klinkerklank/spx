(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open BinInt
open BinNums
open Datatypes
open Eqtype
open Expr
open Fexpr
open Operators
open Ssrfun
open Word0
open Word_ssrZ
open Wsize

type lea = { lea_disp : coq_Z; lea_base : var_i option; lea_scale : coq_Z;
             lea_offset : var_i option }

val lea_const : coq_Z -> lea

val lea_var : var_i -> lea

val mkLea : coq_Z -> var_i option -> Equality.sort -> var_i option -> lea

val lea_mul : lea -> lea -> lea option

val lea_add : lea -> lea -> lea option

val lea_sub : lea -> lea -> lea option

val mk_lea_rec : wsize -> fexpr -> lea option

val mk_lea : wsize -> pexpr -> lea option

val shift_of_scale : coq_Z -> nat option
