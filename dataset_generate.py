import re
import csv

# Input Coq log file
log_file = "coq_proof_log.txt"
output_file = "triplet_dataset.csv"

# Regex pattern to extract proof logs
log_pattern = r"LOG: Current Formula: (.+)$"

# Parse the Coq log
proof_steps = []
with open(log_file, "r") as log:
    for line in log:
        match = re.search(log_pattern, line)
        if match:
            current_formula = match.group(1).strip()
            proof_steps.append(current_formula)

# Build dataset with Target Formula and Closeness
target_formula = proof_steps[-1]  # Last formula is the target
triplet_data = []
for i, current_formula in enumerate(proof_steps):
    closeness = len(proof_steps) - i  # Steps remaining to target
    triplet_data.append({
        "Current Formula": current_formula,
        "Target Formula": target_formula,
        "Closeness": closeness
    })

# Write triplet dataset to a CSV file
with open(output_file, "w", newline="") as csvfile:
    writer = csv.DictWriter(csvfile, fieldnames=["Current Formula", "Target Formula", "Closeness"])
    writer.writeheader()
    writer.writerows(triplet_data)

print(f"Triplet dataset written to {output_file}")
