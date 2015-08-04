%this script checks the expected energy of random configuration on regular
%graph

% here I learnt to predict expected energy of random field

close all;

numberOfVertices = 200;
%[graph, points] = chainGraph(numberOfVertices);
%[graph] = gridOnTorusGraph(10, 20);
[graph, points] = randomGeometricGraph(numberOfVertices, 0.13);

avDegree = averageDegree(graph);
isCon = isConnected(graph);
properties = [1, 2, 3, 4, 5];
temperature = 6;


randConf = randomConfiguration(length(graph), properties);
ge1 = computeGlobalEnergy(graph, randConf)

n = numberOfVertices;
v = length(properties);
expEnergy = n/2*(v-1)*(v+1)/6*averageDegree(graph)


localEnergies = zeros(1, numberOfVertices);
for i = 1:numberOfVertices
    localEnergies(i) = computeLocalEnergy(graph, randConf, i);
end
