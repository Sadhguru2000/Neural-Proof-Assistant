#!/bin/bash

# Step 1: Run Coq proof and capture logs
echo "Running Coq proof..."
coqc theorems.v > coq_proof_log.txt

# Step 2: Generate dataset
echo "Generating dataset from Coq logs..."
python3 parse_coq_logs_to_dataset.py

# Step 3: Train GNN
echo "Training GNN..."
python3 train_gnn.py

# Step 4: Generate Coq proof dynamically
echo "Generating Coq proof..."
python3 generate_coq_proof.py

# Step 5: Verify generated proof
echo "Verifying Coq proof..."
coqc guided_proof.v

echo "Pipeline complete!"
