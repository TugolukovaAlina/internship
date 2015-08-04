% here I saw that energy in ER graph is close to 2*numberOfEdges(graph)*var(field)
% actually predicted energy equals also 2*numberOfEdges(graph)*var(field)
% and in ER graph prediction is close

[graph, field] = randomGraphField(1:10, 15, 'er', 200, 0.3);

energy = computeGlobalEnergy(graph, field)
degrees = graphDegrees(graph);
meanField = mean(field);

energy2 = sum(averageDegree(graph)*(field - meanField).^2)


energy3 = 2*numberOfEdges(graph)*var(field)
