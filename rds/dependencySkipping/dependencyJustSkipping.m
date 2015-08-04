% number of nodes that I see during the RW is the same,
% number of nodes I consider for estimation changes 
% increase number of nodes skipped and see improvement or no

% dependencyJustSkipping

GAF;

realMean = mean(field);
numberOfWalks = 1000;

minProp = 1;
stepProp = 1;
maxProp = 500;

[lineX, lineY] = linesXY(minProp, stepProp, maxProp);

numberOfSamples = 1000;
responses = zeros(numberOfWalks, numberOfSamples);
degrees = zeros(numberOfWalks, numberOfSamples);
estimationMean = zeros(1, numberOfWalks);
%initialDistr = degreeDistribution(graph);
%initialDistr = oneNodeDistribution(length(graph));
% I perform numberOfWalks times random walk, taking the values of the nodes
for i = 1:numberOfWalks
    initialDistr = degreeDistribution(graph);
    [~, responses(i, :), degrees(i, :)] = takeSamples(initialDistr, P, numberOfSamples, graph, @propertyForSample, field);
end

counter = 1;
n = numberOfSamples;
for k = minProp:stepProp:maxProp        
    
%     for i = 1:numberOfWalks
%         currentResponses = responses(i, 1:k:n);
%         currentDegrees = degrees(i, 1:k:n);
%         estimationMean(i) = estimateRDS(currentDegrees, currentResponses);        
%     end
% 
%     [~, ~, ~, ~, errorR2] = statParam(estimationMean, realMean);
%     lineY(counter) = errorR2;  

    lineY(counter) = var(mean(responses(:, 1:k:n),2));
    counter = counter + 1; 
end

figure;
plot(lineX, lineY, 'LineWidth', 2, 'Color', 'r');

xlabel('Number of skipped','FontSize', 18);
ylabel('Error','FontSize', 18);

