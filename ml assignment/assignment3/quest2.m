clear all
clc
% Define the vectors a and b
a = [3 4 5];  
b = [7 8 9]; 
dot_product = dot(a, b);
cross_product = cross(a, b);

% Display the results
disp('Dot Product of a and b:');
disp(dot_product);

disp('Cross Product of a and b:');
disp(cross_product);