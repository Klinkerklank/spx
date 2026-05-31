(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)

open Datatypes
open Compiler_util
open Expr
open Seq
open Sopn
open Type
open Utils0
open Var0

module E =
 struct
  (** val pass : string **)

  let pass =
    "inlining"

  (** val inline_error : pp_error -> pp_error_loc **)

  let inline_error msg =
    { pel_msg = msg; pel_fn = None; pel_fi = None; pel_ii = None; pel_vi =
      None; pel_pass = (Some pass); pel_internal = true }
 end

(** val get_flag : lval -> assgn_tag -> assgn_tag **)

let get_flag x flag =
  match x with
  | Lvar x0 -> if is_inline_var x0.v_var then AT_inline else flag
  | _ -> flag

(** val assgn_tuple :
    'a1 asmOp -> instr_info -> lval list -> assgn_tag -> atype list -> pexpr
    list -> 'a1 instr list **)

let assgn_tuple _ iinfo xs flag tys es =
  let assgn = fun xe -> MkI (iinfo, (Cassgn ((fst xe),
    (get_flag (fst xe) flag), (fst (snd xe)), (snd (snd xe)))))
  in
  map assgn (zip xs (zip tys es))

(** val inline_c :
    'a1 asmOp -> ('a1 instr -> SvExtra.Sv.t -> (SvExtra.Sv.t * 'a1 instr
    list) cexec) -> 'a1 instr list -> SvExtra.Sv.t -> (pp_error_loc,
    SvExtra.Sv.t * 'a1 instr list) result **)

let inline_c _ inline_i0 c s =
  foldr (fun i r ->
    match r with
    | Ok x ->
      (match inline_i0 i (fst x) with
       | Ok x0 -> Ok ((fst x0), (cat (snd x0) (snd x)))
       | Error s0 -> Error s0)
    | Error s0 -> Error s0) (Ok (s, [])) c

(** val locals_p : 'a1 asmOp -> 'a1 ufundef -> SvExtra.Sv.t **)

let locals_p asmop fd =
  let s = read_es (map coq_Plvar fd.f_res) in
  let w = write_c_rec asmop s fd.f_body in
  let r = read_c_rec asmop w fd.f_body in
  vrvs_rec r (map (fun x -> Lvar x) fd.f_params)

(** val check_disjoint :
    'a1 asmOp -> 'a1 ufundef -> SvExtra.Sv.t -> (pp_error_loc, unit) result **)

let check_disjoint asmop fd s =
  let s2 = locals_p asmop fd in
  if SvExtra.disjoint s s2
  then Ok ()
  else Error (E.inline_error (PPEstring "invalid refreshing in function"))

(** val get_fun :
    'a1 asmOp -> 'a1 ufun_decls -> funname -> (pp_error_loc, 'a1 fundef)
    result **)

let get_fun _ p f =
  match get_fundef p f with
  | Some fd -> Ok fd
  | None ->
    Error
      (E.inline_error
        (pp_box ((PPEstring "Unknown function") :: ((PPEfunname f) :: []))))

(** val extend_iinfo_i :
    'a1 asmOp -> (instr_info -> instr_info -> instr_info) -> instr_info ->
    'a1 instr -> 'a1 instr **)

let rec extend_iinfo_i asmop extend_iinfo ii = function
| MkI (iinfo, ir) ->
  let ir0 =
    match ir with
    | Cif (e, c1, c2) ->
      Cif (e, (map (extend_iinfo_i asmop extend_iinfo ii) c1),
        (map (extend_iinfo_i asmop extend_iinfo ii) c2))
    | Cfor (x, r, c) ->
      Cfor (x, r, (map (extend_iinfo_i asmop extend_iinfo ii) c))
    | Cwhile (a, c, e, info, c') ->
      Cwhile (a, (map (extend_iinfo_i asmop extend_iinfo ii) c), e, info,
        (map (extend_iinfo_i asmop extend_iinfo ii) c'))
    | _ -> ir
  in
  let iinfo0 = extend_iinfo ii iinfo in MkI (iinfo0, ir0)

(** val extend_iinfo_cmd :
    'a1 asmOp -> (instr_info -> instr_info -> instr_info) -> instr_info ->
    'a1 instr list -> 'a1 instr list **)

let extend_iinfo_cmd asmop extend_iinfo ii c =
  map (extend_iinfo_i asmop extend_iinfo ii) c

(** val inline_i :
    'a1 asmOp -> (instr_info -> instr_info -> instr_info) -> 'a1 ufun_decls
    -> 'a1 instr -> SvExtra.Sv.t -> (SvExtra.Sv.t * 'a1 instr list) cexec **)

let rec inline_i asmop extend_iinfo p i x =
  let MkI (iinfo, ir) = i in
  (match ir with
   | Cif (e, c1, c2) ->
     (match inline_c asmop (inline_i asmop extend_iinfo p) c1 x with
      | Ok x0 ->
        (match inline_c asmop (inline_i asmop extend_iinfo p) c2 x with
         | Ok x1 ->
           Ok ((read_e_rec (SvExtra.Sv.union (fst x0) (fst x1)) e), ((MkI
             (iinfo, (Cif (e, (snd x0), (snd x1))))) :: []))
         | Error s -> Error s)
      | Error s -> Error s)
   | Cfor (x0, r, c) ->
     let x1 = SvExtra.Sv.union (read_i asmop ir) x in
     (match inline_c asmop (inline_i asmop extend_iinfo p) c x1 with
      | Ok x2 -> Ok (x1, ((MkI (iinfo, (Cfor (x0, r, (snd x2))))) :: []))
      | Error s -> Error s)
   | Cwhile (a, c, e, info, c') ->
     let x0 = SvExtra.Sv.union (read_i asmop ir) x in
     (match inline_c asmop (inline_i asmop extend_iinfo p) c x0 with
      | Ok x1 ->
        (match inline_c asmop (inline_i asmop extend_iinfo p) c' x0 with
         | Ok x2 ->
           Ok (x0, ((MkI (iinfo, (Cwhile (a, (snd x1), e, info,
             (snd x2))))) :: []))
         | Error s -> Error s)
      | Error s -> Error s)
   | Ccall (xs, f, es) ->
     let x0 = SvExtra.Sv.union (read_i asmop ir) x in
     if ii_is_inline iinfo
     then (match add_iinfo iinfo (get_fun asmop p f) with
           | Ok x1 ->
             (match add_iinfo iinfo
                      (check_disjoint asmop x1
                        (SvExtra.Sv.union (vrvs xs) x0)) with
              | Ok _ ->
                let ii = ii_with_location iinfo in
                let rename_args =
                  assgn_tuple asmop ii (map (fun x2 -> Lvar x2) x1.f_params)
                    AT_rename x1.f_tyin es
                in
                let body = extend_iinfo_cmd asmop extend_iinfo iinfo x1.f_body
                in
                let rename_res =
                  assgn_tuple asmop ii xs AT_rename x1.f_tyout
                    (map coq_Plvar x1.f_res)
                in
                Ok (x0, (cat rename_args (cat body rename_res)))
              | Error s -> Error s)
           | Error s -> Error s)
     else Ok (x0, (i :: []))
   | _ -> Ok ((SvExtra.Sv.union (read_i asmop ir) x), (i :: [])))

(** val inline_fd :
    'a1 asmOp -> (instr_info -> instr_info -> instr_info) -> 'a1 ufun_decls
    -> 'a1 ufundef -> (pp_error_loc, ('a1, extra_fun_t) _fundef) result **)

let inline_fd asmop extend_iinfo p fd =
  let { f_info = ii; f_tyin = tyin; f_params = params; f_body = c; f_tyout =
    tyout; f_res = res; f_extra = ef } = fd
  in
  let s = read_es (map coq_Plvar res) in
  (match inline_c asmop (inline_i asmop extend_iinfo p) c s with
   | Ok x ->
     Ok { f_info = ii; f_tyin = tyin; f_params = params; f_body = (snd x);
       f_tyout = tyout; f_res = res; f_extra = ef }
   | Error s0 -> Error s0)

(** val inline_fd_cons :
    'a1 asmOp -> (instr_info -> instr_info -> instr_info) -> (funname * 'a1
    ufundef) -> 'a1 ufun_decls cexec -> (pp_error_loc, (funname * 'a1 fundef)
    list) result **)

let inline_fd_cons asmop extend_iinfo ffd = function
| Ok x ->
  let f = fst ffd in
  (match add_funname f
           (add_finfo (snd ffd).f_info
             (inline_fd asmop extend_iinfo x (snd ffd))) with
   | Ok x0 -> Ok ((f, x0) :: x)
   | Error s -> Error s)
| Error s -> Error s

(** val inline_prog :
    'a1 asmOp -> (instr_info -> instr_info -> instr_info) -> 'a1 ufun_decls
    -> 'a1 ufun_decls cexec **)

let inline_prog asmop extend_iinfo p =
  foldr (inline_fd_cons asmop extend_iinfo) (Ok []) p

(** val inline_prog_err :
    'a1 asmOp -> (instr_info -> instr_info -> instr_info) -> 'a1 uprog ->
    (pp_error_loc, ('a1, extra_fun_t, extra_prog_t) _prog) result **)

let inline_prog_err asmop extend_iinfo p =
  if uniq funname_eqType (map (fun x -> fst (Obj.magic x)) p.p_funcs)
  then (match inline_prog asmop extend_iinfo p.p_funcs with
        | Ok x -> Ok { p_funcs = x; p_globs = p.p_globs; p_extra = p.p_extra }
        | Error s -> Error s)
  else Error
         (E.inline_error (PPEstring
           "two function declarations with the same name"))
