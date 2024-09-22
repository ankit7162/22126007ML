clear all
clc

n = 3;
roll_no =22126007;
first_row = roll_no * ones(1, n);
rest_of_matrix = randi(100,n-1, n); 

matrix =[first_row;rest_of_matrix];
% Display the resulting matrix
disp('The resulting matrix is:');
disp(matrix);

determinant = det(matrix);
disp('The determinant of the matrix is:');
disp(determinant);