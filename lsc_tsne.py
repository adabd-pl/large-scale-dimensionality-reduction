import numpy as np
from sklearn.manifold import TSNE
import time
import sys


if len(sys.argv) != 2:
    print("Usage: python lsc_tsne.py <sample_size>")
    sys.exit(1)


try:
    sample_size = int(sys.argv[1])
    if sample_size <= 0:
        raise ValueError
except ValueError:
    print("Error: <sample_size> must be a positive integer.")
    sys.exit(1)

np.random.seed(0)

start_time = time.time()
array = np.load("/net/pr2/projects/plgrid/plgglscclass/geometricus_embeddings/X_concatenated_all_dims.npy")
execution_time = time.time() - start_time
print(f"Data uploading took: {execution_time:.2f} seconds")

start_time = time.time()
indices = np.random.choice(array.shape[0], sample_size, replace=False)
execution_time = time.time() - start_time
print(f"Data random choice for {sample_size} points took: {execution_time:.2f} seconds")

start_time = time.time()
X_sample = array[indices]
execution_time = time.time() - start_time
print(f"Data get from array for {sample_size} points took: {execution_time:.2f} seconds")


print(f"Data shape: {array.shape}")  

execution_times = {}

# Dimensionality Reduction: t-SNE
start_time = time.time()
embedding_tsne = TSNE(n_components=2, perplexity=30, n_iter=1000, random_state=42)
X_tsne = embedding_tsne.fit_transform(X_sample)
execution_times["t-SNE"] = time.time() - start_time

embeddings = [
      ("t-SNE", X_tsne),
]

print(f"Execution Times for Dimensionality Reduction for {sample_size}:")
for method, duration in execution_times.items():
    print(f"{method}: {duration:.2f} seconds")