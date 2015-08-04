close all;

% energy before after simulation, for one temperature

[graph, points] = chainGraph(50);

avDegree = averageDegree(graph);
isCon = isConnected(graph);
properties = [1, 2, 3, 4, 5];


figure


randConf = randomConfiguration(length(graph), properties);
%randConf = randomConfiguration(length(graph), properties(1:2));

subplot(2,1,1)
drawField(points, randConf, graph);
var(randConf)
ge1 = computeGlobalEnergy(graph, randConf)


subplot(2,1,2)
temperature = 3;
[field, avProp] = createField(graph, properties, temperature, 20, randConf);
drawField(points, field, graph);
var(field)
ge2 = computeGlobalEnergy(graph, field)


