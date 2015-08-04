function graphCell = graphToCells(graph)
%transform sparse graph to the form vertex - all neighbors
%   Detailed explanation goes here

size = length(graph);
% if the graph is sparse
graphCell = cell(1,size);

for i = 1:size
    graphCell{i} = find(full(graph(:,i)));
end

