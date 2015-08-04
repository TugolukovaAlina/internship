function [result] = MSE( data, realValue )
%UNTITLED36 Summary of this function goes here
%   Detailed explanation goes here

result = zeros(1, size(data, 2));
for i = 1:size(data, 2)
    %result(i) = sum((data(:, i) - mean(data(:, i))).^2);
    result(i) = sum((data(:, i) - realValue).^2);
end

result = result/size(data, 1);

end
