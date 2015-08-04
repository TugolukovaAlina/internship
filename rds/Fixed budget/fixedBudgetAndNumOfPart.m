% fixedBudgetAndNumOfPart
% THIS IS NOT FINISHED


% Before I need generated graph and field
% [graph, field] = randomGraphField([1 2 3 4 5], 15, 'er', 200, 945);
% P = transMatrRW(graph);

computeGlobalEnergy(graph, field)
realMean = mean(field);

numberOfWalks = 300;

% I have fixed budget and number of participants
budget = 1000;
m = 50;
cost_step = 1;

portion = [0.01, 0.04, 0.05, 0.1, 0.25, 0.5, 1];
numberOfSamples = ceil(budget/cost_step);


minProp = 0;
stepProp = 1;
maxProp = 50;

lineX = minProp:stepProp:maxProp;
lineY = zeros (length(portion), (maxProp - minProp)/stepProp + 1);


responses = zeros(numberOfWalks, numberOfSamples);
degrees = zeros(numberOfWalks, numberOfSamples);
estimationMean = zeros(1, numberOfWalks);

%initialDistr = degreeDistribution(graph);
initialDistr = oneNodeDistribution(length(graph));

% I perform numberOfWalks times random walk, taking the values of the nodes
for i = 1:numberOfWalks
    [~, responses(i, :), degrees(i, :)] = takeSamples(initialDistr, P, numberOfSamples, graph, @propertyForSample, field);
end

counter = 1;
for k = minProp:stepProp:maxProp
    cost_ans = k*cost_step;
    max_np = 0;
    max_p = 0;
    for i = 1:length(portion)
        
        p = portion(i);
        % n samples, each m is participant
        n = floor(budget/(cost_step + p*cost_ans));
        m = floor(1/p);
        
        
        for j = 1:numberOfWalks
            currentResponses = responses(j, 1:m:n);
            currentDegrees = degrees(j, 1:m:n);
            estimationMean(j) = estimateRDS(currentDegrees, currentResponses);        
        end

        [~, ~, ~, ~, errorR2] = statParam(estimationMean, realMean);        
        lineY(i, counter) = errorR2;  
    end
    counter = counter + 1;  
end

figure;
colors = ['r', 'g', 'b', 'y', 'm', 'c', 'k'];
for j = 1:length(portion)
    plot(lineX, lineY(j, :), 'LineWidth', 3, 'Color', colors(j), 'DisplayName',['portion: ' num2str(portion(j))]);
    hold on;
end
legend(gca,'show')

