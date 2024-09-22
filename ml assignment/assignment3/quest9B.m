R = 007; 
M = 1;  
W = 18;
n=50;
x=linspace(1,2,50);
y = R * x + randn(1, n) * 5;
figure;
plot(x, y, '*', 'DisplayName', 'Data Points');
hold on;
p = polyfit(x, y, 2); 
y_fit = polyval(p, x);

plot(x, y_fit, 'g', 'DisplayName', 'Fitted Line');
xlabel('x'); 
ylabel('y'); 
title('Fitting of Polynomial Curve');
legend('show');