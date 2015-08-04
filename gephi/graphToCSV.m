function graphToCSV( graph, fileName )
% export adjacency matrix of graph to the file
%   Detailed explanation goes here

nameGRAPH = cat(2, fileName, 'GRAPH.csv');
csvwrite(nameGRAPH, graph, 0, 0);

end

