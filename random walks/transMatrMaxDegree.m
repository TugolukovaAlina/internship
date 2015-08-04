function P = transMatrMaxDegree (graph, dmax)

% by default dmax is max degre of the graph
% I needed dmax different form real maxx degree to look at the consequences
if nargin == 1
    dmax = maxDegree(graph);
end

num = length(graph);
P = graph/dmax;
for i = 1:num
    P (i, i) = 1 - numberOfNeighbors(graph, i)/dmax;
end
