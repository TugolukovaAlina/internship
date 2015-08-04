% Before I need generated graph and field
%[graph, field] = randomGraphField([1 2 3 4 5], 15, 'rgg', 2000, 0.05);
[graph, field] = randomGraphField([1 2 3 4 5], 15, 'er', 200, 945);
P = transMatrRW(graph);

computeGlobalEnergy(graph, field)
realMean = mean(field);

numberOfWalks = 300;
budget = 10000;
cost_step = 1;

numberOfSamples = ceil(budget/cost_step);


minK = 0;
stepK = 2;
maxK = 30;

responses = zeros(numberOfWalks, numberOfSamples);
degrees = zeros(numberOfWalks, numberOfSamples);
estimationMean = zeros(1, numberOfWalks);

%initialDistr = degreeDistribution(graph);
initialDistr = oneNodeDistribution(length(graph));

% I perform numberOfWalks times random walk, taking the values of the nodes
for i = 1:numberOfWalks
    [~, responses(i, :), degrees(i, :)] = takeSamples(initialDistr, P, numberOfSamples, graph, @propertyForSample, field);
end


figure;
% ? take only whole portions
portion = [0.01, 0.02, 0.025, 0.05, 0.1, 0.2, 0.25, 0.5, 1];
lineY = zeros (1, length(portion));

for k = minK:stepK:maxK
    cost_ans = k;

    counter = 1;

    for i = 1:length(portion)
        
        p = portion(i);
        n = floor(budget/(cost_step + p*cost_ans));
        m = floor(1/p);
        
        for j = 1:numberOfWalks           
            currentResponses = responses(j, 1:m:n);
            currentDegrees = degrees(j, 1:m:n);
            estimationMean(j) = estimateRDS(currentDegrees, currentResponses);    
        end

        [~, ~, ~, ~, errorR2] = statParam(estimationMean, realMean);        
        lineY(counter) = errorR2;  
        counter = counter + 1;  
    end
    
    subplot(4, 4, k/2+1);
    plot(portion, lineY, 'LineWidth', 3);
    title(sprintf('cost for part - %i', cost_ans));
end



