function [a, b] = myFactor(n)
%n = a*b
%   Detailed explanation goes here

arr = factor(n);

a = prod(arr(1:floor(length(arr)/2)));
b = prod(arr(floor(length(arr)/2 +1):length(arr)));

end

