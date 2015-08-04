% graph with the temperature that brings them to half energy
% I want to see if correlation between neighbors is similar (visually)

% conclusion: difficult to see

[graph, field, points] = randomGraphField([1 2 3 4 5], 20.6, 'rgg', 200, 0.13);
figure;
drawField(points, field, graph);


[graph, field, points] = randomGraphField([1 2 3 4 5], 117, 'rgg', 2000, 0.05);
figure;
drawField(points, field, graph);