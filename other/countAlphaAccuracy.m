function [exp1, exp2] = countAlphaAccuracy(graph,alpha)

d = averageDegree(graph);
exp1 = alpha/(alpha + d);

numberOfVertices = length(graph);
exp2 = 0;
for i = 1:numberOfVertices
    exp2 = exp2 + (alpha/(numberOfNeighbors(graph, i) + alpha))/numberOfVertices;
end

end

