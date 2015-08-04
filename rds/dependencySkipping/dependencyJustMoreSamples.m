%with increaseing n number of nodes I consider for estimation, the error of RSD estimate decrease

% close all;
% %%Before I need generated graph and field

%dependencyJustMoreSamples

realMean = mean(field);
numberOfWalks = 1000;

minN = 10;
stepN = 20;
maxN = 510;

lineX = minN:stepN:maxN;
lineY = zeros (1, floor((maxN - minN)/stepN) + 1);

numberOfSamples = maxN;
responses = zeros(numberOfWalks, numberOfSamples);
degrees = zeros(numberOfWalks, numberOfSamples);
estimationMean = zeros(1, numberOfWalks);

%
%initialDistr = oneNodeDistribution(length(graph));

% I perform numberOfWalks times random walk, taking the values of the nodes
for i = 1:numberOfWalks
    initialDistr = degreeDistribution(graph);
    [~, responses(i, :), degrees(i, :)] = takeSamples(initialDistr, P, numberOfSamples, graph, @propertyForSample, field);
end

counter = 1;

for n = minN:stepN:maxN  
    
    for i = 1:numberOfWalks
        currentResponses = responses(i, 1:n);
        currentDegrees = degrees(i, 1:n);
        estimationMean(i) = estimateRDS(currentDegrees, currentResponses);        
    end
    
%     subplot(3, 2, counter);
%     hist(estimationMean, 40);

    [~, ~, ~, ~, errorR2] = statParam(estimationMean, realMean);
    lineY(counter) = errorR2;  
    counter = counter + 1;  
end

figure;
plot(lineX, lineY, 'LineWidth', 2, 'Color', 'r');


