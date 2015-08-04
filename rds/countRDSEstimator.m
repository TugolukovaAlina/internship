function estimationMean = countRDSEstimator(graph, field, numberOfSamples, numberOfWalks)
% counts rds estimators on given graph and field, number of rds estimators = numberOfWalks 
%   Detailed explanation goes here

if nargin == 3
    numberOfWalks = 1000;
end

estimationMean = zeros(1, numberOfWalks);

%initialDistr = degreeDistribution(graph);
%initialDistr = oneNodeDistribution(length(graph), 1);
P = transMatrRW(graph);

% I perform numberOfWalks times random walk, taking the values of the nodes
for i = 1:numberOfWalks
    initialDistr = degreeDistribution(graph);
    [~, responses, degrees] = takeSamples(initialDistr, P, numberOfSamples, graph, @propertyForSample, field);
    estimationMean(i) = estimateRDS(degrees, responses);
end
 
end



