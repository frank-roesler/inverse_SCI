% -------------------------------------------------------------------------
% MATLAB script that reconstructs the potential of a Sturm-Liouville problem 
% from N eigenvalues and norming constants given in a data file. The
% example data files contain:
% - Spectrum_forward: a vector that contains the given eigenvalues,
% - norm_constants: a vector that contains the given norming constants,
% - xplot, V: the values V of the original potential on a grid xplot for
%   comparison with the reconstruction.
% -------------------------------------------------------------------------
clear
clc
load('data_discontinuous.mat')

% Set up the data for reconstruction:
N = length(Spectrum_forward);
omega = Spectrum_forward(end) - (N-1)^2;
lambda = sqrt(Spectrum_forward - omega);
alpha  = norm_constants;

% Compute the integral u of potential on grid x:
nx = 1e+4;
h = pi/(nx-1);
u = zeros(1,nx);
x = linspace(0,pi,nx);
for i=1:nx
    u(i) = compute_u(x(i),lambda,alpha);
end

% Compute potential, which is given by 2*dudx + omega:
dudx = gradient(u,h);
dudx_spline = griddedInterpolant(x, dudx);
q_reconst =@(t) 2*dudx_spline(t) + omega; 

% Plot reconstructed potential:
figure('Position',[200 200 800 600])
plot(xplot, V, 'LineWidth',1)
hold on
plot(x, q_reconst(x), 'LineWidth',1)
hold off
xlim([0,pi])
ylim([min([V,q_reconst(x)]), max([V,q_reconst(x)])])
legend('Actual potential', 'Reconstruction','Location','northwest')
drawnow

% Effective Robin boundary conditions for finitely many EVs:
robin_left = u(1)
robin_right = -u(end)




