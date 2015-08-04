function maxDistance = variationDistance(P, distr)

distance = zeros(length(P));
for i = 1:length(P)
    for j = 1:length(P)
        distance(i) = distance(i) + abs(P(i, j) - distr(j));
    end
end
maxDistance = max(distance)/2;
end

