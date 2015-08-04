graph = randomGraph(100, 0.1);
P = transMatrMetropolis(graph);



maxDeg = maxDegree(graph);
numberOfSamples = 100*maxDeg;
[samples, sampleResponse] = takeSamples(0, P, graph, numberOfSamples, @numberOfNeighbors);

if chiSquareTestMC(sampleResponse, maxDeg) == 0
    fprintf('independent degrees of nodes\n');
end