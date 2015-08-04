graph = randomGraph(200, 0.2);

avDegree = averageDegree(graph);
isCon = isConnected(graph);
properties = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
temperature = 32;

[field, avProp] = createField(graph, properties, temperature);

P = transMatrMetropolis(graph);
initialDistr = zeros(1, length(P));
initialDistr(randi(length(P))) = 1;

