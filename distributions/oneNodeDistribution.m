function distr = oneNodeDistribution(size, node)
% return distribution with 'size' number of states
%   probability to have state 'node' equals to 1
if nargin == 1
    node = randi(size);
end

distr = zeros(1, size);
distr(node) = 1;

end

