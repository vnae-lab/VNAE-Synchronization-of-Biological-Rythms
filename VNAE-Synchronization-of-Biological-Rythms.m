% --------------------------------------------------
% VNAE Asymmetric Synchronization of Biological Rhythms
% Abstract Phase Model 
% --------------------------------------------------
clear; clc;

% Number of oscillatory units (e.g., neurons or pacemaker cells)
N = 7;

% Asymmetric dissipation parameters (theta_i)
% This defines the "Geometric Curvature" of each biological oscillator
theta = [0.2, 0.5, 0.9, 0.4, 0.7, 0.3, 0.6];

% Initial phases (abstract rhythms) between -pi and pi
rng(10); % Seed for reproducibility
phi0 = (rand(N, 1) * 2 * pi) - pi;

% Time grid
dt = 0.01;
T_max = 12;
time_seq = 0:dt:T_max;
n_steps = length(time_seq);

% Ring coupling Laplacian (Connectivity Matrix)
L = zeros(N, N);
for i = 1:N
    L(i, i) = 2;
    % Next neighbor (ring topology)
    next_node = mod(i, N) + 1;
    % Previous neighbor
    prev_node = mod(i - 2 + N, N) + 1;
    
    L(i, next_node) = -1;
    L(i, prev_node) = -1;
end

% Storage Matrix (N units x n_steps)
Phi = zeros(N, n_steps);
Phi(:, 1) = phi0;

% Dynamics Simulation (VNAE Phase Flow)
for t = 2:n_steps
    phi_prev = Phi(:, t-1);
    
    % Differential equation: dphi = -L*phi - theta*phi
    % The '.*' ensures each unit's theta is applied to its own phase
    dphi = -L * phi_prev - (theta' .* phi_prev);
    
    % Euler integration step
    Phi(:, t) = phi_prev + dt * dphi;
end

% Visualization
figure('Color', 'w');
plot(time_seq, Phi, 'LineWidth', 2);
title('Asymmetric Rhythm Synchronization under VNAE');
xlabel('Time (s)');
ylabel('Phase (rad)');
grid on;
legend('Unit 1','Unit 2','Unit 3','Unit 4','Unit 5','Unit 6','Unit 7', ...
       'Location', 'eastoutside');
