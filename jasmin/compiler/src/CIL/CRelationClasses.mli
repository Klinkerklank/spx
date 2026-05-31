(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)


type __ = Obj.t

type 'a crelation = __

type ('a, 'b) arrow = 'a -> 'b

type ('a, 'b) iffT = ('a -> 'b) * ('b -> 'a)

type ('a, 'r, 'x) subrelation = 'a -> 'a -> 'r -> 'x
