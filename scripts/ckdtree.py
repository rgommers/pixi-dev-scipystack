import numpy as np
from scipy.spatial import cKDTree

# Make a million random 3D points
points = np.random.rand(1_000_000, 3)

# Build a super-fast spatial search structure
tree = cKDTree(points)

# Pick a random target point
target = np.array([0.1, 0.5, 0.9])

# Find the nearest neighbor
dist, idx = tree.query(target)
print(f"Closest point to {target} is {points[idx]} at distance {dist}")
