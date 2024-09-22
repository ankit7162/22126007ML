function result = findUniqueElements(arr)
    % Find unique elements in the array
    unique_elements = unique(arr);
    
    % Initialize the result matrix
    result = zeros(length(unique_elements), 2);
    
    % Iterate over the unique elements to count occurrences
    for i = 1:length(unique_elements)
        element = unique_elements(i);
        count = sum(arr == element);
        result(i, 1) = element;
        result(i, 2) = count;
    end
end
