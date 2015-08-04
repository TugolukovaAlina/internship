% when number of nodes I consider for estimation fixed increase number of nodes skipped and see improvement
% NOTE: number of nodes that I see increases, so each time I see longer
% chain
 
% dependencySkipSameSampleSize
GAF;
realMean = mean(field);
numberOfWalks = 1000;

%how much to skip
minSkip = 1;
stepSkip = 1;
maxSkip = 100;

[lineX, lineY] = linesXY(minSkip, stepSkip, maxSkip);

% n: numberInOne is fixed
numberInOne = 50;


numberOfSamples = numberInOne*maxSkip;
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
for k = minSkip:stepSkip:maxSkip        
    n = k*numberInOne;
    
    for i = 1:numberOfWalks
        currentResponses = responses(i, 1:k:n);
        currentDegrees = degrees(i, 1:k:n);
        estimationMean(i) = estimateRDS(currentDegrees, currentResponses);        
    end

%     [~, ~, ~, ~, errorR2] = statParam(estimationMean, realMean);
%     lineY(counter) = errorR2; 
    lineY(counter) = var(estimationMean); 
    counter = counter + 1; 
end

figure;
plot(lineX, lineY, 'LineWidth', 2, 'Color', 'r');
xlabel('Number of skipped','FontSize', 18);
ylabel('Error','FontSize', 18);


