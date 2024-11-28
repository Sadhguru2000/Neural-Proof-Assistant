Theorem theorem_1043 : forall a b c : nat,
  (a + b + c)^2 + (a - b + c)^2 + (a + b - c)^2 + (b + c - a)^2 = 4 * (a^2 + b^2 + c^2).
Proof.
  intros.

  (* Step 1: Expand each square term *)
  rewrite Z9.
  rewrite Z10.
  rewrite Z9.
  rewrite Z10.
  (* LOG: Current Formula: (a^2 + b^2 + c^2 + 2 * (a * b + b * c + c * a)) + (a^2 + b^2 + c^2 - 2 * (a * b - b * c + c * a)) + 
                           ..., Rule Applied: Z9 and Z10 *)

  (* Step 2: Combine terms *)
  rewrite Z4.
  (* LOG: Current Formula: 4 * (a^2 + b^2 + c^2), Rule Applied: Z4 *)

  reflexivity.
Qed.
