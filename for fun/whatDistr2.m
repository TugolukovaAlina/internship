close all;

numberOfSamples = 10000;
expr = zeros(1, numberOfSamples);
expr2 = zeros(1, numberOfSamples);
n = 5;
temperature = 1;
properties = 1:n;
for i = 1:numberOfSamples
%     a = rand;
%     b = rand;
%     c = rand;
%     d = rand;

    a = randi(n);
    b = randi(n);
    c = randi(n);
    d = randi(n);
    
   %expr(i) = exp(-((b-a)^2 + (c-a)^2));
   %expr(i) = exp(-((b-a)^2));
   %expr(i) = exp(-(b-a)^2);
   %expr(i) = (b-a)^2;
   % expr2(i) = (b-a)^2 + (c-d)^2;
   
   localEnergy = (properties - b).^2 + (properties - c).^2;
   
   [expr(i), distr] = chooseProperty(localEnergy, temperature );
  % distr
  % expr(i)
end

m1 = mean(expr)
hist(expr, n);
%figure;
%hist(expr2, 100);


% sum = 0;
% for i = 1 : n
%    %sum = sum + (n - i)*exp(-(i^2)); 
%    %sum = sum + (n - i)*(i^2);
%    sum = sum + (n - i)*exp(-i^2);
% end
% m2 = (2*sum + n)/(n^2)