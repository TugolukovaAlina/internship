% Before I need generated graph and field
% [graph, field] = randomGraphField([1 2 3 4 5], 15, 'er', 200, 945);
% P = transMatrRW(graph);

computeGlobalEnergy(graph, field)
realMean = mean(field);

numberOfWalks = 200;

minBudget = 100;
stepBudget = 50;
maxBudget = 10000;

cost_step = 1;
cost_ans = 30;

portion = [0.04, 0.05, 0.1, 0.25, 0.5, 1];
numberOfSamples = ceil(maxBudget/(cost_step + min(portion)*cost_ans))


lineX = minBudget:stepBudget:maxBudget;
lineY = zeros (length(portion), (maxBudget - minBudget)/stepBudget + 1);

responses = zeros(numberOfWalks, numberOfSamples);
initialDistr = degreeDistribution(graph);
%initialDistr = oneNodeDistribution(length(graph));

% I perform numberOfWalks times random walk, taking the values of the nodes
for i = 1:numberOfWalks
    [~, responses(i, :)] = takeSamples(initialDistr, P, numberOfSamples, 0, @propertyForSample, field);
    %fprintf('finished here');

    %[~, responses(i, :)] = takeSamplesMH(node, graph, numberOfSamples, @propertyForSample, field);
end
fprintf('finished here');

counter = 1;
for budget = minBudget:stepBudget:maxBudget
    
    for i = 1:length(portion)
        p = portion(i);
        % n samples, each m is participant
        n = floor(budget/(cost_step + p*cost_ans));
        m = floor(1/p);
        %currentResponses1 = responses(:, 1:m:n);
        currentResponses1 = mean(responses(:, 1:m:n), 2);
        [~, varianceR, biasR, errorR1, errorR2] = statParam(currentResponses1, realMean);
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

