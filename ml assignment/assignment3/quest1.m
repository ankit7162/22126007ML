clear all
clc


% Coefficients of the cubic equation Rx^3 + (R*M)x^2 + Wx + 25 = 0

% Define the values of R, M, and W
R = 007; % Example value for R
M = 1; % Example value for M
W = 18; % Example value for W

coefficients = [R, R*M, W, 25];
roots_of_equation = roots(coefficients);
% Display the roots
disp(roots_of_equation);