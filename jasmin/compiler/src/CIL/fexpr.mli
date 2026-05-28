(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open BinNums
open Expr
open Memory_model
open Operators
open Ssrfun
open Type
open Var0
open Wsize

type fexpr =
| Fconst of coq_Z
| Fvar of var_i
| Fapp1 of sop1 * fexpr
| Fapp2 of sop2 * fexpr * fexpr
| Fif of fexpr * fexpr * fexpr

val fconst : wsize -> coq_Z -> fexpr

val fadd : wsize -> fexpr -> fexpr -> fexpr

val faddv : wsize -> var_i -> fexpr -> fexpr

type rexpr =
| Load of aligned * wsize * fexpr
| Rexpr of fexpr

type lexpr =
| Store of aligned * wsize * fexpr
| LLvar of var_i

val fexpr_of_pexpr : pexpr -> fexpr option

val rexpr_of_pexpr : pexpr -> rexpr option

val lexpr_of_lval : lval -> lexpr option

val free_vars_rec : SvExtra.Sv.t -> fexpr -> SvExtra.Sv.t

val free_vars : fexpr -> SvExtra.Sv.t

val free_vars_r : rexpr -> SvExtra.Sv.t

val rvar : var_i -> rexpr

val rconst : wsize -> coq_Z -> rexpr
