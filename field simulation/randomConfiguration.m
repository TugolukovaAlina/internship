function field = randomConfiguration(fieldSize, properties)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

size = length(properties);

field = zeros(1, fieldSize);
for i = 1:fieldSize
    field(i) = properties(randi(size));
end

end

