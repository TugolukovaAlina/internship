function estimator = estimatorHH(p, y)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

n = length(p);
estimator = 1/n * sum( y ./ p );

end

