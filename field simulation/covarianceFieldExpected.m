function covariance = covarianceFieldExpected(graph, properties, temperature)
% it is shit and it does not work
%   Detailed explanation goes here

arr = zeros(length(properties), length(properties));

for i = 1:length(properties)
    for j = 1:length(properties)
       arr(i, j) = exp(-averageDegree(graph)*((i - mean(properties))^2 + (j - mean(properties))^2 )/temperature); 
    end
   % arr(i, :) = normalize(arr(i, :));
end
arr = arr/sum(sum(arr));

a = 0;
for i = 1:length(properties)
    for j = 1:length(properties)
       a = a + arr(i,j)*i*j; 
    end
end

covariance = a - mean(properties)^2;

end

