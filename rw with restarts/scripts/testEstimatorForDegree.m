graph = randomGraph(100, 0.1);
P = transMatrRW(graph);
%P = transMatrMetropolis(graph);
numberOfSamples = 1;

[samples, sampleResponse] = takeSamples(0, P, graph, numberOfSamples, @numberOfNeighbors);

avDegree = averageDegree(graph);

%samplesDistribution = ones(1, length(sampleResponse))/length(P);


E2 = 2*numEdges(graph);
samplesDistribution = zeros(1, length(sampleResponse));
for i = 1:length(samples)
    samplesDistribution(i) = numberOfNeighbors(graph, samples(i))/E2;
end

estDegree = estimatorHH(samplesDistribution, sampleResponse)/length(P);
