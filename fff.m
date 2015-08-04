cost_ans = 256;

for p = minProp:stepProp:maxProp
        n = ceil(budget/(cost_step + p*cost_ans));
        %m = floor(1/p)  ;
        m = floor(n*p);
        cost = n*cost_step + m *cost_ans;
        fprintf('n - %i, m - %i, cost - %i \n', n, m, cost);
end

% % 
% % 
% % % Before I need generated graph and field
% % %[graph, field] = randomGraphField([1 2 3 4 5], 15, 'rgg', 2000, 0.05);
% % [graph, field] = randomGraphField([1 2 3 4 5], 15, 'er', 200, 945);
% % P = transMatrRW(graph);
% % 
% % computeGlobalEnergy(graph, field)
% % realMean = mean(field);
% % 
% % numberOfWalks = 300;
% % budget = 10000;
% % 
% % cost_step = 1;
% % 
% % numberOfSamples = ceil(budget/cost_step);
% % 
% % 
% % minK = 0;
% % stepK = 2;
% % maxK = 30;
% % 
% % responses = zeros(numberOfWalks, numberOfSamples);
% % degrees = zeros(numberOfWalks, numberOfSamples);
% % estimationMean = zeros(1, numberOfWalks);
% % 
% % %initialDistr = degreeDistribution(graph);
% % initialDistr = oneNodeDistribution(length(graph));
% % 
% % % I perform numberOfWalks times random walk, taking the values of the nodes
% % for i = 1:numberOfWalks
% %     [~, responses(i, :), degrees(i, :)] = takeSamples(initialDistr, P, numberOfSamples, graph, @propertyForSample, field);
% % end
% % 
% % 
% % 
% % minProp = 0.05;
% % stepProp = 0.0125;
% % maxProp = 1;
% % 
% % lineX = minProp:stepProp:maxProp;
% % % lineY = zeros (1, floor((maxProp - minProp)/stepProp) + 1);
% % 
% % 
% % figure;
% % 
% % % ? take only whole portions
% % portion = [0.01, 0.02, 0.025, 0.05, 0.1, 0.2, 0.25, 0.5, 1];
% % lineY = zeros (1, length(portion));
% % 
% % for k = minK:stepK:maxK
% %     cost_ans = k;
% % 
% %     counter = 1;
% %  %   for p = minProp:stepProp:maxProp
% %     for i = 1:length(portion)
% %         
% %         p = portion(i);
% %         n = floor(budget/(cost_step + p*cost_ans));
% %         m = floor(1/p);
% % %         numberOfPart = floor(n*p);
% %         
% %         for j = 1:numberOfWalks
% %             
% % %             participants = cat(2, zeros(1, n-numberOfPart), ones(1, numberOfPart));
% % %             participants = logical(participants(randperm(n)));
% % %             currentResponses = responses(j, participants);
% % %             currentDegrees = degrees(j, participants);
% %               
% %             currentResponses = responses(j, 1:m:n);
% %             currentDegrees = degrees(j, 1:m:n);
% % 
% %             estimationMean(j) = estimateRDS(currentDegrees, currentResponses);    
% %             
% % %            fprintf('n - ');
% %         end
% % 
% %         [~, ~, ~, ~, errorR2] = statParam(estimationMean, realMean);        
% %         lineY(counter) = errorR2;  
% %         counter = counter + 1;  
% %     end
% %     
% %     
% %     subplot(4, 4, k/2+1);
% %     %plot(lineX, lineY(j, :), 'LineWidth', 3);
% %     plot(portion, lineY, 'LineWidth', 3);
% %     title(sprintf('cost for part - %i', cost_ans));
% % end



