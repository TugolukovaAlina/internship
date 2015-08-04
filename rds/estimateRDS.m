function estimate = estimateRDS(degrees, response, samples, func)
% returns estimate of the population mean of func
%   Detailed explanation goes here

if nargin == 4
    estimate = sum(func(samples)./degrees)/sum(1./degrees);
else
    estimate = sum(response./degrees)/sum(1./degrees);
end
    
end

