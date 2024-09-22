clear all
clc

n = input('Enter the size of the matrix:');
roll_no = 22126007;
first_row = roll_no * ones(1,n);
rest_of_matrix =randi(100,n-1, n); 

% Combine the first row and the rest of the matrix
matrix =[first_row;rest_of_matrix];

% Display the resulting matrix
disp('The resulting matrix is:');
disp(matrix);
