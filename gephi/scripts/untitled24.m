% illustration3, small RGG graph


[graph, points] = randomGeometricGraph(20, 0.2);
field = randomConfiguration(length(graph), 1:5);

drawField(points, field, graph)

exportToFile(graph, field, 'smallRGG');