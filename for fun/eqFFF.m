%eqFFF

% check solution of equation

C1 = 1;
C2 = 4;
r = 0.7;

x = 0:0.5:30;
fx = C1*x.*(1 + r.^x)./(1 - r.^x) + C2*(1 + r.^x)./(1 - r.^x);

[minValue, index] = min(fx);
minX = x(index)
minValue

figure;
plot(x, fx)

C1*(1 - r^(2*minX)) + 2*C1*minX*r^minX*log(r) + 2*C2*r^minX*log(r)