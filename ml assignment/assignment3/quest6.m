clear all
clc
% Define the radius R
R = 007;

% Initialize theta from 0 to 2*pi
theta = linspace(0, 2*pi, 100);

% Calculate the x and y coordinates
x = R * cos(theta);
y = R * sin(theta);

% Plot the circle
figure;
plot(x, y);
axis equal;
title('Ankit-2D Circle');
xlabel('X-axis');
ylabel('Y-axis');
grid on;

% Show the plot
hold off;