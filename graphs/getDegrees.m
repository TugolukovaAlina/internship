function degrees = getDegrees(graph)
% returns degrees of alll nodes
numberOfNodes = length(graph);
degrees = zeros(1, numberOfNodes);
for i = 1 : numberOfNodes
    degrees(i) = numberOfNeighbors(graph, i);
end

end

