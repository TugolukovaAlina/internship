function exportToCSV(graph, field, fileName)
% export field and graph to csv file

nameGRAPH = cat(2, '/user/atuholuk/home/Documents/MATLAB/RW/graphs/graph from files/', fileName, 'GRAPH.csv');
csvwrite(nameGRAPH, graph, 0, 0);

nameFIELD = cat(2, '/user/atuholuk/home/Documents/MATLAB/RW/graphs/graph from files/', fileName, 'FIELD.csv');
csvwrite(nameFIELD, field, 0, 1);


end

