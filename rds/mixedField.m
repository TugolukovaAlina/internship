% here I wanted to check that dependency between nrighbors indeed influence
% on rds estimator

[graph, field, points] = randomGraphField([1 2 3 4 5], 15, 'er', 200, 0.05);
P = transMatrRW(graph);

figure;
drawField(points, field, graph);
dependencyPN;

%shuffle field
field = field(randperm(length(field)));

figure;
drawField(points, field, graph);
dependencyPN;