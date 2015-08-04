function points = randomPoints(size)
% generates random ccordinates to 'size' points
%   in [0, 1] x [0, 1]
points = zeros (size, 2);

for i = 1:size
    points (i, 1) = rand;
    points (i, 2) = rand;
end

end

