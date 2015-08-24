% This script build dependency of global energy after coming to stationary
% state and temperature

% checkCorrelation

% I want to predict energy depending on T


%[graph, points] = chainGraph(numberOfVertices);
%graph = gridOnTorusGraph(numberOfVertices/10, 10);
%radius = 0.13;
%radius = 0.05;
%[graph, points] = randomGeometricGraph(200, 0.13);
%[graph, points] = randomGraph(200, 0.1);
%[graph, points] = graphPA(200, 1);
graphFacebook = graphFromCSV;
graph = graphFacebook;

isCon = isConnected(graph)
properties = 1:10;

maxT = findTemperature(0.9,  graph, properties);
temperature = power2temp(maxT, 2);

% count global energy in experimentations
fprintf('\n\n\nenergy1\n');
 datestr(now)
globEnergy = calculateEmpEnergy(graph, properties, temperature);
 datestr(now)

figure
plot([ 0 temperature], [0 globEnergy], 'b--o', 'LineWidth', 2);
hold on;

% count predicted global energy
%stepT = floor(max(temperature)/50);
stepT = 1;
temperature2 = 0:stepT:max(temperature);

globEnergyPred = calculateExpectedEnergy(graph, properties, temperature2);
globEnergyPred2 = calculateExpectedEnergy2(graph, properties, temperature2);

fprintf('\n energy2 \n');
 datestr(now)
plot(temperature2, globEnergyPred, 'r', 'LineWidth', 2);
 datestr(now)
hold on;
fprintf('\n energy3 \n');
 datestr(now)
plot(temperature2, globEnergyPred2, 'g', 'LineWidth', 2);
 datestr(now)
% hold on;
% plot([0, temperature2(length(temperature2))], [expectedEnergyOfRC(graph, properties), expectedEnergyOfRC(graph, properties)], 'b');
% 


xlabel('temperature', 'FontSize', 20)
ylabel('global energy', 'FontSize', 20)

legend({'experiments', 'first prediction', 'second prediction'}, 'Fontsize', 20);