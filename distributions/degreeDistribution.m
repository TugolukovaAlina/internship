function distr = degreeDistribution(graph)
% returns distribution on graph nodes that is proportional to node degree
numberOfNodes = length(graph);
degrees = zeros(1, numberOfNodes);
for i = 1 : numberOfNodes
    degrees(i) = numberOfNeighbors(graph, i);
end
distr = degrees/sum(degrees);

end

