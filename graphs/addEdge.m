function graph = addEdge(graph, v1, v2)

graph(v1, v2) = 1;
graph(v2, v1) = 1;

end

