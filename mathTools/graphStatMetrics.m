function [ meanGraph, variance, covariance ] = graphStatMetrics( graph, field )
%GRAPHSTATMETRICS count mean, variance and covariance on the graph

meanGraph = mean(field);
variance = var(field);

covariance = 0;
for v1 = 1:length(graph)
    neighbors = listOfNeighbors(graph, v1);
    for v2 = 1:length(neighbors)
        covariance = covariance + (field(v2) - meanField)*(field(v1) - meanField);
    end
end

end

