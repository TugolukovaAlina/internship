% this script checks the distribution of (a-b)^2


close all;

numberOfSamples = 10000;
expr = zeros(1, numberOfSamples);
expr2 = zeros(1, numberOfSamples);
for i = 1:numberOfSamples

    a = randi(10);
    b = randi(10);
    c = randi(10);
    d = randi(10);
    
   expr(i) = (b-a)^2;
end

m1 = mean(expr)
m2 = (10-1)*(10+1)/6
hist(expr, 100);
