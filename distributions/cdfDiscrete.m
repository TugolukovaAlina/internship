function y = cdfDiscrete( x )
%UNTITLED21 Summary of this function goes here
%   Detailed explanation goes here
y = zeros(1, length(x));
y(1) = x(1);
for i = 2 : length(x)
   y(i) = y(i-1) + x(i); 
end

end

