function degrees = graphDegrees(graph)
% returns degrees of all vertices
%   Detailed explanation goes here

degrees = zeros(1, length(graph));
for i = 1:length(graph)
    degrees(i) = numberOfNeighbors(graph, i);
end

end

