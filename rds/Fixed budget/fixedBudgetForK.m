% fixedBudgetForK

GAF
realMean = mean(field);

numberOfWalks = 3000;
budget = 500;
cost_step = 1;

numberOfSamples = ceil(budget/cost_step + 1);


minK = 0;
stepK = 2;
maxK = 30;

responses = zeros(numberOfWalks, numberOfSamples);
degrees = zeros(numberOfWalks, numberOfSamples);
estimationMean = zeros(1, numberOfWalks);


% I perform numberOfWalks times random walk, taking the values of the nodes
for i = 1:numberOfWalks
    initialDistr = degreeDistribution(graph);
    [~, responses(i, :), degrees(i, :)] = takeSamples(initialDistr, P, numberOfSamples, graph, @propertyForSample, field);
end


figure;
% ? take only whole portions
skipK = 0:20;
lineY = zeros (1, length(skipK));

for cost = minK:stepK:maxK
    cost_ans = cost;

    counter = 1;

    for i = 1:length(skipK)
        
        k = skipK(i);
        
        %number of steps
        n = ceil(budget*(k+1)/(cost_step*(k+1) + cost_ans));
        
        %number of participants
        m = ceil(budget/(cost_step*(k+1) + cost_ans));
        
%         
%         for j = 1:numberOfWalks           
%             currentResponses = responses(j, 1:m:n);
%             currentDegrees = degrees(j, 1:m:n);
%             estimationMean(j) = estimateRDS(currentDegrees, currentResponses);    
%         end
%         [~, ~, ~, ~, errorR2] = statParam(estimationMean, realMean);        
%         lineY(counter) = errorR2;  

        j = randi(numberOfWalks, [1, 1000]);
        lineY(counter) = var(mean(responses(j, 1:(k+1):n),2));
        
        budgetReal = n*cost_step + length(1:(k+1):n)*cost_ans
        
        counter = counter + 1;  
    end
    
    subplot(4, 4, cost/2+1);
    plot(skipK, lineY, 'LineWidth', 3);
    title(sprintf('cost for part - %i', cost_ans));
end



