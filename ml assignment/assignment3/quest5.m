clear all
clc

% Input: An array of numbers to sort
arr = input('Enter the array:');%[2 5 6 9 10]

n = length(arr);

for i = 1:n-1
    for j = 1:n-i
        if arr(j) > arr(j+1)
            % Swap the elements
            temp = arr(j);
            arr(j) = arr(j+1);
            arr(j+1) = temp;
        end
    end
end

disp('The sorted array is:');
disp(arr);