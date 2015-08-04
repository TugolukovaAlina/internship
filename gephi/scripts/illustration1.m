% illustration1, block graph
% not very nice 

a = 5; b = 5; c = 5;
graph = completeBlockGraph([a, b, c], 4);
initialField = cat(2, ones(1, a)*1, ones(1, b)*3, ones(1, c)*6); 
field = createField(graph, 1:6, 5, 1, initialField);

exportToFile(graph, field, 'completeBlocks');