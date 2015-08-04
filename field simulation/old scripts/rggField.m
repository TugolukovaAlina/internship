radius = 0.13;
[graph, points] = randomGeometricGraph(200, radius);

% % graph = randomGraph(10, 1);

avDegree = averageDegree(graph);
isCon = isConnected(graph);
properties = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
temperature = 32;

[field, avProp] = createField(graph, properties, temperature, 10)
drawRGGfield(field, points, radius);

figure;
drawField(points, field, graph);

P = transMatrMetropolis(graph);
initialDistr = zeros(1, length(P));
initialDistr(randi(length(P))) = 1;