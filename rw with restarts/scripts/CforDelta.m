close all;


a = 0;
b = -2;
c = 1;

min = 0.02;
step = 0.04;
max = 0.98;

X = min:step:max;
Y = zeros (1, round((max-min)/step) + 1);
Z = zeros (1, round((max-min)/step) + 1);

counter = 1;
for delta = min:step:max
    
    a = (2*delta - 1)^2;    
    [Y(counter), Z(counter)] = sq_roots(a, b, c);
    
    counter = counter + 1;
end

plot(X, Y);
figure;
plot(X, Z);