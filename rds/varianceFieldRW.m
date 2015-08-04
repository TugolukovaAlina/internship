% varianceFieldRW

% here I built want to compare variance of field and variance of values
% that I see during the rw
% conclusion: ?? it is different

% build graph and field, count variance
GAF;

fieldVar = var(field)

P = transMatrRW(graph);
realMean = mean(field);

numberOfWalks = 500;

minN = 20;
stepN = 10;
maxN = 2000;

lineX = minN:stepN:maxN;
lineY = zeros (1, (maxN - minN)/stepN + 1);

numberOfSamples = maxN;
responses = zeros(numberOfWalks, numberOfSamples);
varianceRW = zeros(1, numberOfWalks);

%initialDistr = degreeDistribution(graph);
initialDistr = oneNodeDistribution(length(graph));

% I perform numberOfWalks times random walk, taking the values of the nodes
for i = 1:numberOfWalks
    initialDistr = degreeDistribution(graph);
    [~, responses(i,:)] = takeSamples(initialDistr, P, numberOfSamples, 0, @propertyForSample, field);
end

counter = 1;

for k = minN:stepN:maxN
    
    for j = 1:numberOfWalks
        currentResponses = responses(j, 1:k);
        varianceRW(j) = var(currentResponses);        
    end
    
    lineY(counter) = mean(varianceRW);
    counter = counter + 1;
end

figure;
plot(lineX, lineY, 'LineWidth', 3);
