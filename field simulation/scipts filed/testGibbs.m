% This script draws graphs from different temperatures

% testGibbs

numberOfVertices = 100;
%[graph, points] = chainGraph(numberOfVertices);
%graph = gridOnTorusGraph(numberOfVertices/10, 10);
%radius = 0.13;
%radius = 0.05;
%[graph, points] = randomGeometricGraph(numberOfVertices, radius);
[graph, points] = randomGraph(numberOfVertices, 0.05);
%[graph, points] = graphPA(numberOfVertices, 1);
%graph = graphFacebook;

properties = 1:10;

maxT = findTemperature(0.97,  graph, properties);
maxTlog = ceil(log(maxT)/log(2));
temperature = [0,(2*ones(1, maxTlog + 1)).^(0:maxTlog)];

figure;

k = ceil(sqrt(length(temperature)));
for i = 1:length(temperature)
    field = createField(graph, properties, temperature(i), 100);
    
    subplot(k, k, i);
    drawField(points, field, graph);
end




