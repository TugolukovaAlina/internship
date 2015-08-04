% Before I need generated graph and field
%[graph, field] = randomGraphField([1 2 3 4 5], 15, 'er', 200, 945);
%[graph, field] = randomGraphField([1 2 3 4 5], 15, 'rgg', 200, 0.13);
%[graph, field] = randomGraphField([1 2 3 4 5], 15, 'er', 2000, 0.01);
%[graph, field] = randomGraphField([1 2 3 4 5], 15, 'rgg', 2000, 0.05);
%[graph, field] = randomGraphField([1 2 3 4 5], 5, 'pa', 2000, 1);

graph = graphFacebook; field = fieldFacebook;
P = transMatrRW(graph);

computeGlobalEnergy(graph, field)
realMean = mean(field);

numberOfWalks = 500;
budget = 1000;
cost_step = 1;
portion = [0.01, 0.02, 0.05, 0.1, 0.25, 0.5, 1];

numberOfSamples = ceil(budget/cost_step);

minCostPart = 0;
stepCostPart = 1;
maxCostPart = 50;

lineX = minCostPart:stepCostPart:maxCostPart;
lineY = zeros (length(portion), (maxCostPart - minCostPart)/stepCostPart + 1);

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
counter2 = 1;
figure;
for k = minCostPart:stepCostPart:maxCostPart
    cost_ans = k*cost_step;
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
    
    
    if counter2 <= 16
        subplot(4, 4, counter2);
        plot(portion, lineY(:, counter), 'LineWidth', 3);
        title(sprintf('cost for part - %i', cost_ans));
    end
    counter = counter + 1;
    counter2 = counter2 + 1;
end

figure;
colors = ['r', 'g', 'b', 'y', 'm', 'c', 'k'];
for j = 1:length(portion)
    plot(lineX, lineY(j, :), 'LineWidth', 3, 'Color', colors(j), 'DisplayName',['portion: ' num2str(portion(j))]);
    hold on;
end
legend(gca,'show')




