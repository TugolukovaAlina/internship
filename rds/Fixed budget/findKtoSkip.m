function [ minK, k, varExpr ] = findKtoSkip(B, C1, C2, rho, maxToSkip, sigma)
% having fixed budget find what k to skip
%   B : budget
%   C1: price for step
%   C2: prive for interview

if nargin == 5
   sigma = 1; 
end

k = 1:maxToSkip;

varExpr = ((k*C1 + C2)/B).*((1 + rho.^(k))./(1 - rho.^(k)))*sigma;

% min function
[~, index] = min(varExpr);
k = 0:(maxToSkip-1);
minK = k(index(1));


end

