% illustration2, small ER graph


graph = randomGraph(20, 0.2);
field = randomConfiguration(length(graph), 1:5);

exportToFile(graph, field, 'smallER');