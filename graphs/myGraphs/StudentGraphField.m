%StudentGraphField


graph = graphFromCSV('/user/atuholuk/home/Documents/materials/data/student health/EDGES.csv');
fields = csvread('/user/atuholuk/home/Documents/materials/data/student health/NODES2.csv');

% 1 node, 2 sex, 3 race, 4 grade, 5 school
fields = fields';
fields = fields(2:5, :); 
% we will rake only connected component
[graph, con_nodes] = giantComponent(graph);
fields = fields(:, con_nodes);

% % 1 node, 2 sex, 3 race, 4 grade, 5 school
% field = fields(:, 4)';
% 
% % we will rake only connected component
% [graph, con_nodes] = giantComponent(graph);
% field = field(con_nodes);