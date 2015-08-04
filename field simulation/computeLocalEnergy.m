function energy = computeLocalEnergy(graph, field, node)
% computes local energy for given node

energy = 0;

% neighbors = find(graph(node, :));
neighbors = listOfNeighbors(graph,node);

for j = 1:length(neighbors)
    energy = energy + (field(node) - field(neighbors(j)))^2;
end

end

