% This script draws graphs from different temperatures

% testGibbs

numberOfVertices = 100;
%[graph, points] = chainGraph(numberOfVertices);
%graph = gridOnTorusGraph(numberOfVertices/10, 10);
%radius = 0.13;
%radius = 0.05;
%[graph, points] = randomGeometricGraph(200, 0.13);
%[graph, points] = randomGraph(numberOfVertices, 0.05);
%[graph, points] = graphPA(numberOfVertices, 1);
%graph = graphFacebook;

properties = 1:5;

% maxT = findTemperature(0.97,  graph, properties);
% maxTlog = ceil(log(maxT)/log(2));
% temperature = [0,(2*ones(1, maxTlog + 1)).^(0:maxTlog)];
% 
% figure;
% 
% k = ceil(sqrt(length(temperature)));
% for i = 1:length(temperature)
%     field = createField(graph, properties, temperature(i), 100);
%     
%     subplot(k, k, i);
%     drawField(points, field, graph);
% end


temperature = [0.1, 0.5, 1, 2, 5, 10, 20, 1000];
fields = zeros(length(temperature), length(graph));
for i = 1:length(temperature)
    field = createField(graph, properties, temperature(i), 20);
    
    figure;
    drawField(points, field, graph, properties);
end




