function [graph, points] = chainGraph(size)

graph = zeros(size, size);
for i = 1:(size-1)
    graph = addEdge(graph,  i,  i+1);
end
graph = addEdge(graph,  1,  size);

points = zeros(size, 2); 
[points(:, 1), points(:, 2)] = circlePoints(size);

end

