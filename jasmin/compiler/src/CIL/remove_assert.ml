(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open Compiler_util
open Expr
open Seq
open Sopn

(** val remove_assert_c :
    'a1 asmOp -> ('a1 instr -> 'a1 instr list) -> 'a1 instr list -> 'a1 instr
    list **)

let remove_assert_c _ remove_assert_i0 c =
  foldr (fun i r -> let i0 = remove_assert_i0 i in cat i0 r) [] c

(** val remove_assert_i : 'a1 asmOp -> 'a1 instr -> 'a1 instr list **)

let rec remove_assert_i asmop i = match i with
| MkI (ii, ir) ->
  (match ir with
   | Cassert _ -> []
   | Cif (e, c1, c2) ->
     let c3 = remove_assert_c asmop (remove_assert_i asmop) c1 in
     let c4 = remove_assert_c asmop (remove_assert_i asmop) c2 in
     (MkI (ii, (Cif (e, c3, c4)))) :: []
   | Cfor (x, r, c) ->
     let c0 = remove_assert_c asmop (remove_assert_i asmop) c in
     (MkI (ii, (Cfor (x, r, c0)))) :: []
   | Cwhile (al, c1, e, ii', c2) ->
     let c3 = remove_assert_c asmop (remove_assert_i asmop) c1 in
     let c4 = remove_assert_c asmop (remove_assert_i asmop) c2 in
     (MkI (ii, (Cwhile (al, c3, e, ii', c4)))) :: []
   | _ -> i :: [])

(** val remove_assert_fd :
    'a1 asmOp -> progT -> 'a1 fundef -> ('a1, extra_fun_t) _fundef **)

let remove_assert_fd asmop _ fd =
  let c = remove_assert_c asmop (remove_assert_i asmop) fd.f_body in
  { f_info = fd.f_info; f_tyin = fd.f_tyin; f_params = fd.f_params; f_body =
  c; f_tyout = fd.f_tyout; f_res = fd.f_res; f_extra = fd.f_extra }

(** val remove_assert_prog : 'a1 asmOp -> progT -> 'a1 prog -> 'a1 prog **)

let remove_assert_prog asmop pT p =
  map_prog asmop pT (remove_assert_fd asmop pT) p
