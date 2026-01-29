# VNAE-Synchronization-of-Biological-Rythms
## Overview

Abstract model of rhythm synchronization driven by asymmetric dissipation under VNAE.

Rather than pursuing biological realism, the objective is to expose a geometric
mechanism of global convergence driven by asymmetric dissipation.

> We reinterpret synchronization as a manifestation of asymmetric dissipation.

This example does not aim to compete with classical biological oscillator models
(e.g. Kuramoto, Winfree).  Instead, it provides a structural explanation for convergence in heterogeneous systems.

---

## Model

We consider a network of \( N \) abstract oscillatory units, each represented by a
scalar phase variable \( \phi_i(t) \).

The dynamics are given by:

    dφ/dt = − L φ − Θ φ

where:

- φ ∈ ℝⁿ is the vector of phase states  
- L is the graph Laplacian encoding network coupling  
- Θ = diag(θ₁, …, θₙ) is a diagonal matrix of asymmetric dissipation parameters


---

## Interpretation

- The Laplacian term promotes coordination between neighboring units.
- The asymmetric dissipation term introduces **heterogeneous contraction rates**.
- No sinusoidal coupling, frequency tuning, or phase-locking assumptions are required.

In this framework, we can see it is clear and understandable that synchronization emerges as a consequence of global dissipation geometry, not parameter fine-tuning.

---

## Victoria-Nash Asymmetric Equilibrium (VNAE): The Proposed Framework

Within the VNAE framework:

- Asymmetry is not treated as a perturbation or defect.
- Heterogeneity induces an effective **positive curvature** in the system’s state space.
- Global convergence follows structurally, even without symmetric equilibria.

In this sense, synchronization appears as an **operational manifestation of positive
curvature**, rather than a classical phase-locking phenomenon.

---

## Scope and Limitations
It is important to highlight some reflections about this framework:
✔️ Abstract dynamical model  
✔️ Structural and geometric interpretation  
✔️ Conceptual and pedagogical example  

✘ Not a physiological model  
✘ No clinical or biological claims  
✘ No empirical data fitting  

The model is intentionally minimal to isolate the geometric effect of asymmetric
dissipation.

---

## Relevance

The same structural principle applies to:

- abstract neural synchronization
- circadian rhythm coordination
- coupled chemical oscillators
- distributed dynamical systems beyond biology

---

## Implementation

The simulation is implemented in **R**, using:

- explicit Euler integration
- simple ring network topology
- heterogeneous dissipation parameters

The code demonstrates how asymmetric agents converge to a synchronized regime without
symmetry assumptions.

---


# Reference

Pereira, D. H. (2025). Riemannian Manifolds of Asymmetric Equilibria: The Victoria-Nash Geometry.
---

## License

MIT License


