function neighbours = listOfNeighbors(graph, node)
% returns the list of neighbors of node in graph

if iscell(graph)
    neighbours = graph{node};
else
% this works quickly for sparse graphs as well
neighbours = find(graph(:, node));
end

end

