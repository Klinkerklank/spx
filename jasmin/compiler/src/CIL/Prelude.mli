(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)


type 't coq_ReverseCoercionSource = 't

type 't coq_ReverseCoercionTarget = 't

val reverse_coercion :
  'a1 -> 'a2 coq_ReverseCoercionSource -> 'a1 coq_ReverseCoercionTarget
