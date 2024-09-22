clear all
clc
% Define the radius R
R = 007;

% Initialize theta from 0 to 2*pi
theta = linspace(0, 2*pi, 100);

% Calculate the x, y, and z coordinates for a circle in the xy-plane (z=0)
x = R * cos(theta);
y = R * sin(theta);
z = zeros(1, length(theta));  
figure;
plot3(x, y, z);
axis equal;
title('Ankit - 3D Circle'); 
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
grid on;

% Show the plot
hold off;
