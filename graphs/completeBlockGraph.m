function graph = completeBlockGraph(blocks, additEdges)
% builds complete graphs and adds some edges between them
%   Detailed explanation goes here

% create block matrix
graph = [];
for i = 1:length(blocks)
    graph = blkdiag(graph, ones(blocks(i))); 
end
graph = graph - eye(length(graph));
% add some random connections

n = length(graph);
% additEdges = f*n*(n-1)/2;

i = 0;
while i < additEdges
   v1 = randi(n);
   v2 = randi(n);
   
   if graph(v1, v2) == 0
       graph(v1, v2) = 1;
       graph(v2, v1) = 1;
       i = i + 1;
   end
end


end

