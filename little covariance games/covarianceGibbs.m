% This script build dependency of global energy after coming to stationary
% state and temperature

% covarianceGibbs

% I want to predict energy depending on T

numberOfVertices = 200;
%[graph, points] = chainGraph(numberOfVertices);
%graph = gridOnTorusGraph(numberOfVertices/10, 10);
radius = 0.13;
%radius = 0.05;
[graph, points] = randomGeometricGraph(numberOfVertices, radius);
%[graph, points] = randomGraph(numberOfVertices, 0.08);
%[graph, points] = graphPA(numberOfVertices, 1);
%graph = graphFacebook;

isCon = isConnected(graph)
properties = 1:10;

maxT = findTemperature(0.97,  graph, properties);
temperature = power2temp(maxT);

% count global energy in experimentations
globEnergy = zeros(1, length(temperature));
byVar = zeros(1, length(temperature));
byCovar = zeros(1, length(temperature));
covMod = zeros(1, length(temperature));
covNorm = zeros(1, length(temperature));
covNormAbs = zeros(1, length(temperature));

numberOfExperiments = 100;

field = zeros(numberOfExperiments, length(graph));
fieldCell = cell(1, length(temperature));
    
for i = 1:length(temperature)
    for j = 1:numberOfExperiments
        field(j, :) = createField(graph, properties, temperature(i), 20);
        globEnergy(i) = globEnergy(i) + computeGlobalEnergy(graph, field(j, :));
    end
    
    [byVar(i), byCovar(i), covMod(i), covNorm(i), covNormAbs(i)] = countRealVariance(graph, field);
    fieldCell{i} = field;
    
    fprintf('done here\n');
end

globEnergy = globEnergy/numberOfExperiments;

figure
plot(temperature, globEnergy, 'b--o');
hold on;

plot(temperature, byVar, 'c--o');
hold on;

plot(temperature, byCovar, 'm--o');
hold on;
% 
% plot(temperature, covMod, 'k', 'LineWidth', 3);
% hold on;


% count predicted global energy
stepT = floor(max(temperature)/50);
temperature2 = 0:stepT:max(temperature);

globEnergyPred = calculateExpectedEnergy(graph, properties, temperature2);
globEnergyPred2 = calculateExpectedEnergy2(graph, properties, temperature2);

%figure
plot(temperature2, globEnergyPred, 'r');

hold on;
plot(temperature2, globEnergyPred2, 'g');

hold on;
plot([0, temperature(length(temperature))], [expectedEnergyOfRC(graph, properties), expectedEnergyOfRC(graph, properties)], 'b');

xlabel('temperature', 'FontSize', 16)
ylabel('global energy', 'FontSize', 16)

legend('experim', 'by variance', 'by covariance', 'predicted1', 'predicted2')


figure;
plot(temperature, covNorm);
hold on;
plot(temperature, covNormAbs);


%LOF - a lot of fields
graphLOF = graph;
fieldLOF = fieldCell{5};

% script
%covDistTemp
