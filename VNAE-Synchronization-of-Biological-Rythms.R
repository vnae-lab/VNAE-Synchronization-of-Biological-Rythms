# --------------------------------------------------
# VNAE Asymmetric Synchronization of Biological Rhythms
# Abstract Phase Model
# --------------------------------------------------

rm(list = ls())
set.seed(10)

# Number of oscillatory units
N <- 7

# Asymmetric dissipation parameters (theta_i)
theta <- c(0.2, 0.5, 0.9, 0.4, 0.7, 0.3, 0.6)

# Initial phases (abstract rhythms)
phi0 <- runif(N, -pi, pi)

# Time grid
dt <- 0.01
T  <- 12
time <- seq(0, T, by = dt)

# Ring coupling Laplacian
L <- matrix(0, N, N)
for (i in 1:N) {
  L[i, i] <- 2
  L[i, (i %% N) + 1] <- -1
  L[i, ((i - 2 + N) %% N) + 1] <- -1
}

# Storage
Phi <- matrix(0, length(time), N)
Phi[1, ] <- phi0

# Dynamics
for (t in 2:length(time)) {
  phi <- Phi[t - 1, ]
  dphi <- -L %*% phi - theta * phi
  Phi[t, ] <- phi + dt * dphi
}

# Visualization
matplot(time, Phi, type = "l", lwd = 2,
        xlab = "Time",
        ylab = "Phase",
        main = "Asymmetric Rhythm Synchronization under VNAE")
grid()
