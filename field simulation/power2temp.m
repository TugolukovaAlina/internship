function temperature = power2temp( maxT, base )
% temperature that is power of 2 while it is less than maxT

if nargin == 1
    base = 2;
end

maxTlog = ceil(log(maxT)/log(base));
temperature = (base*ones(1, maxTlog + 1)).^(0:maxTlog);


end

