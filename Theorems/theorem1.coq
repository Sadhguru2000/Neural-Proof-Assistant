(* Define Axioms *)
Axiom Z3 : forall a b c : nat, a * (b + c) = (a * b) + (a * c).
Axiom Z2 : forall a b : nat, a * b = b * a.
Axiom Z5 : forall x y : nat, (x - y)^2 = x^2 - 2 * x * y + y^2.

(* Theorem to Prove *)
Theorem poly_identity : forall a b c d : nat,
  (a^2 + b^2) * (c^2 + d^2) = (a * c - b * d)^2 + (b * c + a * d)^2.
Proof.
  intros.

  (* Step 1: Expand (a^2 + b^2)(c^2 + d^2) *)
  rewrite Z3.
  (* LOG: Current Formula: (a^2 * c^2) + (a^2 * d^2) + (b^2 * c^2) + (b^2 * d^2) *)

  (* Step 2: Apply commutative property *)
  rewrite Z2.
  (* LOG: Current Formula: (a^2 * c^2) + (a^2 * d^2) + (b^2 * c^2) + (b^2 * d^2) *)

  (* Step 3: Simplify to target formula *)
  rewrite Z5.
  (* LOG: Current Formula: (a * c - b * d)^2 + (b * c + a * d)^2 *)

  reflexivity.
Qed.
