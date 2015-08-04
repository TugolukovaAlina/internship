% script builds expected energy depending on temperature
% plotExpectedEnergy

%numberOfVertices = 200;
%[graph, points] = chainGraph(numberOfVertices);
%graph = gridOnTorusGraph(numberOfVertices/10, 10);
%radius = 0.13;
%radius = 0.05;
%[graph, points] = randomGeometricGraph(numberOfVertices, radius);
%[graph, points] = randomGraph(numberOfVertices, 0.1);
%[graph, points] = graphPA(numberOfVertices, 1);
%graph = graphFacebook;

[graph, points] = completeGraph(100);

isCon = isConnected(graph);
properties = 1:20;
%properties = [1, 2, 3, 4, 5]
maxT = findTemperature(0.95,  graph, properties);
stepT = floor(maxT/50);
temperature = 1:stepT:maxT;

expectedEnergyOfRandomField = numberOfEdges(graph)*(length(properties) + 1)*(length(properties) - 1)/6
globEnergyPred = zeros(1, length(temperature));
globEnergyPred2 = zeros(1, length(temperature));

for i = 1:length(temperature)
    globEnergyPred(i) = calculateExpectedEnergy(graph, properties, temperature(i));
    globEnergyPred2(i) = calculateExpectedEnergy2(graph, properties, temperature(i));
end

figure
plot(temperature, globEnergyPred, 'r');

hold on;
plot([0, temperature(length(temperature))], [expectedEnergyOfRandomField, expectedEnergyOfRandomField], 'b');

hold on;
plot(temperature, globEnergyPred2, 'g');
% hold on;
% plot([0 max(temperature)], [0 numberOfEdges(graph)*max(temperature)/averageDegree(graph)], 'm');

xlabel('temperature', 'FontSize', 16)
ylabel('global energy', 'FontSize', 16)


