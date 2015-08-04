% BWbigGraph

B = 10000;
C1 = 1;
C2 = 4;

[graph, field] = importFromCSV('groupsGraph');

% we will rake only connected component
[graph, con_nodes] = giantComponent(graph);
field = field(con_nodes);