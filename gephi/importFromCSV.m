function [graph, field] = importFromCSV(fileName, flag)
% export field and graph to csv file

graph = null;
field = null;

nameGRAPH = cat(2, '/user/atuholuk/home/Documents/MATLAB/RW/graphs/graph from files/', fileName, 'GRAPH.csv');
nameFIELD = cat(2, '/user/atuholuk/home/Documents/MATLAB/RW/graphs/graph from files/', fileName, 'FIELD.csv');

if isequal(flag, 'graph') || nargin == 1
    graph = csvread(nameGRAPH);
end

if isequal(flag, 'field') || nargin == 1
    field = csvread(nameFIELD);
end

end

