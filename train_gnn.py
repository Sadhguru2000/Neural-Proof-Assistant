import torch
from torch.nn import Linear
from torch_geometric.nn import GCNConv
import pandas as pd
from torch_geometric.data import Data

# Load dataset
data = pd.read_csv("triplet_dataset.csv")

node_features = torch.arange(len(data), dtype=torch.float).view(-1, 1) 
edge_index = torch.tensor([[i, i] for i in range(len(data))], dtype=torch.long).t()
labels = torch.tensor(data["Closeness"].values, dtype=torch.float)


graph_data = Data(x=node_features, edge_index=edge_index, y=labels)

# Define GNN model
class ProofGNN(torch.nn.Module):
    def __init__(self):
        super(ProofGNN, self).__init__()
        self.conv1 = GCNConv(1, 16)
        self.conv2 = GCNConv(16, 1)

    def forward(self, data):
        x, edge_index = data.x, data.edge_index
        x = self.conv1(x, edge_index).relu()
        x = self.conv2(x, edge_index)
        return x

# Train the GNN
model = ProofGNN()
optimizer = torch.optim.Adam(model.parameters(), lr=0.01)
loss_fn = torch.nn.MSELoss()

for epoch in range(50):
    optimizer.zero_grad()
    out = model(graph_data)
    loss = loss_fn(out.view(-1), graph_data.y)
    loss.backward()
    optimizer.step()
    print(f"Epoch {epoch+1}/50, Loss: {loss.item():.4f}")

# Save the model
torch.save(model.state_dict(), "proof_gnn.pth")
print("Model trained and saved.")
