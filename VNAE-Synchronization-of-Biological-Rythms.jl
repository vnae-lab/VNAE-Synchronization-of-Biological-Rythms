using Plots
using LinearAlgebra

# --------------------------------------------------
# VNAE Asymmetric Synchronization of Biological Rhythms
# Abstract Phase Model
# --------------------------------------------------

# Number of oscillatory units
N = 7

# Asymmetric dissipation parameters (theta_i) - The VNAE Structural Rigidity
theta = [0.2, 0.5, 0.9, 0.4, 0.7, 0.3, 0.6]

# Initial phases (abstract rhythms) between -pi and pi
phi0 = (rand(N) .* 2 .* pi) .- pi

# Time grid
dt = 0.01
T_max = 12.0
time_seq = 0:dt:T_max
n_steps = length(time_seq)

# Ring coupling Laplacian (Connectivity Matrix)
L = zeros(N, N)
for i in 1:N
    L[i, i] = 2
    next_node = (i % N) + 1
    prev_node = ((i - 2 + N) % N) + 1
    
    L[i, next_node] = -1
    L[i, prev_node] = -1
end

# Storage Matrix (n_steps x N)
Phi = zeros(n_steps, N)
Phi[1, :] = phi0

# Dynamics Simulation (VNAE Phase Flow)
for t in 2:n_steps
    phi = Phi[t-1, :]
    
    # Differential equation: dphi = -L*phi - theta*phi
    # The term (theta .* phi) applies the unique asymmetry of each rhythm
    dphi = -L * phi - (theta .* phi)
    
    # Euler integration step
    Phi[t, :] = phi + dt * dphi
end

# Visualization
plot(time_seq, Phi, 
     lw=2, 
     title="Asymmetric Rhythm Synchronization under VNAE",
     xlabel="Time", 
     ylabel="Phase",
     legend=:bottomright)
