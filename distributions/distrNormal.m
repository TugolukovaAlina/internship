function distribution = distrNormal(x_values, sigma, mu)
%return normal distribution
if length(x_values) == 1
    x_values = 1:x_values;
end

if nargin == 2
    mu = mean(x_values);
end
    
y_values = pdf('Normal', x_values, mu, sigma);
distribution = y_values/sum(y_values);

end

