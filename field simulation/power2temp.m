function temperature = power2temp( maxT )
% temperature that is power of 2 while it is less than maxT

maxTlog = ceil(log(maxT)/log(2));
temperature = (2*ones(1, maxTlog + 1)).^(0:maxTlog);

end

