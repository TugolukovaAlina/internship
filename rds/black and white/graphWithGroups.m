%graphWithGroups

% size = 200;
% pa = 0.3;
% muA = 5;
% muB = 8;
% I = 0.6;
% 
% [graph, field] = groupsGraph(size, pa, muA, muB, I);
% exportToFile(graph, field, 'groups1');

[graph, field] = groupsGraph();
exportToFile(graph, field, 'bigGroups');
exportToCSV(graph, field, 'groupsGraph');