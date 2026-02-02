import numpy as np
import matplotlib.pyplot as plt

# --------------------------------------------------
# VNAE Asymmetric Synchronization of Biological Rhythms
# Abstract Phase Model 
# --------------------------------------------------

# Number of oscillatory units (e.g., cardiac cells or neurons)
N = 7

# Asymmetric dissipation parameters (theta_i)
# This represents the unique "structural friction" of each biological unit
theta = np.array([0.2, 0.5, 0.9, 0.4, 0.7, 0.3, 0.6])

# Initial phases (abstract rhythms) between -pi and pi
np.random.seed(10)
phi0 = np.random.uniform(-np.pi, np.pi, N)

# Time grid
dt = 0.01
T_max = 12
time_seq = np.arange(0, T_max + dt, dt)
n_steps = len(time_seq)

# Ring coupling Laplacian (Connectivity Matrix)
L = np.zeros((N, N))
for i in range(N):
    L[i, i] = 2
    # Next neighbor (ring topology)
    next_node = (i + 1) % N
    # Previous neighbor
    prev_node = (i - 1 + N) % N
    
    L[i, next_node] = -1
    L[i, prev_node] = -1

# Storage Matrix (n_steps x N)
Phi = np.zeros((n_steps, N))
Phi[0, :] = phi0

# Dynamics Simulation (VNAE Phase Flow)
for t in range(1, n_steps):
    phi_prev = Phi[t-1, :]
    
    # Differential equation: dphi = -L*phi - theta*phi
    # L.dot(phi) is matrix multiplication; (theta * phi) is element-wise
    dphi = -L.dot(phi_prev) - (theta * phi_prev)
    
    # Euler integration step
    Phi[t, :] = phi_prev + dt * dphi

# Visualization
plt.figure(figsize=(10, 6))
for i in range(N):
    plt.plot(time_seq, Phi[:, i], label=f'Unit {i+1}', linewidth=2)

plt.title("Asymmetric Rhythm Synchronization under VNAE")
plt.xlabel("Time (s)")
plt.ylabel("Phase (rad)")
plt.legend(loc='lower right')
plt.grid(True, linestyle='--', alpha=0.7)
plt.show()
