Theorem theorem_1042 : forall a b : nat,
  (a + b + 1) * (a^2 + b^2 - a * b - a - b + 1) = a^3 + b^3 - 3 * a * b + 1.
Proof.
  intros.

  (* Step 1: Expand (a + b + 1) *)
  rewrite Z3.
  (* LOG: Current Formula: a * (a^2 + b^2 - a * b - a - b + 1) + b * (a^2 + b^2 - a * b - a - b + 1) + 1 * (a^2 + b^2 - a * b - a - b + 1), Rule Applied: Z3 *)

  (* Step 2: Distribute each term *)
  rewrite Z3.
  (* LOG: Current Formula: a^3 + a * b^2 - a^2 * b - a^2 - a * b + a + b^3 + b^2 - a * b - b + 1, Rule Applied: Z3 *)

  (* Step 3: Combine like terms *)
  rewrite Z4.
  (* LOG: Current Formula: a^3 + b^3 - 3 * a * b + 1, Rule Applied: Z4 *)

  reflexivity.
Qed.
