% illustration3, small RGG graph

[graph, points] = randomGeometricGraph(25, 0.35);
field = randomConfiguration(length(graph), 1:6);

% saves all changes of field duirng the simulation
fields = createFieldSaveAllFields(graph, 1:6, 2, 4);

%figure
%drawField(points, field, graph)

% in order to have in gephi all colors I add two points with caules 1 and 6
graph = blkdiag(graph, zeros(2));
fields = cat(2, fields, ones(size(fields, 1), 1), ones(size(fields, 1), 1)*6);

exportToFile(graph, fields, 'smallRGG');