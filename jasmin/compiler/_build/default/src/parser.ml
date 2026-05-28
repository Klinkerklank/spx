
(* This generated code requires the following version of MenhirLib: *)

let () =
  MenhirLib.StaticVersion.require_20260209

module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | WHILE
    | UNDERSCORE
    | UNALIGNED
    | T_W of 
# 18 "src/parser.mly"
       (Syntax.swsize)
# 23 "src/parser.ml"
  
    | T_INT_CAST of 
# 19 "src/parser.mly"
       (Syntax.sign)
# 28 "src/parser.ml"
  
    | T_INT
    | T_BOOL
    | TYPE
    | TRUE
    | TO
    | SWSIZE of 
# 71 "src/parser.mly"
       (Syntax.swsize)
# 38 "src/parser.ml"
  
    | SVSIZE of 
# 72 "src/parser.mly"
       (Syntax.svsize)
# 43 "src/parser.ml"
  
    | STRING of 
# 85 "src/parser.mly"
       (string)
# 48 "src/parser.ml"
  
    | STAR
    | STACK
    | SLASH of 
# 73 "src/parser.mly"
       (Syntax.sign option)
# 55 "src/parser.ml"
  
    | SHARPLBRACKET
    | SHARP
    | SEMICOLON
    | RPAREN
    | ROR
    | ROL
    | RETURN
    | REQUIRE
    | REG
    | RBRACKET
    | RBRACE
    | RARROW
    | QUESTIONMARK
    | POINTER
    | PLUS
    | PIPEPIPE
    | PIPE
    | PERCENT of 
# 58 "src/parser.mly"
       (Syntax.sign option)
# 77 "src/parser.ml"
  
    | PARAM
    | NID of 
# 83 "src/parser.mly"
       (string)
# 83 "src/parser.ml"
  
    | NAMESPACE
    | MUTABLE
    | MINUS
    | LTLT
    | LT of 
# 52 "src/parser.mly"
       (Syntax.sign option)
# 92 "src/parser.ml"
  
    | LPAREN
    | LE of 
# 51 "src/parser.mly"
       (Syntax.sign option)
# 98 "src/parser.ml"
  
    | LBRACKET
    | LBRACE
    | INT of 
# 84 "src/parser.mly"
       (Syntax.int_representation)
# 105 "src/parser.ml"
  
    | INLINE
    | IF
    | HAT
    | GTGT of 
# 47 "src/parser.mly"
       (Syntax.sign option)
# 113 "src/parser.ml"
  
    | GT of 
# 46 "src/parser.mly"
       (Syntax.sign option)
# 118 "src/parser.ml"
  
    | GLOBAL
    | GE of 
# 44 "src/parser.mly"
       (Syntax.sign option)
# 124 "src/parser.ml"
  
    | FROM
    | FOR
    | FN
    | FALSE
    | EXPORT
    | EXEC
    | EQEQ
    | EQ
    | EOF
    | ELSE
    | DOWNTO
    | DOT
    | CONSTANT
    | COMMA
    | COLONCOLON
    | COLON
    | BANGEQ
    | BANG
    | ASSERT
    | ARRAYINIT
    | AMPAMP
    | AMP
    | ALIGNED
  
end

include MenhirBasics

# 1 "src/parser.mly"
  

  open Syntax


# 160 "src/parser.ml"

module Tables = struct
  
  include MenhirBasics
  
  let semantic_action =
    [|
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = vd;
          MenhirLib.EngineTypes.startp = _startpos_vd_;
          MenhirLib.EngineTypes.endp = _endpos_vd_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = a;
            MenhirLib.EngineTypes.startp = _startpos_a_;
            MenhirLib.EngineTypes.endp = _endpos_a_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let vd : (Syntax.paramdecls) = Obj.magic vd in
        let a : (Syntax.pannotations) = Obj.magic a in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_a_ in
        let _endpos = _endpos_vd_ in
        let _v : (Syntax.pannotations * Syntax.paramdecls) = 
# 464 "src/parser.mly"
                                     ( (a,vd) )
# 191 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = stoty;
          MenhirLib.EngineTypes.startp = _startpos_stoty_;
          MenhirLib.EngineTypes.endp = _endpos_stoty_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = a;
            MenhirLib.EngineTypes.startp = _startpos_a_;
            MenhirLib.EngineTypes.endp = _endpos_a_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let stoty : (Syntax.pstotype) = Obj.magic stoty in
        let a : (Syntax.pannotations) = Obj.magic a in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_a_ in
        let _endpos = _endpos_stoty_ in
        let _v : (Syntax.pannotations * Syntax.pstotype) = 
# 435 "src/parser.mly"
                                ( (a,stoty) )
# 223 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = v;
          MenhirLib.EngineTypes.startp = _startpos_v_;
          MenhirLib.EngineTypes.endp = _endpos_v_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = k;
            MenhirLib.EngineTypes.startp = _startpos_k_;
            MenhirLib.EngineTypes.endp = _endpos_k_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let v : (Syntax.pattribute option) = Obj.magic v in
        let k : (Syntax.prequire) = Obj.magic k in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_k_ in
        let _endpos = _endpos_v_ in
        let _v : (Syntax.pannotation) = 
# 138 "src/parser.mly"
                                   ( k, v )
# 255 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (string list) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v =
          let id =
            let x =
              let x = 
# 106 "src/parser.mly"
                                               ( String.concat "::" x )
# 283 "src/parser.ml"
               in
              let _endpos = _endpos_x_ in
              let _startpos = _startpos_x_ in
              
# 552 "src/parser.mly"
      ( Location.mk_loc (Location.make _startpos _endpos) x )
# 290 "src/parser.ml"
              
            in
            
# 109 "src/parser.mly"
                ( x )
# 296 "src/parser.ml"
            
          in
          (
# 124 "src/parser.mly"
             (id)
# 302 "src/parser.ml"
           : (Syntax.prequire))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (string) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v =
          let id =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 552 "src/parser.mly"
      ( Location.mk_loc (Location.make _startpos _endpos) x )
# 332 "src/parser.ml"
            
          in
          (
# 125 "src/parser.mly"
                    ( id )
# 338 "src/parser.ml"
           : (Syntax.prequire))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : 
# 85 "src/parser.mly"
       (string)
# 360 "src/parser.ml"
         = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v =
          let s =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 552 "src/parser.mly"
      ( Location.mk_loc (Location.make _startpos _endpos) x )
# 372 "src/parser.ml"
            
          in
          (
# 126 "src/parser.mly"
                  ( s )
# 378 "src/parser.ml"
           : (Syntax.prequire))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = l;
          MenhirLib.EngineTypes.startp = _startpos_l_;
          MenhirLib.EngineTypes.endp = _endpos_l_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let l : (Syntax.pannotations list) = Obj.magic l in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_l_ in
        let _endpos = _endpos_l_ in
        let _v : (Syntax.pannotations) = 
# 147 "src/parser.mly"
                           ( List.concat l )
# 404 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = x;
            MenhirLib.EngineTypes.startp = _startpos_x_;
            MenhirLib.EngineTypes.endp = _endpos_x_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = s;
                MenhirLib.EngineTypes.startp = _startpos_s_;
                MenhirLib.EngineTypes.endp = _endpos_s_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let x : ((unit option * Syntax.swsize Location.located) option * Syntax.pexpr *
  Syntax.pexpr option * [ `Aligned | `Unaligned ] option) = Obj.magic x in
        let _1 : unit = Obj.magic _1 in
        let s : (unit option) = Obj.magic s in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_s_ in
        let _endpos = _endpos__3_ in
        let _v =
          let i =
            let x = 
# 205 "<standard.mly>"
    ( x )
# 453 "src/parser.ml"
             in
            
# 561 "src/parser.mly"
                                     ( x )
# 458 "src/parser.ml"
            
          in
          (
# 252 "src/parser.mly"
                                    (

   let (ws, e, len, al) = i in
   let ws =
      match ws with
      | Some (c, ct) ->
        if c = None then begin
          let sw = string_of_swsize_ty (L.unloc ct) in
          let sd = if s = None then "" else "." in
          Utils.warning Deprecated (Location.of_loc ct)
             "Syntax t%s[%s e] is deprecated. Use t%s[:%s e] instead" sd sw sd sw
        end;
        Some ct
      | None -> None in
   let i = ws, e, len, al in
   let s = if s = None then Warray_.AAscale else Warray_.AAdirect in
   s, i )
# 480 "src/parser.ml"
           : (Warray_.arr_access *
  (Syntax.swsize Location.located option * Syntax.pexpr *
   Syntax.pexpr option * [ `Aligned | `Unaligned ] option)))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = len;
          MenhirLib.EngineTypes.startp = _startpos_len_;
          MenhirLib.EngineTypes.endp = _endpos_len_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = e;
            MenhirLib.EngineTypes.startp = _startpos_e_;
            MenhirLib.EngineTypes.endp = _endpos_e_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = ws;
              MenhirLib.EngineTypes.startp = _startpos_ws_;
              MenhirLib.EngineTypes.endp = _endpos_ws_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = al;
                MenhirLib.EngineTypes.startp = _startpos_al_;
                MenhirLib.EngineTypes.endp = _endpos_al_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let len : (Syntax.pexpr option) = Obj.magic len in
        let e : (Syntax.pexpr) = Obj.magic e in
        let ws : ((unit option * Syntax.swsize Location.located) option) = Obj.magic ws in
        let al : ([ `Aligned | `Unaligned ] option) = Obj.magic al in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_al_ in
        let _endpos = _endpos_len_ in
        let _v : ((unit option * Syntax.swsize Location.located) option * Syntax.pexpr *
  Syntax.pexpr option * [ `Aligned | `Unaligned ] option) = 
# 249 "src/parser.mly"
                                                            ( ws, e, len, al )
# 530 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e;
          MenhirLib.EngineTypes.startp = _startpos_e_;
          MenhirLib.EngineTypes.endp = _endpos_e_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let e : (Syntax.pexpr) = Obj.magic e in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_e_ in
        let _v : (Syntax.pexpr) = 
# 246 "src/parser.mly"
                ( e )
# 562 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let x : (Syntax.psimple_attribute) = Obj.magic x in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_x_ in
        let _v =
          let ap =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 552 "src/parser.mly"
      ( Location.mk_loc (Location.make _startpos _endpos) x )
# 598 "src/parser.ml"
            
          in
          (
# 134 "src/parser.mly"
                                ( ap )
# 604 "src/parser.ml"
           : (Syntax.psimple_attribute Location.located))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = x;
            MenhirLib.EngineTypes.startp = _startpos_x_;
            MenhirLib.EngineTypes.endp = _endpos_x_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _1_inlined1;
              MenhirLib.EngineTypes.startp = _startpos__1_inlined1_;
              MenhirLib.EngineTypes.endp = _endpos__1_inlined1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = _1;
                MenhirLib.EngineTypes.startp = _startpos__1_;
                MenhirLib.EngineTypes.endp = _endpos__1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let x : (Syntax.pannotations) = Obj.magic x in
        let _1_inlined1 : unit = Obj.magic _1_inlined1 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v =
          let s =
            let _startpos__1_ = _startpos__1_inlined1_ in
            let x =
              let x = 
# 205 "<standard.mly>"
    ( x )
# 655 "src/parser.ml"
               in
              
# 564 "src/parser.mly"
                                 ( x )
# 660 "src/parser.ml"
              
            in
            let (_endpos_x_, _startpos_x_) = (_endpos__3_, _startpos__1_) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 552 "src/parser.mly"
      ( Location.mk_loc (Location.make _startpos _endpos) x )
# 669 "src/parser.ml"
            
          in
          (
# 135 "src/parser.mly"
                                   ( Location.mk_loc (Location.loc s) (PAstruct (Location.unloc s)) )
# 675 "src/parser.ml"
           : (Syntax.psimple_attribute Location.located))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Syntax.pcall_conv) = 
# 475 "src/parser.mly"
         ( `Export )
# 701 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Syntax.pcall_conv) = 
# 476 "src/parser.mly"
         ( `Inline )
# 726 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Syntax.cast) = 
# 192 "src/parser.mly"
               ( `ToInt (None) )
# 751 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = s;
          MenhirLib.EngineTypes.startp = _startpos_s_;
          MenhirLib.EngineTypes.endp = _endpos_s_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let s : 
# 19 "src/parser.mly"
       (Syntax.sign)
# 772 "src/parser.ml"
         = Obj.magic s in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_s_ in
        let _endpos = _endpos_s_ in
        let _v : (Syntax.cast) = 
# 193 "src/parser.mly"
               ( `ToInt (Some s))
# 780 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = s;
          MenhirLib.EngineTypes.startp = _startpos_s_;
          MenhirLib.EngineTypes.endp = _endpos_s_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let s : (Syntax.swsize) = Obj.magic s in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_s_ in
        let _endpos = _endpos_s_ in
        let _v : (Syntax.cast) = 
# 194 "src/parser.mly"
               ( `ToWord s )
# 805 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = c;
          MenhirLib.EngineTypes.startp = _startpos_c_;
          MenhirLib.EngineTypes.endp = _endpos_c_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let c : (Syntax.castop) = Obj.magic c in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_c_ in
        let _endpos = _endpos_c_ in
        let _v : (Syntax.castop) = 
# 189 "src/parser.mly"
                  ( c )
# 830 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = s;
          MenhirLib.EngineTypes.startp = _startpos_s_;
          MenhirLib.EngineTypes.endp = _endpos_s_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let s : (Syntax.swsize) = Obj.magic s in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_s_ in
        let _endpos = _endpos_s_ in
        let _v : (Syntax.castop1) = 
# 184 "src/parser.mly"
           ( CSS s )
# 855 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = s;
          MenhirLib.EngineTypes.startp = _startpos_s_;
          MenhirLib.EngineTypes.endp = _endpos_s_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let s : (Syntax.svsize) = Obj.magic s in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_s_ in
        let _endpos = _endpos_s_ in
        let _v : (Syntax.castop1) = 
# 185 "src/parser.mly"
           ( CVS s )
# 880 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = s;
          MenhirLib.EngineTypes.startp = _startpos_s_;
          MenhirLib.EngineTypes.endp = _endpos_s_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let s : (Syntax.swsize) = Obj.magic s in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_s_ in
        let _v : (Syntax.castop1) = 
# 186 "src/parser.mly"
                ( CSS s )
# 912 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let x : (string list) = Obj.magic x in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_x_ in
        let _v =
          let id =
            let x =
              let x = 
# 106 "src/parser.mly"
                                               ( String.concat "::" x )
# 947 "src/parser.ml"
               in
              let _endpos = _endpos_x_ in
              let _startpos = _startpos_x_ in
              
# 552 "src/parser.mly"
      ( Location.mk_loc (Location.make _startpos _endpos) x )
# 954 "src/parser.ml"
              
            in
            
# 109 "src/parser.mly"
                ( x )
# 960 "src/parser.ml"
            
          in
          (
# 520 "src/parser.mly"
                ( id )
# 966 "src/parser.ml"
           : (Annotations.pident))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = x;
            MenhirLib.EngineTypes.startp = _startpos_x_;
            MenhirLib.EngineTypes.endp = _endpos_x_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _1_inlined1;
              MenhirLib.EngineTypes.startp = _startpos__1_inlined1_;
              MenhirLib.EngineTypes.endp = _endpos__1_inlined1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = _1;
                MenhirLib.EngineTypes.startp = _startpos__1_;
                MenhirLib.EngineTypes.endp = _endpos__1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let x : (Syntax.pannotations) = Obj.magic x in
        let _1_inlined1 : unit = Obj.magic _1_inlined1 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v =
          let s =
            let _startpos__1_ = _startpos__1_inlined1_ in
            let x =
              let x = 
# 205 "<standard.mly>"
    ( x )
# 1017 "src/parser.ml"
               in
              
# 564 "src/parser.mly"
                                 ( x )
# 1022 "src/parser.ml"
              
            in
            let (_endpos_x_, _startpos_x_) = (_endpos__3_, _startpos__1_) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 552 "src/parser.mly"
      ( Location.mk_loc (Location.make _startpos _endpos) x )
# 1031 "src/parser.ml"
            
          in
          (
# 361 "src/parser.mly"
                                           ( s )
# 1037 "src/parser.ml"
           : (Syntax.pannotations Location.located))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (string) = 
# 118 "src/parser.mly"
           ( "inline" )
# 1063 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (string) = 
# 119 "src/parser.mly"
           ( "export" )
# 1088 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (string) = 
# 120 "src/parser.mly"
           ( "reg" )
# 1113 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (string) = 
# 121 "src/parser.mly"
           ( "stack" )
# 1138 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (Syntax.pprogram) = 
# 216 "<standard.mly>"
    ( [] )
# 1156 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = xs;
          MenhirLib.EngineTypes.startp = _startpos_xs_;
          MenhirLib.EngineTypes.endp = _endpos_xs_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = x;
            MenhirLib.EngineTypes.startp = _startpos_x_;
            MenhirLib.EngineTypes.endp = _endpos_x_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let xs : (Syntax.pprogram) = Obj.magic xs in
        let x : (Syntax.pitem) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v =
          let x =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 552 "src/parser.mly"
      ( Location.mk_loc (Location.make _startpos _endpos) x )
# 1192 "src/parser.ml"
            
          in
          (
# 219 "<standard.mly>"
    ( x :: xs )
# 1198 "src/parser.ml"
           : (Syntax.pprogram))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (Syntax.pblock_r) = 
# 216 "<standard.mly>"
    ( [] )
# 1217 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = xs;
          MenhirLib.EngineTypes.startp = _startpos_xs_;
          MenhirLib.EngineTypes.endp = _endpos_xs_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = x;
            MenhirLib.EngineTypes.startp = _startpos_x_;
            MenhirLib.EngineTypes.endp = _endpos_x_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let xs : (Syntax.pblock_r) = Obj.magic xs in
        let x : (Syntax.pinstr) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : (Syntax.pblock_r) = 
# 219 "<standard.mly>"
    ( x :: xs )
# 1249 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (Syntax.pannotations list) = 
# 216 "<standard.mly>"
    ( [] )
# 1267 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = xs;
          MenhirLib.EngineTypes.startp = _startpos_xs_;
          MenhirLib.EngineTypes.endp = _endpos_xs_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = x;
            MenhirLib.EngineTypes.startp = _startpos_x_;
            MenhirLib.EngineTypes.endp = _endpos_x_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let xs : (Syntax.pannotations list) = Obj.magic xs in
        let x : (Syntax.pannotations) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : (Syntax.pannotations list) = 
# 219 "<standard.mly>"
    ( x :: xs )
# 1299 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : ((Syntax.pannotations * Syntax.paramdecls) list) = 
# 145 "<standard.mly>"
    ( [] )
# 1317 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : ((Syntax.pannotations * Syntax.paramdecls) list) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : ((Syntax.pannotations * Syntax.paramdecls) list) = 
# 148 "<standard.mly>"
    ( x )
# 1342 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : ((Syntax.pannotations * Syntax.pstotype) list) = 
# 145 "<standard.mly>"
    ( [] )
# 1360 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : ((Syntax.pannotations * Syntax.pstotype) list) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : ((Syntax.pannotations * Syntax.pstotype) list) = 
# 148 "<standard.mly>"
    ( x )
# 1385 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (Syntax.pannotations) = 
# 145 "<standard.mly>"
    ( [] )
# 1403 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Syntax.pannotations) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (Syntax.pannotations) = 
# 148 "<standard.mly>"
    ( x )
# 1428 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (Syntax.pexpr list) = 
# 145 "<standard.mly>"
    ( [] )
# 1446 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Syntax.pexpr list) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (Syntax.pexpr list) = 
# 148 "<standard.mly>"
    ( x )
# 1471 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (Syntax.pexpr list) = 
# 145 "<standard.mly>"
    ( [] )
# 1489 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Syntax.pexpr list) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (Syntax.pexpr list) = 
# 148 "<standard.mly>"
    ( x )
# 1514 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : ((string * string) list) = 
# 145 "<standard.mly>"
    ( [] )
# 1532 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : ((string * string) list) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : ((string * string) list) = 
# 148 "<standard.mly>"
    ( x )
# 1557 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (Annotations.pident list) = 
# 145 "<standard.mly>"
    ( [] )
# 1575 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Annotations.pident list) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (Annotations.pident list) = 
# 148 "<standard.mly>"
    ( x )
# 1600 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _2;
          MenhirLib.EngineTypes.startp = _startpos__2_;
          MenhirLib.EngineTypes.endp = _endpos__2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = pfs;
            MenhirLib.EngineTypes.startp = _startpos_pfs_;
            MenhirLib.EngineTypes.endp = _endpos_pfs_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let _2 : unit = Obj.magic _2 in
        let pfs : (Syntax.pprogram) = Obj.magic pfs in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_pfs_ in
        let _endpos = _endpos__2_ in
        let _v : (Syntax.pprogram) = 
# 539 "src/parser.mly"
    ( pfs )
# 1632 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v =
          let _endpos = _endpos__1_ in
          let _startpos = _startpos__1_ in
          (
# 542 "src/parser.mly"
   ( Syntax.parse_error (Location.make _startpos _endpos) )
# 1660 "src/parser.ml"
           : (Syntax.pprogram))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Syntax.prequire) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (Syntax.prequire list) = 
# 228 "<standard.mly>"
    ( [ x ] )
# 1686 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = xs;
          MenhirLib.EngineTypes.startp = _startpos_xs_;
          MenhirLib.EngineTypes.endp = _endpos_xs_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = x;
            MenhirLib.EngineTypes.startp = _startpos_x_;
            MenhirLib.EngineTypes.endp = _endpos_x_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let xs : (Syntax.prequire list) = Obj.magic xs in
        let x : (Syntax.prequire) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : (Syntax.prequire list) = 
# 231 "<standard.mly>"
    ( x :: xs )
# 1718 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (unit option) = 
# 111 "<standard.mly>"
    ( None )
# 1736 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : unit = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (unit option) = 
# 114 "<standard.mly>"
    ( Some x )
# 1761 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (unit option) = 
# 111 "<standard.mly>"
    ( None )
# 1779 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : unit = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (unit option) = 
# 114 "<standard.mly>"
    ( Some x )
# 1804 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (unit option) = 
# 111 "<standard.mly>"
    ( None )
# 1822 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : unit = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (unit option) = 
# 114 "<standard.mly>"
    ( Some x )
# 1847 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (Annotations.pident list option) = 
# 111 "<standard.mly>"
    ( None )
# 1865 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _3_inlined1;
            MenhirLib.EngineTypes.startp = _startpos__3_inlined1_;
            MenhirLib.EngineTypes.endp = _endpos__3_inlined1_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = xs;
              MenhirLib.EngineTypes.startp = _startpos_xs_;
              MenhirLib.EngineTypes.endp = _endpos_xs_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _1_inlined1;
                MenhirLib.EngineTypes.startp = _startpos__1_inlined1_;
                MenhirLib.EngineTypes.endp = _endpos__1_inlined1_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _menhir_s;
                  MenhirLib.EngineTypes.semv = _1;
                  MenhirLib.EngineTypes.startp = _startpos__1_;
                  MenhirLib.EngineTypes.endp = _endpos__1_;
                  MenhirLib.EngineTypes.next = _menhir_stack;
                };
              };
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let _3_inlined1 : unit = Obj.magic _3_inlined1 in
        let xs : (Annotations.pident list) = Obj.magic xs in
        let _1_inlined1 : unit = Obj.magic _1_inlined1 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v =
          let x =
            let vs =
              let s =
                let x =
                  let x =
                    let s = 
# 241 "<standard.mly>"
    ( xs )
# 1924 "src/parser.ml"
                     in
                    
# 567 "src/parser.mly"
                             ( s )
# 1929 "src/parser.ml"
                    
                  in
                  
# 205 "<standard.mly>"
    ( x )
# 1935 "src/parser.ml"
                  
                in
                
# 558 "src/parser.mly"
                                 ( x )
# 1941 "src/parser.ml"
                
              in
              
# 573 "src/parser.mly"
                                    ( s )
# 1947 "src/parser.ml"
              
            in
            
# 469 "src/parser.mly"
                                                   ( vs )
# 1953 "src/parser.ml"
            
          in
          (
# 114 "<standard.mly>"
    ( Some x )
# 1959 "src/parser.ml"
           : (Annotations.pident list option))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = xs;
            MenhirLib.EngineTypes.startp = _startpos_xs_;
            MenhirLib.EngineTypes.endp = _endpos_xs_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let xs : (Annotations.pident list) = Obj.magic xs in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v =
          let x =
            let vs =
              let s =
                let s = 
# 241 "<standard.mly>"
    ( xs )
# 2003 "src/parser.ml"
                 in
                
# 567 "src/parser.mly"
                             ( s )
# 2008 "src/parser.ml"
                
              in
              
# 573 "src/parser.mly"
                                    ( s )
# 2014 "src/parser.ml"
              
            in
            
# 469 "src/parser.mly"
                                                   ( vs )
# 2020 "src/parser.ml"
            
          in
          (
# 114 "<standard.mly>"
    ( Some x )
# 2026 "src/parser.ml"
           : (Annotations.pident list option))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : ((unit option * Syntax.swsize Location.located) option) = 
# 111 "<standard.mly>"
    ( None )
# 2045 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let x : (Syntax.swsize) = Obj.magic x in
        let c : (unit option) = Obj.magic c in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_c_ in
        let _endpos = _endpos_x_ in
        let _v =
          let x =
            let ct =
              let _endpos = _endpos_x_ in
              let _startpos = _startpos_x_ in
              
# 552 "src/parser.mly"
      ( Location.mk_loc (Location.make _startpos _endpos) x )
# 2082 "src/parser.ml"
              
            in
            
# 232 "src/parser.mly"
                          ( c, ct )
# 2088 "src/parser.ml"
            
          in
          (
# 114 "<standard.mly>"
    ( Some x )
# 2094 "src/parser.ml"
           : ((unit option * Syntax.swsize Location.located) option))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (Syntax.pexpr option) = 
# 111 "<standard.mly>"
    ( None )
# 2113 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Syntax.pexpr) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (Syntax.pexpr option) = 
# 114 "<standard.mly>"
    ( Some x )
# 2138 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (Syntax.pattribute option) = 
# 111 "<standard.mly>"
    ( None )
# 2156 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Syntax.psimple_attribute Location.located) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (Syntax.pattribute option) = 
# 114 "<standard.mly>"
    ( Some x )
# 2181 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (Syntax.pcall_conv option) = 
# 111 "<standard.mly>"
    ( None )
# 2199 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Syntax.pcall_conv) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (Syntax.pcall_conv option) = 
# 114 "<standard.mly>"
    ( Some x )
# 2224 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (Annotations.pident option) = 
# 111 "<standard.mly>"
    ( None )
# 2242 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Annotations.pident) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (Annotations.pident option) = 
# 114 "<standard.mly>"
    ( Some x )
# 2267 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (Syntax.castop) = 
# 111 "<standard.mly>"
    ( None )
# 2285 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Syntax.castop1) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v =
          let x =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 552 "src/parser.mly"
      ( Location.mk_loc (Location.make _startpos _endpos) x )
# 2314 "src/parser.ml"
            
          in
          (
# 114 "<standard.mly>"
    ( Some x )
# 2320 "src/parser.ml"
           : (Syntax.castop))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (Syntax.pblock option) = 
# 111 "<standard.mly>"
    ( None )
# 2339 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Syntax.pblock) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (Syntax.pblock option) = 
# 114 "<standard.mly>"
    ( Some x )
# 2364 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (Syntax.writable option option) = 
# 111 "<standard.mly>"
    ( None )
# 2382 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Syntax.writable option) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (Syntax.writable option option) = 
# 114 "<standard.mly>"
    ( Some x )
# 2407 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (Syntax.pexpr option) = 
# 111 "<standard.mly>"
    ( None )
# 2425 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let x : (Syntax.pexpr) = Obj.magic x in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_x_ in
        let _v =
          let x = 
# 555 "src/parser.mly"
        ( x )
# 2458 "src/parser.ml"
           in
          (
# 114 "<standard.mly>"
    ( Some x )
# 2463 "src/parser.ml"
           : (Syntax.pexpr option))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : ((Syntax.pannotations * Syntax.pstotype) list option) = 
# 111 "<standard.mly>"
    ( None )
# 2482 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = xs;
            MenhirLib.EngineTypes.startp = _startpos_xs_;
            MenhirLib.EngineTypes.endp = _endpos_xs_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _1_inlined1;
              MenhirLib.EngineTypes.startp = _startpos__1_inlined1_;
              MenhirLib.EngineTypes.endp = _endpos__1_inlined1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = _1;
                MenhirLib.EngineTypes.startp = _startpos__1_;
                MenhirLib.EngineTypes.endp = _endpos__1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let xs : ((Syntax.pannotations * Syntax.pstotype) list) = Obj.magic xs in
        let _1_inlined1 : unit = Obj.magic _1_inlined1 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v =
          let x =
            let x =
              let s =
                let x =
                  let x =
                    let s = 
# 241 "<standard.mly>"
    ( xs )
# 2534 "src/parser.ml"
                     in
                    
# 567 "src/parser.mly"
                             ( s )
# 2539 "src/parser.ml"
                    
                  in
                  
# 205 "<standard.mly>"
    ( x )
# 2545 "src/parser.ml"
                  
                in
                
# 558 "src/parser.mly"
                                 ( x )
# 2551 "src/parser.ml"
                
              in
              
# 573 "src/parser.mly"
                                    ( s )
# 2557 "src/parser.ml"
              
            in
            
# 555 "src/parser.mly"
        ( x )
# 2563 "src/parser.ml"
            
          in
          (
# 114 "<standard.mly>"
    ( Some x )
# 2569 "src/parser.ml"
           : ((Syntax.pannotations * Syntax.pstotype) list option))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = xs;
          MenhirLib.EngineTypes.startp = _startpos_xs_;
          MenhirLib.EngineTypes.endp = _endpos_xs_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let xs : ((Syntax.pannotations * Syntax.pstotype) list) = Obj.magic xs in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_xs_ in
        let _v =
          let x =
            let x =
              let s =
                let s = 
# 241 "<standard.mly>"
    ( xs )
# 2606 "src/parser.ml"
                 in
                
# 567 "src/parser.mly"
                             ( s )
# 2611 "src/parser.ml"
                
              in
              
# 573 "src/parser.mly"
                                    ( s )
# 2617 "src/parser.ml"
              
            in
            
# 555 "src/parser.mly"
        ( x )
# 2623 "src/parser.ml"
            
          in
          (
# 114 "<standard.mly>"
    ( Some x )
# 2629 "src/parser.ml"
           : ((Syntax.pannotations * Syntax.pstotype) list option))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : ([ `Aligned | `Unaligned ] option) = 
# 111 "<standard.mly>"
    ( None )
# 2648 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v =
          let x = 
# 228 "src/parser.mly"
          ( `Aligned )
# 2674 "src/parser.ml"
           in
          (
# 114 "<standard.mly>"
    ( Some x )
# 2679 "src/parser.ml"
           : ([ `Aligned | `Unaligned ] option))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v =
          let x = 
# 229 "src/parser.mly"
            ( `Unaligned )
# 2706 "src/parser.ml"
           in
          (
# 114 "<standard.mly>"
    ( Some x )
# 2711 "src/parser.ml"
           : ([ `Aligned | `Unaligned ] option))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let _menhir_s = _menhir_env.MenhirLib.EngineTypes.current in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _endpos = _startpos in
        let _v : (Syntax.writable option) = 
# 111 "<standard.mly>"
    ( None )
# 2730 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Syntax.writable) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (Syntax.writable option) = 
# 114 "<standard.mly>"
    ( Some x )
# 2755 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Syntax.pblock_r) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v =
          let s =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 552 "src/parser.mly"
      ( Location.mk_loc (Location.make _startpos _endpos) x )
# 2784 "src/parser.ml"
            
          in
          (
# 426 "src/parser.mly"
                  ( s )
# 2790 "src/parser.ml"
           : (Syntax.pblock))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = x;
            MenhirLib.EngineTypes.startp = _startpos_x_;
            MenhirLib.EngineTypes.endp = _endpos_x_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let x : (Syntax.pblock_r) = Obj.magic x in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v =
          let s =
            let x = 
# 205 "<standard.mly>"
    ( x )
# 2832 "src/parser.ml"
             in
            
# 564 "src/parser.mly"
                                 ( x )
# 2837 "src/parser.ml"
            
          in
          (
# 423 "src/parser.mly"
                    ( s )
# 2843 "src/parser.ml"
           : (Syntax.pblock_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Syntax.pblock_r) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v =
          let s =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 552 "src/parser.mly"
      ( Location.mk_loc (Location.make _startpos _endpos) x )
# 2873 "src/parser.ml"
            
          in
          (
# 416 "src/parser.mly"
                 ( s )
# 2879 "src/parser.ml"
           : (Syntax.pblock))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = s;
          MenhirLib.EngineTypes.startp = _startpos_s_;
          MenhirLib.EngineTypes.endp = _endpos_s_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let s : (Syntax.pblock) = Obj.magic s in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_s_ in
        let _endpos = _endpos_s_ in
        let _v : (Syntax.pblock) = 
# 417 "src/parser.mly"
           ( s )
# 2905 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Syntax.pinstr_r) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v =
          let s =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 552 "src/parser.mly"
      ( Location.mk_loc (Location.make _startpos _endpos) x )
# 2934 "src/parser.ml"
            
          in
          (
# 413 "src/parser.mly"
             ( [([], s)] )
# 2940 "src/parser.ml"
           : (Syntax.pblock_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Syntax.peqop) = 
# 326 "src/parser.mly"
                     ( `Raw    )
# 2966 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let c : (Syntax.castop) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v : (Syntax.peqop) = 
# 327 "src/parser.mly"
                     ( `Add  c )
# 3005 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let c : (Syntax.castop) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v : (Syntax.peqop) = 
# 328 "src/parser.mly"
                     ( `Sub  c )
# 3044 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let c : (Syntax.castop) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v : (Syntax.peqop) = 
# 329 "src/parser.mly"
                     ( `Mul  c )
# 3083 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = s;
              MenhirLib.EngineTypes.startp = _startpos_s_;
              MenhirLib.EngineTypes.endp = _endpos_s_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let c : (Syntax.castop) = Obj.magic c in
        let s : 
# 73 "src/parser.mly"
       (Syntax.sign option)
# 3118 "src/parser.ml"
         = Obj.magic s in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_s_ in
        let _endpos = _endpos__3_ in
        let _v : (Syntax.peqop) = 
# 330 "src/parser.mly"
                         ( `Div  (s, c) )
# 3126 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = s;
              MenhirLib.EngineTypes.startp = _startpos_s_;
              MenhirLib.EngineTypes.endp = _endpos_s_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let c : (Syntax.castop) = Obj.magic c in
        let s : 
# 58 "src/parser.mly"
       (Syntax.sign option)
# 3161 "src/parser.ml"
         = Obj.magic s in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_s_ in
        let _endpos = _endpos__3_ in
        let _v : (Syntax.peqop) = 
# 331 "src/parser.mly"
                         ( `Mod (s, c) )
# 3169 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = s;
              MenhirLib.EngineTypes.startp = _startpos_s_;
              MenhirLib.EngineTypes.endp = _endpos_s_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let c : (Syntax.castop) = Obj.magic c in
        let s : 
# 47 "src/parser.mly"
       (Syntax.sign option)
# 3204 "src/parser.ml"
         = Obj.magic s in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_s_ in
        let _endpos = _endpos__3_ in
        let _v : (Syntax.peqop) = 
# 332 "src/parser.mly"
                         ( `ShR (s, c) )
# 3212 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let c : (Syntax.castop) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v : (Syntax.peqop) = 
# 333 "src/parser.mly"
                     ( `ShL  c )
# 3251 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let c : (Syntax.castop) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v : (Syntax.peqop) = 
# 334 "src/parser.mly"
                     ( `ROR  c )
# 3290 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let c : (Syntax.castop) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v : (Syntax.peqop) = 
# 335 "src/parser.mly"
                     ( `ROL  c )
# 3329 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let c : (Syntax.castop) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v : (Syntax.peqop) = 
# 336 "src/parser.mly"
                     ( `BAnd c )
# 3368 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let c : (Syntax.castop) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v : (Syntax.peqop) = 
# 337 "src/parser.mly"
                     ( `BXOr c )
# 3407 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let c : (Syntax.castop) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v : (Syntax.peqop) = 
# 338 "src/parser.mly"
                     ( `BOr  c )
# 3446 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = xs;
            MenhirLib.EngineTypes.startp = _startpos_xs_;
            MenhirLib.EngineTypes.endp = _endpos_xs_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _1_inlined1;
              MenhirLib.EngineTypes.startp = _startpos__1_inlined1_;
              MenhirLib.EngineTypes.endp = _endpos__1_inlined1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = x;
                MenhirLib.EngineTypes.startp = _startpos_x_;
                MenhirLib.EngineTypes.endp = _endpos_x_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _menhir_s;
                  MenhirLib.EngineTypes.semv = _1;
                  MenhirLib.EngineTypes.startp = _startpos__1_;
                  MenhirLib.EngineTypes.endp = _endpos__1_;
                  MenhirLib.EngineTypes.next = _menhir_stack;
                };
              };
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let xs : ((string * string) list) = Obj.magic xs in
        let _1_inlined1 : unit = Obj.magic _1_inlined1 in
        let x : (string list) = Obj.magic x in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v =
          let pex_mem =
            let s =
              let x =
                let x =
                  let s = 
# 241 "<standard.mly>"
    ( xs )
# 3504 "src/parser.ml"
                   in
                  
# 567 "src/parser.mly"
                             ( s )
# 3509 "src/parser.ml"
                  
                in
                
# 205 "<standard.mly>"
    ( x )
# 3515 "src/parser.ml"
                
              in
              
# 558 "src/parser.mly"
                                 ( x )
# 3521 "src/parser.ml"
              
            in
            
# 579 "src/parser.mly"
                      ( s )
# 3527 "src/parser.ml"
            
          in
          let pex_name =
            let x =
              let x = 
# 106 "src/parser.mly"
                                               ( String.concat "::" x )
# 3535 "src/parser.ml"
               in
              let _endpos = _endpos_x_ in
              let _startpos = _startpos_x_ in
              
# 552 "src/parser.mly"
      ( Location.mk_loc (Location.make _startpos _endpos) x )
# 3542 "src/parser.ml"
              
            in
            
# 109 "src/parser.mly"
                ( x )
# 3548 "src/parser.ml"
            
          in
          (
# 510 "src/parser.mly"
                                                  ( { pex_name ; pex_mem } )
# 3554 "src/parser.ml"
           : (Syntax.pexec))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Syntax.pexpr_r) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v =
          let e =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 552 "src/parser.mly"
      ( Location.mk_loc (Location.make _startpos _endpos) x )
# 3584 "src/parser.ml"
            
          in
          (
# 322 "src/parser.mly"
                 ( e )
# 3590 "src/parser.ml"
           : (Syntax.pexpr))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Syntax.pexpr_r) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v =
          let e =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 552 "src/parser.mly"
      ( Location.mk_loc (Location.make _startpos _endpos) x )
# 3620 "src/parser.ml"
            
          in
          (
# 316 "src/parser.mly"
                                    ( e )
# 3626 "src/parser.ml"
           : (Syntax.pexpr))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = v;
          MenhirLib.EngineTypes.startp = _startpos_v_;
          MenhirLib.EngineTypes.endp = _endpos_v_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let v : (Annotations.pident) = Obj.magic v in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_v_ in
        let _endpos = _endpos_v_ in
        let _v : (Syntax.pexpr_r) = 
# 272 "src/parser.mly"
    ( PEVar v )
# 3652 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = i;
          MenhirLib.EngineTypes.startp = _startpos_i_;
          MenhirLib.EngineTypes.endp = _endpos_i_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = v;
            MenhirLib.EngineTypes.startp = _startpos_v_;
            MenhirLib.EngineTypes.endp = _endpos_v_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let i : (Warray_.arr_access *
  (Syntax.swsize Location.located option * Syntax.pexpr *
   Syntax.pexpr option * [ `Aligned | `Unaligned ] option)) = Obj.magic i in
        let v : (Annotations.pident) = Obj.magic v in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_v_ in
        let _endpos = _endpos_i_ in
        let _v : (Syntax.pexpr_r) = 
# 275 "src/parser.mly"
    ( let aa, (ws, e, len, al) = i in PEGet (al, aa, ws, v, e, len) )
# 3686 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Syntax.pexpr_r) = 
# 278 "src/parser.mly"
    ( PEBool true )
# 3711 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Syntax.pexpr_r) = 
# 281 "src/parser.mly"
    ( PEBool false )
# 3736 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = i;
          MenhirLib.EngineTypes.startp = _startpos_i_;
          MenhirLib.EngineTypes.endp = _endpos_i_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let i : 
# 84 "src/parser.mly"
       (Syntax.int_representation)
# 3757 "src/parser.ml"
         = Obj.magic i in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_i_ in
        let _endpos = _endpos_i_ in
        let _v : (Syntax.pexpr_r) = 
# 284 "src/parser.mly"
    ( PEInt i )
# 3765 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _5;
          MenhirLib.EngineTypes.startp = _startpos__5_;
          MenhirLib.EngineTypes.endp = _endpos__5_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = e;
            MenhirLib.EngineTypes.startp = _startpos_e_;
            MenhirLib.EngineTypes.endp = _endpos_e_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = ct;
              MenhirLib.EngineTypes.startp = _startpos_ct_;
              MenhirLib.EngineTypes.endp = _endpos_ct_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = al;
                MenhirLib.EngineTypes.startp = _startpos_al_;
                MenhirLib.EngineTypes.endp = _endpos_al_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _menhir_s;
                  MenhirLib.EngineTypes.semv = _1;
                  MenhirLib.EngineTypes.startp = _startpos__1_;
                  MenhirLib.EngineTypes.endp = _endpos__1_;
                  MenhirLib.EngineTypes.next = _menhir_stack;
                };
              };
            };
          };
        } = _menhir_stack in
        let _5 : unit = Obj.magic _5 in
        let e : (Syntax.pexpr) = Obj.magic e in
        let ct : ((unit option * Syntax.swsize Location.located) option) = Obj.magic ct in
        let al : ([ `Aligned | `Unaligned ] option) = Obj.magic al in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__5_ in
        let _v =
          let ma = 
# 236 "src/parser.mly"
  (
    let ct =
      match ct with
      | Some (c, ct) ->
        if c = None then Syntax.parse_error ~msg:"`:` expected" (L.loc ct);
        Some ct
      | None -> None in
    al, ct, e )
# 3826 "src/parser.ml"
           in
          (
# 287 "src/parser.mly"
    ( PEFetch ma )
# 3831 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _4;
          MenhirLib.EngineTypes.startp = _startpos__4_;
          MenhirLib.EngineTypes.endp = _endpos__4_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = s;
            MenhirLib.EngineTypes.startp = _startpos_s_;
            MenhirLib.EngineTypes.endp = _endpos_s_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _2;
              MenhirLib.EngineTypes.startp = _startpos__2_;
              MenhirLib.EngineTypes.endp = _endpos__2_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _3;
                MenhirLib.EngineTypes.startp = _startpos__3_;
                MenhirLib.EngineTypes.endp = _endpos__3_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = x;
                  MenhirLib.EngineTypes.startp = _startpos_x_;
                  MenhirLib.EngineTypes.endp = _endpos_x_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _menhir_s;
                    MenhirLib.EngineTypes.semv = _1;
                    MenhirLib.EngineTypes.startp = _startpos__1_;
                    MenhirLib.EngineTypes.endp = _endpos__1_;
                    MenhirLib.EngineTypes.next = _menhir_stack;
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let _4 : unit = Obj.magic _4 in
        let s : (Syntax.pexpr list) = Obj.magic s in
        let _2 : unit = Obj.magic _2 in
        let _3 : unit = Obj.magic _3 in
        let x : (Syntax.svsize) = Obj.magic x in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__4_ in
        let _v =
          let es = 
# 570 "src/parser.mly"
                                      ( s )
# 3893 "src/parser.ml"
           in
          let ct =
            let x = 
# 205 "<standard.mly>"
    ( x )
# 3899 "src/parser.ml"
             in
            
# 558 "src/parser.mly"
                                 ( x )
# 3904 "src/parser.ml"
            
          in
          (
# 290 "src/parser.mly"
    ( PEpack(ct,es) )
# 3910 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = e;
          MenhirLib.EngineTypes.startp = _startpos_e_;
          MenhirLib.EngineTypes.endp = _endpos_e_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let e : 
# 85 "src/parser.mly"
       (string)
# 3932 "src/parser.ml"
         = Obj.magic e in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e_ in
        let _endpos = _endpos_e_ in
        let _v : (Syntax.pexpr_r) = 
# 292 "src/parser.mly"
             ( PEstring e )
# 3940 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e;
          MenhirLib.EngineTypes.startp = _startpos_e_;
          MenhirLib.EngineTypes.endp = _endpos_e_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _3;
            MenhirLib.EngineTypes.startp = _startpos__3_;
            MenhirLib.EngineTypes.endp = _endpos__3_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = _1;
                MenhirLib.EngineTypes.startp = _startpos__1_;
                MenhirLib.EngineTypes.endp = _endpos__1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e : (Syntax.pexpr) = Obj.magic e in
        let _3 : unit = Obj.magic _3 in
        let x : (Syntax.cast) = Obj.magic x in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_e_ in
        let _v =
          let ct =
            let x = 
# 205 "<standard.mly>"
    ( x )
# 3988 "src/parser.ml"
             in
            
# 558 "src/parser.mly"
                                 ( x )
# 3993 "src/parser.ml"
            
          in
          (
# 295 "src/parser.mly"
    ( PEOp1 (`Cast(ct), e) )
# 3999 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e;
          MenhirLib.EngineTypes.startp = _startpos_e_;
          MenhirLib.EngineTypes.endp = _endpos_e_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let e : (Syntax.pexpr) = Obj.magic e in
        let c : (Syntax.castop) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_e_ in
        let _v =
          let o = 
# 199 "src/parser.mly"
                    ( `Not c  )
# 4040 "src/parser.ml"
           in
          (
# 298 "src/parser.mly"
    ( PEOp1 (o, e) )
# 4045 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e;
          MenhirLib.EngineTypes.startp = _startpos_e_;
          MenhirLib.EngineTypes.endp = _endpos_e_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let e : (Syntax.pexpr) = Obj.magic e in
        let c : (Syntax.castop) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_e_ in
        let _v =
          let o = 
# 200 "src/parser.mly"
                    ( `Neg c  )
# 4086 "src/parser.ml"
           in
          (
# 298 "src/parser.mly"
    ( PEOp1 (o, e) )
# 4091 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = e1;
              MenhirLib.EngineTypes.startp = _startpos_e1_;
              MenhirLib.EngineTypes.endp = _endpos_e1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let _1 : unit = Obj.magic _1 in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 203 "src/parser.mly"
                       ( `And   )
# 4132 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 4137 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = e1;
              MenhirLib.EngineTypes.startp = _startpos_e1_;
              MenhirLib.EngineTypes.endp = _endpos_e1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let _1 : unit = Obj.magic _1 in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 204 "src/parser.mly"
                       ( `Or    )
# 4178 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 4183 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 205 "src/parser.mly"
                       ( `Add  c)
# 4231 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 4236 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 206 "src/parser.mly"
                       ( `Sub  c)
# 4284 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 4289 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 207 "src/parser.mly"
                       ( `Mul  c)
# 4337 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 4342 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = s;
              MenhirLib.EngineTypes.startp = _startpos_s_;
              MenhirLib.EngineTypes.endp = _endpos_s_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let s : 
# 73 "src/parser.mly"
       (Syntax.sign option)
# 4384 "src/parser.ml"
         = Obj.magic s in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 208 "src/parser.mly"
                       ( `Div (s,c))
# 4394 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 4399 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = s;
              MenhirLib.EngineTypes.startp = _startpos_s_;
              MenhirLib.EngineTypes.endp = _endpos_s_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let s : 
# 58 "src/parser.mly"
       (Syntax.sign option)
# 4441 "src/parser.ml"
         = Obj.magic s in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 209 "src/parser.mly"
                       ( `Mod (s,c))
# 4451 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 4456 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 210 "src/parser.mly"
                       ( `BAnd c)
# 4504 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 4509 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 211 "src/parser.mly"
                       ( `BOr  c)
# 4557 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 4562 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 212 "src/parser.mly"
                       ( `BXOr c)
# 4610 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 4615 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 213 "src/parser.mly"
                       ( `ShL  c)
# 4663 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 4668 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = s;
              MenhirLib.EngineTypes.startp = _startpos_s_;
              MenhirLib.EngineTypes.endp = _endpos_s_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let s : 
# 47 "src/parser.mly"
       (Syntax.sign option)
# 4710 "src/parser.ml"
         = Obj.magic s in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 214 "src/parser.mly"
                       ( `ShR (s,c))
# 4720 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 4725 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 215 "src/parser.mly"
                       ( `ROR  c)
# 4773 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 4778 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 216 "src/parser.mly"
                       ( `ROL  c)
# 4826 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 4831 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 217 "src/parser.mly"
                       ( `Eq   c)
# 4879 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 4884 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 218 "src/parser.mly"
                       ( `Neq  c)
# 4932 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 4937 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = s;
              MenhirLib.EngineTypes.startp = _startpos_s_;
              MenhirLib.EngineTypes.endp = _endpos_s_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let s : 
# 52 "src/parser.mly"
       (Syntax.sign option)
# 4979 "src/parser.ml"
         = Obj.magic s in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 219 "src/parser.mly"
                       ( `Lt (s,c))
# 4989 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 4994 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = s;
              MenhirLib.EngineTypes.startp = _startpos_s_;
              MenhirLib.EngineTypes.endp = _endpos_s_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let s : 
# 51 "src/parser.mly"
       (Syntax.sign option)
# 5036 "src/parser.ml"
         = Obj.magic s in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 220 "src/parser.mly"
                       ( `Le (s,c))
# 5046 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 5051 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = s;
              MenhirLib.EngineTypes.startp = _startpos_s_;
              MenhirLib.EngineTypes.endp = _endpos_s_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let s : 
# 46 "src/parser.mly"
       (Syntax.sign option)
# 5093 "src/parser.ml"
         = Obj.magic s in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 221 "src/parser.mly"
                       ( `Gt (s,c))
# 5103 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 5108 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = s;
              MenhirLib.EngineTypes.startp = _startpos_s_;
              MenhirLib.EngineTypes.endp = _endpos_s_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let s : 
# 44 "src/parser.mly"
       (Syntax.sign option)
# 5150 "src/parser.ml"
         = Obj.magic s in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 222 "src/parser.mly"
                       ( `Ge (s,c))
# 5160 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 5165 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = x;
            MenhirLib.EngineTypes.startp = _startpos_x_;
            MenhirLib.EngineTypes.endp = _endpos_x_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let x : (Syntax.pexpr) = Obj.magic x in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v =
          let e =
            let x = 
# 205 "<standard.mly>"
    ( x )
# 5207 "src/parser.ml"
             in
            
# 558 "src/parser.mly"
                                 ( x )
# 5212 "src/parser.ml"
            
          in
          (
# 304 "src/parser.mly"
    ( PEParens e )
# 5218 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = xs;
            MenhirLib.EngineTypes.startp = _startpos_xs_;
            MenhirLib.EngineTypes.endp = _endpos_xs_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = f;
                MenhirLib.EngineTypes.startp = _startpos_f_;
                MenhirLib.EngineTypes.endp = _endpos_f_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let xs : (Syntax.pexpr list) = Obj.magic xs in
        let _1 : unit = Obj.magic _1 in
        let f : (Annotations.pident) = Obj.magic f in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_f_ in
        let _endpos = _endpos__3_ in
        let _v =
          let args =
            let s =
              let x =
                let x =
                  let s = 
# 241 "<standard.mly>"
    ( xs )
# 5270 "src/parser.ml"
                   in
                  
# 567 "src/parser.mly"
                             ( s )
# 5275 "src/parser.ml"
                  
                in
                
# 205 "<standard.mly>"
    ( x )
# 5281 "src/parser.ml"
                
              in
              
# 558 "src/parser.mly"
                                 ( x )
# 5287 "src/parser.ml"
              
            in
            
# 579 "src/parser.mly"
                      ( s )
# 5293 "src/parser.ml"
            
          in
          (
# 307 "src/parser.mly"
    ( PECall (f, args) )
# 5299 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = xs;
            MenhirLib.EngineTypes.startp = _startpos_xs_;
            MenhirLib.EngineTypes.endp = _endpos_xs_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = f;
                MenhirLib.EngineTypes.startp = _startpos_f_;
                MenhirLib.EngineTypes.endp = _endpos_f_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let xs : (Syntax.pexpr list) = Obj.magic xs in
        let _1 : unit = Obj.magic _1 in
        let f : (Annotations.pident) = Obj.magic f in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_f_ in
        let _endpos = _endpos__3_ in
        let _v =
          let args =
            let s =
              let x =
                let x =
                  let s = 
# 241 "<standard.mly>"
    ( xs )
# 5351 "src/parser.ml"
                   in
                  
# 567 "src/parser.mly"
                             ( s )
# 5356 "src/parser.ml"
                  
                in
                
# 205 "<standard.mly>"
    ( x )
# 5362 "src/parser.ml"
                
              in
              
# 558 "src/parser.mly"
                                 ( x )
# 5368 "src/parser.ml"
              
            in
            
# 579 "src/parser.mly"
                      ( s )
# 5374 "src/parser.ml"
            
          in
          (
# 310 "src/parser.mly"
    ( PEPrim (f, args) )
# 5380 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e3;
          MenhirLib.EngineTypes.startp = _startpos_e3_;
          MenhirLib.EngineTypes.endp = _endpos_e3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _4;
            MenhirLib.EngineTypes.startp = _startpos__4_;
            MenhirLib.EngineTypes.endp = _endpos__4_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = e2;
              MenhirLib.EngineTypes.startp = _startpos_e2_;
              MenhirLib.EngineTypes.endp = _endpos_e2_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _2;
                MenhirLib.EngineTypes.startp = _startpos__2_;
                MenhirLib.EngineTypes.endp = _endpos__2_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _menhir_s;
                  MenhirLib.EngineTypes.semv = e1;
                  MenhirLib.EngineTypes.startp = _startpos_e1_;
                  MenhirLib.EngineTypes.endp = _endpos_e1_;
                  MenhirLib.EngineTypes.next = _menhir_stack;
                };
              };
            };
          };
        } = _menhir_stack in
        let e3 : (Syntax.pexpr) = Obj.magic e3 in
        let _4 : unit = Obj.magic _4 in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let _2 : unit = Obj.magic _2 in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e3_ in
        let _v : (Syntax.pexpr_r) = 
# 313 "src/parser.mly"
    ( PEIf(e1, e2, e3) )
# 5434 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = v;
          MenhirLib.EngineTypes.startp = _startpos_v_;
          MenhirLib.EngineTypes.endp = _endpos_v_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let v : (Annotations.pident) = Obj.magic v in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_v_ in
        let _endpos = _endpos_v_ in
        let _v : (Syntax.pexpr_r) = 
# 272 "src/parser.mly"
    ( PEVar v )
# 5459 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = i;
          MenhirLib.EngineTypes.startp = _startpos_i_;
          MenhirLib.EngineTypes.endp = _endpos_i_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = v;
            MenhirLib.EngineTypes.startp = _startpos_v_;
            MenhirLib.EngineTypes.endp = _endpos_v_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let i : (Warray_.arr_access *
  (Syntax.swsize Location.located option * Syntax.pexpr *
   Syntax.pexpr option * [ `Aligned | `Unaligned ] option)) = Obj.magic i in
        let v : (Annotations.pident) = Obj.magic v in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_v_ in
        let _endpos = _endpos_i_ in
        let _v : (Syntax.pexpr_r) = 
# 275 "src/parser.mly"
    ( let aa, (ws, e, len, al) = i in PEGet (al, aa, ws, v, e, len) )
# 5493 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Syntax.pexpr_r) = 
# 278 "src/parser.mly"
    ( PEBool true )
# 5518 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Syntax.pexpr_r) = 
# 281 "src/parser.mly"
    ( PEBool false )
# 5543 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = i;
          MenhirLib.EngineTypes.startp = _startpos_i_;
          MenhirLib.EngineTypes.endp = _endpos_i_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let i : 
# 84 "src/parser.mly"
       (Syntax.int_representation)
# 5564 "src/parser.ml"
         = Obj.magic i in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_i_ in
        let _endpos = _endpos_i_ in
        let _v : (Syntax.pexpr_r) = 
# 284 "src/parser.mly"
    ( PEInt i )
# 5572 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _5;
          MenhirLib.EngineTypes.startp = _startpos__5_;
          MenhirLib.EngineTypes.endp = _endpos__5_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = e;
            MenhirLib.EngineTypes.startp = _startpos_e_;
            MenhirLib.EngineTypes.endp = _endpos_e_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = ct;
              MenhirLib.EngineTypes.startp = _startpos_ct_;
              MenhirLib.EngineTypes.endp = _endpos_ct_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = al;
                MenhirLib.EngineTypes.startp = _startpos_al_;
                MenhirLib.EngineTypes.endp = _endpos_al_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _menhir_s;
                  MenhirLib.EngineTypes.semv = _1;
                  MenhirLib.EngineTypes.startp = _startpos__1_;
                  MenhirLib.EngineTypes.endp = _endpos__1_;
                  MenhirLib.EngineTypes.next = _menhir_stack;
                };
              };
            };
          };
        } = _menhir_stack in
        let _5 : unit = Obj.magic _5 in
        let e : (Syntax.pexpr) = Obj.magic e in
        let ct : ((unit option * Syntax.swsize Location.located) option) = Obj.magic ct in
        let al : ([ `Aligned | `Unaligned ] option) = Obj.magic al in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__5_ in
        let _v =
          let ma = 
# 236 "src/parser.mly"
  (
    let ct =
      match ct with
      | Some (c, ct) ->
        if c = None then Syntax.parse_error ~msg:"`:` expected" (L.loc ct);
        Some ct
      | None -> None in
    al, ct, e )
# 5633 "src/parser.ml"
           in
          (
# 287 "src/parser.mly"
    ( PEFetch ma )
# 5638 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _4;
          MenhirLib.EngineTypes.startp = _startpos__4_;
          MenhirLib.EngineTypes.endp = _endpos__4_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = s;
            MenhirLib.EngineTypes.startp = _startpos_s_;
            MenhirLib.EngineTypes.endp = _endpos_s_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _2;
              MenhirLib.EngineTypes.startp = _startpos__2_;
              MenhirLib.EngineTypes.endp = _endpos__2_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _3;
                MenhirLib.EngineTypes.startp = _startpos__3_;
                MenhirLib.EngineTypes.endp = _endpos__3_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = x;
                  MenhirLib.EngineTypes.startp = _startpos_x_;
                  MenhirLib.EngineTypes.endp = _endpos_x_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _menhir_s;
                    MenhirLib.EngineTypes.semv = _1;
                    MenhirLib.EngineTypes.startp = _startpos__1_;
                    MenhirLib.EngineTypes.endp = _endpos__1_;
                    MenhirLib.EngineTypes.next = _menhir_stack;
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let _4 : unit = Obj.magic _4 in
        let s : (Syntax.pexpr list) = Obj.magic s in
        let _2 : unit = Obj.magic _2 in
        let _3 : unit = Obj.magic _3 in
        let x : (Syntax.svsize) = Obj.magic x in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__4_ in
        let _v =
          let es = 
# 570 "src/parser.mly"
                                      ( s )
# 5700 "src/parser.ml"
           in
          let ct =
            let x = 
# 205 "<standard.mly>"
    ( x )
# 5706 "src/parser.ml"
             in
            
# 558 "src/parser.mly"
                                 ( x )
# 5711 "src/parser.ml"
            
          in
          (
# 290 "src/parser.mly"
    ( PEpack(ct,es) )
# 5717 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = e;
          MenhirLib.EngineTypes.startp = _startpos_e_;
          MenhirLib.EngineTypes.endp = _endpos_e_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let e : 
# 85 "src/parser.mly"
       (string)
# 5739 "src/parser.ml"
         = Obj.magic e in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e_ in
        let _endpos = _endpos_e_ in
        let _v : (Syntax.pexpr_r) = 
# 292 "src/parser.mly"
             ( PEstring e )
# 5747 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e;
          MenhirLib.EngineTypes.startp = _startpos_e_;
          MenhirLib.EngineTypes.endp = _endpos_e_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _3;
            MenhirLib.EngineTypes.startp = _startpos__3_;
            MenhirLib.EngineTypes.endp = _endpos__3_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = _1;
                MenhirLib.EngineTypes.startp = _startpos__1_;
                MenhirLib.EngineTypes.endp = _endpos__1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e : (Syntax.pexpr) = Obj.magic e in
        let _3 : unit = Obj.magic _3 in
        let x : (Syntax.cast) = Obj.magic x in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_e_ in
        let _v =
          let ct =
            let x = 
# 205 "<standard.mly>"
    ( x )
# 5795 "src/parser.ml"
             in
            
# 558 "src/parser.mly"
                                 ( x )
# 5800 "src/parser.ml"
            
          in
          (
# 295 "src/parser.mly"
    ( PEOp1 (`Cast(ct), e) )
# 5806 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e;
          MenhirLib.EngineTypes.startp = _startpos_e_;
          MenhirLib.EngineTypes.endp = _endpos_e_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let e : (Syntax.pexpr) = Obj.magic e in
        let c : (Syntax.castop) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_e_ in
        let _v =
          let o = 
# 199 "src/parser.mly"
                    ( `Not c  )
# 5847 "src/parser.ml"
           in
          (
# 298 "src/parser.mly"
    ( PEOp1 (o, e) )
# 5852 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e;
          MenhirLib.EngineTypes.startp = _startpos_e_;
          MenhirLib.EngineTypes.endp = _endpos_e_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let e : (Syntax.pexpr) = Obj.magic e in
        let c : (Syntax.castop) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_e_ in
        let _v =
          let o = 
# 200 "src/parser.mly"
                    ( `Neg c  )
# 5893 "src/parser.ml"
           in
          (
# 298 "src/parser.mly"
    ( PEOp1 (o, e) )
# 5898 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = e1;
              MenhirLib.EngineTypes.startp = _startpos_e1_;
              MenhirLib.EngineTypes.endp = _endpos_e1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let _1 : unit = Obj.magic _1 in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 203 "src/parser.mly"
                       ( `And   )
# 5939 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 5944 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = e1;
              MenhirLib.EngineTypes.startp = _startpos_e1_;
              MenhirLib.EngineTypes.endp = _endpos_e1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let _1 : unit = Obj.magic _1 in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 204 "src/parser.mly"
                       ( `Or    )
# 5985 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 5990 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 205 "src/parser.mly"
                       ( `Add  c)
# 6038 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 6043 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 206 "src/parser.mly"
                       ( `Sub  c)
# 6091 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 6096 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 207 "src/parser.mly"
                       ( `Mul  c)
# 6144 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 6149 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = s;
              MenhirLib.EngineTypes.startp = _startpos_s_;
              MenhirLib.EngineTypes.endp = _endpos_s_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let s : 
# 73 "src/parser.mly"
       (Syntax.sign option)
# 6191 "src/parser.ml"
         = Obj.magic s in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 208 "src/parser.mly"
                       ( `Div (s,c))
# 6201 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 6206 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = s;
              MenhirLib.EngineTypes.startp = _startpos_s_;
              MenhirLib.EngineTypes.endp = _endpos_s_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let s : 
# 58 "src/parser.mly"
       (Syntax.sign option)
# 6248 "src/parser.ml"
         = Obj.magic s in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 209 "src/parser.mly"
                       ( `Mod (s,c))
# 6258 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 6263 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 210 "src/parser.mly"
                       ( `BAnd c)
# 6311 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 6316 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 211 "src/parser.mly"
                       ( `BOr  c)
# 6364 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 6369 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 212 "src/parser.mly"
                       ( `BXOr c)
# 6417 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 6422 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 213 "src/parser.mly"
                       ( `ShL  c)
# 6470 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 6475 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = s;
              MenhirLib.EngineTypes.startp = _startpos_s_;
              MenhirLib.EngineTypes.endp = _endpos_s_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let s : 
# 47 "src/parser.mly"
       (Syntax.sign option)
# 6517 "src/parser.ml"
         = Obj.magic s in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 214 "src/parser.mly"
                       ( `ShR (s,c))
# 6527 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 6532 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 215 "src/parser.mly"
                       ( `ROR  c)
# 6580 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 6585 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 216 "src/parser.mly"
                       ( `ROL  c)
# 6633 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 6638 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 217 "src/parser.mly"
                       ( `Eq   c)
# 6686 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 6691 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 218 "src/parser.mly"
                       ( `Neq  c)
# 6739 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 6744 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = s;
              MenhirLib.EngineTypes.startp = _startpos_s_;
              MenhirLib.EngineTypes.endp = _endpos_s_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let s : 
# 52 "src/parser.mly"
       (Syntax.sign option)
# 6786 "src/parser.ml"
         = Obj.magic s in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 219 "src/parser.mly"
                       ( `Lt (s,c))
# 6796 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 6801 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = s;
              MenhirLib.EngineTypes.startp = _startpos_s_;
              MenhirLib.EngineTypes.endp = _endpos_s_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let s : 
# 51 "src/parser.mly"
       (Syntax.sign option)
# 6843 "src/parser.ml"
         = Obj.magic s in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 220 "src/parser.mly"
                       ( `Le (s,c))
# 6853 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 6858 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = s;
              MenhirLib.EngineTypes.startp = _startpos_s_;
              MenhirLib.EngineTypes.endp = _endpos_s_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let s : 
# 46 "src/parser.mly"
       (Syntax.sign option)
# 6900 "src/parser.ml"
         = Obj.magic s in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 221 "src/parser.mly"
                       ( `Gt (s,c))
# 6910 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 6915 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e2;
          MenhirLib.EngineTypes.startp = _startpos_e2_;
          MenhirLib.EngineTypes.endp = _endpos_e2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = s;
              MenhirLib.EngineTypes.startp = _startpos_s_;
              MenhirLib.EngineTypes.endp = _endpos_s_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = e1;
                MenhirLib.EngineTypes.startp = _startpos_e1_;
                MenhirLib.EngineTypes.endp = _endpos_e1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let c : (Syntax.castop) = Obj.magic c in
        let s : 
# 44 "src/parser.mly"
       (Syntax.sign option)
# 6957 "src/parser.ml"
         = Obj.magic s in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e2_ in
        let _v =
          let o = 
# 222 "src/parser.mly"
                       ( `Ge (s,c))
# 6967 "src/parser.ml"
           in
          (
# 301 "src/parser.mly"
    ( PEOp2 (o, (e1, e2)) )
# 6972 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = x;
            MenhirLib.EngineTypes.startp = _startpos_x_;
            MenhirLib.EngineTypes.endp = _endpos_x_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let x : (Syntax.pexpr) = Obj.magic x in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v =
          let e =
            let x = 
# 205 "<standard.mly>"
    ( x )
# 7014 "src/parser.ml"
             in
            
# 558 "src/parser.mly"
                                 ( x )
# 7019 "src/parser.ml"
            
          in
          (
# 304 "src/parser.mly"
    ( PEParens e )
# 7025 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = xs;
            MenhirLib.EngineTypes.startp = _startpos_xs_;
            MenhirLib.EngineTypes.endp = _endpos_xs_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = f;
                MenhirLib.EngineTypes.startp = _startpos_f_;
                MenhirLib.EngineTypes.endp = _endpos_f_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let xs : (Syntax.pexpr list) = Obj.magic xs in
        let _1 : unit = Obj.magic _1 in
        let f : (Annotations.pident) = Obj.magic f in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_f_ in
        let _endpos = _endpos__3_ in
        let _v =
          let args =
            let s =
              let x =
                let x =
                  let s = 
# 241 "<standard.mly>"
    ( xs )
# 7077 "src/parser.ml"
                   in
                  
# 567 "src/parser.mly"
                             ( s )
# 7082 "src/parser.ml"
                  
                in
                
# 205 "<standard.mly>"
    ( x )
# 7088 "src/parser.ml"
                
              in
              
# 558 "src/parser.mly"
                                 ( x )
# 7094 "src/parser.ml"
              
            in
            
# 579 "src/parser.mly"
                      ( s )
# 7100 "src/parser.ml"
            
          in
          (
# 307 "src/parser.mly"
    ( PECall (f, args) )
# 7106 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = xs;
            MenhirLib.EngineTypes.startp = _startpos_xs_;
            MenhirLib.EngineTypes.endp = _endpos_xs_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = f;
                MenhirLib.EngineTypes.startp = _startpos_f_;
                MenhirLib.EngineTypes.endp = _endpos_f_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let xs : (Syntax.pexpr list) = Obj.magic xs in
        let _1 : unit = Obj.magic _1 in
        let f : (Annotations.pident) = Obj.magic f in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_f_ in
        let _endpos = _endpos__3_ in
        let _v =
          let args =
            let s =
              let x =
                let x =
                  let s = 
# 241 "<standard.mly>"
    ( xs )
# 7158 "src/parser.ml"
                   in
                  
# 567 "src/parser.mly"
                             ( s )
# 7163 "src/parser.ml"
                  
                in
                
# 205 "<standard.mly>"
    ( x )
# 7169 "src/parser.ml"
                
              in
              
# 558 "src/parser.mly"
                                 ( x )
# 7175 "src/parser.ml"
              
            in
            
# 579 "src/parser.mly"
                      ( s )
# 7181 "src/parser.ml"
            
          in
          (
# 310 "src/parser.mly"
    ( PEPrim (f, args) )
# 7187 "src/parser.ml"
           : (Syntax.pexpr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e3;
          MenhirLib.EngineTypes.startp = _startpos_e3_;
          MenhirLib.EngineTypes.endp = _endpos_e3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _4;
            MenhirLib.EngineTypes.startp = _startpos__4_;
            MenhirLib.EngineTypes.endp = _endpos__4_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = e2;
              MenhirLib.EngineTypes.startp = _startpos_e2_;
              MenhirLib.EngineTypes.endp = _endpos_e2_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _2;
                MenhirLib.EngineTypes.startp = _startpos__2_;
                MenhirLib.EngineTypes.endp = _endpos__2_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _menhir_s;
                  MenhirLib.EngineTypes.semv = e1;
                  MenhirLib.EngineTypes.startp = _startpos_e1_;
                  MenhirLib.EngineTypes.endp = _endpos_e1_;
                  MenhirLib.EngineTypes.next = _menhir_stack;
                };
              };
            };
          };
        } = _menhir_stack in
        let e3 : (Syntax.pexpr) = Obj.magic e3 in
        let _4 : unit = Obj.magic _4 in
        let e2 : (Syntax.pexpr) = Obj.magic e2 in
        let _2 : unit = Obj.magic _2 in
        let e1 : (Syntax.pexpr) = Obj.magic e1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e1_ in
        let _endpos = _endpos_e3_ in
        let _v : (Syntax.pexpr_r) = 
# 313 "src/parser.mly"
    ( PEIf(e1, e2, e3) )
# 7241 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = e;
          MenhirLib.EngineTypes.startp = _startpos_e_;
          MenhirLib.EngineTypes.endp = _endpos_e_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let e : (Syntax.pexpr_r) = Obj.magic e in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e_ in
        let _endpos = _endpos_e_ in
        let _v : (Syntax.pexpr_r) = 
# 319 "src/parser.mly"
                           ( e )
# 7266 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _4;
          MenhirLib.EngineTypes.startp = _startpos__4_;
          MenhirLib.EngineTypes.endp = _endpos__4_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = x;
            MenhirLib.EngineTypes.startp = _startpos_x_;
            MenhirLib.EngineTypes.endp = _endpos_x_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = is;
              MenhirLib.EngineTypes.startp = _startpos_is_;
              MenhirLib.EngineTypes.endp = _endpos_is_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = _1;
                MenhirLib.EngineTypes.startp = _startpos__1_;
                MenhirLib.EngineTypes.endp = _endpos__1_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let _4 : unit = Obj.magic _4 in
        let x : (Annotations.pident list option) = Obj.magic x in
        let is : (Syntax.pblock_r) = Obj.magic is in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__4_ in
        let _v =
          let rt =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 552 "src/parser.mly"
      ( Location.mk_loc (Location.make _startpos _endpos) x )
# 7316 "src/parser.ml"
            
          in
          (
# 471 "src/parser.mly"
    ( { pdb_instr = is;
        pdb_ret   = rt; } )
# 7323 "src/parser.ml"
           : (Syntax.pfunbody))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = body;
          MenhirLib.EngineTypes.startp = _startpos_body_;
          MenhirLib.EngineTypes.endp = _endpos_body_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = rty;
            MenhirLib.EngineTypes.startp = _startpos_rty_;
            MenhirLib.EngineTypes.endp = _endpos_rty_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _3_inlined1;
              MenhirLib.EngineTypes.startp = _startpos__3_inlined1_;
              MenhirLib.EngineTypes.endp = _endpos__3_inlined1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = xs;
                MenhirLib.EngineTypes.startp = _startpos_xs_;
                MenhirLib.EngineTypes.endp = _endpos_xs_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = _1;
                  MenhirLib.EngineTypes.startp = _startpos__1_;
                  MenhirLib.EngineTypes.endp = _endpos__1_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _;
                    MenhirLib.EngineTypes.semv = x;
                    MenhirLib.EngineTypes.startp = _startpos_x_;
                    MenhirLib.EngineTypes.endp = _endpos_x_;
                    MenhirLib.EngineTypes.next = {
                      MenhirLib.EngineTypes.state = _;
                      MenhirLib.EngineTypes.semv = _3;
                      MenhirLib.EngineTypes.startp = _startpos__3_;
                      MenhirLib.EngineTypes.endp = _endpos__3_;
                      MenhirLib.EngineTypes.next = {
                        MenhirLib.EngineTypes.state = _;
                        MenhirLib.EngineTypes.semv = cc;
                        MenhirLib.EngineTypes.startp = _startpos_cc_;
                        MenhirLib.EngineTypes.endp = _endpos_cc_;
                        MenhirLib.EngineTypes.next = {
                          MenhirLib.EngineTypes.state = _menhir_s;
                          MenhirLib.EngineTypes.semv = pdf_annot;
                          MenhirLib.EngineTypes.startp = _startpos_pdf_annot_;
                          MenhirLib.EngineTypes.endp = _endpos_pdf_annot_;
                          MenhirLib.EngineTypes.next = _menhir_stack;
                        };
                      };
                    };
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let body : (Syntax.pfunbody) = Obj.magic body in
        let rty : ((Syntax.pannotations * Syntax.pstotype) list option) = Obj.magic rty in
        let _3_inlined1 : unit = Obj.magic _3_inlined1 in
        let xs : ((Syntax.pannotations * Syntax.paramdecls) list) = Obj.magic xs in
        let _1 : unit = Obj.magic _1 in
        let x : (string list) = Obj.magic x in
        let _3 : unit = Obj.magic _3 in
        let cc : (Syntax.pcall_conv option) = Obj.magic cc in
        let pdf_annot : (Syntax.pannotations) = Obj.magic pdf_annot in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_pdf_annot_ in
        let _endpos = _endpos_body_ in
        let _v =
          let args =
            let s =
              let x =
                let x =
                  let s = 
# 241 "<standard.mly>"
    ( xs )
# 7410 "src/parser.ml"
                   in
                  
# 567 "src/parser.mly"
                             ( s )
# 7415 "src/parser.ml"
                  
                in
                
# 205 "<standard.mly>"
    ( x )
# 7421 "src/parser.ml"
                
              in
              
# 558 "src/parser.mly"
                                 ( x )
# 7427 "src/parser.ml"
              
            in
            
# 579 "src/parser.mly"
                      ( s )
# 7433 "src/parser.ml"
            
          in
          let name =
            let x =
              let x = 
# 106 "src/parser.mly"
                                               ( String.concat "::" x )
# 7441 "src/parser.ml"
               in
              let _endpos = _endpos_x_ in
              let _startpos = _startpos_x_ in
              
# 552 "src/parser.mly"
      ( Location.mk_loc (Location.make _startpos _endpos) x )
# 7448 "src/parser.ml"
              
            in
            
# 109 "src/parser.mly"
                ( x )
# 7454 "src/parser.ml"
            
          in
          (
# 487 "src/parser.mly"
  ( { pdf_annot;
      pdf_cc   = cc;
      pdf_name = name;
      pdf_args = args;
      pdf_rty  = rty ;
      pdf_body = body; } )
# 7465 "src/parser.ml"
           : (Syntax.pfundef))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = e;
          MenhirLib.EngineTypes.startp = _startpos_e_;
          MenhirLib.EngineTypes.endp = _endpos_e_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let e : (Syntax.pexpr) = Obj.magic e in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e_ in
        let _endpos = _endpos_e_ in
        let _v : (Syntax.gpexpr) = 
# 501 "src/parser.mly"
          ( GEexpr e )
# 7491 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = s;
            MenhirLib.EngineTypes.startp = _startpos_s_;
            MenhirLib.EngineTypes.endp = _endpos_s_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let s : (Syntax.pexpr list) = Obj.magic s in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v =
          let es = 
# 570 "src/parser.mly"
                                      ( s )
# 7531 "src/parser.ml"
           in
          (
# 502 "src/parser.mly"
                                    ( GEarray es )
# 7536 "src/parser.ml"
           : (Syntax.gpexpr))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _5;
          MenhirLib.EngineTypes.startp = _startpos__5_;
          MenhirLib.EngineTypes.endp = _endpos__5_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = pgd_val;
            MenhirLib.EngineTypes.startp = _startpos_pgd_val_;
            MenhirLib.EngineTypes.endp = _endpos_pgd_val_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _3;
              MenhirLib.EngineTypes.startp = _startpos__3_;
              MenhirLib.EngineTypes.endp = _endpos__3_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = x;
                MenhirLib.EngineTypes.startp = _startpos_x_;
                MenhirLib.EngineTypes.endp = _endpos_x_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _menhir_s;
                  MenhirLib.EngineTypes.semv = pgd_type;
                  MenhirLib.EngineTypes.startp = _startpos_pgd_type_;
                  MenhirLib.EngineTypes.endp = _endpos_pgd_type_;
                  MenhirLib.EngineTypes.next = _menhir_stack;
                };
              };
            };
          };
        } = _menhir_stack in
        let _5 : unit = Obj.magic _5 in
        let pgd_val : (Syntax.gpexpr) = Obj.magic pgd_val in
        let _3 : unit = Obj.magic _3 in
        let x : (string list) = Obj.magic x in
        let pgd_type : (Syntax.ptype) = Obj.magic pgd_type in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_pgd_type_ in
        let _endpos = _endpos__5_ in
        let _v =
          let pgd_name =
            let x =
              let x = 
# 106 "src/parser.mly"
                                               ( String.concat "::" x )
# 7593 "src/parser.ml"
               in
              let _endpos = _endpos_x_ in
              let _startpos = _startpos_x_ in
              
# 552 "src/parser.mly"
      ( Location.mk_loc (Location.make _startpos _endpos) x )
# 7600 "src/parser.ml"
              
            in
            
# 109 "src/parser.mly"
                ( x )
# 7606 "src/parser.ml"
            
          in
          (
# 506 "src/parser.mly"
  ( { pgd_type ; pgd_name ; pgd_val  } )
# 7612 "src/parser.ml"
           : (Syntax.pglobal))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = i1s;
          MenhirLib.EngineTypes.startp = _startpos_i1s_;
          MenhirLib.EngineTypes.endp = _endpos_i1s_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let i1s : (Syntax.pblock) = Obj.magic i1s in
        let c : (Syntax.pexpr) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_i1s_ in
        let _v : (Syntax.pinstr_r) = 
# 407 "src/parser.mly"
    ( PIIf (c, i1s, None) )
# 7652 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = i2s;
          MenhirLib.EngineTypes.startp = _startpos_i2s_;
          MenhirLib.EngineTypes.endp = _endpos_i2s_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _4;
            MenhirLib.EngineTypes.startp = _startpos__4_;
            MenhirLib.EngineTypes.endp = _endpos__4_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = i1s;
              MenhirLib.EngineTypes.startp = _startpos_i1s_;
              MenhirLib.EngineTypes.endp = _endpos_i1s_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = c;
                MenhirLib.EngineTypes.startp = _startpos_c_;
                MenhirLib.EngineTypes.endp = _endpos_c_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _menhir_s;
                  MenhirLib.EngineTypes.semv = _1;
                  MenhirLib.EngineTypes.startp = _startpos__1_;
                  MenhirLib.EngineTypes.endp = _endpos__1_;
                  MenhirLib.EngineTypes.next = _menhir_stack;
                };
              };
            };
          };
        } = _menhir_stack in
        let i2s : (Syntax.pblock) = Obj.magic i2s in
        let _4 : unit = Obj.magic _4 in
        let i1s : (Syntax.pblock) = Obj.magic i1s in
        let c : (Syntax.pexpr) = Obj.magic c in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_i2s_ in
        let _v : (Syntax.pinstr_r) = 
# 410 "src/parser.mly"
    ( PIIf (c, i1s, Some i2s) )
# 7705 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = a;
            MenhirLib.EngineTypes.startp = _startpos_a_;
            MenhirLib.EngineTypes.endp = _endpos_a_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let x : (Syntax.pinstr_r) = Obj.magic x in
        let a : (Syntax.pannotations) = Obj.magic a in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_a_ in
        let _endpos = _endpos_x_ in
        let _v =
          let i =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 552 "src/parser.mly"
      ( Location.mk_loc (Location.make _startpos _endpos) x )
# 7741 "src/parser.ml"
            
          in
          (
# 420 "src/parser.mly"
                                 ( (a,i) )
# 7747 "src/parser.ml"
           : (Syntax.pinstr))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _3_inlined1;
            MenhirLib.EngineTypes.startp = _startpos__3_inlined1_;
            MenhirLib.EngineTypes.endp = _endpos__3_inlined1_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _1_inlined1;
                MenhirLib.EngineTypes.startp = _startpos__1_inlined1_;
                MenhirLib.EngineTypes.endp = _endpos__1_inlined1_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _menhir_s;
                  MenhirLib.EngineTypes.semv = _1;
                  MenhirLib.EngineTypes.startp = _startpos__1_;
                  MenhirLib.EngineTypes.endp = _endpos__1_;
                  MenhirLib.EngineTypes.next = _menhir_stack;
                };
              };
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let _3_inlined1 : unit = Obj.magic _3_inlined1 in
        let x : (Annotations.pident) = Obj.magic x in
        let _1_inlined1 : unit = Obj.magic _1_inlined1 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v =
          let x =
            let x = 
# 205 "<standard.mly>"
    ( x )
# 7803 "src/parser.ml"
             in
            
# 558 "src/parser.mly"
                                 ( x )
# 7808 "src/parser.ml"
            
          in
          (
# 371 "src/parser.mly"
    ( PIArrayInit x )
# 7814 "src/parser.ml"
           : (Syntax.pinstr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _3_inlined1;
            MenhirLib.EngineTypes.startp = _startpos__3_inlined1_;
            MenhirLib.EngineTypes.endp = _endpos__3_inlined1_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = xs;
              MenhirLib.EngineTypes.startp = _startpos_xs_;
              MenhirLib.EngineTypes.endp = _endpos_xs_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _1;
                MenhirLib.EngineTypes.startp = _startpos__1_;
                MenhirLib.EngineTypes.endp = _endpos__1_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _menhir_s;
                  MenhirLib.EngineTypes.semv = x;
                  MenhirLib.EngineTypes.startp = _startpos_x_;
                  MenhirLib.EngineTypes.endp = _endpos_x_;
                  MenhirLib.EngineTypes.next = _menhir_stack;
                };
              };
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let _3_inlined1 : unit = Obj.magic _3_inlined1 in
        let xs : (Syntax.pexpr list) = Obj.magic xs in
        let _1 : unit = Obj.magic _1 in
        let x : (Annotations.pident) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos__3_ in
        let _v =
          let args =
            let s =
              let x =
                let x =
                  let s = 
# 241 "<standard.mly>"
    ( xs )
# 7873 "src/parser.ml"
                   in
                  
# 567 "src/parser.mly"
                             ( s )
# 7878 "src/parser.ml"
                  
                in
                
# 205 "<standard.mly>"
    ( x )
# 7884 "src/parser.ml"
                
              in
              
# 558 "src/parser.mly"
                                 ( x )
# 7890 "src/parser.ml"
              
            in
            
# 579 "src/parser.mly"
                      ( s )
# 7896 "src/parser.ml"
            
          in
          let f =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 552 "src/parser.mly"
      ( Location.mk_loc (Location.make _startpos _endpos) x )
# 7905 "src/parser.ml"
            
          in
          (
# 374 "src/parser.mly"
    ( let { Location.pl_loc = loc; Location.pl_desc = f } = f in
      PIAssign((None, []), `Raw, Location.mk_loc loc (PEPrim (f, args)), None) )
# 7912 "src/parser.ml"
           : (Syntax.pinstr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _5;
          MenhirLib.EngineTypes.startp = _startpos__5_;
          MenhirLib.EngineTypes.endp = _endpos__5_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = e;
              MenhirLib.EngineTypes.startp = _startpos_e_;
              MenhirLib.EngineTypes.endp = _endpos_e_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = o;
                MenhirLib.EngineTypes.startp = _startpos_o_;
                MenhirLib.EngineTypes.endp = _endpos_o_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _menhir_s;
                  MenhirLib.EngineTypes.semv = x;
                  MenhirLib.EngineTypes.startp = _startpos_x_;
                  MenhirLib.EngineTypes.endp = _endpos_x_;
                  MenhirLib.EngineTypes.next = _menhir_stack;
                };
              };
            };
          };
        } = _menhir_stack in
        let _5 : unit = Obj.magic _5 in
        let c : (Syntax.pexpr option) = Obj.magic c in
        let e : (Syntax.pexpr) = Obj.magic e in
        let o : (Syntax.peqop) = Obj.magic o in
        let x : (Syntax.plvals) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos__5_ in
        let _v : (Syntax.pinstr_r) = 
# 378 "src/parser.mly"
    ( PIAssign (x, o, e, c) )
# 7966 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = c;
            MenhirLib.EngineTypes.startp = _startpos_c_;
            MenhirLib.EngineTypes.endp = _endpos_c_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _3_inlined1;
              MenhirLib.EngineTypes.startp = _startpos__3_inlined1_;
              MenhirLib.EngineTypes.endp = _endpos__3_inlined1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = xs;
                MenhirLib.EngineTypes.startp = _startpos_xs_;
                MenhirLib.EngineTypes.endp = _endpos_xs_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = _1;
                  MenhirLib.EngineTypes.startp = _startpos__1_;
                  MenhirLib.EngineTypes.endp = _endpos__1_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _menhir_s;
                    MenhirLib.EngineTypes.semv = f;
                    MenhirLib.EngineTypes.startp = _startpos_f_;
                    MenhirLib.EngineTypes.endp = _endpos_f_;
                    MenhirLib.EngineTypes.next = _menhir_stack;
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let c : (Syntax.pexpr option) = Obj.magic c in
        let _3_inlined1 : unit = Obj.magic _3_inlined1 in
        let xs : (Syntax.pexpr list) = Obj.magic xs in
        let _1 : unit = Obj.magic _1 in
        let f : (Annotations.pident) = Obj.magic f in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_f_ in
        let _endpos = _endpos__3_ in
        let _v =
          let fc =
            let _endpos__3_ = _endpos__3_inlined1_ in
            let x =
              let args =
                let s =
                  let x =
                    let x =
                      let s = 
# 241 "<standard.mly>"
    ( xs )
# 8034 "src/parser.ml"
                       in
                      
# 567 "src/parser.mly"
                             ( s )
# 8039 "src/parser.ml"
                      
                    in
                    
# 205 "<standard.mly>"
    ( x )
# 8045 "src/parser.ml"
                    
                  in
                  
# 558 "src/parser.mly"
                                 ( x )
# 8051 "src/parser.ml"
                  
                in
                
# 579 "src/parser.mly"
                      ( s )
# 8057 "src/parser.ml"
                
              in
              
# 380 "src/parser.mly"
                                        ( (f, args) )
# 8063 "src/parser.ml"
              
            in
            let (_endpos_x_, _startpos_x_) = (_endpos__3_, _startpos_f_) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 552 "src/parser.mly"
      ( Location.mk_loc (Location.make _startpos _endpos) x )
# 8072 "src/parser.ml"
            
          in
          (
# 382 "src/parser.mly"
    ( let { Location.pl_loc = loc; Location.pl_desc = (f, args) } = fc in
      PIAssign ((None, []), `Raw, Location.mk_loc loc (PECall (f, args)), c) )
# 8079 "src/parser.ml"
           : (Syntax.pinstr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _7;
          MenhirLib.EngineTypes.startp = _startpos__7_;
          MenhirLib.EngineTypes.endp = _endpos__7_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _6;
            MenhirLib.EngineTypes.startp = _startpos__6_;
            MenhirLib.EngineTypes.endp = _endpos__6_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = e;
              MenhirLib.EngineTypes.startp = _startpos_e_;
              MenhirLib.EngineTypes.endp = _endpos_e_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _4;
                MenhirLib.EngineTypes.startp = _startpos__4_;
                MenhirLib.EngineTypes.endp = _endpos__4_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = x;
                  MenhirLib.EngineTypes.startp = _startpos_x_;
                  MenhirLib.EngineTypes.endp = _endpos_x_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _;
                    MenhirLib.EngineTypes.semv = _2;
                    MenhirLib.EngineTypes.startp = _startpos__2_;
                    MenhirLib.EngineTypes.endp = _endpos__2_;
                    MenhirLib.EngineTypes.next = {
                      MenhirLib.EngineTypes.state = _menhir_s;
                      MenhirLib.EngineTypes.semv = _1;
                      MenhirLib.EngineTypes.startp = _startpos__1_;
                      MenhirLib.EngineTypes.endp = _endpos__1_;
                      MenhirLib.EngineTypes.next = _menhir_stack;
                    };
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let _7 : unit = Obj.magic _7 in
        let _6 : unit = Obj.magic _6 in
        let e : (Syntax.pexpr) = Obj.magic e in
        let _4 : unit = Obj.magic _4 in
        let x : 
# 85 "src/parser.mly"
       (string)
# 8141 "src/parser.ml"
         = Obj.magic x in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__7_ in
        let _v =
          let msg =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 552 "src/parser.mly"
      ( Location.mk_loc (Location.make _startpos _endpos) x )
# 8155 "src/parser.ml"
            
          in
          (
# 386 "src/parser.mly"
    ( PIAssert(msg, e) )
# 8161 "src/parser.ml"
           : (Syntax.pinstr_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = s;
          MenhirLib.EngineTypes.startp = _startpos_s_;
          MenhirLib.EngineTypes.endp = _endpos_s_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let s : (Syntax.pinstr_r) = Obj.magic s in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_s_ in
        let _endpos = _endpos_s_ in
        let _v : (Syntax.pinstr_r) = 
# 388 "src/parser.mly"
        ( s )
# 8187 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = is;
          MenhirLib.EngineTypes.startp = _startpos_is_;
          MenhirLib.EngineTypes.endp = _endpos_is_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = ce2;
            MenhirLib.EngineTypes.startp = _startpos_ce2_;
            MenhirLib.EngineTypes.endp = _endpos_ce2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _5;
              MenhirLib.EngineTypes.startp = _startpos__5_;
              MenhirLib.EngineTypes.endp = _endpos__5_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = ce1;
                MenhirLib.EngineTypes.startp = _startpos_ce1_;
                MenhirLib.EngineTypes.endp = _endpos_ce1_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = _3;
                  MenhirLib.EngineTypes.startp = _startpos__3_;
                  MenhirLib.EngineTypes.endp = _endpos__3_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _;
                    MenhirLib.EngineTypes.semv = v;
                    MenhirLib.EngineTypes.startp = _startpos_v_;
                    MenhirLib.EngineTypes.endp = _endpos_v_;
                    MenhirLib.EngineTypes.next = {
                      MenhirLib.EngineTypes.state = _menhir_s;
                      MenhirLib.EngineTypes.semv = _1;
                      MenhirLib.EngineTypes.startp = _startpos__1_;
                      MenhirLib.EngineTypes.endp = _endpos__1_;
                      MenhirLib.EngineTypes.next = _menhir_stack;
                    };
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let is : (Syntax.pblock) = Obj.magic is in
        let ce2 : (Syntax.pexpr) = Obj.magic ce2 in
        let _5 : unit = Obj.magic _5 in
        let ce1 : (Syntax.pexpr) = Obj.magic ce1 in
        let _3 : unit = Obj.magic _3 in
        let v : (Annotations.pident) = Obj.magic v in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_is_ in
        let _v : (Syntax.pinstr_r) = 
# 391 "src/parser.mly"
    ( PIFor (v, (`Up, ce1, ce2), is) )
# 8254 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = is;
          MenhirLib.EngineTypes.startp = _startpos_is_;
          MenhirLib.EngineTypes.endp = _endpos_is_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = ce2;
            MenhirLib.EngineTypes.startp = _startpos_ce2_;
            MenhirLib.EngineTypes.endp = _endpos_ce2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _5;
              MenhirLib.EngineTypes.startp = _startpos__5_;
              MenhirLib.EngineTypes.endp = _endpos__5_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = ce1;
                MenhirLib.EngineTypes.startp = _startpos_ce1_;
                MenhirLib.EngineTypes.endp = _endpos_ce1_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = _3;
                  MenhirLib.EngineTypes.startp = _startpos__3_;
                  MenhirLib.EngineTypes.endp = _endpos__3_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _;
                    MenhirLib.EngineTypes.semv = v;
                    MenhirLib.EngineTypes.startp = _startpos_v_;
                    MenhirLib.EngineTypes.endp = _endpos_v_;
                    MenhirLib.EngineTypes.next = {
                      MenhirLib.EngineTypes.state = _menhir_s;
                      MenhirLib.EngineTypes.semv = _1;
                      MenhirLib.EngineTypes.startp = _startpos__1_;
                      MenhirLib.EngineTypes.endp = _endpos__1_;
                      MenhirLib.EngineTypes.next = _menhir_stack;
                    };
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let is : (Syntax.pblock) = Obj.magic is in
        let ce2 : (Syntax.pexpr) = Obj.magic ce2 in
        let _5 : unit = Obj.magic _5 in
        let ce1 : (Syntax.pexpr) = Obj.magic ce1 in
        let _3 : unit = Obj.magic _3 in
        let v : (Annotations.pident) = Obj.magic v in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_is_ in
        let _v : (Syntax.pinstr_r) = 
# 394 "src/parser.mly"
    ( PIFor (v, (`Down, ce2, ce1), is) )
# 8321 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = is2;
          MenhirLib.EngineTypes.startp = _startpos_is2_;
          MenhirLib.EngineTypes.endp = _endpos_is2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _5;
            MenhirLib.EngineTypes.startp = _startpos__5_;
            MenhirLib.EngineTypes.endp = _endpos__5_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = b;
              MenhirLib.EngineTypes.startp = _startpos_b_;
              MenhirLib.EngineTypes.endp = _endpos_b_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _3;
                MenhirLib.EngineTypes.startp = _startpos__3_;
                MenhirLib.EngineTypes.endp = _endpos__3_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = is1;
                  MenhirLib.EngineTypes.startp = _startpos_is1_;
                  MenhirLib.EngineTypes.endp = _endpos_is1_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _menhir_s;
                    MenhirLib.EngineTypes.semv = _1;
                    MenhirLib.EngineTypes.startp = _startpos__1_;
                    MenhirLib.EngineTypes.endp = _endpos__1_;
                    MenhirLib.EngineTypes.next = _menhir_stack;
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let is2 : (Syntax.pblock option) = Obj.magic is2 in
        let _5 : unit = Obj.magic _5 in
        let b : (Syntax.pexpr) = Obj.magic b in
        let _3 : unit = Obj.magic _3 in
        let is1 : (Syntax.pblock option) = Obj.magic is1 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_is2_ in
        let _v : (Syntax.pinstr_r) = 
# 397 "src/parser.mly"
    ( PIWhile (is1, b, is2) )
# 8381 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = vs;
            MenhirLib.EngineTypes.startp = _startpos_vs_;
            MenhirLib.EngineTypes.endp = _endpos_vs_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = ty;
              MenhirLib.EngineTypes.startp = _startpos_ty_;
              MenhirLib.EngineTypes.endp = _endpos_ty_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let vs : ((Annotations.pident * Syntax.pexpr) Location.located list) = Obj.magic vs in
        let ty : (Syntax.pstotype) = Obj.magic ty in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_ty_ in
        let _endpos = _endpos__3_ in
        let _v : (Syntax.pinstr_r) = 
# 400 "src/parser.mly"
    ( PIdeclinit (ty, vs) )
# 8420 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = vs;
            MenhirLib.EngineTypes.startp = _startpos_vs_;
            MenhirLib.EngineTypes.endp = _endpos_vs_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = ty;
              MenhirLib.EngineTypes.startp = _startpos_ty_;
              MenhirLib.EngineTypes.endp = _endpos_ty_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let vs : (Annotations.pident list) = Obj.magic vs in
        let ty : (Syntax.pstotype) = Obj.magic ty in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_ty_ in
        let _endpos = _endpos__3_ in
        let _v : (Syntax.pinstr_r) = 
# 403 "src/parser.mly"
    ( PIdecl (ty, vs) )
# 8459 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Syntax.plvalue_r) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v =
          let x =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 552 "src/parser.mly"
      ( Location.mk_loc (Location.make _startpos _endpos) x )
# 8488 "src/parser.ml"
            
          in
          (
# 356 "src/parser.mly"
                   ( x )
# 8494 "src/parser.ml"
           : (Syntax.plvalue))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Syntax.plvalue_r) = 
# 344 "src/parser.mly"
    ( PLIgnore )
# 8520 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Annotations.pident) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (Syntax.plvalue_r) = 
# 347 "src/parser.mly"
    ( PLVar x )
# 8545 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = i;
          MenhirLib.EngineTypes.startp = _startpos_i_;
          MenhirLib.EngineTypes.endp = _endpos_i_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = x;
            MenhirLib.EngineTypes.startp = _startpos_x_;
            MenhirLib.EngineTypes.endp = _endpos_x_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let i : (Warray_.arr_access *
  (Syntax.swsize Location.located option * Syntax.pexpr *
   Syntax.pexpr option * [ `Aligned | `Unaligned ] option)) = Obj.magic i in
        let x : (Annotations.pident) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_i_ in
        let _v : (Syntax.plvalue_r) = 
# 350 "src/parser.mly"
    ( let a, (ws, e, len, al) = i in PLArray (al, a, ws, x, e, len) )
# 8579 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _5;
          MenhirLib.EngineTypes.startp = _startpos__5_;
          MenhirLib.EngineTypes.endp = _endpos__5_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = e;
            MenhirLib.EngineTypes.startp = _startpos_e_;
            MenhirLib.EngineTypes.endp = _endpos_e_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = ct;
              MenhirLib.EngineTypes.startp = _startpos_ct_;
              MenhirLib.EngineTypes.endp = _endpos_ct_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = al;
                MenhirLib.EngineTypes.startp = _startpos_al_;
                MenhirLib.EngineTypes.endp = _endpos_al_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _menhir_s;
                  MenhirLib.EngineTypes.semv = _1;
                  MenhirLib.EngineTypes.startp = _startpos__1_;
                  MenhirLib.EngineTypes.endp = _endpos__1_;
                  MenhirLib.EngineTypes.next = _menhir_stack;
                };
              };
            };
          };
        } = _menhir_stack in
        let _5 : unit = Obj.magic _5 in
        let e : (Syntax.pexpr) = Obj.magic e in
        let ct : ((unit option * Syntax.swsize Location.located) option) = Obj.magic ct in
        let al : ([ `Aligned | `Unaligned ] option) = Obj.magic al in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__5_ in
        let _v =
          let ma = 
# 236 "src/parser.mly"
  (
    let ct =
      match ct with
      | Some (c, ct) ->
        if c = None then Syntax.parse_error ~msg:"`:` expected" (L.loc ct);
        Some ct
      | None -> None in
    al, ct, e )
# 8640 "src/parser.ml"
           in
          (
# 353 "src/parser.mly"
    ( let ct, e, al = ma in PLMem (ct, e, al) )
# 8645 "src/parser.ml"
           : (Syntax.plvalue_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = s;
            MenhirLib.EngineTypes.startp = _startpos_s_;
            MenhirLib.EngineTypes.endp = _endpos_s_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let s : (Syntax.plvalue list) = Obj.magic s in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v =
          let lv =
            let s =
              let x =
                let x = 
# 570 "src/parser.mly"
                                      ( s )
# 8689 "src/parser.ml"
                 in
                
# 205 "<standard.mly>"
    ( x )
# 8694 "src/parser.ml"
                
              in
              
# 558 "src/parser.mly"
                                 ( x )
# 8700 "src/parser.ml"
              
            in
            
# 576 "src/parser.mly"
                                      ( s )
# 8706 "src/parser.ml"
            
          in
          (
# 364 "src/parser.mly"
                     ( None, lv )
# 8712 "src/parser.ml"
           : (Syntax.plvals))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = s;
          MenhirLib.EngineTypes.startp = _startpos_s_;
          MenhirLib.EngineTypes.endp = _endpos_s_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let s : (Syntax.plvalue list) = Obj.magic s in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_s_ in
        let _endpos = _endpos_s_ in
        let _v =
          let lv =
            let s = 
# 570 "src/parser.mly"
                                      ( s )
# 8740 "src/parser.ml"
             in
            
# 576 "src/parser.mly"
                                      ( s )
# 8745 "src/parser.ml"
            
          in
          (
# 364 "src/parser.mly"
                     ( None, lv )
# 8751 "src/parser.ml"
           : (Syntax.plvals))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _2;
          MenhirLib.EngineTypes.startp = _startpos__2_;
          MenhirLib.EngineTypes.endp = _endpos__2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let _2 : unit = Obj.magic _2 in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__2_ in
        let _v : (Syntax.plvals) = 
# 365 "src/parser.mly"
                ( None, [] )
# 8784 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = s;
          MenhirLib.EngineTypes.startp = _startpos_s_;
          MenhirLib.EngineTypes.endp = _endpos_s_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let s : (Syntax.pannotations Location.located) = Obj.magic s in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_s_ in
        let _endpos = _endpos_s_ in
        let _v : (Syntax.plvals) = 
# 366 "src/parser.mly"
               ( Some s, [] )
# 8809 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = s_inlined1;
          MenhirLib.EngineTypes.startp = _startpos_s_inlined1_;
          MenhirLib.EngineTypes.endp = _endpos_s_inlined1_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = s;
              MenhirLib.EngineTypes.startp = _startpos_s_;
              MenhirLib.EngineTypes.endp = _endpos_s_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let s_inlined1 : (Syntax.plvalue list) = Obj.magic s_inlined1 in
        let _2 : unit = Obj.magic _2 in
        let s : (Syntax.pannotations Location.located) = Obj.magic s in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_s_ in
        let _endpos = _endpos_s_inlined1_ in
        let _v =
          let lv =
            let s = s_inlined1 in
            
# 570 "src/parser.mly"
                                      ( s )
# 8851 "src/parser.ml"
            
          in
          (
# 367 "src/parser.mly"
                                         ( Some s, lv )
# 8857 "src/parser.ml"
           : (Syntax.plvals))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _2;
          MenhirLib.EngineTypes.startp = _startpos__2_;
          MenhirLib.EngineTypes.endp = _endpos__2_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = o;
            MenhirLib.EngineTypes.startp = _startpos_o_;
            MenhirLib.EngineTypes.endp = _endpos_o_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let _2 : unit = Obj.magic _2 in
        let o : (Syntax.writable option) = Obj.magic o in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_o_ in
        let _endpos = _endpos__2_ in
        let _v : (Syntax.writable option) = 
# 442 "src/parser.mly"
                      ( o )
# 8890 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _6;
          MenhirLib.EngineTypes.startp = _startpos__6_;
          MenhirLib.EngineTypes.endp = _endpos__6_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = pe;
            MenhirLib.EngineTypes.startp = _startpos_pe_;
            MenhirLib.EngineTypes.endp = _endpos_pe_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _4;
              MenhirLib.EngineTypes.startp = _startpos__4_;
              MenhirLib.EngineTypes.endp = _endpos__4_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = x;
                MenhirLib.EngineTypes.startp = _startpos_x_;
                MenhirLib.EngineTypes.endp = _endpos_x_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _;
                  MenhirLib.EngineTypes.semv = ty;
                  MenhirLib.EngineTypes.startp = _startpos_ty_;
                  MenhirLib.EngineTypes.endp = _endpos_ty_;
                  MenhirLib.EngineTypes.next = {
                    MenhirLib.EngineTypes.state = _menhir_s;
                    MenhirLib.EngineTypes.semv = _1;
                    MenhirLib.EngineTypes.startp = _startpos__1_;
                    MenhirLib.EngineTypes.endp = _endpos__1_;
                    MenhirLib.EngineTypes.next = _menhir_stack;
                  };
                };
              };
            };
          };
        } = _menhir_stack in
        let _6 : unit = Obj.magic _6 in
        let pe : (Syntax.pexpr) = Obj.magic pe in
        let _4 : unit = Obj.magic _4 in
        let x : (string list) = Obj.magic x in
        let ty : (Syntax.ptype) = Obj.magic ty in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__6_ in
        let _v =
          let x =
            let x =
              let x = 
# 106 "src/parser.mly"
                                               ( String.concat "::" x )
# 8953 "src/parser.ml"
               in
              let _endpos = _endpos_x_ in
              let _startpos = _startpos_x_ in
              
# 552 "src/parser.mly"
      ( Location.mk_loc (Location.make _startpos _endpos) x )
# 8960 "src/parser.ml"
              
            in
            
# 109 "src/parser.mly"
                ( x )
# 8966 "src/parser.ml"
            
          in
          (
# 497 "src/parser.mly"
    ( { ppa_ty = ty; ppa_name = x; ppa_init = pe; } )
# 8972 "src/parser.ml"
           : (Syntax.pparam))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = vs;
          MenhirLib.EngineTypes.startp = _startpos_vs_;
          MenhirLib.EngineTypes.endp = _endpos_vs_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = ty;
            MenhirLib.EngineTypes.startp = _startpos_ty_;
            MenhirLib.EngineTypes.endp = _endpos_ty_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let vs : (Annotations.pident list) = Obj.magic vs in
        let ty : (Syntax.pstotype) = Obj.magic ty in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_ty_ in
        let _endpos = _endpos_vs_ in
        let _v : (Syntax.paramdecls) = 
# 461 "src/parser.mly"
                                                    ( (ty, vs) )
# 9005 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = f;
              MenhirLib.EngineTypes.startp = _startpos_f_;
              MenhirLib.EngineTypes.endp = _endpos_f_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let x : (Syntax.prequire list) = Obj.magic x in
        let _2 : unit = Obj.magic _2 in
        let f : (Annotations.pident option) = Obj.magic f in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_f_ in
        let _endpos = _endpos_x_ in
        let _v : (Annotations.pident option * Syntax.prequire list) = 
# 523 "src/parser.mly"
                                             ( f, x )
# 9044 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : 
# 85 "src/parser.mly"
       (string)
# 9065 "src/parser.ml"
         = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v =
          let s =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 552 "src/parser.mly"
      ( Location.mk_loc (Location.make _startpos _endpos) x )
# 9077 "src/parser.ml"
            
          in
          (
# 517 "src/parser.mly"
                ( s )
# 9083 "src/parser.ml"
           : (Syntax.prequire))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let x : (string list) = Obj.magic x in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_x_ in
        let _v =
          let x =
            let x =
              let x = 
# 106 "src/parser.mly"
                                               ( String.concat "::" x )
# 9119 "src/parser.ml"
               in
              let _endpos = _endpos_x_ in
              let _startpos = _startpos_x_ in
              
# 552 "src/parser.mly"
      ( Location.mk_loc (Location.make _startpos _endpos) x )
# 9126 "src/parser.ml"
              
            in
            
# 109 "src/parser.mly"
                ( x )
# 9132 "src/parser.ml"
            
          in
          (
# 225 "src/parser.mly"
                ( x )
# 9138 "src/parser.ml"
           : (Annotations.pident))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = o;
          MenhirLib.EngineTypes.startp = _startpos_o_;
          MenhirLib.EngineTypes.endp = _endpos_o_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let o : (Syntax.writable option option) = Obj.magic o in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_o_ in
        let _endpos = _endpos_o_ in
        let _v : (Syntax.ptr) = 
# 445 "src/parser.mly"
             (
   match o with
   | Some w -> `Pointer w
   | None   -> `Direct
   )
# 9168 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Syntax.ptype_r) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v =
          let x =
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 552 "src/parser.mly"
      ( Location.mk_loc (Location.make _startpos _endpos) x )
# 9197 "src/parser.ml"
            
          in
          (
# 175 "src/parser.mly"
                 ( x )
# 9203 "src/parser.ml"
           : (Syntax.ptype))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Syntax.ptype_r) = 
# 162 "src/parser.mly"
    ( TBool )
# 9229 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Syntax.ptype_r) = 
# 165 "src/parser.mly"
    ( TInt )
# 9254 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = ut;
          MenhirLib.EngineTypes.startp = _startpos_ut_;
          MenhirLib.EngineTypes.endp = _endpos_ut_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let ut : (Syntax.swsize) = Obj.magic ut in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_ut_ in
        let _endpos = _endpos_ut_ in
        let _v : (Syntax.ptype_r) = 
# 168 "src/parser.mly"
    ( TWord ut )
# 9279 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = x;
            MenhirLib.EngineTypes.startp = _startpos_x_;
            MenhirLib.EngineTypes.endp = _endpos_x_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _menhir_s;
                MenhirLib.EngineTypes.semv = ut;
                MenhirLib.EngineTypes.startp = _startpos_ut_;
                MenhirLib.EngineTypes.endp = _endpos_ut_;
                MenhirLib.EngineTypes.next = _menhir_stack;
              };
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let x : (Syntax.pexpr) = Obj.magic x in
        let _1 : unit = Obj.magic _1 in
        let ut : (Syntax.psizetype) = Obj.magic ut in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_ut_ in
        let _endpos = _endpos__3_ in
        let _v =
          let d =
            let x = 
# 205 "<standard.mly>"
    ( x )
# 9327 "src/parser.ml"
             in
            
# 561 "src/parser.mly"
                                     ( x )
# 9332 "src/parser.ml"
            
          in
          (
# 171 "src/parser.mly"
    ( TArray (ut, d) )
# 9338 "src/parser.ml"
           : (Syntax.ptype_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (string list) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v =
          let x =
            let x =
              let x = 
# 106 "src/parser.mly"
                                               ( String.concat "::" x )
# 9367 "src/parser.ml"
               in
              let _endpos = _endpos_x_ in
              let _startpos = _startpos_x_ in
              
# 552 "src/parser.mly"
      ( Location.mk_loc (Location.make _startpos _endpos) x )
# 9374 "src/parser.ml"
              
            in
            
# 109 "src/parser.mly"
                ( x )
# 9380 "src/parser.ml"
            
          in
          (
# 172 "src/parser.mly"
          (TAlias x)
# 9386 "src/parser.ml"
           : (Syntax.ptype_r))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = size;
          MenhirLib.EngineTypes.startp = _startpos_size_;
          MenhirLib.EngineTypes.endp = _endpos_size_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = ptr;
              MenhirLib.EngineTypes.startp = _startpos_ptr_;
              MenhirLib.EngineTypes.endp = _endpos_ptr_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let size : 
# 84 "src/parser.mly"
       (Syntax.int_representation)
# 9420 "src/parser.ml"
         = Obj.magic size in
        let _2 : unit = Obj.magic _2 in
        let ptr : 
# 84 "src/parser.mly"
       (Syntax.int_representation)
# 9426 "src/parser.ml"
         = Obj.magic ptr in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_ptr_ in
        let _endpos = _endpos_size_ in
        let _v : (string * string) = 
# 513 "src/parser.mly"
                         ( ptr, size )
# 9434 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : 
# 83 "src/parser.mly"
       (string)
# 9455 "src/parser.ml"
         = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (string list) = 
# 250 "<standard.mly>"
    ( [ x ] )
# 9463 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = xs;
          MenhirLib.EngineTypes.startp = _startpos_xs_;
          MenhirLib.EngineTypes.endp = _endpos_xs_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let xs : (string list) = Obj.magic xs in
        let _2 : unit = Obj.magic _2 in
        let x : 
# 83 "src/parser.mly"
       (string)
# 9498 "src/parser.ml"
         = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : (string list) = 
# 253 "<standard.mly>"
    ( x :: xs )
# 9506 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Syntax.pannotations * Syntax.paramdecls) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : ((Syntax.pannotations * Syntax.paramdecls) list) = 
# 250 "<standard.mly>"
    ( [ x ] )
# 9531 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = xs;
          MenhirLib.EngineTypes.startp = _startpos_xs_;
          MenhirLib.EngineTypes.endp = _endpos_xs_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let xs : ((Syntax.pannotations * Syntax.paramdecls) list) = Obj.magic xs in
        let _2 : unit = Obj.magic _2 in
        let x : (Syntax.pannotations * Syntax.paramdecls) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : ((Syntax.pannotations * Syntax.paramdecls) list) = 
# 253 "<standard.mly>"
    ( x :: xs )
# 9570 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Syntax.pannotations * Syntax.pstotype) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : ((Syntax.pannotations * Syntax.pstotype) list) = 
# 250 "<standard.mly>"
    ( [ x ] )
# 9595 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = xs;
          MenhirLib.EngineTypes.startp = _startpos_xs_;
          MenhirLib.EngineTypes.endp = _endpos_xs_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let xs : ((Syntax.pannotations * Syntax.pstotype) list) = Obj.magic xs in
        let _2 : unit = Obj.magic _2 in
        let x : (Syntax.pannotations * Syntax.pstotype) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : ((Syntax.pannotations * Syntax.pstotype) list) = 
# 253 "<standard.mly>"
    ( x :: xs )
# 9634 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Syntax.pannotation) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (Syntax.pannotations) = 
# 250 "<standard.mly>"
    ( [ x ] )
# 9659 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = xs;
          MenhirLib.EngineTypes.startp = _startpos_xs_;
          MenhirLib.EngineTypes.endp = _endpos_xs_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let xs : (Syntax.pannotations) = Obj.magic xs in
        let _2 : unit = Obj.magic _2 in
        let x : (Syntax.pannotation) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : (Syntax.pannotations) = 
# 253 "<standard.mly>"
    ( x :: xs )
# 9698 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = e;
          MenhirLib.EngineTypes.startp = _startpos_e_;
          MenhirLib.EngineTypes.endp = _endpos_e_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = v;
              MenhirLib.EngineTypes.startp = _startpos_v_;
              MenhirLib.EngineTypes.endp = _endpos_v_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let e : (Syntax.pexpr) = Obj.magic e in
        let _2 : unit = Obj.magic _2 in
        let v : (Annotations.pident) = Obj.magic v in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_v_ in
        let _endpos = _endpos_e_ in
        let _v =
          let x =
            let x = 
# 458 "src/parser.mly"
                   ( v, e )
# 9739 "src/parser.ml"
             in
            let (_endpos_x_, _startpos_x_) = (_endpos_e_, _startpos_v_) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 552 "src/parser.mly"
      ( Location.mk_loc (Location.make _startpos _endpos) x )
# 9747 "src/parser.ml"
            
          in
          (
# 250 "<standard.mly>"
    ( [ x ] )
# 9753 "src/parser.ml"
           : ((Annotations.pident * Syntax.pexpr) Location.located list))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = xs;
          MenhirLib.EngineTypes.startp = _startpos_xs_;
          MenhirLib.EngineTypes.endp = _endpos_xs_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = e;
              MenhirLib.EngineTypes.startp = _startpos_e_;
              MenhirLib.EngineTypes.endp = _endpos_e_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = _2_inlined1;
                MenhirLib.EngineTypes.startp = _startpos__2_inlined1_;
                MenhirLib.EngineTypes.endp = _endpos__2_inlined1_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _menhir_s;
                  MenhirLib.EngineTypes.semv = v;
                  MenhirLib.EngineTypes.startp = _startpos_v_;
                  MenhirLib.EngineTypes.endp = _endpos_v_;
                  MenhirLib.EngineTypes.next = _menhir_stack;
                };
              };
            };
          };
        } = _menhir_stack in
        let xs : ((Annotations.pident * Syntax.pexpr) Location.located list) = Obj.magic xs in
        let _2 : unit = Obj.magic _2 in
        let e : (Syntax.pexpr) = Obj.magic e in
        let _2_inlined1 : unit = Obj.magic _2_inlined1 in
        let v : (Annotations.pident) = Obj.magic v in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_v_ in
        let _endpos = _endpos_xs_ in
        let _v =
          let x =
            let x = 
# 458 "src/parser.mly"
                   ( v, e )
# 9809 "src/parser.ml"
             in
            let (_endpos_x_, _startpos_x_) = (_endpos_e_, _startpos_v_) in
            let _endpos = _endpos_x_ in
            let _startpos = _startpos_x_ in
            
# 552 "src/parser.mly"
      ( Location.mk_loc (Location.make _startpos _endpos) x )
# 9817 "src/parser.ml"
            
          in
          (
# 253 "<standard.mly>"
    ( x :: xs )
# 9823 "src/parser.ml"
           : ((Annotations.pident * Syntax.pexpr) Location.located list))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Syntax.pexpr) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (Syntax.pexpr list) = 
# 250 "<standard.mly>"
    ( [ x ] )
# 9849 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = xs;
          MenhirLib.EngineTypes.startp = _startpos_xs_;
          MenhirLib.EngineTypes.endp = _endpos_xs_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let xs : (Syntax.pexpr list) = Obj.magic xs in
        let _2 : unit = Obj.magic _2 in
        let x : (Syntax.pexpr) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : (Syntax.pexpr list) = 
# 253 "<standard.mly>"
    ( x :: xs )
# 9888 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Syntax.pexpr) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (Syntax.pexpr list) = 
# 250 "<standard.mly>"
    ( [ x ] )
# 9913 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = xs;
          MenhirLib.EngineTypes.startp = _startpos_xs_;
          MenhirLib.EngineTypes.endp = _endpos_xs_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let xs : (Syntax.pexpr list) = Obj.magic xs in
        let _2 : unit = Obj.magic _2 in
        let x : (Syntax.pexpr) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : (Syntax.pexpr list) = 
# 253 "<standard.mly>"
    ( x :: xs )
# 9952 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Syntax.plvalue) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (Syntax.plvalue list) = 
# 250 "<standard.mly>"
    ( [ x ] )
# 9977 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = xs;
          MenhirLib.EngineTypes.startp = _startpos_xs_;
          MenhirLib.EngineTypes.endp = _endpos_xs_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let xs : (Syntax.plvalue list) = Obj.magic xs in
        let _2 : unit = Obj.magic _2 in
        let x : (Syntax.plvalue) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : (Syntax.plvalue list) = 
# 253 "<standard.mly>"
    ( x :: xs )
# 10016 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (string * string) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : ((string * string) list) = 
# 250 "<standard.mly>"
    ( [ x ] )
# 10041 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = xs;
          MenhirLib.EngineTypes.startp = _startpos_xs_;
          MenhirLib.EngineTypes.endp = _endpos_xs_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let xs : ((string * string) list) = Obj.magic xs in
        let _2 : unit = Obj.magic _2 in
        let x : (string * string) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : ((string * string) list) = 
# 253 "<standard.mly>"
    ( x :: xs )
# 10080 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Annotations.pident) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (Annotations.pident list) = 
# 250 "<standard.mly>"
    ( [ x ] )
# 10105 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = xs;
          MenhirLib.EngineTypes.startp = _startpos_xs_;
          MenhirLib.EngineTypes.endp = _endpos_xs_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let xs : (Annotations.pident list) = Obj.magic xs in
        let _2 : unit = Obj.magic _2 in
        let x : (Annotations.pident) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : (Annotations.pident list) = 
# 253 "<standard.mly>"
    ( x :: xs )
# 10144 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Annotations.pident) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (Annotations.pident list) = 
# 250 "<standard.mly>"
    ( [ x ] )
# 10169 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = xs;
          MenhirLib.EngineTypes.startp = _startpos_xs_;
          MenhirLib.EngineTypes.endp = _endpos_xs_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = x;
            MenhirLib.EngineTypes.startp = _startpos_x_;
            MenhirLib.EngineTypes.endp = _endpos_x_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let xs : (Annotations.pident list) = Obj.magic xs in
        let x : (Annotations.pident) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v =
          let _2 = 
# 546 "src/parser.mly"
              ( () )
# 10202 "src/parser.ml"
           in
          (
# 253 "<standard.mly>"
    ( x :: xs )
# 10207 "src/parser.ml"
           : (Annotations.pident list))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Annotations.pident) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (Annotations.pident list) = 
# 250 "<standard.mly>"
    ( [ x ] )
# 10233 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = xs;
          MenhirLib.EngineTypes.startp = _startpos_xs_;
          MenhirLib.EngineTypes.endp = _endpos_xs_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = _2;
            MenhirLib.EngineTypes.startp = _startpos__2_;
            MenhirLib.EngineTypes.endp = _endpos__2_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = x;
              MenhirLib.EngineTypes.startp = _startpos_x_;
              MenhirLib.EngineTypes.endp = _endpos_x_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let xs : (Annotations.pident list) = Obj.magic xs in
        let _2 : (unit option) = Obj.magic _2 in
        let x : (Annotations.pident) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_xs_ in
        let _v : (Annotations.pident list) = 
# 253 "<standard.mly>"
    ( x :: xs )
# 10272 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = e;
          MenhirLib.EngineTypes.startp = _startpos_e_;
          MenhirLib.EngineTypes.endp = _endpos_e_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let e : (Syntax.pexpr) = Obj.magic e in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_e_ in
        let _endpos = _endpos_e_ in
        let _v : (Syntax.psimple_attribute) = 
# 129 "src/parser.mly"
                   ( PAexpr e)
# 10297 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = s;
          MenhirLib.EngineTypes.startp = _startpos_s_;
          MenhirLib.EngineTypes.endp = _endpos_s_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let s : (string) = Obj.magic s in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_s_ in
        let _endpos = _endpos_s_ in
        let _v : (Syntax.psimple_attribute) = 
# 130 "src/parser.mly"
                   ( PAstring s )
# 10322 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = ws;
          MenhirLib.EngineTypes.startp = _startpos_ws_;
          MenhirLib.EngineTypes.endp = _endpos_ws_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let ws : (Syntax.swsize) = Obj.magic ws in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_ws_ in
        let _endpos = _endpos_ws_ in
        let _v : (Syntax.psimple_attribute) = 
# 131 "src/parser.mly"
                   ( PAws (fst ws) )
# 10347 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = ty;
          MenhirLib.EngineTypes.startp = _startpos_ty_;
          MenhirLib.EngineTypes.endp = _endpos_ty_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = sto;
            MenhirLib.EngineTypes.startp = _startpos_sto_;
            MenhirLib.EngineTypes.endp = _endpos_sto_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let ty : (Syntax.ptype) = Obj.magic ty in
        let sto : (Syntax.pstorage) = Obj.magic sto in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_sto_ in
        let _endpos = _endpos_ty_ in
        let _v : (Syntax.pstotype) = 
# 432 "src/parser.mly"
                       ( (sto, ty) )
# 10379 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = ptr;
          MenhirLib.EngineTypes.startp = _startpos_ptr_;
          MenhirLib.EngineTypes.endp = _endpos_ptr_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let ptr : (Syntax.ptr) = Obj.magic ptr in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_ptr_ in
        let _v : (Syntax.pstorage) = 
# 452 "src/parser.mly"
                 ( `Reg ptr )
# 10411 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = ptr;
          MenhirLib.EngineTypes.startp = _startpos_ptr_;
          MenhirLib.EngineTypes.endp = _endpos_ptr_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _menhir_s;
            MenhirLib.EngineTypes.semv = _1;
            MenhirLib.EngineTypes.startp = _startpos__1_;
            MenhirLib.EngineTypes.endp = _endpos__1_;
            MenhirLib.EngineTypes.next = _menhir_stack;
          };
        } = _menhir_stack in
        let ptr : (Syntax.ptr) = Obj.magic ptr in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos_ptr_ in
        let _v : (Syntax.pstorage) = 
# 453 "src/parser.mly"
                 ( `Stack ptr )
# 10443 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Syntax.pstorage) = 
# 454 "src/parser.mly"
                 ( `Inline )
# 10468 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Syntax.pstorage) = 
# 455 "src/parser.mly"
                 ( `Global )
# 10493 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = xs;
          MenhirLib.EngineTypes.startp = _startpos_xs_;
          MenhirLib.EngineTypes.endp = _endpos_xs_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let xs : (Syntax.pannotations) = Obj.magic xs in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_xs_ in
        let _endpos = _endpos_xs_ in
        let _v =
          let a = 
# 241 "<standard.mly>"
    ( xs )
# 10519 "src/parser.ml"
           in
          (
# 141 "src/parser.mly"
                                        ( a )
# 10524 "src/parser.ml"
           : (Syntax.pannotations))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = s;
          MenhirLib.EngineTypes.startp = _startpos_s_;
          MenhirLib.EngineTypes.endp = _endpos_s_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let s : 
# 72 "src/parser.mly"
       (Syntax.svsize)
# 10546 "src/parser.ml"
         = Obj.magic s in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_s_ in
        let _endpos = _endpos_s_ in
        let _v : (Syntax.svsize) = 
# 181 "src/parser.mly"
           ( s )
# 10554 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = s;
          MenhirLib.EngineTypes.startp = _startpos_s_;
          MenhirLib.EngineTypes.endp = _endpos_s_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let s : 
# 71 "src/parser.mly"
       (Syntax.swsize)
# 10575 "src/parser.ml"
         = Obj.magic s in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_s_ in
        let _endpos = _endpos_s_ in
        let _v : (Syntax.swsize) = 
# 178 "src/parser.mly"
           ( s )
# 10583 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Syntax.pfundef) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (Syntax.pitem) = 
# 527 "src/parser.mly"
             ( Syntax.PFundef x )
# 10608 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Syntax.pparam) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (Syntax.pitem) = 
# 528 "src/parser.mly"
             ( Syntax.PParam  x )
# 10633 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Syntax.pglobal) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (Syntax.pitem) = 
# 529 "src/parser.mly"
             ( Syntax.PGlobal x )
# 10658 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Syntax.pexec) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (Syntax.pitem) = 
# 530 "src/parser.mly"
             ( Syntax.Pexec   x )
# 10683 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (Annotations.pident option * Syntax.prequire list) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v : (Syntax.pitem) = 
# 531 "src/parser.mly"
             ( Syntax.Prequire x)
# 10708 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _5;
          MenhirLib.EngineTypes.startp = _startpos__5_;
          MenhirLib.EngineTypes.endp = _endpos__5_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = ty;
            MenhirLib.EngineTypes.startp = _startpos_ty_;
            MenhirLib.EngineTypes.endp = _endpos_ty_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _3;
              MenhirLib.EngineTypes.startp = _startpos__3_;
              MenhirLib.EngineTypes.endp = _endpos__3_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = x;
                MenhirLib.EngineTypes.startp = _startpos_x_;
                MenhirLib.EngineTypes.endp = _endpos_x_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _menhir_s;
                  MenhirLib.EngineTypes.semv = _1;
                  MenhirLib.EngineTypes.startp = _startpos__1_;
                  MenhirLib.EngineTypes.endp = _endpos__1_;
                  MenhirLib.EngineTypes.next = _menhir_stack;
                };
              };
            };
          };
        } = _menhir_stack in
        let _5 : unit = Obj.magic _5 in
        let ty : (Syntax.ptype) = Obj.magic ty in
        let _3 : unit = Obj.magic _3 in
        let x : (string list) = Obj.magic x in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__5_ in
        let _v =
          let name =
            let x =
              let x = 
# 106 "src/parser.mly"
                                               ( String.concat "::" x )
# 10764 "src/parser.ml"
               in
              let _endpos = _endpos_x_ in
              let _startpos = _startpos_x_ in
              
# 552 "src/parser.mly"
      ( Location.mk_loc (Location.make _startpos _endpos) x )
# 10771 "src/parser.ml"
              
            in
            
# 109 "src/parser.mly"
                ( x )
# 10777 "src/parser.ml"
            
          in
          (
# 533 "src/parser.mly"
    ( Syntax.PTypeAlias (name, ty))
# 10783 "src/parser.ml"
           : (Syntax.pitem))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _5;
          MenhirLib.EngineTypes.startp = _startpos__5_;
          MenhirLib.EngineTypes.endp = _endpos__5_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = pfs;
            MenhirLib.EngineTypes.startp = _startpos_pfs_;
            MenhirLib.EngineTypes.endp = _endpos_pfs_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _;
              MenhirLib.EngineTypes.semv = _3;
              MenhirLib.EngineTypes.startp = _startpos__3_;
              MenhirLib.EngineTypes.endp = _endpos__3_;
              MenhirLib.EngineTypes.next = {
                MenhirLib.EngineTypes.state = _;
                MenhirLib.EngineTypes.semv = x;
                MenhirLib.EngineTypes.startp = _startpos_x_;
                MenhirLib.EngineTypes.endp = _endpos_x_;
                MenhirLib.EngineTypes.next = {
                  MenhirLib.EngineTypes.state = _menhir_s;
                  MenhirLib.EngineTypes.semv = _1;
                  MenhirLib.EngineTypes.startp = _startpos__1_;
                  MenhirLib.EngineTypes.endp = _endpos__1_;
                  MenhirLib.EngineTypes.next = _menhir_stack;
                };
              };
            };
          };
        } = _menhir_stack in
        let _5 : unit = Obj.magic _5 in
        let pfs : (Syntax.pprogram) = Obj.magic pfs in
        let _3 : unit = Obj.magic _3 in
        let x : (string list) = Obj.magic x in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__5_ in
        let _v =
          let name =
            let x =
              let x = 
# 106 "src/parser.mly"
                                               ( String.concat "::" x )
# 10840 "src/parser.ml"
               in
              let _endpos = _endpos_x_ in
              let _startpos = _startpos_x_ in
              
# 552 "src/parser.mly"
      ( Location.mk_loc (Location.make _startpos _endpos) x )
# 10847 "src/parser.ml"
              
            in
            
# 109 "src/parser.mly"
                ( x )
# 10853 "src/parser.ml"
            
          in
          (
# 535 "src/parser.mly"
    ( Syntax.PNamespace (name, pfs) )
# 10859 "src/parser.ml"
           : (Syntax.pitem))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _;
          MenhirLib.EngineTypes.semv = _3;
          MenhirLib.EngineTypes.startp = _startpos__3_;
          MenhirLib.EngineTypes.endp = _endpos__3_;
          MenhirLib.EngineTypes.next = {
            MenhirLib.EngineTypes.state = _;
            MenhirLib.EngineTypes.semv = a;
            MenhirLib.EngineTypes.startp = _startpos_a_;
            MenhirLib.EngineTypes.endp = _endpos_a_;
            MenhirLib.EngineTypes.next = {
              MenhirLib.EngineTypes.state = _menhir_s;
              MenhirLib.EngineTypes.semv = _1;
              MenhirLib.EngineTypes.startp = _startpos__1_;
              MenhirLib.EngineTypes.endp = _endpos__1_;
              MenhirLib.EngineTypes.next = _menhir_stack;
            };
          };
        } = _menhir_stack in
        let _3 : unit = Obj.magic _3 in
        let a : (Syntax.pannotations) = Obj.magic a in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__3_ in
        let _v : (Syntax.pannotations) = 
# 144 "src/parser.mly"
                                          ( a )
# 10899 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = sw;
          MenhirLib.EngineTypes.startp = _startpos_sw_;
          MenhirLib.EngineTypes.endp = _endpos_sw_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let sw : 
# 18 "src/parser.mly"
       (Syntax.swsize)
# 10920 "src/parser.ml"
         = Obj.magic sw in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_sw_ in
        let _endpos = _endpos_sw_ in
        let _v : (Syntax.swsize) = 
# 154 "src/parser.mly"
           ( sw )
# 10928 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = ws;
          MenhirLib.EngineTypes.startp = _startpos_ws_;
          MenhirLib.EngineTypes.endp = _endpos_ws_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let ws : (Syntax.swsize) = Obj.magic ws in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_ws_ in
        let _endpos = _endpos_ws_ in
        let _v : (Syntax.psizetype) = 
# 157 "src/parser.mly"
           (TypeWsize ws)
# 10953 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (string list) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v =
          let id =
            let x =
              let x = 
# 106 "src/parser.mly"
                                               ( String.concat "::" x )
# 10981 "src/parser.ml"
               in
              let _endpos = _endpos_x_ in
              let _startpos = _startpos_x_ in
              
# 552 "src/parser.mly"
      ( Location.mk_loc (Location.make _startpos _endpos) x )
# 10988 "src/parser.ml"
              
            in
            
# 109 "src/parser.mly"
                ( x )
# 10994 "src/parser.ml"
            
          in
          (
# 158 "src/parser.mly"
           (TypeSizeAlias id)
# 11000 "src/parser.ml"
           : (Syntax.psizetype))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = x;
          MenhirLib.EngineTypes.startp = _startpos_x_;
          MenhirLib.EngineTypes.endp = _endpos_x_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let x : (string list) = Obj.magic x in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos_x_ in
        let _endpos = _endpos_x_ in
        let _v =
          let x =
            let x =
              let x = 
# 106 "src/parser.mly"
                                               ( String.concat "::" x )
# 11029 "src/parser.ml"
               in
              let _endpos = _endpos_x_ in
              let _startpos = _startpos_x_ in
              
# 552 "src/parser.mly"
      ( Location.mk_loc (Location.make _startpos _endpos) x )
# 11036 "src/parser.ml"
              
            in
            
# 109 "src/parser.mly"
                ( x )
# 11042 "src/parser.ml"
            
          in
          (
# 112 "src/parser.mly"
          ( x )
# 11048 "src/parser.ml"
           : (Annotations.pident))
        in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Syntax.writable) = 
# 438 "src/parser.mly"
              (`Constant )
# 11074 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
      (fun _menhir_env ->
        let _menhir_stack = _menhir_env.MenhirLib.EngineTypes.stack in
        let {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = _1;
          MenhirLib.EngineTypes.startp = _startpos__1_;
          MenhirLib.EngineTypes.endp = _endpos__1_;
          MenhirLib.EngineTypes.next = _menhir_stack;
        } = _menhir_stack in
        let _1 : unit = Obj.magic _1 in
        let _endpos__0_ = _menhir_stack.MenhirLib.EngineTypes.endp in
        let _startpos = _startpos__1_ in
        let _endpos = _endpos__1_ in
        let _v : (Syntax.writable) = 
# 439 "src/parser.mly"
              (`Writable )
# 11099 "src/parser.ml"
         in
        {
          MenhirLib.EngineTypes.state = _menhir_s;
          MenhirLib.EngineTypes.semv = Obj.repr _v;
          MenhirLib.EngineTypes.startp = _startpos;
          MenhirLib.EngineTypes.endp = _endpos;
          MenhirLib.EngineTypes.next = _menhir_stack;
        });
    |]
  
  let terminal_count =
    77
  
  let token2terminal : token -> int =
    fun _tok ->
      match _tok with
      | WHILE ->
          1
      | UNDERSCORE ->
          2
      | UNALIGNED ->
          3
      | T_W _ ->
          4
      | T_INT_CAST _ ->
          5
      | T_INT ->
          6
      | T_BOOL ->
          7
      | TYPE ->
          8
      | TRUE ->
          9
      | TO ->
          10
      | SWSIZE _ ->
          11
      | SVSIZE _ ->
          12
      | STRING _ ->
          13
      | STAR ->
          14
      | STACK ->
          15
      | SLASH _ ->
          16
      | SHARPLBRACKET ->
          17
      | SHARP ->
          18
      | SEMICOLON ->
          19
      | RPAREN ->
          20
      | ROR ->
          21
      | ROL ->
          22
      | RETURN ->
          23
      | REQUIRE ->
          24
      | REG ->
          25
      | RBRACKET ->
          26
      | RBRACE ->
          27
      | RARROW ->
          28
      | QUESTIONMARK ->
          29
      | POINTER ->
          30
      | PLUS ->
          31
      | PIPEPIPE ->
          32
      | PIPE ->
          33
      | PERCENT _ ->
          34
      | PARAM ->
          35
      | NID _ ->
          36
      | NAMESPACE ->
          37
      | MUTABLE ->
          38
      | MINUS ->
          39
      | LTLT ->
          40
      | LT _ ->
          41
      | LPAREN ->
          42
      | LE _ ->
          43
      | LBRACKET ->
          44
      | LBRACE ->
          45
      | INT _ ->
          46
      | INLINE ->
          47
      | IF ->
          48
      | HAT ->
          49
      | GTGT _ ->
          50
      | GT _ ->
          51
      | GLOBAL ->
          52
      | GE _ ->
          53
      | FROM ->
          54
      | FOR ->
          55
      | FN ->
          56
      | FALSE ->
          57
      | EXPORT ->
          58
      | EXEC ->
          59
      | EQEQ ->
          60
      | EQ ->
          61
      | EOF ->
          62
      | ELSE ->
          63
      | DOWNTO ->
          64
      | DOT ->
          65
      | CONSTANT ->
          66
      | COMMA ->
          67
      | COLONCOLON ->
          68
      | COLON ->
          69
      | BANGEQ ->
          70
      | BANG ->
          71
      | ASSERT ->
          72
      | ARRAYINIT ->
          73
      | AMPAMP ->
          74
      | AMP ->
          75
      | ALIGNED ->
          76
  
  let error_terminal =
    0
  
  let token2value : token -> Obj.t =
    fun _tok ->
      match _tok with
      | WHILE ->
          Obj.repr ()
      | UNDERSCORE ->
          Obj.repr ()
      | UNALIGNED ->
          Obj.repr ()
      | T_W _v ->
          Obj.repr (_v : 
# 18 "src/parser.mly"
       (Syntax.swsize)
# 11285 "src/parser.ml"
          )
      | T_INT_CAST _v ->
          Obj.repr (_v : 
# 19 "src/parser.mly"
       (Syntax.sign)
# 11291 "src/parser.ml"
          )
      | T_INT ->
          Obj.repr ()
      | T_BOOL ->
          Obj.repr ()
      | TYPE ->
          Obj.repr ()
      | TRUE ->
          Obj.repr ()
      | TO ->
          Obj.repr ()
      | SWSIZE _v ->
          Obj.repr (_v : 
# 71 "src/parser.mly"
       (Syntax.swsize)
# 11307 "src/parser.ml"
          )
      | SVSIZE _v ->
          Obj.repr (_v : 
# 72 "src/parser.mly"
       (Syntax.svsize)
# 11313 "src/parser.ml"
          )
      | STRING _v ->
          Obj.repr (_v : 
# 85 "src/parser.mly"
       (string)
# 11319 "src/parser.ml"
          )
      | STAR ->
          Obj.repr ()
      | STACK ->
          Obj.repr ()
      | SLASH _v ->
          Obj.repr (_v : 
# 73 "src/parser.mly"
       (Syntax.sign option)
# 11329 "src/parser.ml"
          )
      | SHARPLBRACKET ->
          Obj.repr ()
      | SHARP ->
          Obj.repr ()
      | SEMICOLON ->
          Obj.repr ()
      | RPAREN ->
          Obj.repr ()
      | ROR ->
          Obj.repr ()
      | ROL ->
          Obj.repr ()
      | RETURN ->
          Obj.repr ()
      | REQUIRE ->
          Obj.repr ()
      | REG ->
          Obj.repr ()
      | RBRACKET ->
          Obj.repr ()
      | RBRACE ->
          Obj.repr ()
      | RARROW ->
          Obj.repr ()
      | QUESTIONMARK ->
          Obj.repr ()
      | POINTER ->
          Obj.repr ()
      | PLUS ->
          Obj.repr ()
      | PIPEPIPE ->
          Obj.repr ()
      | PIPE ->
          Obj.repr ()
      | PERCENT _v ->
          Obj.repr (_v : 
# 58 "src/parser.mly"
       (Syntax.sign option)
# 11369 "src/parser.ml"
          )
      | PARAM ->
          Obj.repr ()
      | NID _v ->
          Obj.repr (_v : 
# 83 "src/parser.mly"
       (string)
# 11377 "src/parser.ml"
          )
      | NAMESPACE ->
          Obj.repr ()
      | MUTABLE ->
          Obj.repr ()
      | MINUS ->
          Obj.repr ()
      | LTLT ->
          Obj.repr ()
      | LT _v ->
          Obj.repr (_v : 
# 52 "src/parser.mly"
       (Syntax.sign option)
# 11391 "src/parser.ml"
          )
      | LPAREN ->
          Obj.repr ()
      | LE _v ->
          Obj.repr (_v : 
# 51 "src/parser.mly"
       (Syntax.sign option)
# 11399 "src/parser.ml"
          )
      | LBRACKET ->
          Obj.repr ()
      | LBRACE ->
          Obj.repr ()
      | INT _v ->
          Obj.repr (_v : 
# 84 "src/parser.mly"
       (Syntax.int_representation)
# 11409 "src/parser.ml"
          )
      | INLINE ->
          Obj.repr ()
      | IF ->
          Obj.repr ()
      | HAT ->
          Obj.repr ()
      | GTGT _v ->
          Obj.repr (_v : 
# 47 "src/parser.mly"
       (Syntax.sign option)
# 11421 "src/parser.ml"
          )
      | GT _v ->
          Obj.repr (_v : 
# 46 "src/parser.mly"
       (Syntax.sign option)
# 11427 "src/parser.ml"
          )
      | GLOBAL ->
          Obj.repr ()
      | GE _v ->
          Obj.repr (_v : 
# 44 "src/parser.mly"
       (Syntax.sign option)
# 11435 "src/parser.ml"
          )
      | FROM ->
          Obj.repr ()
      | FOR ->
          Obj.repr ()
      | FN ->
          Obj.repr ()
      | FALSE ->
          Obj.repr ()
      | EXPORT ->
          Obj.repr ()
      | EXEC ->
          Obj.repr ()
      | EQEQ ->
          Obj.repr ()
      | EQ ->
          Obj.repr ()
      | EOF ->
          Obj.repr ()
      | ELSE ->
          Obj.repr ()
      | DOWNTO ->
          Obj.repr ()
      | DOT ->
          Obj.repr ()
      | CONSTANT ->
          Obj.repr ()
      | COMMA ->
          Obj.repr ()
      | COLONCOLON ->
          Obj.repr ()
      | COLON ->
          Obj.repr ()
      | BANGEQ ->
          Obj.repr ()
      | BANG ->
          Obj.repr ()
      | ASSERT ->
          Obj.repr ()
      | ARRAYINIT ->
          Obj.repr ()
      | AMPAMP ->
          Obj.repr ()
      | AMP ->
          Obj.repr ()
      | ALIGNED ->
          Obj.repr ()
  
  let default_reduction =
    "\000\000\0002\001\n\000\218\000\217\000\000\000\000\000\000\000\224\000\000\000\000\000\000\000\000\000o\000t\000\000\000\214\000\000\001\001\001\000\000\000\000\022\000\020\000\021\000\019\000I\000\000\000\000\000\017\000\016\000\000\000U\000T\000\000\0006\000\000\000q\000p\000\000\000\000\000\000\000\000\000*\001\r\000\000\000\000\000k\000\179\000\000\000\000\000\000\000|\000\000\000\000\000}\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000~\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\234\000\000\000\142\000\000\000\141\000:\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\n\000A\000\000\000?\000\000\000\t\000n\000v\000\000\000r\000\018\000\000\000\000\000\000\000\000\000s\000\000\000\140\000\000\000\000\000u\000\000\000\000\000\220\000\000\000\000\000\216\000\000\001\007\000\000\000\007\000\028\000\027\000\025\000\026\000\000\001\t\000(\000\005\000\255\000\006\000\000\000\000\000\146\000\151\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\149\000\148\000\147\000\000\000\000\000\000\000\000\000,\000\000\000\000\000l\000\000\000\000\000\000\000\159\000\000\000\000\000\160\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\161\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\236\000\000\000\177\000\000\000\176\000\145\000\153\000\000\000\000\000\000\000\000\000\150\000\000\000\175\000\000\000\000\000\152\000\000\000\000\000\000\000\r\000\000\000\000\000\230\000\249\000\012\000\000\000\248\000\004\000C\000\000\000\000\000\000\000\000\000\000\000\210\000\000\000\000\000\000\000\000\000\023\000\000\000\000\000\000\000\000\000\000\000\222\000.\000\000\000\000\000\240\000\000\000j\000\000\000\"\000\000\000\000\000\000\000\000\000\000\000\000\000\183\000\000\000\184\000\000\001\006\001\003\001\004\001\002\001\005\000\000\000\000\000\213\000\000\0004\000\212\000\b\000\030\000G\000\000\000\015\000\014\000\000\000\000\000\000\000\000\000$\000\000\000\000\000\000\000\000\000&\000\000\000Q\000\000\000\000\001\015\001\014\000W\000\252\000M\000\000\000\209\000\215\000\000\000\251\000\253\000\254\000\000\000\250\000\003\000\000\000\000\000\228\000R\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\000\000Y\000X\000K\000\000\000\000\000\000\000\000\000\196\000\200\000\000\000\000\000\000\000\024\000\000\000\206\000\000\000\000\000\000\000\000\000\203\000\000\000\202\000\000\000\204\000\199\000\000\000\000\000\238\000\000\000\000\000\000\000\000\000\\\000Z\000\186\000[\000\000\000\000\000\000\000\000\000\000\000\000\000\194\000\000\000\000\000\195\000\000\000\000\000\000\000\000\000\000\000\000\000\192\000\000\000\000\000\000\000\000\000\188\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\191\000\000\000\000\000\000\000\000\000\000\000\000\000\232\0008\000\000\000\000\000\246\000\000\000\198\000\000\000\197\000\205\000\000\000\000\000\000\000\000\000\189\000\000\000\000\000\000\000`\000\000\000\000\000a\000\000\000\000\000e\000\000\000\000\000f\000\000\000\000\000^\000\000\000\000\000i\000\000\000\000\000b\000\000\000\000\000_\000\000\000\000\000d\000\000\000\000\000h\000\000\000\000\000c\000]\000\000\000\000\000g\000\000\000\000\000\000\000\190\000\187\000\193\000\000\000\000\000\208\000\000\000\000\000\000\000\000\000\000\000\242\0000\000\000\000\000\000<\000\000\000=\000\000\000\180\000\181\000\000\000\000\000\000\000\244\000\211\000\002\000\000\000\000\000\226\000E\000\000\001\b\000\001\000\000\0001"
  
  let[@inline] default_reduction =
    fun i ->
      MenhirLib.PackedIntArray.get16 default_reduction i
  
  let error =
    "\139\128@\128\028\001\002\178\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000\000\000\000\138z\215\167\243\2083x\192\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000 \000\002\192\000\000\002\000\000\000\000\000\000\000\000\000\000\016\000\000\000\000\004B\000\000\146\160\004\000\016\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\002\225\000\000IP\002\000(\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\128\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\017\b\000\002J\128\016\000@\012\184@\000\018T\000\128\002\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000a\016\128\000$\168\001\000\020 \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000B!\000\000IP\002\000(\000\000\000\000\000\000\000\000\000\000\000\136@\000\018T\000\128\002\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001p\128\000$\168\001\000\020\000\b\132\000\001%@\b\000 \000\"\1585\225\252\244\b\2140\002!@\000IP\002\000\b\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\002\000\000\000\000\000\"\020\000\004\149\000 \000\128\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\002\1425\225\208t\b\0180\002\225\000\000IP\002\000(\000\017\b\000\002J\128\016\000@\000\000\000\000\000\000\000\000\000\000\005\194\000\000\146\160\004\000P\000\"\016\000\004\149\000 \000\128\000\000\000\000\000\000\000\000\000\000\011\132\000\001%@\b\000\160\000D \000\t*\000@\001\000\001\020\241\175\014\167\160D\177\128\023\b\000\002J\128\016\001@\000\136@\000\018T\000\128\002\000\002)\227^\029O@\137c\000.\016\000\004\149\000 \002\128\001\016\128\000$\168\001\000\004\000\000\000\000\000\000\000\000\000\000\000\\ \000\t*\000@\005\000\002!\000\000IP\002\000\b\000\b\167\141xu=\002%\140\000\184@\000\018T\000\128\n\000\004B\000\000\146\160\004\000\016\000\017O\026\240\234z\004K\024\001\016\128\000$\168\001\000\004\000\000P\192\188:\014\129\000\198\000D \000\t*\000@\001\000\001\020\241\175\014\167\160D\177\128\023\b\000\002J\128\016\001@\000\136@\000\018T\000\128\002\000\002)\227^\029O@\137c\000.\016\000\004\149\000 \002\128\001\016\128\000$\168\001\000\004\000\004S\198\188:\158\129\018\198\000\\ \000\t*\000@\005\000\002!\000\000IP\002\000\b\000\b\167\141xu=\002%\140\000\184@\000\018T\000\128\n\000\004B\000\000\146\160\004\000\016\000\017O\026\240\234z\004K\024\001p\128\000$\168\001\000\020\000\b\132\000\001%@\b\000 \000\"\1585\225\212\244\b\1500\002\225\000\000IP\002\000(\000\017\b\000\002J\128\016\000@\000E<k\195\169\232\017,`\005\194\000\000\146\160\004\000P\000\"\016\000\004\149\000 \000\128\000\138x\215\135S\208\"X\192\011\132\000\001%@\b\000\160\000D \000\t*\000@\001\000\001\020\241\175\014\167\160D\177\128\023\b\000\002J\128\016\001@\000\136@\000\018T\000\128\002\000\002)\227^\029O@\137c\000.\016\000\004\149\000 \002\128\001\016\128\000$\168\001\000\004\000\004S\198\188:\158\129\018\198\000\\ \000\t*\000@\005\000\002!\000\000IP\002\000\b\000\b\167\141xu=\002%\140\000\136@\000\018T\000\128\002\000\002)\227^\029O@\137c\000\"\016\000\004\149\000 \000\128\000\138x\199\135S\208\"X\192\b\132\000\001%@\b\000 \000\000\000\000\000\000\000\000\000\000\000\000@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\016\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000 \000\000\000\003\b\132\000\001%@\b\000\161\bD \000\t*\000@\005\000\002!\000\000IP\002\000\b\000\000\161\137xt\029\002\001\140\000\136@\000\018T\000\128\002\000\000(b^\029\007@\128#\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001C\018\240\232:\004\001\024\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\000\000\000\000\000@\000\000\000\000\017\b\000\002J\128\016\000@\000\000\000@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001G\002\240\232:\004\001\024\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000D \000\t*\000@\001\000\000\000\000\000\000\000\000\000\000\000\b\167\141xu=\002%\140\000\005\012K\195\160\232\016\004`\000\000\000\000\000\000\000\000\000\000\000\012\000\004\006\000\000\b\000\000\000`\000 0\000\000@\000\000\000\000\000\000\000\000\000\000\000\000\016\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001@\024\002\000@\b\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\192\000\000\000\016@\001\b\164\b\001%\224\012\000 \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\023\b\000\002J\128\016\001@\000\136@\000\018T\000\128\002\000e\194\000\000\146\160\004\000\016\012\"\016\000\004\149\000 \002\132!\016\128\000$\168\001\000\020\000\b\132\000\001%@\b\000 \000\002\134%\225\208t\b\0020\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\005\194\000\000\146\160\004\000P\000\"\016\000\004\149\000 \000\128\000\n8\215\135\225\208!X\192\b\133\000\001%@\b\000 \000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\017\n\000\002J\128\016\000@\000\000\000\000\000\000\000\000\000\000\000(\226^\029\007@\129#\000.\016\000\004\149\000 \002\128\001\016\128\000$\168\001\000\004\000\000\000\000\000\000\000\000\000\000\000\\ \000\t*\000@\005\000\002!\000\000IP\002\000\b\000\000\000\000\000\000\000\000\000\000\000\184@\000\018T\000\128\n\000\004B\000\000\146\160\004\000\016\000\001G\026\240\232:\004\011\024\001p\128\000$\168\001\000\020\000\b\132\000\001%@\b\000 \000\002\1425\225\208t\b\0220\002\225\000\000IP\002\000(\000\017\b\000\002J\128\016\000@\000\000\000\000\000\000\000\000\000\000\005\194\000\000\146\160\004\000P\000\"\016\000\004\149\000 \000\128\000\n8\215\135A\208 X\192\011\132\000\001%@\b\000\160\000D \000\t*\000@\001\000\000\020q\175\014\131\160@\177\128\017\b\000\002J\128\016\000@\000\005\012\011\195\160\232\016\012`\004B\000\000\146\160\004\000\016\000\001G\026\240\232:\004\011\024\001p\128\000$\168\001\000\020\000\b\132\000\001%@\b\000 \000\002\1425\225\208t\b\0220\002\225\000\000IP\002\000(\000\017\b\000\002J\128\016\000@\000\005\028k\195\160\232\016,`\005\194\000\000\146\160\004\000P\000\"\016\000\004\149\000 \000\128\000\n8\215\135A\208 X\192\011\132\000\001%@\b\000\160\000D \000\t*\000@\001\000\000\020q\175\014\131\160@\177\128\023\b\000\002J\128\016\001@\000\136@\000\018T\000\128\002\000\000(\227^\029\007@\129c\000.\016\000\004\149\000 \002\128\001\016\128\000$\168\001\000\004\000\000Q\198\188:\014\129\002\198\000\\ \000\t*\000@\005\000\002!\000\000IP\002\000\b\000\000\163\141xt\029\002\005\140\000\184@\000\018T\000\128\n\000\004B\000\000\146\160\004\000\016\000\001G\026\240\232:\004\011\024\001p\128\000$\168\001\000\020\000\b\132\000\001%@\b\000 \000\002\1425\225\208t\b\0220\002\225\000\000IP\002\000(\000\017\b\000\002J\128\016\000@\000\005\028k\195\160\232\016,`\005\194\000\000\146\160\004\000P\000\"\016\000\004\149\000 \000\128\000\n8\215\135A\208 X\192\b\132\000\001%@\b\000 \000\002\1425\225\208t\b\0220\002!\000\000IP\002\000\b\000\000\163\140xt\029\002\005\140\000\136@\000\018T\000\128\002\000\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\016\000\000\000\000\000\000\000\000\000\000\000\000\128\000\000\000\000\"\016\000\004\149\000 \000\128\000\000\000\128\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\002\142\005\225\208t\b\0020\000\000\000\000\000\000\000\000\000\000\000\002\000\000\000\000\000\000\000\000\136@\000\018T\000\128\002\000\000\000\000\000\000\000\000\000\000\000\001G\026\240\232:\004\011\024\000\020\001@ \004\000\128\000\000\000\000\002\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\128\000\000\000\000\128\000\001@\016\002\000@\b\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\n\024\215\135A\208 H\192\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\002\192\000\000\002\000\000\000\000\000\000\000\000\000\016\000\000\000\000\000\000\000\000\000\000\000\000@\000\000\"\016\000\004\149\000 \000\128\000\nX\023\135A\208 \b\192\000\000\000\000\000\000\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\000\000\000 \000\000\000\002\224\016$\007\000@\172\000\000\000\000\000\000\016\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000\000\000\000\128\000\000\000\000\000\001\000\000\000@\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000\000\000\000\016\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\128\000\000\000\000\001\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\003\000\011\002 ALM\000\006\000\000\000\000\000\000\000\000\000\000\023\000\129 8\002\005d\000\000\000\000\000\000\128\000\000\000\000\000\000\000\000\000\000\000\002\000\000\001\016\128\000$\184\001\000\004\000\b\132\000\001%@\b\000 \000\000\000\016\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000)`^\029\007@\128#\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\005\194 H\014\000\129Y\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\002\001@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\002\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\nB\000\000\b@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\016\000\000\000\000\000\000\000\000\000\000\128\000@\000\000\000\000\000\160 \000\018\132\000\000\000\000\005!\000\000\004 \000\000\000\000\000\000\000\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000@\016\000\000B\000\000\000\022\000\000\004\020\000\000\000@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\016\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\176\000\000 \160\000\000\002\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\011\000\000\000\b\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\016\000\000\b\000\000 \000\000\020\004\000\000\016\128\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\128\000\000\000`\001aT\b)\137\000\000\195\000\011\n\160ALH\000\006\000\000\000\000\000\000\000\000\000\000\192\002@\136\016S\018\000\001\128\000\000\000\000\002@\000\000\0000\000\176*\004\020\196\128\000`\000\000\000@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\b\000\000\000\000\000\136@\000\018T\000\128\002\000\000(\224^\029\007@\128#0\000\176\170\004\022\196\128\000`\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\004\000\000\000\000\000(\002\128@\b\001\000\000\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\002\000\000\128\000\128\128\000\000\000\000\000\000\000\000\000\000\000\000\000a\016\128\000$\168\001\000\020!\b\132\000\001%@\b\000\160\000D \000\t*\000@\001\000\000\0201/\014\131\160@\017\128\000\000\000\000\000\000\000\000\000\000\005\028\002\195\016\192\b\160 \000\000\000\000\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\002\142\001a\128`\004\016\017\000\000\000\000@@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\136@\000\018T\000\128\002\000\000(`^\029G@\128#0\000\176\170\004\020\196\128\128`\000\000\000\000\000\018\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\016\000\000\000\000\000\000\000\000\000\000\000\000@\000\000\"\016\000\004\149\000 \000\128\000\138\024\023\135A\208\"\b\192\b\132\000\001%@\b\000 \000\002\134\005\225\212t\b\0020\000\000\000\000\000\000\000\000\000\000\017\b\000\002J\128\016\000@\000\005\012\011\195\168\232\016\004`\000\000\000\000\000\000\000\000\000\000\000\000\000\000\016\000\000\000\000\000\016\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\002\000\000D \000\t*\000@\001\000\000\020p/\014\131\160@\017\128\000\004\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\002\000\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\000\002\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\0200\011\rC\000\"\128\128\017\n\000\002J\128\016\000@\000\000\016\000\000\000\000\000\000\000\000\001\000\000\000\b\000\000\000\000\"\016\000\004\149\000 \000\128\000\nX\023\135A\208 \b\192\000\002\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000@\000\000\000\000\000\000\004\000\002\000\000\001\004\000\000\136@\000\018T\000\128\002\000\000)`^\029\007@\129#\000\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\000\016\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000@\000\000\000\000\000\000\004\000\002\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\017\n\000\002J\128\016\000@\000\000\016\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\n\024\005\134\001\128\016\000@\003\000\000\000\000\000\000\128\128\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\000\006\000\000\000\000\000\001\001\000\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\000\000\000\000\000\012\000\000\000\000\000\002\002\000\000\000\000\000\000\000\000\016\000\000\000\000\000\000\000\000\000\000\000\000\024\000\000\000\000\000\004\004\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\000\000\000\000\0000\000\000\000\000\000\b\b\000\000\000\000\000\000\000\000@\000\000\000\000\000\000\000\000\000\000\000\000`\000\000\000\000\000\016\016\000\000\000\000\000\000\000\000\128\000\000\000\000\000\000\000\000\000\000\000\000\192\000\000\000\000\000  \000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\001\128\000\000\000\000\000@@\000\000\000\000\000\000\000\002\000\000\000\000\000\000\000\000\000\000\000\000\003\000\000\000\000\000\000\128\128\000\000\000\000\000\000\000\004\000\000\000\000\000\000\000\000\000\000\000\000\006\000\000\000\000\000\001\001\000\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\000\000\000\000\000\012\000\000\000\000\000\002\002\000\000\000\000\000\000\000\000\016\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\192\000\000\000\000\000  \000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\000\000\004B\000\000\146\160\004\000\016\000\001K\002\240\232z\004\001\024\000\000@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\161\128X`\024\001\004\004@\000\000\000\016\016\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\136\000\000\000\000\000\000\000\000@\000 \128\000\000\000\000\000\001\000\001\000\000\000\000\000\000\000\024\000\000\000\000\000\016\000\000\000\000\000@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\128\000\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\002\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\128\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\016\004\000\000\016\128\000\000\000\000\000\000\004\000\000\000\000\000\000\000 \000 \000\000\000@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\002\000\000\000\000\000\004\000\000\002\128\128\000\002\016\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\016\000\000\000\000\000\000\000\000\000\000\000"
  
  let[@inline] error =
    fun i ->
      MenhirLib.PackedIntArray.get1 error i
  
  let[@inline] error =
    fun i j ->
      error (77 * i + j)
  
  let start =
    1
  
  let action_displacement =
    "\011\026\000\000\000\000\000\000\000\000\022\012\000\021\022\012\000\000\001.\011\026\001\130\011\026\000\000\000\000\022\012\000\000\026\144\000\000\000\000\022\012\000\000\000\000\000\000\000\000\000\000\011\026\025H\000\000\000\000\025\214\000\000\000\000\026\176\000\000\011\026\000\000\000\000\026\144\011\026\000h\011\026\000\000\000\000\000F\011\026\000\000\000\000\000\228\026\144\011\026\000\000\026\144\011\026\000\000\026\144\011\026\006\180\026\144\011\026\005\188\026\144\011\026\000\000\026\144\011\026\0070\026\144\011\026\002X\011\026\000\228\011\026\007\172\026\144\011\026\004\196\026\144\011\026\t \026\144\011\026\005@\026\144\011\026\004H\026\144\011\026\b(\026\144\011\026\001`\026\144\011\026\b\164\026\144\011\026\t\156\026\144\011\026\001\220\026\144\011\026\003\204\026\144\011\026\002\212\011\026\003P\011\026\n\024\011\026\000\000\001\192\000\000\001\202\000\000\000\000\001\166\025\214\026\176\011\026\011x\011\026\022\174\000\000\000\000\022\012\000\000\000*\000\000\000\000\000\000\023\012\000\000\000\000\000\136\000n\011\026\000\184\000\000\021\162\000\000\001V\011\026\000\000\0068\021D\000\000\000\140\000\016\000\000\001\026\000\000\n,\000\000\000\000\000\000\000\000\000\000\001,\000\000\000\000\000\000\000\000\000\000\0003\022\012\000\000\000\000\026\144\022\012\022\012\025\214\026\176\011\026\022P\000\000\000\000\000\000\026\144\022\012\n\138\022\012\000\000\001\"\022\012\000\000\020`\026\144\022\012\000\000\026\144\022\012\000\000\026\144\022\012\015z\026\144\022\012\015\b\026\144\022\012\000\000\026\144\022\012\014$\026\144\022\012\r@\022\012\020`\022\012\011\234\026\144\022\012\015\236\026\144\022\012\018\152\026\144\022\012\012\206\026\144\022\012\r\178\026\144\022\012\017B\026\144\022\012\019|\026\144\022\012\016^\026\144\022\012\016\208\026\144\022\012\017\180\026\144\022\012\012\\\026\144\022\012\019\n\022\012\018&\022\012\020\210\022\012\000\000\001h\000\000\001j\000\000\000\000\000\000\001\130\001T\022\012\001\128\000\000\019\238\000\000\001\144\022\012\000\000\014\150\n,\001\134\000\000\000'\n,\000\000\000\000\000\000\019\238\000\000\000\000\000\000\011\026\022\012\001N\011\026\022P\000\000\022\012\001r\011\026\022\012\000\000\022\012\001z\000\"\001F\001J\000\000\000\000\000|\000\"\000\000\001\170\000\000\023d\000\000\011\026\022\012\000\238\011\026\011\026\001\158\000\000\001\176\000\000\021\162\000\000\000\000\000\000\000\000\000\000\001\172\024\254\000\000\024\254\000\000\000\000\000\000\000\000\000\000\000f\000\000\000\000\001r\022\012\000\200\023d\000\000\001\188\000T\n\220\n\220\000\000\000\186\000\000\024\188\011\234\000\000\000\000\000\000\000\000\000\000\001\190\000\000\000\000\011\234\000\000\000\000\000\000\011\026\000\000\000\000\000\000\023d\000\000\000\000\000U\023d\023d\000\000\024\188\000\228\023d\000\025\000\000\000\000\000\000\001\154\011\026\021D\023\204\000\000\000\000\000)\n,\000&\000\000\024\188\000\000\025\214\026\176\011\026\021\162\000\000\024d\000\000\000b\000\000\000\000\025\130\024\188\000\000\011\026\000\228\024\026\024\188\000\000\000\000\000\000\000\000\022\012\001D\011\026\000\228\011\026\000\228\000\000\011\026\000\228\000\000\000\162\001\130\001\018\011\026\011x\000\212\000\000\000\178\022\012\000\236\001L\000\000\024d\011\026\000\238\000\228\011\026\021D\000\250\000\000\022\012\001\b\011\026\011x\022\012\001\b\000\000\000\000\022\012\001\b\000\000\001\004\000\000\001\006\000\000\000\000\001\n\011\026\0012\001\028\000\000\026L\022\012\000\210\000\000\022\012\000\216\000\000\022\012\000\232\000\000\022\012\000\218\000\000\022\012\000\222\000\000\022\012\000\182\000\000\022\012\000\220\000\000\022\012\000a\000\000\022\012\000\242\000\000\022\012\001\n\000\000\022\012\000\142\000\000\000\000\022\012\000v\000\000\011\026\000\228\000\170\000\000\000\000\000\000\025\246\024\188\000\000\000j\n,\n,\000\182\022\012\000\000\000\000\000H\001@\000\000\000<\000\000\001\168\000\000\000\000\024\188\022\012\025H\000\000\000\000\000\000\000R\023d\000\000\000\000\000\019\000\000\000\000\000s\000\000"
  
  let[@inline] action_displacement =
    fun i ->
      MenhirLib.PackedIntArray.get16 action_displacement i
  
  let action_data =
    "\003y\001\005\001\005\005\194\003y\bk\003y\003\145\003\145\003y\003y\003y\003y\007\154\003y\005\222\003y\003y\b^\003y\003\137\003y\003y\003y\003y\006\006\003y\003q\003q\003y\003y\003y\003y\003y\003y\003y\002\158\000\177\003y\003y\003y\003y\001\005\003y\003q\003\137\006\014\002\n\004J\b\"\003y\003y\004-\003q\003y\003y\b\022\003y\000\030\003y\003y\003\129\001\177\004\162\003y\003y\001\177\005\178\001\177\006:\005V\001\177\001\177\001\177\001\177\003q\007\250\000\182\001\177\001\177\000\233\001\177\003\185\001\177\001\177\001\177\001\177\001=\002&\003i\003i\001\177\001\177\001\177\000\166\001\177\000\225\001\177\0052\002*\001\177\001\177\001\177\001\177\007\222\001\177\003i\001\r\bN\0056\003\193\003\193\001\177\005f\004)\003i\001\177\001\214\0022\001\177\007\206\001\177\001\177\006\154\006~\006\174\001\177\001\177\000\198\004\182\000\210\006\182\007\190\0015\003\161\000\222\001\014\003i\006\190\006\210\003\161\003\161\005F\001\026\006\226\000\234\001\"\001*\000\246\007\022\007\030\003\209\007\130\001\002\0016\001f\001%\001r\b\006\005\214\002f\0076\006\214\001B\001N\001~\007F\001\138\000\217\007R\007j\007\142\007v\0072\001\150\007*\002\134\007^\006\138\b\026\004\218\001\190\007\166\001\182\001\162\006\194\002\029\002\234\001\174\001Z\000\198\002B\000\210\006\238\007\178\002\029\002\029\000\222\001\014\007\002\003\250\004\002\002\029\002\029\006\162\002\029\006\158\000\234\002\029\001*\000\246\004\170\000*\004\018\004\022\001\002\0016\002\029\004\030\002\029\004.\002\029\004B\006v\002\029\001B\001N\002\029\004v\002\029\004\138\004\158\004\166\004\194\004\230\004\238\002\029\0002\005\014\b*\002\029\005>\005R\002\029\001\202\002\029\002\029\005\238\002)\001\210\002\029\001Z\000\198\005\138\000\210\001\222\000\000\002)\002)\000\222\001\014\000\000\000\000\000\000\002)\002)\000\000\002)\000\000\000\234\002)\001*\000\246\000\000\000\000\000\000\000\000\001\002\0016\002)\000\000\002)\000\000\002)\000\000\000\000\002)\001B\001N\002)\000\000\002)\000\000\000\000\000\000\000\000\000\000\000\000\002)\000\000\000\000\000\000\002)\000\000\000\000\002)\000\000\002)\002)\000\000\002\017\000\000\002)\001Z\000\198\000\000\000\210\000\000\000\000\002\017\002\017\002\017\002\017\000\000\000\000\000\000\002\017\002\017\000\000\002\017\000\000\000\234\002\017\002\017\000\246\000\000\000\000\000\000\000\000\001\002\002\017\002\017\000\000\002\017\000\000\002\017\000\000\000\000\002\017\002\017\002\017\002\017\000\000\002\017\000\000\000\000\000\000\000\000\000\000\000\000\002\017\000\000\000\000\000\000\002\017\000\000\000\000\002\017\000\000\002\017\002\017\000\000\002\025\000\000\002\017\002\017\000\198\000\000\000\210\000\000\000\000\002\025\002\025\000\222\001\014\000\000\000\000\000\000\002\025\002\025\000\000\002\025\000\000\000\234\002\025\001*\000\246\000\000\000\000\000\000\000\000\001\002\0016\001f\000\000\001r\000\000\002\025\000\000\000\000\002\025\001B\001N\001~\000\000\001\138\000\000\000\000\000\000\000\000\000\000\000\000\002\025\000\000\000\000\000\000\002\025\000\000\000\000\002\025\000\000\002\025\002\025\000\000\001\221\000\000\002\025\001Z\000\198\000\000\000\210\000\000\000\000\001\221\001\221\000\222\001\014\000\000\000\000\000\000\001\221\001\221\000\000\001\221\000\000\000\234\001\221\001*\000\246\000\000\000\000\000\000\000\000\001\002\0016\001f\000\000\001r\000\000\001\221\000\000\000\000\001\221\001B\001N\001~\000\000\001\138\000\000\000\000\000\000\000\000\000\000\000\000\001\150\000\000\000\000\000\000\001\221\000\000\000\000\001\221\000\000\001\221\001\162\000\000\002\021\000\000\001\221\001Z\000\198\000\000\000\210\000\000\000\000\002\021\002\021\000\222\001\014\000\000\000\000\000\000\002\021\002\021\000\000\002\021\000\000\000\234\002\021\001*\000\246\000\000\000\000\000\000\000\000\001\002\0016\001f\000\000\001r\000\000\002\021\000\000\000\000\002\021\001B\001N\001~\000\000\001\138\000\000\000\000\000\000\000\000\000\000\000\000\002\021\000\000\000\000\000\000\002\021\000\000\000\000\002\021\000\000\002\021\002\021\000\000\002\t\000\000\002\021\001Z\000\198\000\000\000\210\000\000\000\000\002\t\002\t\002\t\002\t\000\000\000\000\000\000\002\t\002\t\000\000\002\t\000\000\000\234\002\t\002\t\000\246\000\000\000\000\000\000\000\000\001\002\002\t\002\t\000\000\002\t\000\000\002\t\000\000\000\000\002\t\002\t\002\t\002\t\000\000\002\t\000\000\000\000\000\000\000\000\000\000\000\000\002\t\000\000\000\000\000\000\002\t\000\000\000\000\002\t\000\000\002\t\002\t\000\000\001\253\000\000\002\t\002\t\000\198\000\000\000\210\000\000\000\000\001\253\001\253\000\222\001\014\000\000\000\000\000\000\001\253\001\253\000\000\001\253\000\000\000\234\001\253\001\253\000\246\000\000\000\000\000\000\000\000\001\002\0016\001\253\000\000\001\253\000\000\001\253\000\000\000\000\001\253\001B\001N\001\253\000\000\001\253\000\000\000\000\000\000\000\000\000\000\000\000\001\253\000\000\000\000\000\000\001\253\000\000\000\000\001\253\000\000\001\253\001\253\000\000\002\001\000\000\001\253\001Z\000\198\000\000\000\210\000\000\000\000\002\001\002\001\000\222\001\014\000\000\000\000\000\000\002\001\002\001\000\000\002\001\000\000\000\234\002\001\002\001\000\246\000\000\000\000\000\000\000\000\001\002\0016\002\001\000\000\002\001\000\000\002\001\000\000\000\000\002\001\002\001\001N\002\001\000\000\002\001\000\000\000\000\000\000\000\000\000\000\000\000\002\001\000\000\000\000\000\000\002\001\000\000\000\000\002\001\000\000\002\001\002\001\000\000\001\229\000\000\002\001\001Z\000\198\000\000\000\210\000\000\000\000\001\229\001\229\001\229\001\229\000\000\000\000\000\000\001\229\001\229\000\000\001\229\000\000\001\229\001\229\001\229\000\246\000\000\000\000\000\000\000\000\001\229\001\229\001\229\000\000\001\229\000\000\001\229\000\000\000\000\001\229\001\229\001\229\001\229\000\000\001\229\000\000\000\000\000\000\000\000\000\000\000\000\001\229\000\000\000\000\000\000\001\229\000\000\000\000\001\229\000\000\001\229\001\229\000\000\001\217\000\000\001\229\001\229\000\198\000\000\000\210\000\000\000\000\001\217\001\217\001\217\001\217\000\000\000\000\000\000\001\217\001\217\000\000\001\217\000\000\001\217\001\217\001\217\000\246\000\000\000\000\000\000\000\000\001\217\001\217\001\217\000\000\001\217\000\000\001\217\000\000\000\000\001\217\001\217\001\217\001\217\000\000\001\217\000\000\000\000\000\000\000\000\000\000\000\000\001\217\000\000\000\000\000\000\001\217\000\000\000\000\001\217\000\000\001\217\001\217\000\000\002\r\000\000\001\217\001\217\000\198\000\000\000\210\000\000\000\000\002\r\002\r\002\r\002\r\000\000\000\000\000\000\002\r\002\r\000\000\002\r\000\000\000\234\002\r\002\r\000\246\000\000\000\000\000\000\000\000\001\002\002\r\002\r\000\000\002\r\000\000\002\r\000\000\000\000\002\r\002\r\002\r\002\r\000\000\002\r\000\000\000\000\000\000\000\000\000\000\000\000\002\r\000\000\000\000\000\000\002\r\000\000\000\000\002\r\000\000\002\r\002\r\000\000\001\233\000\000\002\r\002\r\000\198\000\000\000\210\000\000\000\000\001\233\001\233\001\233\001\233\000\000\000\000\000\000\001\233\001\233\000\000\001\233\000\000\001\233\001\233\001\233\000\246\000\000\000\000\000\000\000\000\001\233\001\233\001\233\000\000\001\233\000\000\001\233\000\000\000\000\001\233\001\233\001\233\001\233\000\000\001\233\000\000\000\000\000\000\000\000\000\000\000\000\001\233\000\000\000\000\000\000\001\233\000\000\000\000\001\233\000\000\001\233\001\233\000\000\001\225\000\000\001\233\001\233\000\198\000\000\000\210\000\000\000\000\001\225\001\225\000\222\001\014\000\000\000\000\000\000\001\225\001\225\000\000\001\225\000\000\000\234\001\225\001*\000\246\000\000\000\000\000\000\000\000\001\002\0016\001f\000\000\001r\000\000\001\225\000\000\000\000\001\225\001B\001N\001~\000\000\001\138\000\000\000\000\000\000\000\000\000\000\000\000\001\150\000\000\000\000\000\000\001\225\000\000\000\000\001\225\000\000\001\225\001\162\000\000\001\249\000\000\001\174\001Z\000\198\000\000\000\210\000\000\000\000\001\249\001\249\000\222\001\014\000\000\000\000\000\000\001\249\001\249\000\000\001\249\000\000\000\234\001\249\001\249\000\246\000\000\000\000\000\000\000\000\001\002\0016\001\249\000\000\001\249\000\000\001\249\000\000\000\000\001\249\001\249\001N\001\249\000\000\001\249\000\000\000\000\000\000\000\000\000\000\000\000\001\249\000\000\000\000\000\000\001\249\000\000\000\000\001\249\000\000\001\249\001\249\000\000\002!\000\000\001\249\001\249\000\198\000\000\000\210\000\000\000\000\002!\002!\000\222\001\014\000\000\000\000\000\000\002!\002!\000\000\002!\000\000\000\234\002!\001*\000\246\000\000\000\000\000\000\000\000\001\002\0016\002!\000\000\002!\000\000\002!\000\000\000\000\002!\001B\001N\002!\000\000\002!\000\000\000\000\000\000\000\000\000\000\000\000\002!\000\000\000\000\000\000\002!\000\000\000\000\002!\000\000\002!\002!\000\000\002\005\000\000\002!\001Z\000\198\000\000\000\210\000\000\000\000\002\005\002\005\002\005\002\005\000\000\000\000\000\000\002\005\002\005\000\000\002\005\000\000\000\234\002\005\002\005\000\246\000\000\000\000\000\000\000\000\001\002\002\005\002\005\000\000\002\005\000\000\002\005\000\000\000\000\002\005\002\005\002\005\002\005\000\000\002\005\000\000\000\000\000\000\000\000\000\000\000\000\002\005\000\000\000\000\000\000\002\005\000\000\000\000\002\005\000\000\002\005\002\005\000\000\002%\000\000\002\005\002\005\000\198\000\000\000\210\000\000\000\000\002%\002%\000\222\001\014\000\000\000\000\000\000\002%\002%\000\000\002%\000\000\000\234\002%\001*\000\246\000\000\000\000\000\000\000\000\001\002\0016\002%\000\000\002%\000\000\002%\000\000\000\000\002%\001B\001N\002%\000\000\002%\000\000\000\000\000\000\000\000\000\000\000\000\002%\000\000\000\000\000\000\002%\000\000\000\000\002%\000\000\002%\002%\000\000\0029\000\000\002%\001Z\000\198\000\000\000\210\000\000\000\000\0029\0029\000\222\001\014\002n\000\000\002r\0029\0029\000\000\000\185\000\185\000\234\001\"\001*\000\246\002v\000\153\000\153\000\000\001\002\0016\001f\000\000\001r\000\000\0029\000\026\000\000\0029\001B\001N\001~\007\254\001\138\000\000\000\000\000\000\002z\000\000\000\000\001\150\000\000\000\000\000\000\0029\000\000\000\000\0029\002~\0029\001\162\002=\000\000\002=\001\174\001Z\000\000\002=\002=\002=\000\000\000\000\000\000\002=\002=\000\000\002=\000\000\002=\002=\002=\002=\000\000\000\000\000\000\000\000\002=\002=\002=\002\222\002=\000\225\000\000\000\000\000\000\000\000\002=\002=\002=\000\000\002=\000\000\000\000\000\129\000\000\002j\000\000\002=\000\145\000\000\000\000\000\000\001\214\000\129\002=\000\000\002=\002=\000\000\000\007\000\000\002=\002=\000\n\000\000\000\014\000\018\000\022\0006\000\000\005Z\000\000\000:\000\145\000\000\000\129\002j\000>\000\000\000\161\000\129\000\000\000\000\001\021\000\000\000\000\000q\000\000\000\000\000\000\000\000\000\000\000\000\000\000\004j\000\026\004\130\000\000\000F\000\000\000\000\000n\000\000\000z\004\222\000\146\000\129\000\000\000\000\000\000\000\000\000\000\000\000\004\142\000\000\000\129\000\150\000\129\004\150\000\000\000\198\000q\000\210\000\000\000\000\003\153\006\170\000\222\001\014\000\000\000\154\000\000\000\253\000\000\000\000\001\026\000\000\000\234\001\"\001*\000\246\000\000\000\000\000\000\000\000\001\002\0016\001f\000\000\001r\000\000\000\000\000\000\000\000\000\000\001B\001N\001~\000\000\001\138\000\000\000\000\000\000\000\000\000\000\000\000\001\150\001-\000\000\001-\001-\000\000\000\000\006\246\000\000\001\238\001\162\002\246\000\000\003\002\001\174\001Z\000\000\002m\003\014\003>\000\000\000\000\000\000\002m\002m\000\000\002m\001U\003\026\002m\003Z\003&\000\000\001-\000\000\005r\0032\003f\003\150\000\000\003\162\000\000\000\000\000\000\000\000\000\000\003r\003~\003\174\000\000\003\186\000\000\000\000\000\000\000\000\000\000\000\000\003\198\000\000\000\000\000\000\000\000\000\000\005v\002m\000\000\002m\003\210\002\246\000\000\003\002\003\222\003\138\000\000\002\161\003\014\003>\000\000\000\000\000\000\002\161\002\161\000\000\002\161\000\000\003\026\002\161\003Z\003&\000\000\000\000\000\000\000\000\0032\003f\003\150\000\000\003\162\000\000\000\000\000\000\000\000\000\000\003r\003~\003\174\000\000\003\186\000\000\000\000\000\000\000\000\000\000\000\000\002\161\000\000\000\000\000\000\000\000\000\000\000\000\002\161\000\000\002\161\002\161\002\246\000\000\003\002\002\161\003\138\000\000\002\141\003\014\003>\000\000\000\000\000\000\002\141\002\141\000\000\002\141\000\000\003\026\002\141\002\141\003&\000\000\000\000\000\000\000\000\0032\003f\002\141\000\000\002\141\000\000\000\000\000\000\000\000\000\000\002\141\003~\002\141\000\000\002\141\000\000\000\000\000\000\000\000\000\000\000\000\002\141\000\000\000\000\000\000\000\000\000\000\000\000\002\141\000\000\002\141\002\141\002\246\000\000\003\002\002\141\003\138\000\000\002\157\002\157\002\157\000\000\000\000\000\000\002\157\002\157\000\000\002\157\000\000\003\026\002\157\002\157\003&\000\000\000\000\000\000\000\000\0032\002\157\002\157\000\000\002\157\000\000\000\000\000\000\000\000\000\000\002\157\002\157\002\157\000\000\002\157\000\000\000\000\000\000\000\000\000\000\000\000\002\157\000\000\000\000\000\000\000\000\000\000\000\000\002\157\000\000\002\157\002\157\002\246\000\000\003\002\002\157\002\157\000\000\002\149\002\149\002\149\000\000\000\000\000\000\002\149\002\149\000\000\002\149\000\000\003\026\002\149\002\149\003&\000\000\000\000\000\000\000\000\0032\002\149\002\149\000\000\002\149\000\000\000\000\000\000\000\000\000\000\002\149\002\149\002\149\000\000\002\149\000\000\000\000\000\000\000\000\000\000\000\000\002\149\000\000\000\000\000\000\000\000\000\000\000\000\002\149\000\000\002\149\002\149\002\246\000\000\003\002\002\149\002\149\000\000\002u\002u\002u\000\000\000\000\000\000\002u\002u\000\000\002u\000\000\002u\002u\002u\003&\000\000\000\000\000\000\000\000\002u\002u\002u\000\000\002u\000\000\000\000\000\000\000\000\000\000\002u\002u\002u\000\000\002u\000\000\000\000\000\000\000\000\000\000\000\000\002u\000\000\000\000\000\000\000\000\000\000\000\000\002u\000\000\002u\002u\002\246\000\000\003\002\002u\002u\000\000\002e\002e\002e\000\000\000\000\000\000\002e\002e\000\000\002e\000\000\002e\002e\002e\003&\000\000\000\000\000\000\000\000\002e\002e\002e\000\000\002e\000\000\000\000\000\000\000\000\000\000\002e\002e\002e\000\000\002e\000\000\000\000\000\000\000\000\000\000\000\000\002e\000\000\000\000\000\000\000\000\000\000\000\000\002e\000\000\002e\002e\002\246\000\000\003\002\002e\002e\000\000\002q\002q\002q\000\000\000\000\000\000\002q\002q\000\000\002q\000\000\002q\002q\002q\003&\000\000\000\000\000\000\000\000\002q\002q\002q\000\000\002q\000\000\000\000\000\000\000\000\000\000\002q\002q\002q\000\000\002q\000\000\000\000\000\000\000\000\000\000\000\000\002q\000\000\000\000\000\000\000\000\000\000\000\000\002q\000\000\002q\002q\002\246\000\000\003\002\002q\002q\000\000\002\153\002\153\002\153\000\000\000\000\000\000\002\153\002\153\000\000\002\153\000\000\003\026\002\153\002\153\003&\000\000\000\000\000\000\000\000\0032\002\153\002\153\000\000\002\153\000\000\000\000\000\000\000\000\000\000\002\153\002\153\002\153\000\000\002\153\000\000\000\000\000\000\000\000\000\000\000\000\002\153\000\000\000\000\000\000\000\000\000\000\000\000\002\153\000\000\002\153\002\153\002\246\000\000\003\002\002\153\002\153\000\000\002\137\003\014\003>\000\000\000\000\000\000\002\137\002\137\000\000\002\137\000\000\003\026\002\137\002\137\003&\000\000\000\000\000\000\000\000\0032\003f\002\137\000\000\002\137\000\000\000\000\000\000\000\000\000\000\003r\003~\002\137\000\000\002\137\000\000\000\000\000\000\000\000\000\000\000\000\002\137\000\000\000\000\000\000\000\000\000\000\000\000\002\137\000\000\002\137\002\137\002\246\000\000\003\002\002\137\003\138\000\000\002\173\003\014\003>\000\000\000\000\000\000\002\173\002\173\000\000\002\173\000\000\003\026\002\173\003Z\003&\000\000\000\000\000\000\000\000\0032\003f\002\173\000\000\002\173\000\000\000\000\000\000\000\000\000\000\003r\003~\002\173\000\000\002\173\000\000\000\000\000\000\000\000\000\000\000\000\002\173\000\000\000\000\000\000\000\000\000\000\000\000\002\173\000\000\002\173\002\173\002\246\000\000\003\002\002\173\003\138\000\000\002\177\003\014\003>\000\000\000\000\000\000\002\177\002\177\000\000\002\177\000\000\003\026\002\177\003Z\003&\000\000\000\000\000\000\000\000\0032\003f\002\177\000\000\002\177\000\000\000\000\000\000\000\000\000\000\003r\003~\002\177\000\000\002\177\000\000\000\000\000\000\000\000\000\000\000\000\002\177\000\000\000\000\000\000\000\000\000\000\000\000\002\177\000\000\002\177\002\177\002\246\000\000\003\002\002\177\003\138\000\000\002\133\003\014\003>\000\000\000\000\000\000\002\133\002\133\000\000\002\133\000\000\003\026\002\133\002\133\003&\000\000\000\000\000\000\000\000\0032\003f\002\133\000\000\002\133\000\000\000\000\000\000\000\000\000\000\002\133\003~\002\133\000\000\002\133\000\000\000\000\000\000\000\000\000\000\000\000\002\133\000\000\000\000\000\000\000\000\000\000\000\000\002\133\000\000\002\133\002\133\002\246\000\000\003\002\002\133\002\133\000\000\002\181\003\014\003>\000\000\000\000\000\000\002\181\002\181\000\000\002\181\000\000\003\026\002\181\003Z\003&\000\000\000\000\000\000\000\000\0032\003f\002\181\000\000\002\181\000\000\000\000\000\000\000\000\000\000\003r\003~\002\181\000\000\002\181\000\000\000\000\000\000\000\000\000\000\000\000\002\181\000\000\000\000\000\000\000\000\000\000\000\000\002\181\000\000\002\181\002\181\002\246\000\000\003\002\002\181\003\138\000\000\002i\003\014\003>\000\000\000\000\000\000\002i\002i\000\000\002i\000\000\003\026\002i\003Z\003&\000\000\000\000\000\000\000\000\0032\003f\003\150\000\000\003\162\000\000\000\000\000\000\000\000\000\000\003r\003~\003\174\000\000\003\186\000\000\000\000\000\000\000\000\000\000\000\000\003\198\000\000\000\000\000\000\000\000\000\000\000\000\002i\000\000\002i\003\210\002\246\000\000\003\002\002i\003\138\000\000\002\145\002\145\002\145\000\000\000\000\000\000\002\145\002\145\000\000\002\145\000\000\003\026\002\145\002\145\003&\000\000\000\000\000\000\000\000\0032\002\145\002\145\000\000\002\145\000\000\000\000\000\000\000\000\000\000\002\145\002\145\002\145\000\000\002\145\000\000\000\000\000\000\000\000\000\000\000\000\002\145\000\000\000\000\000\000\000\000\000\000\000\000\002\145\000\000\002\145\002\145\002\246\000\000\003\002\002\145\002\145\000\000\002\165\003\014\003>\000\000\000\000\000\000\002\165\002\165\000\000\002\165\000\000\003\026\002\165\003Z\003&\000\000\000\000\000\000\000\000\0032\003f\003\150\000\000\003\162\000\000\000\000\000\000\000\000\000\000\003r\003~\003\174\000\000\003\186\000\000\000\000\000\000\000\000\000\000\000\000\002\165\000\000\000\000\000\000\000\000\000\000\000\000\002\165\000\000\002\165\002\165\002\246\000\000\003\002\002\165\003\138\000\000\002\169\003\014\003>\000\000\000\000\000\000\002\169\002\169\000\000\002\169\000\000\003\026\002\169\003Z\003&\000\000\000\000\000\000\000\000\0032\003f\002\169\000\000\002\169\000\000\000\000\000\000\000\000\000\000\003r\003~\002\169\000\000\002\169\000\000\000\000\000\000\000\000\000\000\000\000\002\169\000\000\000\000\000\000\000\000\000\000\000\000\002\169\000\000\002\169\002\169\002\246\000\000\003\002\002\169\003\138\000\000\004&\003\014\003>\000\000\000\000\000\000\003\217\003\217\000\000\003J\000\000\003\026\003R\003Z\003&\000\000\000\000\000\000\000\000\0032\003f\003\150\000\000\003\162\000\000\000\000\000\000\000\000\000\000\003r\003~\003\174\000\000\003\186\000\000\000\000\000\000\000\000\000\000\000\000\003\198\000\000\000\000\000\000\000\000\000\000\000\000\003\217\000\000\000\000\003\210\002\246\000\000\003\002\003\222\003\138\000\000\003\169\003\014\003>\000\000\000\000\000\000\003\169\000\000\000\000\003J\000\000\003\026\003R\003Z\003&\000\000\000\000\000\000\000\000\0032\003f\003\150\000\000\003\162\000\000\000\000\000\000\000\000\000\000\003r\003~\003\174\000\000\003\186\000\000\000\000\000\000\000\000\000\000\000\000\003\198\000\000\000\000\000\000\000\000\000\000\000\000\003\238\000\000\003\230\003\210\002\246\000\000\003\002\003\222\003\138\000\000\002\197\003\014\003>\000\000\000\000\000\000\002\197\002\197\000\000\000\000\000\000\003\026\003R\003Z\003&\000\000\000\000\000\000\000\000\0032\003f\003\150\000\000\003\162\000\000\000\000\000\000\000\000\000\000\003r\003~\003\174\000\000\003\186\000\000\000\000\000\000\000\000\000\000\000\000\003\198\000\000\000\000\000\000\000\000\000\000\000\000\002\197\000\000\002\197\003\210\000\198\000\000\000\210\003\222\003\138\0019\005\246\000\222\001\014\000\000\000\000\000\000\002R\000\000\000\000\001\026\000\000\000\234\001\"\001*\000\246\000\000\000\000\000\000\000\000\001\002\0016\001f\000\000\001r\000\000\000\000\000\000\000\000\000\000\001B\001N\001~\000\000\001\138\000\000\000\000\000\000\000\000\000\000\000\000\001\150\000\198\000\000\000\210\000\000\000\000\002\213\002:\000\222\001\014\001\162\000\000\000\000\006*\001\174\001Z\001\026\000\000\000\234\001\"\001*\000\246\000\000\000\000\000\000\000\000\001\002\0016\001f\000\000\001r\000\000\000\000\000\000\000\000\000\000\001B\001N\001~\000\000\001\138\000\000\000\000\000\000\000\n\000r\000v\001\150\000\000\002\162\000\000\000J\000N\002\166\000\000\002r\000\000\001\162\000>\000\000\000\169\001\174\001Z\000\000\000\000\002v\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\026\000\000\000\000\002\170\000\000\000\000\002\178\000\000\002\182\004:\002\202\002z\000\198\000\000\000\210\000\000\000\000\004~\000\000\000\222\001\014\002\206\002~\000\000\002\198\001\029\000\000\001\026\000\000\000\234\001\"\001*\000\246\000R\000\000\002\210\000\000\001\002\0016\001f\000\000\001r\000\000\000\000\000\000\000\000\000\000\001B\001N\001~\000\000\001\138\000\000\000\000\000\000\000\000\000\000\000\000\001\150\000\198\000\000\000\210\000\000\000\000\000\000\000\000\000\222\001\014\001\162\000\000\000\000\000)\001\174\001Z\001\026\000\000\000\234\001\"\001*\000\246\000\000\000\000\000\000\000\000\001\002\0016\001f\000\000\001r\000\000\000\000\000\000\000\000\000\000\001B\001N\001~\000\000\001\138\000\000\000\000\000\000\000\000\000\000\000\000\001\150\000\198\000\000\000\210\000\000\000\000\000\000\000\000\000\222\001\014\001\162\000\000\000\000\002\026\001\174\001Z\001\026\000\000\000\234\001\"\001*\000\246\000\000\000\000\000\000\000\000\001\002\0016\001f\000\000\001r\000\000\000\129\000\129\000\000\000\000\001B\001N\001~\000\000\001\138\000\000\000\000\000\000\000\000\000\000\000\129\001\150\002j\000\129\000\000\000\137\000\000\000\000\000y\000\000\000\129\001\162\000y\000\000\000\129\001\174\001Z\000\000\000\000\000\000\000\000\000\129\000\000\000\000\000\000\000\000\000\000\000\129\000\000\000\129\000\000\000\000\000\129\000\129\000\000\000\000\000\000\000\129\001%\001%\000\129\000\129\000\000\000\129\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001%\000\000\001%\001%\000\000\000\129\000\129\000\000\001%\000\000\001%\000\000\001%\000\000\001%\000\000\000\000\000\000\000\000\000\000\000\000\001%\000\000\000\000\000\000\002\225\002\225\001%\000\000\001%\005\214\000\000\001%\001%\000\000\000\000\000\000\001%\000\000\002\225\001%\002\225\002\225\000\000\000\000\000\000\000\000\002\225\000\000\002\225\000\000\002\225\000\000\002\225\000\000\000\000\000\000\001%\001%\000\000\002\225\000\000\000\000\000\000\000\000\000\000\002\225\000\000\002\225\000\000\000\000\002\225\002\225\000\000\000\000\003!\002\225\003!\000\000\002\225\000\000\003!\003!\003!\000\000\000\000\000\000\006Z\000\000\000\000\000\000\000\000\003!\000\000\003!\003!\002\225\002\225\000\000\000\000\003!\003!\000\000\006\202\000\000\000\225\005\210\005\254\000\000\000\000\003!\003!\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\005n\000\000\003!\000>\000\000\006\022\001\214\000\000\003!\000\000\005\146\000\000\000\000\000\000\006\002\000\000\003!\000\000\000\000\000\000\000\000\000\026\000\201\000\000\000\201\000\201\000\201\006\018\000\000\006\026\005\214\005\018\005\154\006N\000\000\000\201\000\000\005\158\000\000\000\000\006n\000\000\000\201\000\000\000\000\000\201\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\201\000\201\000\201\000\000\006\150\006\178\000\000\000r\000v\000\000\000\000\0006\000\201\000J\000N\000:\000\000\000\000\000\000\000\201\000>\000\201\003\201\000\201\000\201\000\000\000\000\000\201\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\026\000\000\000\000\000F\000\000\000\000\000n\003\177\000z\003\177\000\146\000\000\000\000\003\177\003\177\003\177\000\000\000\000\000\000\000\000\000\000\000\150\000\000\000\000\003\177\000\000\003\177\003\177\000\000\000\000\000\000\003\201\003\177\003\177\000\000\000\154\000\000\000\000\000~\001I\000\000\000\000\003\177\003\177\001I\000\000\000\000\000\000\001I\000\000\000\000\000\000\000\000\001I\003\177\000\000\000\000\000\000\000\000\000\000\006F\000\000\000\000\000\000\000\000\0039\000\000\0039\003\177\000\000\000\000\001I\0039\0039\001I\000\000\000\000\001I\000\000\001I\000\000\001I\0039\000\000\0039\0039\000\000\000\000\000\000\000\000\0039\0039\001I\000\000\000\000\000\000\000\000\000\000\000\000\000\000\0039\0039\000\000\000\000\001I\000\000\001I\000\000\007>\000\000\007J\000\130\0039\000\000\000\000\007V\007b\000\000\007\238\000\000\000\000\000\000\000\000\000\000\000\000\007n\0039\007z\007\134\000\000\000\000\000\000\000\000\007\146\007\158\000\000\000\000\001\029\000\000\000J\000N\001\029\000\000\007\170\007\182\000\000\001\029\000\000\000\209\000\000\000\000\000\000\000\000\000\245\000\000\007\194\000\000\000\245\000\000\000\000\000\000\000\000\000\245\000\000\001\029\000\000\000\000\001\029\000\000\007\198\001\029\000\000\001\029\000\000\001\029\000\000\000\000\000\000\000\000\000\000\000\245\000\000\000\000\000\245\000\000\001\029\000\245\000\000\000\245\000\000\000\245\000\000\000\000\000\000\000\000\000\000\000\000\000R\000\000\001\029\000\000\000\245\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\138\000\000\000\245"
  
  let[@inline] action_data =
    fun i ->
      MenhirLib.PackedIntArray.get16 action_data i
  
  let[@inline] action =
    fun i j ->
      let k = MenhirLib.RowDisplacementDecode.decode (action_displacement i) in
      action_data (k + j)
  
  let lhs =
    "\000cba```_^]\\[[ZZYYYXWWWVUTTTTSSRRQQPPOONNMMLLKKJJIIHHGGFFEEDDDCCBBAA@@??>>==<<;;:::99988765543333333333333210///////////////////////////////////...................................-,+**)(('&&&&&&&&&&&%$$$$#####\"! \031\030\029\028\027\026\026\026\026\026\025\024\024\023\023\022\022\021\021\020\020\019\019\018\018\017\017\016\016\015\015\014\014\r\r\012\012\012\011\n\n\n\n\t\b\007\006\006\006\006\006\006\006\005\004\003\003\002\001\001"
  
  let[@inline] lhs =
    fun i ->
      MenhirLib.PackedIntArray.get8 lhs i
  
  let goto_displacement =
    "\000\007\000\000\000\000\000\000\000\000\000\250\000\000\001\238\000\000\000\000\007\214\000\000\003\000\000\000\000\000\001\004\000\000\005\162\000\000\000\000\002\000\000\000\000\000\000\000\000\000\000\000\004\146\000\160\000\000\000\000\002\024\000\000\000\000\002>\000\000\002\\\000\000\000\000\007@\004\208\000\014\001\026\000\000\000\000\000\000\000\014\000\000\000\000\000\000\005\188\002J\000\000\005\192\002>\000\000\b\n\003\210\000\000\006d\004\002\000\000\006\130\003\198\000\000\bR\004\228\000\000\006t\003X\000\000\003>\000\000\002\154\000\000\t\n\004\132\000\000\007T\005D\000\000\007\220\0050\000\000\b\194\004\194\000\000\b\028\005\000\000\000\b:\005\020\000\000\b`\004\242\000\000\005(\005\"\000\000\007\196\004\160\000\000\007L\002\188\000\000\007(\004\024\000\000\001\248\000\000\004T\000\000\001\220\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\004\001 \003\184\0000\004H\000\000\000\000\000\000\000$\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\146\000\000\000\000\000\000\000\000\000\000\003n\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001>\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\162\000\026\000\000\000\000\005\134\007\244\001|\000S\000\127\002~\000\000\000\000\000\000\000\000\006x\006^\001\182\001n\000\000\000\000\001\174\000\000\000\000\006\146\003\202\000\000\000H\006\188\000\000\br\006\190\000\000\b6\007\012\000\000\006\242\007&\000\000\005\220\0076\000\000\005\174\007T\000\000\004L\000\000\007Z\000\000\005x\007\226\000\000\006\206\tp\000\000\007f\007\136\000\000\007\140\t>\000\000\007\182\t<\000\000\007\240\007n\000\000\007D\t.\000\000\b\000\t,\000\000\b\230\b\250\000\000\b\018\b\236\000\000\b\024\b\238\000\000\bz\000\000\b\220\000\000\001\150\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\003P\000\000\000\000\000\000\000\000\000\000\b\168\000\000\000\000\001\242\000\000\000\000\000\000\bl\000\000\000\000\000\000\000\000\000\000\000\000\000\000\br\002V\000\000\004b\000\000\000\000\002L\000\000\000\016\0028\000\000\0024\000\000\000\r\000\000\000\000\000\000\000\000\000\000\002\144\000\000\000\000\000\000\002v\000\000\000\138\0022\000\000\001\246\001\234\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\220\000\000\001\016\000\000\000\000\000\000\000\000\000\000\001D\000\000\000\000\000\000\002\012\000\000\002f\000\000\000\000\001\234\000\230\003:\000\000\000\000\000\000\001\206\bL\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\0022\000\000\000\000\000\000\002\202\000\000\000\000\000\000\003\002\000\000\000\000\000M\005Z\006\138\000\000\000\208\001\166\005\030\000\000\000\000\000\000\000\000\000\000\004\180\000\000\001\190\000\000\000\000\000\000\001\020\000\000\000\000\002\224\000\000\000`\000\029\003\028\000\000\000\000\000T\000\000\000\000\000\000\000\000\000\000\005\150\000\000\0042\000\019\000\000\000\020\000\000\000\000\000\000\000\000\000\212\000\000\002\218\000\000\003\014\000~\000\000\003L\001\"\000\000\000\000\000\000\000\000\003\136\000\000\000\000\000\000\000\000\001\144\000\000\000\000\000\000\000T\001\002\000\000\001R\002\140\000\000\000\000\000\000\001V\000\136\003\232\000\000\001\030\000\000\000\000\000\000\001h\000\136\000\000\000\000\000\000\000\000\000\000\000\000\000\000\001\b\000\000\000\000\000\000\000\142\005\252\000\000\000\000\005X\000\000\000\000\006\000\000\000\000\000\006\004\000\000\000\000\006\"\000\000\000\000\006\030\000\000\000\000\005H\000\000\000\000\005\158\000\000\000\000\006\252\000\000\000\000\006X\000\000\000\000\005\166\000\000\000\000\000\000\006:\000\000\000\000\002\236\001t\000\000\000\000\000\000\000\000\000\000\000>\000\000\000\005\000\006\000\n\000\000\000\222\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\150\002b\002X\000\000\000\000\000\000\000\000\000\152\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
  
  let[@inline] goto_displacement =
    fun i ->
      MenhirLib.PackedIntArray.get16 goto_displacement i
  
  let goto_data =
    "\000\012\000\150\0012\0014\000\176\002\001\002\012\002\001\000\128\000)\001,\000\012\000\150\0012\0014\000\183\000\175\001\021\002\004\001-\002\004\000\151\000\129\000\152\0015\001\022\000+\000,\001>\000,\001?\000,\000\151\001\140\000\152\0015\000-\000,\001@\001>\001A\001?\000\186\000\023\000\024\001y\001\150\001B\001\253\001@\001\152\001A\000/\001\137\0000\000,\0001\000\128\001B\000\188\001C\001\023\001\153\001\154\001y\001\155\002\n\001\144\001\145\0010\002\025\001C\000\012\000\150\0012\0014\000w\002\b\001I\002\005\002\026\0012\000)\001K\000r\001i\002\014\000\136\000\137\001I\000~\002\023\001L\000\151\001K\000\152\0015\001\024\000\025\002\021\001>\000\132\001?\001L\000,\001\136\001\178\002\018\001\157\000-\001@\000w\001A\002\001\001i\001\186\000\127\001y\001\162\001B\0012\001\201\001\245\000\026\000\194\000/\002\003\0000\000,\000\142\000,\000)\001C\001\202\000)\000,\001\141\001X\001\194\001\207\001\144\001\145\001\249\000)\001\250\001\191\001\025\001\131\000+\000\n\001I\000+\001J\000,\000\017\001K\000,\001I\000-\000\163\000+\000-\000\164\001\192\001L\000,\001F\000,\000\161\000\144\000-\002\r\001\026\001\187\000/\002\019\0000\000/\0001\0000\000\163\0001\001\195\000\164\001\197\000\183\000/\000y\0000\001\251\0001\001\199\000\183\001\196\001o\000,\001I\000\136\001\004\001y\001\165\000\185\001\175\000)\000,\000\183\001\180\000,\001G\001\204\001[\000z\000\186\001l\000,\000\128\000\165\000\183\000t\000\186\000\140\000\253\000\166\000\130\000,\000,\001O\000,\001\184\000\188\000-\000\189\000\186\000\185\000\167\001\018\000\188\000\165\001\t\000,\000)\001i\001k\000\166\000\186\001\247\000/\000)\0000\000\188\0001\000\189\002\022\000)\000)\000\167\001\018\000q\001\016\001\000\000\022\000\188\000,\000\189\0019\001y\001z\000-\001F\000,\000\163\000\t\001{\000\164\000-\000,\000,\001y\001z\001\011\000-\000-\001_\000/\001\127\0000\001Q\0001\000w\000)\000/\000\254\0000\001;\0001\000)\000/\000/\0000\0000\001=\000m\002\015\001p\000)\0016\001'\002\015\001%\001f\001H\000,\0012\001\002\002\016\001a\000-\000,\001\"\002\017\0012\000)\000-\001\029\000,\000\"\000,\000\165\000)\000,\001S\000-\000/\000\166\0000\000)\0007\001b\000/\000\000\0000\001d\0004\000,\001/\000\167\001\018\000/\000-\0000\000,\000\134\000)\001-\000$\000-\000\000\000,\000\128\000\000\000\012\000\150\000-\000\000\000/\000\000\0000\000)\000\177\000\000\001\140\000/\000\000\0000\000,\001\183\000)\000\000\000/\000-\0000\000\151\000J\000\152\001j\001\142\000)\001T\001I\000,\0012\000\000\000,\000)\000-\000/\0013\0000\000,\000h\000)\000\000\002\r\000-\001\144\001\145\002\019\001n\000,\000\000\000/\000\000\0000\000-\001\159\000,\000\000\000)\0012\000/\000-\0000\000,\001\246\000)\000\000\000\183\000-\000\000\000/\000)\0000\000\000\000\148\000\000\001X\000/\000\000\0000\000,\001\161\000)\001\007\000/\000-\0000\000,\001\138\000,\000\000\000\000\000-\000,\000\186\000)\000\000\000\000\000-\000\000\000\000\000/\000\000\0000\000,\000H\000\000\001I\000/\000-\0000\000\188\001\164\000\189\000/\000\000\0000\000,\000F\000)\000\000\001[\000-\000\000\001l\000/\000)\0000\000\183\000\146\000\000\000\000\000)\001Y\000\000\001I\000\000\000\000\000/\000\000\0000\000,\001\170\000)\000\000\000\000\000-\000\000\000,\001[\000,\000\000\001l\000-\000,\000\186\000)\000\000\000\000\000-\000\000\000\000\000/\000\000\0000\000,\000{\000)\000\000\000/\000-\0000\000\188\000@\000\192\000/\000\000\0000\000,\000:\000)\000\000\000\000\000-\000\000\000\000\000/\000\000\0000\000,\001\189\000)\000\000\000\183\000-\000\000\000\000\000)\000\000\000/\000\000\0000\000,\000=\000)\000\000\000\000\000-\000\000\000\000\000/\000\000\0000\000,\000k\000,\000\000\000\000\000-\000,\000\186\000)\000\000\000/\000-\0000\000,\001\149\000)\000\000\000\000\000-\000\000\000\000\000/\000)\0000\000\188\000}\000\212\000/\000\000\0000\000,\000o\000)\000\000\000/\000-\0000\000,\001\031\000)\000\000\000\000\000-\000\000\000,\000\000\000)\000\000\000\000\000-\000\000\000/\000\000\0000\000,\000M\000)\000\000\000/\000-\0000\000,\000\147\000)\000\000\000/\000-\0000\000,\000e\000)\000\000\000\000\000-\000\000\000/\000\000\0000\000,\001}\000)\000\000\000/\000-\0000\000,\000V\000)\0012\000/\000-\0000\000,\000\133\000)\000\023\000\024\000-\000\000\000/\000\000\0000\000,\000C\000)\000\000\000/\000-\0000\000,\000_\000\023\000\024\000/\000-\0000\000,\000Y\0012\000\023\000\024\000-\001r\000/\000\000\0000\000,\000\\\000\000\000\000\000/\000-\0000\000\000\000b\000\023\000\024\000/\000\000\0000\000\000\000S\000\023\000\024\000\000\001\140\000\000\000/\000\000\0000\000\025\000P\001r\000\000\000\023\000\024\000\023\000\024\000\023\000\024\001\147\000\000\000\023\000\024\001I\001w\000\025\000,\000\000\000\023\000\024\000\023\000\024\000\000\000\025\000\026\000a\000\000\001t\001\144\001\145\000\000\000\000\000\000\000\000\000\023\000\024\000\000\000\000\000\000\000\025\000\026\001\227\000\000\001I\001\254\000\000\000\025\000\000\000\026\001\212\000\023\000\024\000\023\000\024\000\023\000\024\000\000\001t\000\025\000\000\000\025\000\000\000\025\000\000\000\026\000\216\000\025\000\023\000\024\000\023\000\024\000\026\000\172\000\025\000\000\000\025\000\000\000\000\000\000\000\000\000\000\000\023\000\024\000\026\001\230\000\026\000\027\000\026\001\239\000\025\000\000\000\026\000\209\000\000\000\183\000\000\000\023\000\024\000\026\0003\000\026\0006\000\023\000\024\000\000\000\025\000\000\000\025\000\000\000\025\000\023\000\024\000\023\000\024\000\026\000\206\000,\000\023\000\024\0012\000\000\000\186\000\025\000\000\000\025\000\023\000\024\000\000\000\000\000\000\000\026\001\209\000\026\001\215\000\026\001\218\000\025\000\000\000\188\000\000\001\003\000\183\000\183\000\000\000\000\000\000\000\000\000\026\001\224\000\026\001\221\000\025\000\000\001r\000\000\000\023\000\024\000\025\000\000\000\000\000\000\000\026\001\243\000,\000,\000\025\000\000\000\025\000\186\000\186\000\000\000\000\000\025\000\023\000\024\000\000\000\026\001\236\000\023\000\024\000\025\000\183\000\026\000<\000\000\000\188\000\188\000\195\000\198\000\000\000\026\000E\000\026\000\182\000\183\001I\001s\000\026\000?\000\000\000\023\000\024\000\183\000,\000\000\000\026\000\191\000\000\000\186\001t\000\025\000\000\000\023\000\024\000\023\000\024\000,\000\183\000\023\000\024\000\183\000\186\000\023\000\024\000,\000\188\000\000\000\201\000\025\000\186\000\183\000\023\000\024\000\025\000\000\000\026\000\219\000\000\000\188\000,\000\204\000\000\000,\000\183\000\186\000\000\000\188\000\186\000\207\000\000\000\023\000\024\000,\000\026\000\203\000\025\000\000\000\186\000\026\001\233\000\000\000\188\000\000\000\210\000\188\000,\000\214\000\025\000\000\000\025\000\186\000\023\000\024\000\025\000\188\000\000\000\232\000\025\000\023\000\024\000\026\000j\000\000\000\012\000\150\000\000\000\025\000\188\000\183\000\223\000\023\000\024\000\026\000(\000\026\000\234\000\000\000\183\000\026\000g\000\023\000\024\000\026\000O\000\151\000\025\000\152\000\153\000\023\000\024\000,\000\026\000\222\000\023\000\024\000\186\000\000\000\023\000\024\000,\000\023\000\024\000\023\000\024\000\186\000\000\000\025\000\000\000\000\000\000\000\026\000\225\000\188\000\025\000\217\000\023\000\024\000\023\000\024\000\000\001_\000\188\000\000\001\014\000\000\000\025\000\000\000\000\000\000\000\023\000\024\000\026\000\228\000\000\000\000\000\025\000\023\000\024\000\026\000d\000\000\000\012\000\150\000\025\000\183\000\023\000\024\001`\000\025\000\000\000\026\000R\000\025\001a\000\000\000\025\001\020\000\025\000\000\000\164\000\026\000\231\000\151\000\000\000\152\001\028\000,\000\183\000\026\000\237\000\025\000\186\000\025\000\026\0009\001b\000\000\000\026\000\243\001d\000\026\000\246\000\026\000X\000\025\000\023\000\024\000\000\000\188\000,\000\249\000\025\000\000\000\183\000\186\000\026\000\200\000\026\000[\000\000\000\025\000\183\000\183\000\023\000\024\000\000\000\000\000\000\000\183\000\026\000B\000\188\000\000\001\r\000\000\000,\000\026\000^\000\000\000\166\000\186\000\023\000\024\000,\000,\000\026\000\197\000\000\000\186\000\186\000,\000\167\001\018\000\183\000\183\000\186\000\000\000\188\000\000\000\251\000\025\000\183\000\183\000\000\000\000\000\188\000\188\000\244\000\247\000\000\000\000\000\000\000\188\000\000\000\241\000,\000,\000\000\000\025\000\000\000\186\000\186\000\000\000,\000,\000\026\000U\000\183\000\186\000\186\000\000\000\000\000\000\000\000\000\000\000\000\000\025\000\188\000\188\000\238\000\235\000\000\000\000\000\026\000\240\000\188\000\188\000\229\000\226\000,\000\000\000\000\000\000\000\000\000\186\000\000\000\000\000\000\000\000\000\000\000\000\000\026\000L\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\188\000\000\000\220"
  
  let[@inline] goto_data =
    fun i ->
      MenhirLib.PackedIntArray.get16 goto_data i
  
  let[@inline] goto =
    fun i j ->
      let k = MenhirLib.RowDisplacementDecode.decode (goto_displacement i) in
      goto_data (k + j)
  
  let trace =
    None
  
end

module MenhirInterpreter = struct
  
  module ET = MenhirLib.TableInterpreter.MakeEngineTable (Tables)
  
  module TI = MenhirLib.Engine.Make (ET)
  
  include TI
  
  module Symbols = struct
    
    type _ terminal = 
      | T_error : unit terminal
      | T_WHILE : unit terminal
      | T_UNDERSCORE : unit terminal
      | T_UNALIGNED : unit terminal
      | T_T_W : 
# 18 "src/parser.mly"
       (Syntax.swsize)
# 11573 "src/parser.ml"
     terminal
      | T_T_INT_CAST : 
# 19 "src/parser.mly"
       (Syntax.sign)
# 11578 "src/parser.ml"
     terminal
      | T_T_INT : unit terminal
      | T_T_BOOL : unit terminal
      | T_TYPE : unit terminal
      | T_TRUE : unit terminal
      | T_TO : unit terminal
      | T_SWSIZE : 
# 71 "src/parser.mly"
       (Syntax.swsize)
# 11588 "src/parser.ml"
     terminal
      | T_SVSIZE : 
# 72 "src/parser.mly"
       (Syntax.svsize)
# 11593 "src/parser.ml"
     terminal
      | T_STRING : 
# 85 "src/parser.mly"
       (string)
# 11598 "src/parser.ml"
     terminal
      | T_STAR : unit terminal
      | T_STACK : unit terminal
      | T_SLASH : 
# 73 "src/parser.mly"
       (Syntax.sign option)
# 11605 "src/parser.ml"
     terminal
      | T_SHARPLBRACKET : unit terminal
      | T_SHARP : unit terminal
      | T_SEMICOLON : unit terminal
      | T_RPAREN : unit terminal
      | T_ROR : unit terminal
      | T_ROL : unit terminal
      | T_RETURN : unit terminal
      | T_REQUIRE : unit terminal
      | T_REG : unit terminal
      | T_RBRACKET : unit terminal
      | T_RBRACE : unit terminal
      | T_RARROW : unit terminal
      | T_QUESTIONMARK : unit terminal
      | T_POINTER : unit terminal
      | T_PLUS : unit terminal
      | T_PIPEPIPE : unit terminal
      | T_PIPE : unit terminal
      | T_PERCENT : 
# 58 "src/parser.mly"
       (Syntax.sign option)
# 11627 "src/parser.ml"
     terminal
      | T_PARAM : unit terminal
      | T_NID : 
# 83 "src/parser.mly"
       (string)
# 11633 "src/parser.ml"
     terminal
      | T_NAMESPACE : unit terminal
      | T_MUTABLE : unit terminal
      | T_MINUS : unit terminal
      | T_LTLT : unit terminal
      | T_LT : 
# 52 "src/parser.mly"
       (Syntax.sign option)
# 11642 "src/parser.ml"
     terminal
      | T_LPAREN : unit terminal
      | T_LE : 
# 51 "src/parser.mly"
       (Syntax.sign option)
# 11648 "src/parser.ml"
     terminal
      | T_LBRACKET : unit terminal
      | T_LBRACE : unit terminal
      | T_INT : 
# 84 "src/parser.mly"
       (Syntax.int_representation)
# 11655 "src/parser.ml"
     terminal
      | T_INLINE : unit terminal
      | T_IF : unit terminal
      | T_HAT : unit terminal
      | T_GTGT : 
# 47 "src/parser.mly"
       (Syntax.sign option)
# 11663 "src/parser.ml"
     terminal
      | T_GT : 
# 46 "src/parser.mly"
       (Syntax.sign option)
# 11668 "src/parser.ml"
     terminal
      | T_GLOBAL : unit terminal
      | T_GE : 
# 44 "src/parser.mly"
       (Syntax.sign option)
# 11674 "src/parser.ml"
     terminal
      | T_FROM : unit terminal
      | T_FOR : unit terminal
      | T_FN : unit terminal
      | T_FALSE : unit terminal
      | T_EXPORT : unit terminal
      | T_EXEC : unit terminal
      | T_EQEQ : unit terminal
      | T_EQ : unit terminal
      | T_EOF : unit terminal
      | T_ELSE : unit terminal
      | T_DOWNTO : unit terminal
      | T_DOT : unit terminal
      | T_CONSTANT : unit terminal
      | T_COMMA : unit terminal
      | T_COLONCOLON : unit terminal
      | T_COLON : unit terminal
      | T_BANGEQ : unit terminal
      | T_BANG : unit terminal
      | T_ASSERT : unit terminal
      | T_ARRAYINIT : unit terminal
      | T_AMPAMP : unit terminal
      | T_AMP : unit terminal
      | T_ALIGNED : unit terminal
    
    type _ nonterminal = 
      | N_writable : (Syntax.writable) nonterminal
      | N_var : (Annotations.pident) nonterminal
      | N_utype_array : (Syntax.psizetype) nonterminal
      | N_utype : (Syntax.swsize) nonterminal
      | N_top_annotation : (Syntax.pannotations) nonterminal
      | N_top : (Syntax.pitem) nonterminal
      | N_swsize : (Syntax.swsize) nonterminal
      | N_svsize : (Syntax.svsize) nonterminal
      | N_struct_annot : (Syntax.pannotations) nonterminal
      | N_storage : (Syntax.pstorage) nonterminal
      | N_stor_type : (Syntax.pstotype) nonterminal
      | N_simple_attribute : (Syntax.psimple_attribute) nonterminal
      | N_separated_nonempty_list_option_COMMA__var_ : (Annotations.pident list) nonterminal
      | N_separated_nonempty_list_empty_var_ : (Annotations.pident list) nonterminal
      | N_separated_nonempty_list_COMMA_var_ : (Annotations.pident list) nonterminal
      | N_separated_nonempty_list_COMMA_range_ : ((string * string) list) nonterminal
      | N_separated_nonempty_list_COMMA_plvalue_ : (Syntax.plvalue list) nonterminal
      | N_separated_nonempty_list_COMMA_pexpr_noarr_ : (Syntax.pexpr list) nonterminal
      | N_separated_nonempty_list_COMMA_pexpr_ : (Syntax.pexpr list) nonterminal
      | N_separated_nonempty_list_COMMA_loc_decl__ : ((Annotations.pident * Syntax.pexpr) Location.located list) nonterminal
      | N_separated_nonempty_list_COMMA_annotation_ : (Syntax.pannotations) nonterminal
      | N_separated_nonempty_list_COMMA_annot_stor_type_ : ((Syntax.pannotations * Syntax.pstotype) list) nonterminal
      | N_separated_nonempty_list_COMMA_annot_pparamdecl_ : ((Syntax.pannotations * Syntax.paramdecls) list) nonterminal
      | N_separated_nonempty_list_COLONCOLON_NID_ : (string list) nonterminal
      | N_range : (string * string) nonterminal
      | N_ptype_r : (Syntax.ptype_r) nonterminal
      | N_ptype : (Syntax.ptype) nonterminal
      | N_ptr : (Syntax.ptr) nonterminal
      | N_prim : (Annotations.pident) nonterminal
      | N_prequire1 : (Syntax.prequire) nonterminal
      | N_prequire : (Annotations.pident option * Syntax.prequire list) nonterminal
      | N_pparamdecl_empty_ : (Syntax.paramdecls) nonterminal
      | N_pparam : (Syntax.pparam) nonterminal
      | N_pointer : (Syntax.writable option) nonterminal
      | N_plvalues : (Syntax.plvals) nonterminal
      | N_plvalue_r : (Syntax.plvalue_r) nonterminal
      | N_plvalue : (Syntax.plvalue) nonterminal
      | N_pinstr_r : (Syntax.pinstr_r) nonterminal
      | N_pinstr : (Syntax.pinstr) nonterminal
      | N_pif : (Syntax.pinstr_r) nonterminal
      | N_pglobal : (Syntax.pglobal) nonterminal
      | N_pgexpr : (Syntax.gpexpr) nonterminal
      | N_pfundef : (Syntax.pfundef) nonterminal
      | N_pfunbody : (Syntax.pfunbody) nonterminal
      | N_pexpr_r : (Syntax.pexpr_r) nonterminal
      | N_pexpr_noarr_r_pexpr_noarr_ : (Syntax.pexpr_r) nonterminal
      | N_pexpr_noarr_r_pexpr_ : (Syntax.pexpr_r) nonterminal
      | N_pexpr_noarr : (Syntax.pexpr) nonterminal
      | N_pexpr : (Syntax.pexpr) nonterminal
      | N_pexec : (Syntax.pexec) nonterminal
      | N_peqop : (Syntax.peqop) nonterminal
      | N_pelseif : (Syntax.pblock_r) nonterminal
      | N_pelse : (Syntax.pblock) nonterminal
      | N_pblock_r : (Syntax.pblock_r) nonterminal
      | N_pblock : (Syntax.pblock) nonterminal
      | N_option_writable_ : (Syntax.writable option) nonterminal
      | N_option_unaligned_ : ([ `Aligned | `Unaligned ] option) nonterminal
      | N_option_prefix_RARROW_tuple_annot_stor_type___ : ((Syntax.pannotations * Syntax.pstotype) list option) nonterminal
      | N_option_prefix_IF_pexpr__ : (Syntax.pexpr option) nonterminal
      | N_option_pointer_ : (Syntax.writable option option) nonterminal
      | N_option_pblock_ : (Syntax.pblock option) nonterminal
      | N_option_loc_castop1__ : (Syntax.castop) nonterminal
      | N_option_from_ : (Annotations.pident option) nonterminal
      | N_option_call_conv_ : (Syntax.pcall_conv option) nonterminal
      | N_option_attribute_ : (Syntax.pattribute option) nonterminal
      | N_option_arr_access_len_ : (Syntax.pexpr option) nonterminal
      | N_option_access_type_ : ((unit option * Syntax.swsize Location.located) option) nonterminal
      | N_option___anonymous_1_ : (Annotations.pident list option) nonterminal
      | N_option_DOT_ : (unit option) nonterminal
      | N_option_COMMA_ : (unit option) nonterminal
      | N_option_COLON_ : (unit option) nonterminal
      | N_nonempty_list_prequire1_ : (Syntax.prequire list) nonterminal
      | N_module_ : (Syntax.pprogram) nonterminal
      | N_loption_separated_nonempty_list_COMMA_var__ : (Annotations.pident list) nonterminal
      | N_loption_separated_nonempty_list_COMMA_range__ : ((string * string) list) nonterminal
      | N_loption_separated_nonempty_list_COMMA_pexpr_noarr__ : (Syntax.pexpr list) nonterminal
      | N_loption_separated_nonempty_list_COMMA_pexpr__ : (Syntax.pexpr list) nonterminal
      | N_loption_separated_nonempty_list_COMMA_annotation__ : (Syntax.pannotations) nonterminal
      | N_loption_separated_nonempty_list_COMMA_annot_stor_type__ : ((Syntax.pannotations * Syntax.pstotype) list) nonterminal
      | N_loption_separated_nonempty_list_COMMA_annot_pparamdecl__ : ((Syntax.pannotations * Syntax.paramdecls) list) nonterminal
      | N_list_top_annotation_ : (Syntax.pannotations list) nonterminal
      | N_list_pinstr_ : (Syntax.pblock_r) nonterminal
      | N_list_loc_top__ : (Syntax.pprogram) nonterminal
      | N_keyword : (string) nonterminal
      | N_implicites : (Syntax.pannotations Location.located) nonterminal
      | N_from : (Annotations.pident) nonterminal
      | N_castop1 : (Syntax.castop1) nonterminal
      | N_castop : (Syntax.castop) nonterminal
      | N_cast : (Syntax.cast) nonterminal
      | N_call_conv : (Syntax.pcall_conv) nonterminal
      | N_attribute : (Syntax.psimple_attribute Location.located) nonterminal
      | N_arr_access_len : (Syntax.pexpr) nonterminal
      | N_arr_access_i : ((unit option * Syntax.swsize Location.located) option * Syntax.pexpr *
  Syntax.pexpr option * [ `Aligned | `Unaligned ] option) nonterminal
      | N_arr_access : (Warray_.arr_access *
  (Syntax.swsize Location.located option * Syntax.pexpr *
   Syntax.pexpr option * [ `Aligned | `Unaligned ] option)) nonterminal
      | N_annotations : (Syntax.pannotations) nonterminal
      | N_annotationlabel : (Syntax.prequire) nonterminal
      | N_annotation : (Syntax.pannotation) nonterminal
      | N_annot_stor_type : (Syntax.pannotations * Syntax.pstotype) nonterminal
      | N_annot_pparamdecl : (Syntax.pannotations * Syntax.paramdecls) nonterminal
    
  end
  
  include Symbols
  
  include MenhirLib.InspectionTableInterpreter.Make (Tables) (struct
    
    include TI
    
    include Symbols
    
    include MenhirLib.InspectionTableInterpreter.Symbols (Symbols)
    
    let terminal =
      fun t ->
        match t with
        | 0 ->
            X (T T_error)
        | 1 ->
            X (T T_WHILE)
        | 2 ->
            X (T T_UNDERSCORE)
        | 3 ->
            X (T T_UNALIGNED)
        | 4 ->
            X (T T_T_W)
        | 5 ->
            X (T T_T_INT_CAST)
        | 6 ->
            X (T T_T_INT)
        | 7 ->
            X (T T_T_BOOL)
        | 8 ->
            X (T T_TYPE)
        | 9 ->
            X (T T_TRUE)
        | 10 ->
            X (T T_TO)
        | 11 ->
            X (T T_SWSIZE)
        | 12 ->
            X (T T_SVSIZE)
        | 13 ->
            X (T T_STRING)
        | 14 ->
            X (T T_STAR)
        | 15 ->
            X (T T_STACK)
        | 16 ->
            X (T T_SLASH)
        | 17 ->
            X (T T_SHARPLBRACKET)
        | 18 ->
            X (T T_SHARP)
        | 19 ->
            X (T T_SEMICOLON)
        | 20 ->
            X (T T_RPAREN)
        | 21 ->
            X (T T_ROR)
        | 22 ->
            X (T T_ROL)
        | 23 ->
            X (T T_RETURN)
        | 24 ->
            X (T T_REQUIRE)
        | 25 ->
            X (T T_REG)
        | 26 ->
            X (T T_RBRACKET)
        | 27 ->
            X (T T_RBRACE)
        | 28 ->
            X (T T_RARROW)
        | 29 ->
            X (T T_QUESTIONMARK)
        | 30 ->
            X (T T_POINTER)
        | 31 ->
            X (T T_PLUS)
        | 32 ->
            X (T T_PIPEPIPE)
        | 33 ->
            X (T T_PIPE)
        | 34 ->
            X (T T_PERCENT)
        | 35 ->
            X (T T_PARAM)
        | 36 ->
            X (T T_NID)
        | 37 ->
            X (T T_NAMESPACE)
        | 38 ->
            X (T T_MUTABLE)
        | 39 ->
            X (T T_MINUS)
        | 40 ->
            X (T T_LTLT)
        | 41 ->
            X (T T_LT)
        | 42 ->
            X (T T_LPAREN)
        | 43 ->
            X (T T_LE)
        | 44 ->
            X (T T_LBRACKET)
        | 45 ->
            X (T T_LBRACE)
        | 46 ->
            X (T T_INT)
        | 47 ->
            X (T T_INLINE)
        | 48 ->
            X (T T_IF)
        | 49 ->
            X (T T_HAT)
        | 50 ->
            X (T T_GTGT)
        | 51 ->
            X (T T_GT)
        | 52 ->
            X (T T_GLOBAL)
        | 53 ->
            X (T T_GE)
        | 54 ->
            X (T T_FROM)
        | 55 ->
            X (T T_FOR)
        | 56 ->
            X (T T_FN)
        | 57 ->
            X (T T_FALSE)
        | 58 ->
            X (T T_EXPORT)
        | 59 ->
            X (T T_EXEC)
        | 60 ->
            X (T T_EQEQ)
        | 61 ->
            X (T T_EQ)
        | 62 ->
            X (T T_EOF)
        | 63 ->
            X (T T_ELSE)
        | 64 ->
            X (T T_DOWNTO)
        | 65 ->
            X (T T_DOT)
        | 66 ->
            X (T T_CONSTANT)
        | 67 ->
            X (T T_COMMA)
        | 68 ->
            X (T T_COLONCOLON)
        | 69 ->
            X (T T_COLON)
        | 70 ->
            X (T T_BANGEQ)
        | 71 ->
            X (T T_BANG)
        | 72 ->
            X (T T_ASSERT)
        | 73 ->
            X (T T_ARRAYINIT)
        | 74 ->
            X (T T_AMPAMP)
        | 75 ->
            X (T T_AMP)
        | 76 ->
            X (T T_ALIGNED)
        | _ ->
            assert false
    
    let nonterminal =
      fun nt ->
        match nt with
        | 99 ->
            X (N N_annot_pparamdecl)
        | 98 ->
            X (N N_annot_stor_type)
        | 97 ->
            X (N N_annotation)
        | 96 ->
            X (N N_annotationlabel)
        | 95 ->
            X (N N_annotations)
        | 94 ->
            X (N N_arr_access)
        | 93 ->
            X (N N_arr_access_i)
        | 92 ->
            X (N N_arr_access_len)
        | 91 ->
            X (N N_attribute)
        | 90 ->
            X (N N_call_conv)
        | 89 ->
            X (N N_cast)
        | 88 ->
            X (N N_castop)
        | 87 ->
            X (N N_castop1)
        | 86 ->
            X (N N_from)
        | 85 ->
            X (N N_implicites)
        | 84 ->
            X (N N_keyword)
        | 83 ->
            X (N N_list_loc_top__)
        | 82 ->
            X (N N_list_pinstr_)
        | 81 ->
            X (N N_list_top_annotation_)
        | 80 ->
            X (N N_loption_separated_nonempty_list_COMMA_annot_pparamdecl__)
        | 79 ->
            X (N N_loption_separated_nonempty_list_COMMA_annot_stor_type__)
        | 78 ->
            X (N N_loption_separated_nonempty_list_COMMA_annotation__)
        | 77 ->
            X (N N_loption_separated_nonempty_list_COMMA_pexpr__)
        | 76 ->
            X (N N_loption_separated_nonempty_list_COMMA_pexpr_noarr__)
        | 75 ->
            X (N N_loption_separated_nonempty_list_COMMA_range__)
        | 74 ->
            X (N N_loption_separated_nonempty_list_COMMA_var__)
        | 73 ->
            X (N N_module_)
        | 72 ->
            X (N N_nonempty_list_prequire1_)
        | 71 ->
            X (N N_option_COLON_)
        | 70 ->
            X (N N_option_COMMA_)
        | 69 ->
            X (N N_option_DOT_)
        | 68 ->
            X (N N_option___anonymous_1_)
        | 67 ->
            X (N N_option_access_type_)
        | 66 ->
            X (N N_option_arr_access_len_)
        | 65 ->
            X (N N_option_attribute_)
        | 64 ->
            X (N N_option_call_conv_)
        | 63 ->
            X (N N_option_from_)
        | 62 ->
            X (N N_option_loc_castop1__)
        | 61 ->
            X (N N_option_pblock_)
        | 60 ->
            X (N N_option_pointer_)
        | 59 ->
            X (N N_option_prefix_IF_pexpr__)
        | 58 ->
            X (N N_option_prefix_RARROW_tuple_annot_stor_type___)
        | 57 ->
            X (N N_option_unaligned_)
        | 56 ->
            X (N N_option_writable_)
        | 55 ->
            X (N N_pblock)
        | 54 ->
            X (N N_pblock_r)
        | 53 ->
            X (N N_pelse)
        | 52 ->
            X (N N_pelseif)
        | 51 ->
            X (N N_peqop)
        | 50 ->
            X (N N_pexec)
        | 49 ->
            X (N N_pexpr)
        | 48 ->
            X (N N_pexpr_noarr)
        | 47 ->
            X (N N_pexpr_noarr_r_pexpr_)
        | 46 ->
            X (N N_pexpr_noarr_r_pexpr_noarr_)
        | 45 ->
            X (N N_pexpr_r)
        | 44 ->
            X (N N_pfunbody)
        | 43 ->
            X (N N_pfundef)
        | 42 ->
            X (N N_pgexpr)
        | 41 ->
            X (N N_pglobal)
        | 40 ->
            X (N N_pif)
        | 39 ->
            X (N N_pinstr)
        | 38 ->
            X (N N_pinstr_r)
        | 37 ->
            X (N N_plvalue)
        | 36 ->
            X (N N_plvalue_r)
        | 35 ->
            X (N N_plvalues)
        | 34 ->
            X (N N_pointer)
        | 33 ->
            X (N N_pparam)
        | 32 ->
            X (N N_pparamdecl_empty_)
        | 31 ->
            X (N N_prequire)
        | 30 ->
            X (N N_prequire1)
        | 29 ->
            X (N N_prim)
        | 28 ->
            X (N N_ptr)
        | 27 ->
            X (N N_ptype)
        | 26 ->
            X (N N_ptype_r)
        | 25 ->
            X (N N_range)
        | 24 ->
            X (N N_separated_nonempty_list_COLONCOLON_NID_)
        | 23 ->
            X (N N_separated_nonempty_list_COMMA_annot_pparamdecl_)
        | 22 ->
            X (N N_separated_nonempty_list_COMMA_annot_stor_type_)
        | 21 ->
            X (N N_separated_nonempty_list_COMMA_annotation_)
        | 20 ->
            X (N N_separated_nonempty_list_COMMA_loc_decl__)
        | 19 ->
            X (N N_separated_nonempty_list_COMMA_pexpr_)
        | 18 ->
            X (N N_separated_nonempty_list_COMMA_pexpr_noarr_)
        | 17 ->
            X (N N_separated_nonempty_list_COMMA_plvalue_)
        | 16 ->
            X (N N_separated_nonempty_list_COMMA_range_)
        | 15 ->
            X (N N_separated_nonempty_list_COMMA_var_)
        | 14 ->
            X (N N_separated_nonempty_list_empty_var_)
        | 13 ->
            X (N N_separated_nonempty_list_option_COMMA__var_)
        | 12 ->
            X (N N_simple_attribute)
        | 11 ->
            X (N N_stor_type)
        | 10 ->
            X (N N_storage)
        | 9 ->
            X (N N_struct_annot)
        | 8 ->
            X (N N_svsize)
        | 7 ->
            X (N N_swsize)
        | 6 ->
            X (N N_top)
        | 5 ->
            X (N N_top_annotation)
        | 4 ->
            X (N N_utype)
        | 3 ->
            X (N N_utype_array)
        | 2 ->
            X (N N_var)
        | 1 ->
            X (N N_writable)
        | _ ->
            assert false
    
    let lr0_incoming =
      "\000\002\n\014\016\018J\13811|\007Z\020\028&1P\024\026\140\t\015\017}\175\177V\012\014Z\b\154s\140\135^t\144\177\005V'1;V[_c\030\177c\"\177c,\177c.\177c<c@\177cBcD\177cF\177cP\177cR\177cT\177cX\177cd\177cf\177ch\177cl\177cz\177c\142\177c\150c\152\177c\140c\136'\155*\155*\132\139Zs\135c\140c\133\185\143\t\1876\189cc6\015\017*Z'6c*\179*ccc6\t157($\028 4`v\0196+1\157\169\193|\020\028P\177VZs\135c6^t\144\177\005V%;V]a\030\177a\"\177a,\177a.\177a<a@\177aBaD\177aF\177aP\177aR\177aT\177aX\177ad\177af\177ah\177al\177az\177a\142\177a\150a\152\177a\140a\136%\153*\153*\189a\017*Z%6a*\179*aa\\\0198\195\136+\t\025a\169\131\183H71|c(L1\\n1x1V^\140^!3\136!\151*\011\163\r71|\\'8U(c?CSWe\1272\028=\145\145\163\167\173\191`v\129r1V/\161*:V-\159*\191 N\134\0039Eq>y49`j\0217\023\197\136-\159u\\O\165\191\004\\\1658mo{Vc*{\006<\\\0198V*Zs\135c6\005\189#*IK\136#bco\128Qikop\005|c\022co\130co\146V\028\136c*(\148V\005*(\005V\155*bcw(\023\005|c\136\005)\136\141\005\027\027()(#;V\155*(G\030\177|\"\177|,\177|.\177|@\177|D\177|F\177|P\177|R\177|d\177|f\177||\152\177|gcw(MQ\171\136#\1650V\005\136\031\031\149*(\149(\1378Y\191\023\005\029\029A\199\136/\181\1678\147\167~"
    
    let[@inline] lr0_incoming =
      fun i ->
        MenhirLib.PackedIntArray.get8 lr0_incoming i
    
    let rhs_data =
      "\147\191A\191\023\193\1311\169\028\163\139Z\1876s\135c\133\140c|\025|\\\0198v`\014\012\015}\015\017\140\tn1<\\\0198`v4 \r\167O\165\011\163/-+'%!\031\167~\002==\145\140\136\1320V\149*(0\149(\143\t\185\183\181\173\175oEbc:V\159*:\159\154\b\003m\\\1658ioQ|@\177|P\177|\030\177|\"\177|F\177|f\177|R\177|,\177|.\177|\152\177|d\177|D\177|x1V\151*[]\005\005\189\020t^Zs\135c6V\017*Z'6\028V\179*c\144\177cP\177cc\150ccBcc@\177ccP\177cc\030\177cc\"\177ccF\177cc\152\177ccD\177ccd\177ccR\177ccf\177cc,\177cc.\177ccz\177cc\142\177ccT\177ccX\177cch\177ccl\177cVc*\005V\155*;V\155*c<c\140c\005\005\189\020t^Zs\135c6V\017*Z%6\028V\179*a\144\177aP\177aa\150aaBaa@\177aaP\177aa\030\177aa\"\177aaF\177aa\152\177aaD\177aad\177aaR\177aaf\177aa,\177aa.\177aaz\177aa\142\177aaT\177aaX\177aah\177aal\177aVa*\005V\153*;V\153*a<a\140a_\\\165\1378\191\129r1V\161*uYc\\'871|U(bcobco\128k\191M\148V\005*(;V\155*(Ggcw(\005V\155*w(\146V\028\136c*(Qp\005|c\022cop\005|c\130co\004{Vc*{\023)(\023\027(I\006\005\005\189Zs\135c6V#*#V*\171\171\136#q>H71|c(\023\029\1272\145\028&1y5\016\014\t\007Zc61^\140^JJ\1381\199\199\136/\197\197\136-\195\195\136+\005|c\005|c\136)cc\136'aa\136%KK\136#33\136!\005\005\136\031\005\005\029\005\005\141\027a\169\t\021749 9`j\157\026\024WCSe?\0181|7(L1\\\1678$\0196\n\t11\134N"
    
    let[@inline] rhs_data =
      fun i ->
        MenhirLib.PackedIntArray.get8 rhs_data i
    
    let rhs_entry =
      "\000\000\000\001\000\003\000\005\000\007\000\b\000\t\000\n\000\011\000\015\000\019\000\021\000\023\000\027\000\028\000\029\000\030\000\031\000 \000!\000\"\000#\000%\000'\000+\000,\000-\000.\000/\000/\0001\0001\0003\0003\0005\0005\0006\0006\0007\0007\0008\0008\0009\0009\000:\000:\000;\000;\000<\000>\000?\000@\000B\000B\000C\000C\000D\000D\000E\000E\000J\000M\000M\000O\000O\000P\000P\000Q\000Q\000R\000R\000S\000S\000T\000T\000U\000U\000V\000V\000X\000X\000\\\000^\000^\000_\000`\000`\000a\000b\000e\000f\000g\000h\000i\000l\000o\000r\000u\000x\000{\000~\000\129\000\132\000\135\000\138\000\141\000\146\000\147\000\148\000\149\000\151\000\152\000\153\000\154\000\159\000\165\000\166\000\170\000\173\000\176\000\179\000\182\000\186\000\190\000\194\000\198\000\202\000\206\000\210\000\214\000\218\000\222\000\226\000\230\000\234\000\238\000\242\000\246\000\250\000\254\001\001\001\005\001\t\001\014\001\015\001\017\001\018\001\019\001\020\001\025\001\031\001 \001$\001'\001*\001-\0010\0014\0018\001<\001@\001D\001H\001L\001P\001T\001X\001\\\001`\001d\001h\001l\001p\001t\001x\001{\001\127\001\131\001\136\001\137\001\141\001\150\001\151\001\154\001\159\001\162\001\167\001\169\001\174\001\179\001\184\001\190\001\197\001\198\001\205\001\212\001\218\001\221\001\224\001\225\001\226\001\227\001\229\001\234\001\237\001\238\001\240\001\241\001\244\001\246\001\252\001\254\002\001\002\002\002\004\002\005\002\006\002\007\002\b\002\t\002\r\002\014\002\017\002\018\002\021\002\022\002\025\002\026\002\029\002\030\002!\002$\002)\002*\002-\002.\0021\0022\0025\0026\0029\002:\002=\002>\002@\002A\002D\002E\002F\002G\002I\002K\002M\002N\002O\002P\002Q\002R\002S\002T\002U\002V\002W\002\\\002a\002d\002e\002f\002g\002h\002i\002j"
    
    let[@inline] rhs_entry =
      fun i ->
        MenhirLib.PackedIntArray.get16 rhs_entry i
    
    let[@inline] rhs =
      fun i ->
        MenhirLib.LinearizedArray.read_row_via rhs_data rhs_entry i
    
    let lr0_core =
      "\000\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\b\000\t\000\n\000\011\000\012\000\r\000\014\000\015\000\016\000\017\000\018\000\019\000\020\000\021\000\022\000\023\000\024\000\025\000\026\000\027\000\028\000\029\000\030\000\031\000 \000!\000\"\000#\000$\000%\000&\000'\000(\000)\000*\000+\000,\000-\000.\000/\0000\0001\0002\0003\0004\0005\0006\0007\0008\0009\000?\000@\000A\000G\000H\000I\000J\000K\000L\000:\000;\000<\000=\000>\000B\000C\000D\000E\000F\000M\000N\000O\000V\000W\000X\000Y\000Z\000[\000j\000k\000l\000P\000Q\000R\000S\000T\000U\000\\\000]\000^\000_\000`\000a\000b\000c\000d\000e\000f\000g\000h\000i\000m\000n\000o\000p\000q\000r\000s\000t\000u\000v\000w\000x\000y\000z\000{\000|\000}\000~\000\127\000\128\000\129\000\130\000\131\000\132\000\133\000\134\000\135\000\136\000\137\000\138\000\139\000\140\000\141\000\142\000\143\000\144\000\145\000\146\000\147\000\148\000\149\000\150\000\151\000\152\000\153\000\154\000\155\000\156\000\157\000\158\000\159\000\160\000\161\000\162\000\163\000\164\000\165\000\166\000\167\000\168\000\169\000\170\000\171\000\172\000\173\000\174\000\175\000\176\000\177\000\178\000\179\000\180\000\181\000\182\000\183\000\184\000\185\000\186\000\187\000\188\000\189\000\190\000\191\000\192\000\193\000\194\000\195\000\196\000\197\000\203\000\204\000\205\000\211\000\212\000\213\000\214\000\215\000\216\000\198\000\199\000\200\000\201\000\202\000\206\000\207\000\208\000\209\000\210\000\217\000\218\000\219\000\226\000\227\000\228\000\229\000\230\000\231\000\246\000\247\000\248\000\220\000\221\000\222\000\223\000\224\000\225\000\232\000\233\000\234\000\235\000\236\000\237\000\238\000\239\000\240\000\241\000\242\000\243\000\244\000\245\000\249\000\250\000\251\000\252\000\253\000\254\000\255\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\b\001\t\001\n\001\011\001\012\001\r\001\014\001\015\001\016\001\017\001\018\001\019\001\020\001\021\001\022\001\023\001\024\001\025\001\026\001\027\001\028\001\029\001\030\001\031\001 \001!\001\"\001#\001$\001%\001&\001'\001(\001)\001*\001+\001,\001-\001.\001/\0010\0011\0012\0013\0014\0015\0016\0017\0018\0019\001:\001;\001<\001=\001>\001?\001@\001A\001B\001C\001D\001E\001F\001G\001H\001I\001J\001K\001L\001M\001N\001O\001P\001Q\001R\001S\001T\001U\001V\001W\001X\001Y\001Z\001[\001\\\001]\001^\001_\001`\001a\001b\001c\001d\001e\001f\001g\001h\001i\001j\001k\001l\001m\001n\001o\001p\001q\001r\001s\001t\001u\001v\001w\001x\001y\001z\001{\001|\001}\001~\001\127\001\128\001\129\001\130\001\131\001\132\001\133\001\134\001\135\001\136\001\137\001\138\001\139\001\140\001\141\001\142\001\143\001\144\001\145\001\146\001\147\001\148\001\149\001\150\001\151\001\152\001\153\001\154\001\155\001\156\001\157\001\158\001\159\001\160\001\161\001\162\001\163\001\164\001\165\001\166\001\167\001\168\001\169\001\170\001\171\001\172\001\173\001\174\001\175\001\176\001\177\001\178\001\179\001\180\001\181\001\182\001\183\001\184\001\185\001\186\001\187\001\188\001\189\001\190\001\191\001\192\001\193\001\194\001\195\001\196\001\197\001\198\001\199\001\200\001\201\001\202\001\203\001\204\001\205\001\206\001\207\001\208\001\209\001\210\001\211\001\212\001\213\001\214\001\215\001\216\001\217\001\218\001\219\001\220\001\221\001\222\001\223\001\224\001\225\001\226\001\227\001\228\001\229\001\230\001\231\001\232\001\233\001\234\001\235\001\236\001\237\001\238\001\239\001\240\001\241\001\242\001\243\001\244\001\245\001\246\001\247\001\248\001\249\001\250\001\251\001\252\001\253\001\254\001\255\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\b\002\t\002\n\002\011\002\012\002\r\002\014\002\015\002\016\002\017\002\018\002\019\002\020\002\021\002\022\002\023\002\024\002\025\002\026"
    
    let[@inline] lr0_core =
      fun i ->
        MenhirLib.PackedIntArray.get16 lr0_core i
    
    let lr0_items_data =
      "\000\000\000\000\000\000\196\001\000\004$\001\000\003d\001\000\003`\001\000\004\024\001\000\003|\001\000\003x\001\000\003|\002\000\003|\003\000\004\024\002\000\004\024\003\000\003l\001\000\003l\002\000\001\184\001\000\001\204\001\000\003T\001\000\003T\002\000\001\216\001\000\004\000\001\000\003\252\001\000\000T\001\000\000T\002\000\000L\001\000\000P\001\000\000H\001\000\001 \001\000\001\216\002\000\002,\001\000\001\208\001\000\001\200\001\000\000@\001\000\000<\001\000\001\196\001\000\001P\001\000\001L\001\000\001\196\002\000\000\212\001\000\001\196\003\000\001\192\001\000\001\188\001\000\001\212\001\000\001\212\002\000\0020\001\000\001\180\001\000\001\176\001\000\0020\002\000\000\164\001\000\0040\001\000\0024\001\000\0024\002\000\001\168\001\000\002\200\001\000\003\164\001\000\003\160\001\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\001\236\002\000\001\236\003\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\004\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\001\240\002\000\001\240\003\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\004\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\002\012\002\000\002\012\003\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\004\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\002\016\002\000\002\016\003\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\004\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\0028\002\000\0028\003\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\001\228\002\000\001\228\003\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\004\000\001\228\001\000\001\224\001\000\001\220\001\000\001\224\002\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\003\000\001\224\001\000\001\220\001\000\001\252\002\000\001\252\003\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\004\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\001\244\002\000\001\244\003\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\004\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\001\232\002\000\001\232\003\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\004\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\002\004\002\000\002\004\003\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\004\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\002\028\002\000\002\028\003\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\004\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\002 \002\000\002 \003\000\0028\001\000\002(\001\000\002$\001\000\002 \004\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\002\000\002\000\002\000\003\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\004\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\002\b\002\000\002\b\003\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\004\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\002$\002\000\002$\003\000\0028\001\000\002(\001\000\002$\004\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\002(\002\000\002(\003\000\0028\001\000\002(\004\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\002\020\002\000\002\020\003\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\004\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\002\024\002\000\002\024\003\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\004\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\001\220\002\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\003\000\001\220\001\000\001\248\002\000\001\248\003\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\004\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\0028\004\000\0028\005\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\003\164\002\000\003\164\003\000\0024\003\000\0024\004\000\0020\003\000\0020\004\000\000\228\001\000\000 \001\000\000 \002\000\000$\001\000\000$\002\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\000$\003\000\000(\001\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\000(\002\000\000$\004\000\001\000\001\000\000\248\001\000\000\248\002\000\000 \003\000\000 \004\000\001\180\002\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\001\212\003\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\001\196\004\000\001\196\005\000\000D\001\000\001\200\002\000\001\200\003\000\001\200\004\000\001\200\005\000\001\200\006\000\0028\001\000\002,\002\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\002,\003\000\001\208\002\000\001\208\003\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\001\208\004\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\001\216\003\000\003l\003\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\003l\004\000\004(\001\000\003h\001\000\004,\001\000\003p\001\000\003\\\001\000\004\024\004\000\004\024\005\000\004 \001\000\000\024\001\000\000l\001\000\000h\001\000\000`\001\000\000d\001\000\004 \002\000\004 \003\000\000\156\001\000\000\016\001\000\003\248\001\000\000\020\001\000\000\012\001\000\0000\001\000\000,\001\000\002D\001\000\002X\001\000\002d\001\000\002d\002\000\002\184\001\000\002\\\001\000\002T\001\000\002P\001\000\002P\002\000\002P\003\000\002P\004\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\002P\005\000\002L\001\000\002H\001\000\002`\001\000\002`\002\000\002\188\001\000\002@\001\000\002<\001\000\002\188\002\000\000\172\001\000\002\192\001\000\002\192\002\000\001\172\001\000\003\172\001\000\003\168\001\000\002\196\001\000\002\180\001\000\002\176\001\000\002\172\001\000\002\168\001\000\002\164\001\000\002\160\001\000\002\156\001\000\002\152\001\000\002\148\001\000\002\144\001\000\002\140\001\000\002\136\001\000\002\132\001\000\002\128\001\000\002|\001\000\002x\001\000\002t\001\000\002p\001\000\002l\001\000\002h\001\000\002x\002\000\002x\003\000\002\196\001\000\002\180\001\000\002\176\001\000\002\172\001\000\002\168\001\000\002\164\001\000\002\160\001\000\002\156\001\000\002\152\001\000\002\148\001\000\002\144\001\000\002\140\001\000\002\136\001\000\002\132\001\000\002\128\001\000\002|\001\000\002x\004\000\002x\001\000\002t\001\000\002p\001\000\002l\001\000\002h\001\000\002|\002\000\002|\003\000\002\196\001\000\002\180\001\000\002\176\001\000\002\172\001\000\002\168\001\000\002\164\001\000\002\160\001\000\002\156\001\000\002\152\001\000\002\148\001\000\002\144\001\000\002\140\001\000\002\136\001\000\002\132\001\000\002\128\001\000\002|\004\000\002|\001\000\002x\001\000\002t\001\000\002p\001\000\002l\001\000\002h\001\000\002\152\002\000\002\152\003\000\002\196\001\000\002\180\001\000\002\176\001\000\002\172\001\000\002\168\001\000\002\164\001\000\002\160\001\000\002\156\001\000\002\152\004\000\002\152\001\000\002\148\001\000\002\144\001\000\002\140\001\000\002\136\001\000\002\132\001\000\002\128\001\000\002|\001\000\002x\001\000\002t\001\000\002p\001\000\002l\001\000\002h\001\000\002\156\002\000\002\156\003\000\002\196\001\000\002\180\001\000\002\176\001\000\002\172\001\000\002\168\001\000\002\164\001\000\002\160\001\000\002\156\004\000\002\156\001\000\002\152\001\000\002\148\001\000\002\144\001\000\002\140\001\000\002\136\001\000\002\132\001\000\002\128\001\000\002|\001\000\002x\001\000\002t\001\000\002p\001\000\002l\001\000\002h\001\000\002\196\002\000\002\196\003\000\002\196\001\000\002\180\001\000\002\176\001\000\002\172\001\000\002\168\001\000\002\164\001\000\002\160\001\000\002\156\001\000\002\152\001\000\002\148\001\000\002\144\001\000\002\140\001\000\002\136\001\000\002\132\001\000\002\128\001\000\002|\001\000\002x\001\000\002t\001\000\002p\001\000\002l\001\000\002h\001\000\002p\002\000\002p\003\000\002\196\001\000\002\180\001\000\002\176\001\000\002\172\001\000\002\168\001\000\002\164\001\000\002\160\001\000\002\156\001\000\002\152\001\000\002\148\001\000\002\144\001\000\002\140\001\000\002\136\001\000\002\132\001\000\002\128\001\000\002|\001\000\002x\001\000\002t\001\000\002p\004\000\002p\001\000\002l\001\000\002h\001\000\002l\002\000\002\196\001\000\002\180\001\000\002\176\001\000\002\172\001\000\002\168\001\000\002\164\001\000\002\160\001\000\002\156\001\000\002\152\001\000\002\148\001\000\002\144\001\000\002\140\001\000\002\136\001\000\002\132\001\000\002\128\001\000\002|\001\000\002x\001\000\002t\001\000\002p\001\000\002l\003\000\002l\001\000\002h\001\000\002\136\002\000\002\136\003\000\002\196\001\000\002\180\001\000\002\176\001\000\002\172\001\000\002\168\001\000\002\164\001\000\002\160\001\000\002\156\001\000\002\152\001\000\002\148\001\000\002\144\001\000\002\140\001\000\002\136\004\000\002\136\001\000\002\132\001\000\002\128\001\000\002|\001\000\002x\001\000\002t\001\000\002p\001\000\002l\001\000\002h\001\000\002\128\002\000\002\128\003\000\002\196\001\000\002\180\001\000\002\176\001\000\002\172\001\000\002\168\001\000\002\164\001\000\002\160\001\000\002\156\001\000\002\152\001\000\002\148\001\000\002\144\001\000\002\140\001\000\002\136\001\000\002\132\001\000\002\128\004\000\002\128\001\000\002|\001\000\002x\001\000\002t\001\000\002p\001\000\002l\001\000\002h\001\000\002t\002\000\002t\003\000\002\196\001\000\002\180\001\000\002\176\001\000\002\172\001\000\002\168\001\000\002\164\001\000\002\160\001\000\002\156\001\000\002\152\001\000\002\148\001\000\002\144\001\000\002\140\001\000\002\136\001\000\002\132\001\000\002\128\001\000\002|\001\000\002x\001\000\002t\004\000\002t\001\000\002p\001\000\002l\001\000\002h\001\000\002\144\002\000\002\144\003\000\002\196\001\000\002\180\001\000\002\176\001\000\002\172\001\000\002\168\001\000\002\164\001\000\002\160\001\000\002\156\001\000\002\152\001\000\002\148\001\000\002\144\004\000\002\144\001\000\002\140\001\000\002\136\001\000\002\132\001\000\002\128\001\000\002|\001\000\002x\001\000\002t\001\000\002p\001\000\002l\001\000\002h\001\000\002\168\002\000\002\168\003\000\002\196\001\000\002\180\001\000\002\176\001\000\002\172\001\000\002\168\004\000\002\168\001\000\002\164\001\000\002\160\001\000\002\156\001\000\002\152\001\000\002\148\001\000\002\144\001\000\002\140\001\000\002\136\001\000\002\132\001\000\002\128\001\000\002|\001\000\002x\001\000\002t\001\000\002p\001\000\002l\001\000\002h\001\000\002\172\002\000\002\172\003\000\002\196\001\000\002\180\001\000\002\176\001\000\002\172\004\000\002\172\001\000\002\168\001\000\002\164\001\000\002\160\001\000\002\156\001\000\002\152\001\000\002\148\001\000\002\144\001\000\002\140\001\000\002\136\001\000\002\132\001\000\002\128\001\000\002|\001\000\002x\001\000\002t\001\000\002p\001\000\002l\001\000\002h\001\000\002\140\002\000\002\140\003\000\002\196\001\000\002\180\001\000\002\176\001\000\002\172\001\000\002\168\001\000\002\164\001\000\002\160\001\000\002\156\001\000\002\152\001\000\002\148\001\000\002\144\001\000\002\140\004\000\002\140\001\000\002\136\001\000\002\132\001\000\002\128\001\000\002|\001\000\002x\001\000\002t\001\000\002p\001\000\002l\001\000\002h\001\000\002\148\002\000\002\148\003\000\002\196\001\000\002\180\001\000\002\176\001\000\002\172\001\000\002\168\001\000\002\164\001\000\002\160\001\000\002\156\001\000\002\152\001\000\002\148\004\000\002\148\001\000\002\144\001\000\002\140\001\000\002\136\001\000\002\132\001\000\002\128\001\000\002|\001\000\002x\001\000\002t\001\000\002p\001\000\002l\001\000\002h\001\000\002\176\002\000\002\176\003\000\002\196\001\000\002\180\001\000\002\176\004\000\002\176\001\000\002\172\001\000\002\168\001\000\002\164\001\000\002\160\001\000\002\156\001\000\002\152\001\000\002\148\001\000\002\144\001\000\002\140\001\000\002\136\001\000\002\132\001\000\002\128\001\000\002|\001\000\002x\001\000\002t\001\000\002p\001\000\002l\001\000\002h\001\000\002\180\002\000\002\180\003\000\002\196\001\000\002\180\004\000\002\180\001\000\002\176\001\000\002\172\001\000\002\168\001\000\002\164\001\000\002\160\001\000\002\156\001\000\002\152\001\000\002\148\001\000\002\144\001\000\002\140\001\000\002\136\001\000\002\132\001\000\002\128\001\000\002|\001\000\002x\001\000\002t\001\000\002p\001\000\002l\001\000\002h\001\000\002\160\002\000\002\160\003\000\002\196\001\000\002\180\001\000\002\176\001\000\002\172\001\000\002\168\001\000\002\164\001\000\002\160\004\000\002\160\001\000\002\156\001\000\002\152\001\000\002\148\001\000\002\144\001\000\002\140\001\000\002\136\001\000\002\132\001\000\002\128\001\000\002|\001\000\002x\001\000\002t\001\000\002p\001\000\002l\001\000\002h\001\000\002\164\002\000\002\164\003\000\002\196\001\000\002\180\001\000\002\176\001\000\002\172\001\000\002\168\001\000\002\164\004\000\002\164\001\000\002\160\001\000\002\156\001\000\002\152\001\000\002\148\001\000\002\144\001\000\002\140\001\000\002\136\001\000\002\132\001\000\002\128\001\000\002|\001\000\002x\001\000\002t\001\000\002p\001\000\002l\001\000\002h\001\000\002h\002\000\002\196\001\000\002\180\001\000\002\176\001\000\002\172\001\000\002\168\001\000\002\164\001\000\002\160\001\000\002\156\001\000\002\152\001\000\002\148\001\000\002\144\001\000\002\140\001\000\002\136\001\000\002\132\001\000\002\128\001\000\002|\001\000\002x\001\000\002t\001\000\002p\001\000\002l\001\000\002h\003\000\002h\001\000\002\132\002\000\002\132\003\000\002\196\001\000\002\180\001\000\002\176\001\000\002\172\001\000\002\168\001\000\002\164\001\000\002\160\001\000\002\156\001\000\002\152\001\000\002\148\001\000\002\144\001\000\002\140\001\000\002\136\001\000\002\132\004\000\002\132\001\000\002\128\001\000\002|\001\000\002x\001\000\002t\001\000\002p\001\000\002l\001\000\002h\001\000\002\196\004\000\002\196\005\000\002\196\001\000\002\180\001\000\002\176\001\000\002\172\001\000\002\168\001\000\002\164\001\000\002\160\001\000\002\156\001\000\002\152\001\000\002\148\001\000\002\144\001\000\002\140\001\000\002\136\001\000\002\132\001\000\002\128\001\000\002|\001\000\002x\001\000\002t\001\000\002p\001\000\002l\001\000\002h\001\000\003\172\002\000\003\172\003\000\002\192\003\000\002\192\004\000\002\188\003\000\002\188\004\000\002@\002\000\002\196\001\000\002\180\001\000\002\176\001\000\002\172\001\000\002\168\001\000\002\164\001\000\002\160\001\000\002\156\001\000\002\152\001\000\002\148\001\000\002\144\001\000\002\140\001\000\002\136\001\000\002\132\001\000\002\128\001\000\002|\001\000\002x\001\000\002t\001\000\002p\001\000\002l\001\000\002h\001\000\002`\003\000\002T\002\000\002T\003\000\002T\004\000\002T\005\000\002T\006\000\002\196\001\000\002\184\002\000\002\180\001\000\002\176\001\000\002\172\001\000\002\168\001\000\002\164\001\000\002\160\001\000\002\156\001\000\002\152\001\000\002\148\001\000\002\144\001\000\002\140\001\000\002\136\001\000\002\132\001\000\002\128\001\000\002|\001\000\002x\001\000\002t\001\000\002p\001\000\002l\001\000\002h\001\000\002\184\003\000\002\\\002\000\002\\\003\000\002\196\001\000\002\180\001\000\002\176\001\000\002\172\001\000\002\168\001\000\002\164\001\000\002\160\001\000\002\156\001\000\002\152\001\000\002\148\001\000\002\144\001\000\002\140\001\000\002\136\001\000\002\132\001\000\002\128\001\000\002|\001\000\002x\001\000\002t\001\000\002p\001\000\002l\001\000\002h\001\000\002\\\004\000\002\196\001\000\002\180\001\000\002\176\001\000\002\172\001\000\002\168\001\000\002\164\001\000\002\160\001\000\002\156\001\000\002\152\001\000\002\148\001\000\002\144\001\000\002\140\001\000\002\136\001\000\002\132\001\000\002\128\001\000\002|\001\000\002x\001\000\002t\001\000\002p\001\000\002l\001\000\002h\001\000\002d\003\000\0000\002\000\0000\003\000\0000\004\000\003\148\001\000\003\144\001\000\003\148\002\000\003\148\003\000\003\224\001\000\000,\002\000\003\216\001\000\002\196\001\000\002\180\001\000\002\176\001\000\002\172\001\000\002\168\001\000\002\164\001\000\002\160\001\000\002\156\001\000\002\152\001\000\002\148\001\000\002\144\001\000\002\140\001\000\002\136\001\000\002\132\001\000\002\128\001\000\002|\001\000\002x\001\000\002t\001\000\002p\001\000\002l\001\000\002h\001\000\003\220\001\000\000\012\002\000\001\b\001\000\003D\001\000\003D\002\000\003D\003\000\003D\004\000\003D\005\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\003D\006\000\004\028\001\000\004\028\002\000\004\028\003\000\000X\001\000\000X\002\000\001\164\001\000\001\164\002\000\001\164\003\000\003t\001\000\003t\002\000\003t\003\000\000\180\001\000\003\188\001\000\003\184\001\000\003\188\002\000\003\188\003\000\001\164\004\000\001\164\005\000\000\132\001\000\000\132\002\000\000t\001\000\002\220\001\000\002\220\002\000\002\220\003\000\002\216\001\000\002\216\002\000\002\216\003\000\002\220\004\000\002\220\005\000\002\212\001\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\004\020\001\000\004\b\001\000\004\012\001\000\004\004\001\000\004\016\001\000\003L\001\000\003L\002\000\003P\001\000\000\204\001\000\000\200\001\000\000\204\002\000\003L\003\000\000\028\001\000\000t\002\000\001\024\001\000\002\208\001\000\0008\001\000\0004\001\000\002\208\002\000\002\208\003\000\002\208\004\000\002\208\005\000\000\140\001\000\002\208\006\000\002\208\007\000\001D\001\000\001@\001\000\001@\002\000\000\148\001\000\001@\003\000\001@\004\000\000\b\001\000\003\236\001\000\0048\001\000\0044\001\000\001X\001\000\003\236\002\000\0010\001\000\003@\001\000\003@\002\000\003X\001\000\003\232\001\000\003\232\002\000\003\240\001\000\003\244\001\000\003\228\001\000\003\228\002\000\000\b\002\000\003\140\001\000\003\136\001\000\003\140\002\000\003\140\003\000\001D\002\000\002\208\b\000\002\204\001\000\000|\001\000\000|\002\000\002\232\001\000\003\012\001\000\001`\001\000\001`\002\000\001`\003\000\001\\\001\000\001(\001\000\003\012\002\000\003\012\003\000\003\012\004\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\003\012\005\000\003\012\006\000\003\028\001\000\000\\\001\000\000\\\002\000\000\\\003\000\000\\\004\000\0034\001\000\003,\001\000\0034\002\000\003(\001\000\003(\002\000\003(\003\000\003(\004\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\003(\005\000\003$\001\000\003 \001\000\003$\002\000\003,\002\000\003,\003\000\003\024\001\000\003\180\001\000\003\176\001\000\003\180\002\000\003\180\003\000\002\228\001\000\002\224\001\000\002\228\002\000\002\224\002\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\002\228\003\000\002\224\003\000\002\228\004\000\001l\001\000\001d\001\000\002\228\005\000\001h\001\000\003\b\001\000\003\004\001\000\003\b\002\000\003\004\002\000\003\b\003\000\003\004\003\000\003\b\004\000\003\004\004\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\003\004\005\000\003\004\006\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\003\004\007\000\003\b\005\000\003\b\006\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\003\b\007\000\002\252\001\000\002\252\002\000\002\252\003\000\002\252\004\000\002\252\005\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\002\252\006\000\002\252\007\000\002\236\001\000\002\236\002\000\002\236\003\000\002\236\004\000\002\236\005\000\003$\001\000\003 \001\000\002\248\001\000\002\248\002\000\002\248\003\000\002\248\004\000\0018\001\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\0018\002\000\002\248\005\000\002\248\006\000\003\020\001\000\003\016\001\000\003\212\001\000\003\208\001\000\003\156\001\000\003\152\001\000\003\156\002\000\003\152\002\000\003\156\003\000\003\152\003\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\003\156\004\000\003\156\001\000\003\152\001\000\003\156\005\000\000\220\001\000\003\212\002\000\003\212\001\000\003\208\001\000\003\212\003\000\003\020\002\000\003\020\003\000\003\016\002\000\003\016\003\000\0030\001\000\002\240\001\000\002\240\002\000\002\240\003\000\002\240\004\000\002\240\005\000\002\244\001\000\001|\001\000\001|\002\000\001|\003\000\001\128\001\000\001\128\002\000\001\128\003\000\001\144\001\000\001\144\002\000\001\144\003\000\001\148\001\000\001\148\002\000\001\148\003\000\001t\001\000\001t\002\000\001t\003\000\001\160\001\000\001\160\002\000\001\160\003\000\001\132\001\000\001\132\002\000\001\132\003\000\001x\001\000\001x\002\000\001x\003\000\001\140\001\000\001\140\002\000\001\140\003\000\001\156\001\000\001\156\002\000\001\156\003\000\001\136\001\000\001\136\002\000\001\136\003\000\001p\001\000\001\152\001\000\001\152\002\000\001\152\003\000\002\244\002\000\002\244\003\000\0028\001\000\002(\001\000\002$\001\000\002 \001\000\002\028\001\000\002\024\001\000\002\020\001\000\002\016\001\000\002\012\001\000\002\b\001\000\002\004\001\000\002\000\001\000\001\252\001\000\001\248\001\000\001\244\001\000\001\240\001\000\001\236\001\000\001\232\001\000\001\228\001\000\001\224\001\000\001\220\001\000\002\244\004\000\002\244\005\000\002\232\002\000\003\000\001\000\003<\001\000\0038\001\000\003<\002\000\003<\003\000\002\204\002\000\000\240\001\000\000\236\001\000\000\236\002\000\003\196\001\000\003\192\001\000\003\196\002\000\003\196\003\000\000\188\001\000\000\236\003\000\000\236\004\000\000\236\005\000\000\240\002\000\000\240\003\000\002\204\003\000\002\204\004\000\002\208\t\000\000\004\001\000\003H\001\000\003\204\001\000\003\200\001\000\003\204\002\000\003H\002\000\000\004\002\000\003\132\001\000\003\128\001\000\003\132\002\000\003\132\003\000\001\016\001\000\004\028\004\000\004\028\005\000\000\000\001\000\000\192\001\000\000\192\002"
    
    let[@inline] lr0_items_data =
      fun i ->
        MenhirLib.PackedIntArray.get32 lr0_items_data i
    
    let lr0_items_entry =
      "\000\000\000\001\000\002\000\003\000\004\000\005\000\006\000\b\000\t\000\n\000\011\000\012\000\r\000\014\000\015\000\016\000\017\000\018\000\019\000\020\000\021\000\022\000\023\000\024\000\025\000\026\000\027\000\028\000\031\000 \000!\000\"\000#\000$\000%\000&\000'\000(\000)\000*\000+\000.\000/\0000\0001\0002\0003\0004\0005\000L\000M\000N\000d\000e\000f\000|\000}\000~\000\148\000\149\000\150\000\172\000\173\000\195\000\196\000\197\000\219\000\220\000\242\000\243\000\244\001\n\001\011\001\012\001\"\001#\001$\001:\001;\001<\001R\001S\001T\001j\001k\001l\001\130\001\131\001\132\001\154\001\155\001\156\001\178\001\179\001\180\001\202\001\203\001\204\001\226\001\227\001\228\001\250\001\251\001\252\002\018\002\019\002)\002*\002+\002A\002B\002X\002Y\002Z\002[\002\\\002]\002^\002_\002`\002a\002b\002c\002y\002z\002\144\002\145\002\146\002\147\002\148\002\149\002\150\002\151\002\173\002\195\002\196\002\197\002\198\002\199\002\200\002\201\002\202\002\224\002\225\002\226\002\227\002\249\003\015\003%\003&\003(\003*\003+\003,\003-\003.\003/\0030\0031\0032\0033\0034\0035\0036\0037\0038\0039\003:\003<\003=\003>\003?\003@\003C\003D\003E\003F\003\\\003]\003^\003_\003`\003a\003d\003e\003f\003g\003h\003i\003\128\003\129\003\130\003\152\003\153\003\154\003\176\003\177\003\178\003\200\003\201\003\202\003\224\003\225\003\247\003\248\003\249\004\015\004\016\004&\004'\004(\004>\004?\004@\004V\004W\004X\004n\004o\004p\004\134\004\135\004\136\004\158\004\159\004\160\004\182\004\183\004\184\004\206\004\207\004\208\004\230\004\231\004\232\004\254\004\255\005\000\005\022\005\023\005\024\005.\005/\0050\005F\005G\005]\005^\005_\005u\005v\005\140\005\141\005\142\005\143\005\144\005\145\005\146\005\147\005\169\005\170\005\171\005\172\005\173\005\174\005\196\005\197\005\198\005\199\005\221\005\243\005\244\005\245\005\246\005\248\005\249\005\250\005\251\005\252\006\018\006\019\006\020\006\021\006\022\006\023\006\024\006\025\006/\0060\0061\0062\0063\0064\0065\0066\0067\0068\0069\006:\006;\006<\006>\006?\006@\006A\006B\006C\006D\006E\006F\006G\006H\006I\006J\006K\006L\006M\006c\006d\006e\006f\006g\006h\006i\006j\006k\006m\006n\006o\006p\006q\006r\006s\006t\006u\006v\006w\006x\006y\006z\006{\006|\006~\006\127\006\128\006\129\006\130\006\131\006\132\006\133\006\134\006\135\006\136\006\137\006\138\006\139\006\140\006\141\006\142\006\143\006\144\006\145\006\146\006\147\006\149\006\150\006\151\006\152\006\153\006\154\006\155\006\156\006\157\006\158\006\159\006\160\006\161\006\162\006\163\006\164\006\165\006\187\006\188\006\189\006\190\006\191\006\192\006\193\006\194\006\196\006\197\006\198\006\199\006\200\006\222\006\223\006\225\006\226\006\227\006\228\006\229\006\231\006\232\006\233\006\235\007\002\007\004\007\005\007\006\007\007\007\b\007\t\007\011\007\r\007\015\007&\007'\007=\007>\007?\007U\007V\007W\007X\007Y\007Z\007p\007q\007r\007s\007t\007u\007v\007w\007z\007{\007|\007}\007~\007\148\007\149\007\150\007\152\007\156\007\158\007\181\007\182\007\184\007\185\007\186\007\187\007\189\007\190\007\191\007\192\007\193\007\194\007\195\007\196\007\197\007\198\007\199\007\200\007\201\007\202\007\203\007\204\007\205\007\206\007\207\007\208\007\209\007\210\007\211\007\212\007\213\007\214\007\215\007\216\007\217\007\218\007\219\007\220\007\221\007\222\007\223\007\224\007\225\007\226\007\227\007\228\007\229\007\230\007\231\007\232\007\233\007\234\007\235\007\236\007\237\007\238\007\239\b\005\b\006\b\007\b\b\b\t\b\011\b\012\b\r\b\014\b\016\b\017\b\019\b\020\b\021\b\022\b\023\b\024\b\025\b\026\b\027\b\028\b\029\b\030\b\031\b \b\"\b#\b$\b%\b'\b(\b)\b*\b+\b,\b-\b.\b/"
    
    let[@inline] lr0_items_entry =
      fun i ->
        MenhirLib.PackedIntArray.get16 lr0_items_entry i
    
    let[@inline] lr0_items =
      fun i ->
        MenhirLib.LinearizedArray.read_row_via lr0_items_data lr0_items_entry i
    
    let nullable =
      "\000@\000\b\000\000\000\255\255?\240\129\000"
    
    let[@inline] nullable =
      fun i ->
        MenhirLib.PackedIntArray.get1 nullable i
    
    let first =
      "\139\128@\128\028\001\002\178\000\000\000\000\000\000\016\000\000\001\000\000\000\000\000\002\000\000\000\000\000\016\000\000\000\016\000\000\000\000\000\128\000\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000.\001\002\000p\004\n\192\000\000\002\000\000\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\000\000(\002\000@\b\001\000\000\000\000@\016\000\000B\000\000\000\000\002\000\128\000\002\016\000\000\000\132R\004\000\146\176\006\000\016\000\000\000\000\004\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\000\002\000\000\000\001\000\000\000\000@@\000\000\000\000\017\b\000\002J\128\016\000@\000\136@\000\018T\000\128\002\000\000\000\000\000\128\000\000\000\000\000\002\128 \004\000\128\016\000\000\000\005\001\000\000\004 \000\000\000\000(\b\000\000!\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\000\000\000\016\000\000\000\002\192\000\000\002\000\000\000\000\000\022\000\000\000\016\000\000\000\000\000\000\000\000  \000\000\002\000\000\000\016\000\000\000\000\000\000\000\000\016\000\000\000\000\000\000\000\000\000\000\016\000\000\000@\000\000\000\001\000@\000\001\b\000\000\000\000\000\000\000\128\000\000\000\000\000\000\000\000\128\128\000\000\b\000@\000\000\b\016P\000\000\000\002\000\000\000\000\128\128\000\000\000\016\000\000\000\004\004\000\000\000\001\128\004\129\016 \166$\000\003\012\000,\b\129\0051 \000\024\000\000\000\000\000\000\128\000\000\000X\000\000\000@\000\000\000\000\000\017\b\000\002K\128\016\000@\000\000\128\000\000\002\001@\000\000\000\000\000\000\000@\000\000\000\000\"\016\000\004\149\000 \000\128\001\016\128\000$\168\001\000\004\000\b\132\000\001%@\b\000 \000D \000\t*\000@\001\000\002!\000\000IP\002\000\b\000\000\000\000\000\000\000\004\000\000\000\005\012\002\195\000\192\b\000 \000\000\000\000\000\b\000\000\000\000\000\000\000\000\002@\000\000\000\000\000\000\000\000\016\000\000\000\000\000\000\000\000\000\128\000\000\000\000\000\000\000\002\000\000\000 \000\128\000\000\000\000\000\000\000\000@\000\000\002\000\000\000\000\000\000\000\000\000\000\000\001\000\000\000\000\000\000\000  \000\000\002\000\000\000\000\000\000\002\000\000\000\000\000`\000\000\000\000\000\000\016\000\000\000\000\000\000\000@\000\000\000\000\000\000\000\001\000 \000\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\000\000\001\000\016\000\000\000\000\000\000\000\b\000\000\000\016\000\000\000\000\000\000\000\000\000\000\000\000\000\000 \000\000\000\000\000\000\000\000\000@\000\000\000\000\000\000\000\000\000\128\000\004\000\000\000\000\000\000\000\004\\\002\004\000\224\b\021\144\000\000\000\000\000\002\000\000\000\000\000\000\000\000\000\000\004\000\000\000\000\004B\000\000\146\160\004\000\016\000\"\016\000\004\149\000 \000\128\000\020\001\000 \004\000\128\000\000\000(\b\000\000!\000\000\000\000\001@@\000\001\b\000\000\000\000\002\000\000\000\000\000\000\000\024\000X\017\002\nb@\0000\023\000\129\0008\002\005`\000\000\000\016\004\000\000\016\002\000\000\000\000\000\002\000\000\000\000\000\000\000\000\000\000\000\000\b\000\000\000\003\000\000\000\000\000\000\000\128\000\024\000\000\000\000\000\000\004\0000\128\000\000\000\000\000\000\000\000\000\000\000\000\000@\b\000\000\000\000\000\000\000\000\000\b\000\000\000\000\000\000\000\000\000\000@\012\"\016\000\004\149\000 \002\132\000\000\000\000\000 \000\001\000\000\000\b\000\000\000\000\000\000\000\000\005\000@\b\001\000 \000\000\000(\002\000@\b\001\000\000\000\000P\016\000\000B\000\000\000\000\002\128\128\000\002\016\000\000\000"
    
    let[@inline] first =
      fun i ->
        MenhirLib.PackedIntArray.get1 first i
    
    let[@inline] first =
      fun i j ->
        first (77 * i + j)
    
  end) (ET) (TI)
  
end

let module_ =
  fun lexer lexbuf : ((Syntax.pprogram)) ->
    Obj.magic (MenhirInterpreter.entry `Legacy 0 lexer lexbuf)

module Incremental = struct
  
  let module_ =
    fun initial_position : ((Syntax.pprogram) MenhirInterpreter.checkpoint) ->
      Obj.magic (MenhirInterpreter.start 0 initial_position)
  
end
