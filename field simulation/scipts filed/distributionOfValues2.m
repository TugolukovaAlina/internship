% I want to know the distribution of properties in stationary state


numberOfVertices = 100;
%[graph, points] = chainGraph(numberOfVertices);
% radius = 0.13;
% [graph, points] = randomGeometricGraph(200, radius);

[graph, points] = randomGraph(numberOfVertices, 0.2);

avDegree = averageDegree(graph);
isCon = isConnected(graph);
properties = [1, 2, 3, 4, 5, 6, 7];
%temperature = [0, 0.1, 0.5, 1, 2, 4, 8, 10, 20, 50];
temperature = 30;

randConf = randomConfiguration(length(graph), properties);
energyOfRandomField = computeGlobalEnergy(graph, randConf)
expectedEnergyOfRandomField = numberOfEdges(graph)*(length(properties) + 1)*(length(properties) - 1)/6

numberOfExperiments = 500;

firstNodeValues = zeros(1, numberOfExperiments);
tenthNodeValues = zeros(1, numberOfExperiments);

bigField = []; 
for i = 1:length(temperature)
    for j = 1:numberOfExperiments
        [field, avProp] = createField(graph, properties, temperature(i), 20, randConf);
        bigField = cat(2, bigField, field); 
        firstNodeValues(j) = field(11);
        tenthNodeValues(j) = field(10);
    end
end

% I consider that distribution of value on all nodes is the same for one
% node
% check considering only one node
% distribution based on simulation
figure
subplot(1, 6, 1)
a = hist(bigField, length(properties));
a = a/sum(a)
bar(a)
title('total distribution');


% I will draw on the same plot normal distribution to see if it
% approximates good reality
pd = fitdist(transpose(bigField),'Normal');
x_values = 1:0.2:7;
y = pdf(pd,x_values);
hold on;
plot(x_values,y,'LineWidth',2)


% with average degree, here I think that all nodes have the same
% distribution
subplot(1, 6, 2)
distrPredicted = exp(-averageDegree(graph)*(properties - meanOfProperties).^2/temperature);
distrPredicted = distrPredicted/sum(distrPredicted);
bar(distrPredicted);
title('total distribution predicted');


% here I will node at the distribution of properties on one node
subplot(1, 6, 3)
a = hist(firstNodeValues, length(properties));
a = a/sum(a)
bar(a)
title('first node distribution');

subplot(1, 6, 5)
a = hist(tenthNodeValues, length(properties));
a = a/sum(a)
bar(a)
title('tenth node distribution');

% distribution predicted
meanOfRandomField = mean(randConf);
meanOfProperties = mean(properties);

degreeOfFirstNode = numberOfNeighbors(graph, 11);
degreeOfTenthNode = numberOfNeighbors(graph, 10);
%distrPredicted = exp(-averageDegree(graph)*(properties - meanOfProperties).^2/(temperature));

subplot(1, 6, 4)
distrPredicted = exp(-degreeOfFirstNode*(properties - meanOfProperties).^2/temperature);
distrPredicted = distrPredicted/sum(distrPredicted);
bar(distrPredicted);
title('first node distribution predicted');

subplot(1, 6, 6)
distrPredicted = exp(-degreeOfTenthNode*(properties - meanOfProperties).^2/temperature);
distrPredicted = distrPredicted/sum(distrPredicted);
bar(distrPredicted);
title('tenth node distribution predicted');





