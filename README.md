# **Neural Proof Assistant**

A project that integrates **Coq Theorem Prover** and **Graph Neural Networks (GNNs)** to optimize theorem proving by dynamically selecting the most efficient proof steps. This pipeline automates dataset generation, GNN training, and proof verification.

---

## **Pipeline Overview**

The pipeline consists of the following stages:

1. **Theorem Definition**:

   - Theorems and axioms are defined in Coq files located in the `Theorems` directory (e.g., `theorem1.coq`, `theorem2.coq`, etc.).

2. **Proof Execution**:

   - Each theorem is executed using Coq, generating intermediate proof steps.
   - Logs capture the current formula, the applied axiom, and the transformation.

3. **Dataset Generation**:

   - The logs are parsed to create a **triplet dataset** (`Current Formula`, `Target Formula`, `Closeness`) in CSV format for GNN training.

4. **GNN Training**:

   - The GNN model is trained to predict the most efficient proof steps based on the closeness relation between formulas.

5. **Dynamic Proof Generation**:

   - A trained GNN suggests the optimal steps for new proofs.
   - These steps are used to generate Coq proofs dynamically.

6. **Pipeline Automation**:
   - The `run_pipeline.sh` script automates the entire process, from proof execution to GNN training and proof verification.

---

## **Theorems Used**

The following theorems are included in this project:

1. **Theorem 1**: Polynomial identity  
   (a² + b²) * (c² + d²) = (a * c - b * d)² + (b * c + a * d)²

2. **Theorem 2**: Expansion of terms  
   a(b - c)² + b(c - a)² + c(a - b)² = (b + c)(c + a)(a + b) - 8abc

3. **Theorem 3**: Sum and product relation  
   (a + b + 1)(a² + b² - ab - a - b + 1) = a³ + b³ - 3ab + 1

4. **Theorem 4**: Quadratic expansions  
   (a + b + c)² + (a - b + c)² + (a + b - c)² + (b + c - a)² = 4(a² + b² + c²)


---

## **Repository Structure**

```plaintext
/NEURAL-PROOF-ASSISTANT
  ├── Theorems/                     # Coq files for each theorem
  │   ├── theorem1.coq
  │   ├── theorem2.coq
  │   ├── theorem3.coq
  │   ├── theorem4.coq
  ├── dataset_generate.py           # Script to parse Coq logs into dataset
  ├── generate_proof.py             # Generates dynamic Coq proofs
  ├── train_gnn.py                  # GNN training and evaluation script
  ├── run_pipeline.sh               # Automates the entire pipeline
  ├── README.md                     # Documentation file
```
