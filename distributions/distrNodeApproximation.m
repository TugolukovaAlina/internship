function distrValueNode = distrNodeApproximation(d, t, properties)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
distrValueNode = normalize(exp(-d*(properties - mean(properties)).^2/t));

end

