properties = 1:10;

[graph, field, points] = randomGraphField(properties, 10, 'rgg', 200, 0.13);
%[graph, field, points] = randomGraphField(properties, 10, 'rgg', 200, 0.13);
%[graph, field, points] = randomGraphField(1:2, 10, 'rgg', 200, 0.13); field(field == 2) = 0;

%[graph, field] = randomGraphField(properties, 15, 'rgg', 2000, 0.05);
%[graph, field] = randomGraphField(properties, 10, 'er', 100, 0.07);
%[graph, field] = randomGraphField(properties, 50, 'er', 100, 0.1);
%[graph, field] = randomGraphField(1:20, 0.2, 'complete', 100);
% [graph, field, points] = randomGraphField([1 2 3 4 5], 15, 'rgg', 2000, 0.05);
% %[graph, field, points] = randomGraphField([1 2 3 4 5], 15, 'er', 200, 945);
%[graph, field] = randomGraphField(properties, 10, 'er', 1000, 0.02);

P = transMatrRW(graph);

if ~isConnected(graph)
    fprintf('is not connected!!!'); 
end


