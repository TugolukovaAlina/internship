function [ H, p_value, chi,  chiCritical] = chiUniGOF(samples, size, alpha)
% size - number of states
%   Detailed explanation goes here

if nargin == 2
    alpha = 0.05;
end

o = hist(samples, size);
e = length(samples)* ones(1, size)/size;

chi = sum((o - e).^2 ./ e);


p_value = 1 - chi2cdf(chi, size - 1);

chiCritical = chi2inv(1 - alpha, size - 1);
if chiCritical > chi
    H = 0;
else
    H = 1;
end

end

