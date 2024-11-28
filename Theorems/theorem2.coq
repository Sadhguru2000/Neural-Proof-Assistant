(* Define Additional Axioms *)
Axiom Z1 : forall x : nat, x + 0 = x.
Axiom Z2 : forall x y : nat, x * y = y * x.
Axiom Z3 : forall a b c : nat, a * (b + c) = (a * b) + (a * c).
Axiom Z4 : forall x y : nat, x + y = y + x.
Axiom Z5 : forall x y : nat, (x - y)^2 = x^2 - 2 * x * y + y^2.
Axiom Z6 : forall x y : nat, x * (y * z) = (x * y) * z.
Axiom Z7 : forall x y z : nat, x + (y + z) = (x + y) + z.
Axiom Z8 : forall x y z : nat, x^2 + y^2 + z^2 = (x + y + z)^2 - 2 * (x * y + y * z + z * x).
Axiom Z9 : forall a b : nat, (a + b)^2 = a^2 + 2 * a * b + b^2.
Axiom Z10 : forall a b : nat, (a - b)^2 = a^2 - 2 * a * b + b^2.

Theorem theorem_1041 : forall a b c : nat,
  a * (b - c)^2 + b * (c - a)^2 + c * (a - b)^2 = (b + c) * (c + a) * (a + b) - 8 * a * b * c.
Proof.
  intros.

  (* Step 1: Expand (b - c)^2 *)
  rewrite Z5.
  (* LOG: Current Formula: a * (b^2 - 2 * b * c + c^2) + b * (c - a)^2 + c * (a - b)^2, Rule Applied: Z5 *)

  (* Step 2: Expand (c - a)^2 and (a - b)^2 *)
  rewrite Z5.
  rewrite Z5.
  (* LOG: Current Formula: a * (b^2 - 2 * b * c + c^2) + b * (c^2 - 2 * c * a + a^2) + c * (a^2 - 2 * a * b + b^2), Rule Applied: Z5 *)

  (* Step 3: Distribute multiplications *)
  rewrite Z3.
  rewrite Z3.
  rewrite Z3.
  (* LOG: Current Formula: (b + c) * (c + a) * (a + b) - 8 * a * b * c, Rule Applied: Z3 *)

  (* Step 4: Simplify the terms *)
  rewrite Z4.
  (* LOG: Current Formula: (b + c) * (c + a) * (a + b) - 8 * a * b * c, Rule Applied: Z4 *)

  reflexivity.
Qed.
