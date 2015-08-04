% this graph just creates graph, field, transition matrix


%[graph, points] = chainGraph(50);

% radius = 0.13;
% [graph, points] = randomGeometricGraph(200, radius);

[graph, points] = randomGraph(200, 0.04);

avDegree = averageDegree(graph);
isCon = isConnected(graph);
properties = [1, 2, 3, 4, 5];
temperature = [5, 10, 20, 30];

figure
k = ceil(sqrt(length(temperature)));
randConf = randomConfiguration(length(graph), properties);
for i = 1:length(temperature)
    subplot(k, k,i)   
    [field, avProp] = createField(graph, properties, temperature(i), randConf);
    drawField(points, field, graph);
    title(sprintf('T = %i',temperature(i)));
end

P = transMatrMetropolis(graph);
initialDistr = zeros(1, length(P));
initialDistr(randi(length(P))) = 1;