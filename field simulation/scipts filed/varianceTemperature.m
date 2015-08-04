% dependency energy, variance from temperature



numberOfVertices = 200;
%[graph, points] = chainGraph(numberOfVertices);
%graph = gridOnTorusGraph(numberOfVertices/10, 10);
radius = 0.13;
%radius = 0.05;
[graph, points] = randomGeometricGraph(numberOfVertices, radius);
%[graph, points] = randomGraph(numberOfVertices, 0.1);

avDegree = averageDegree(graph);
isCon = isConnected(graph);
properties = 1:5;
temperature = [0, 1, 2, 5, 10, 20, 50, 75, 100, 150, 200, 400, 600];

randConf = randomConfiguration(length(graph), properties);
energyOfRandomField = computeGlobalEnergy(graph, randConf)
expectedEnergyOfRandomField = numberOfEdges(graph)*(length(properties) + 1)*(length(properties) - 1)/6

globEnergy = zeros(1, length(temperature));
variance = zeros(1, length(temperature));

numberOfExperiments = 10;
for i = 1:length(temperature)
    for j = 1:numberOfExperiments
        [field, avProp] = createField(graph, properties, temperature(i), 20, 0, randConf);
        globEnergy(i) = globEnergy(i) + computeGlobalEnergy(graph, field);
        variance(i) = variance(i) + var(field);
    end
    
    fprintf('done here\n');
end

globEnergy = globEnergy/numberOfExperiments;
variance = variance/numberOfExperiments;


figure
subplot(1, 2, 1);
plot(temperature, globEnergy, 'b--o');

xlabel('temperature', 'FontSize', 16)
ylabel('global energy', 'FontSize', 16)

subplot(1, 2, 2);
plot(temperature, variance, 'b--o');

xlabel('temperature', 'FontSize', 16)
ylabel('variance', 'FontSize', 16)





