% I want to see how the mean of the all field changes during the simulations
% and also what happens with variance and energy

numberOfVertices = 200;
% % [graph, points] = chainGraph(numberOfVertices);

%radius = 0.13;
%[graph, points] = randomGeometricGraph(numberOfVertices, radius);
[graph, points] = randomGraph(numberOfVertices, 0.1);
%[graph, points] = graphPA(numberOfVertices, 1);

avDegree = averageDegree(graph);
isCon = isConnected(graph);
properties = 1:10;
temperature = findTemperature(1/4, graph, properties)

[field, averages, variances, globEnergies, covariances] = createField(graph, properties, temperature, 20, 1);

%changes of mean, variance, energy

lineX = 1:length(averages);

subplot(4, 1, 1)
plot(lineX, averages)
title('mean')

subplot(4, 1, 2)
%plot(lineX, variances)
plot(lineX, 2*numberOfEdges(graph)*variances)
title('variance')

subplot(4, 1, 3)
plot(lineX, globEnergies)
title('energy')

subplot(4, 1, 4)
plot(lineX, covariances)
title('covariances')

% variance of energy after stable state
var(globEnergies(500:4000))


calculateExpectedEnergy(graph, properties, temperature)