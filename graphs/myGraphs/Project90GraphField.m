%Project90GraphField

graph = graphFromCSV('/user/atuholuk/home/Documents/materials/data/project90/EDGES.csv');
fields = csvread('/user/atuholuk/home/Documents/materials/data/project90/NODES.csv');

% name 1, race 2, gender 3, sexWorker 4, pimp 5, sexWorkClient 6, drugDealer 7, drugCook 8, thief 9, retired 10, housewife 11, disabled 12, unemployed 13, homeless 14 
fields = fields';
fields = fields(2:14, :); 
% we will rake only connected component
[graph, con_nodes] = giantComponent(graph);
fields = fields(:, con_nodes);
fields(fields == -1) = 0;




% field = fields(:, 2)';
% field = field(con_nodes);
% field(field == -1) = 0;
% field = fields(:, 3)';
%exportToFile(graph, fields', 'pr90withouna')
% B = 6000;
% C1 = 1;
% C2 = 9;