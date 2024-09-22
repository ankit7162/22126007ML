
data = load('hw1_data1.txt'); 


sales = data(:, 1);
revenue = data(:, 2);


slope = 0.0528;
intercept = 3.35;

ypred = slope * sales + intercept;

%  Calculate RSS, TSS, and R²

% Residual Sum of Squares (RSS)
rss = sum((revenue - ypred).^2);

% Total Sum of Squares (TSS)
mean_revenue = mean(revenue);
tss = sum((revenue - mean_revenue).^2);

% R² Value
r2 = 1 - (rss / tss);

% Display the results
fprintf('Residual Sum of Squares (RSS): %.2f\n', rss);
fprintf('Total Sum of Squares (TSS): %.2f\n', tss);
fprintf('R² Value: %.2f\n', r2);
