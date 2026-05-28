(* This prelude is added at extraction time. See lang/extraction.v. *)
   [@@@ocaml.warning "-9-20-27-32-33-34-37-39-50-67"] (* End of prelude. *)


type positive =
| Coq_xI of positive
| Coq_xO of positive
| Coq_xH

type coq_N =
| N0
| Npos of positive

type coq_Z =
| Z0
| Zpos of positive
| Zneg of positive
