close all;

numberOfSamples = 10000;
expr = zeros(1, numberOfSamples);
expr2 = zeros(1, numberOfSamples);
n = 11;
temperature = 1;
properties = 1:n;
x=1:1:n;
mu = 5.9718;
sigma = 0.706232;

for i = 1:numberOfSamples

%     b = generateRV(distTriangular(n));
%     c = generateRV(distTriangular(n));
    b = generateRV(pdf('Normal',x,mu,sigma));
    c = generateRV(pdf('Normal',x,mu,sigma));

      
   localEnergy = (properties - b).^2 + (properties - c).^2;
   [expr(i), distr] = chooseProperty(localEnergy, temperature );

end

m1 = mean(expr)
hist(expr, n);


pd = fitdist(transpose(expr),'Normal')



