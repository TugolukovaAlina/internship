% I want to know the distribution of properties in stationary state


numberOfVertices = 100;
% [graph, points] = chainGraph(numberOfVertices);
% radius = 0.13;
% [graph, points] = randomGeometricGraph(200, radius);

[graph, points] = randomGraph(numberOfVertices, 0.7);

avDegree = averageDegree(graph);
isCon = isConnected(graph);
properties = [1, 2, 3, 4, 5];
%temperature = [0, 0.1, 0.5, 1, 2, 4, 8, 10, 20, 50];
temperature = 20;

randConf = randomConfiguration(length(graph), properties);
energyOfRandomField = computeGlobalEnergy(graph, randConf)
expectedEnergyOfRandomField = numberOfEdges(graph)*(length(properties) + 1)*(length(properties) - 1)/6

numberOfExperiments = 500;

firstNodeValues = zeros(1, numberOfExperiments);

bigField = []; 
for i = 1:length(temperature)
    for j = 1:numberOfExperiments
        [field, avProp] = createField(graph, properties, temperature(i), 20, randConf);
        bigField = cat(2, bigField, field); 
        firstNodeValues(j) = field(1);
    end
end

% I consider that distribution of value on all nodes is the same for one
% node
% check considering only one node
% distribution based on simulation
figure
subplot(1, 3, 1)
a = hist(bigField, length(properties));
a = a/sum(a)
bar(a)


% here I will node at the distribution of properties on one node
subplot(1, 3, 2)
a = hist(firstNodeValues, length(properties));
a = a/sum(a)
bar(a)

% distribution predicted
meanOfRandomField = mean(randConf);
meanOfProperties = mean(properties);

degreeOfFirstNode = numberOfNeighbors(graph, 1);

%distrPredicted = exp(-degreeOfFirstNode*(properties - meanOfProperties).^2/temperature);
distrPredicted = exp(-averageDegree(graph)*(properties - meanOfProperties).^2/(temperature));
distrPredicted = distrPredicted/sum(distrPredicted);

subplot(1, 3, 3)
bar(distrPredicted);
distrPredicted


%I will check what normal distr fits good for values
pd = fitdist(transpose(bigField),'Normal')

my_sigma = sqrt(temperature/degreeOfFirstNode)
%predicted energy


%distribution of difference (xi - xj)
%!!!!!!!!!!!!!!!!!!!!!consider also negative values and check when
%properties distributed uniformly
distrXi = distrPredicted
%
distrDiff = zeros(1, 2*length(properties) - 1); 
for a = 0:length(properties)-1
   for b = 1 : length(properties) - a
       distrDiff(a + 1) = distrDiff(a + 1) + distrXi(a + b)*distrXi(b);
   end
end

%distribution of (xi - xj)^2




