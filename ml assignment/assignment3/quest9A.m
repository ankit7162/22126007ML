R=007;
M=1;
W=18;
n=50;
x=linspace(1,2,50);
y = R * x + randn(1, n) * 5;

p=polyfit(x,y,1);
figure 
plot(x,y,'*')
hold on
y_fit=polyval(p,x);
plot(x,y_fit,"r")
title("Data points and Liner Fit")
xlabel("x");
ylabel("y");