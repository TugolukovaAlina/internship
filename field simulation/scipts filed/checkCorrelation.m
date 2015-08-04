% This script build dependency of global energy after coming to stationary
% state and temperature

% checkCorrelation

% I want to predict energy depending on T


numberOfVertices = 100;
%[graph, points] = chainGraph(numberOfVertices);
%graph = gridOnTorusGraph(numberOfVertices/10, 10);
%radius = 0.13;
%radius = 0.05;
%[graph, points] = randomGeometricGraph(numberOfVertices, radius);
[graph, points] = randomGraph(numberOfVertices, 0.1);
%[graph, points] = graphPA(numberOfVertices, 1);
%graph = graphFacebook;

isCon = isConnected(graph)
properties = 1:10;

maxT = findTemperature(0.9,  graph, properties);
temperature = power2temp(maxT);

% count global energy in experimentations
globEnergy = calculateEmpEnergy(graph, properties, temperature);


figure
plot(temperature, globEnergy, 'b--o');
hold on;

% count predicted global energy
stepT = floor(max(temperature)/50);
temperature2 = 0:stepT:max(temperature);

globEnergyPred = calculateExpectedEnergy(graph, properties, temperature2);
globEnergyPred2 = calculateExpectedEnergy2(graph, properties, temperature2);

plot(temperature2, globEnergyPred, 'r');
hold on;
plot(temperature2, globEnergyPred2, 'g');
hold on;
plot([0, temperature2(length(temperature2))], [expectedEnergyOfRC(graph, properties), expectedEnergyOfRC(graph, properties)], 'b');



xlabel('temperature', 'FontSize', 16)
ylabel('global energy', 'FontSize', 16)


