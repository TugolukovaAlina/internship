% I want to know the distribution of differences and squared differences

% first question is it better to use my difference function or use the fact
% that difference of two normal distributions is normal??????????????????

close all;
numberOfVertices = 200;
%[graph, points] = chainGraph(numberOfVertices);
%graph = gridOnTorusGraph(5, 20);
% radius = 0.13;
% [graph, points] = randomGeometricGraph(200, radius);

[graph, points] = randomGraph(numberOfVertices, 0.3);

avDegree = averageDegree(graph);
isCon = isConnected(graph);
properties = 1:30;
%properties = [1, 2, 3, 4, 5];
temperature = 500;

randConf = randomConfiguration(length(graph), properties);
energyOfRandomField = computeGlobalEnergy(graph, randConf)
expectedEnergyOfRandomField = numberOfEdges(graph)*(length(properties) + 1)*(length(properties) - 1)/6

globEnergy = zeros(1, length(temperature));

numberOfExperiments = 50;
differences = zeros(1, 2*numberOfEdges(graph));

counter = 1;
globEnergy = 0;
for j = 1:numberOfExperiments
    [field, ~, ~, energies] = createField(graph, properties, temperature, 20, randConf);

    % for each vertex look at the difference between it and neighbors
    % values

    for v1 = 1:numberOfVertices
        Ni = listOfNeighbors(graph, v1);
        for i = 1:length(Ni)
            v2 = Ni(i);
            %differences(counter) = (field(v1) - field(v2))^2;
            differences(counter) = field(v1) - field(v2);
            counter = counter + 1;
        end
    end
    
    globEnergy = globEnergy + energies(length(energies));
end
globEnergy = globEnergy/numberOfExperiments;
counter
numberOfEdges(graph)


figure
subplot(1, 4, 1)
a = hist(differences, 2*length(properties)-1);
%a = hist(differences, length(properties));
a = a/sum(a)
bar(a)
title('total distribution of differences');


% % with average degree, here I think that all nodes have the same
% % distribution

distrValueNode = exp(-averageDegree(graph)*(properties - meanOfProperties).^2/temperature);
distrValueNode = distrValueNode/sum(distrValueNode);

%distribution of differences: first way

subplot(1, 4, 2)
table = zeros(2, length(properties));
table(1, :) = properties;
table(2, :) = distrValueNode;
table2 = distrDifference(table, table);
table2(2, :)
bar(table2(2, :));
title('distribution of differences predicted1');


%distribution of values: second way
distrValueNode = distrNormal(properties, sqrt(temperature/(2*averageDegree(graph))));

% distribution of differences: second way

subplot(1, 4, 3)
table = zeros(2, length(properties));
table(1, :) = properties;
table(2, :) = distrValueNode;

%table2 = distrSquare( distrDifference(table, table) );
table2 = distrDifference(table, table);
table2(2, :)
bar(table2(2, :));
title('distribution of differences predicted2');


% distribution of differences: third way

subplot(1, 4, 4)

distr3 = distrNormal( -(length(properties) - 1):1:(length(properties) - 1), sqrt(temperature/averageDegree(graph)))
bar(distr3);
title('distribution of differences predicted3');

% % distribution of squared differences
% %subplot(1, 4, 3)
% table2 = distrSquare( distrDifference(table, table) );
% bar(table2(2, :));
% title('distribution of squared differences predicted');


% energy prediction
globEnergy
energyPredicted  = numberOfEdges(graph)*sum(table2(2, :).*table2(1, :)) 





