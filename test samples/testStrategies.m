realMean = mean(field);

numberOfWalks = 1000;
maxStep = 80;
numberInOneMin = 20;
numberOfSamples = maxStep*numberInOneMin;

lineX = 1:maxStep;
lineY = zeros (8, maxStep);

responses = zeros(numberOfWalks, numberOfSamples);
initialDistr = degreeDistribution(graph);
%initialDistr = oneNodeDistribution(length(graph));

% I perform numberOfWalks times random walk, taking the values of the nodes
for i = 1:numberOfWalks
    [~, responses(i, :)] = takeSamples(initialDistr, P, numberOfSamples, graph, @propertyForSample, field);
    %[~, responses(i, :)] = takeSamplesMH(node, graph, numberOfSamples, @propertyForSample, field);
end
fprintf('finished here');

for i = 1:maxStep
    % I take all responses from 1st to numberInOneMin*i from all walks and
    % count mean value in each walk
    currentResponses1 = mean(responses(:, 1:numberInOneMin*i), 2);
    %currentResponses1 = responses(:, 1:numberInOneMin*i);
    [~, varianceR, biasR, errorR1] = statParam(currentResponses1, realMean);
    lineY(1, i) = varianceR;
    lineY(2, i) = biasR;
    lineY(3, i) = errorR1;   
    lineY(7, i) = biasR;
    
    % I take all each i_th response from all walks and
    % count mean value in each walk
    currentResponses2 = mean(responses(:, i*(1:numberInOneMin)), 2);
    %currentResponses2 = responses(:, i*(1:numberInOneMin));
    [~, varianceR, biasR, errorR1] = statParam(currentResponses2, realMean);
    lineY(4, i) = varianceR;
    lineY(5, i) = biasR;
    lineY(6, i) = errorR1;    
    lineY(8, i) = biasR;
end

figure;
subplot(2, 2, 1);
plot(lineX, lineY(1,:), 'LineWidth', 2, 'Color', 'r');
hold on;
plot(lineX, lineY(2,:), 'LineWidth', 2, 'Color', 'g');
title('Take more biased samples')
legend('variance','bias');

subplot(2, 2, 2);
plot(lineX, lineY(4,:), 'LineWidth', 2, 'Color', 'r');
hold on;
plot(lineX, lineY(5,:), 'LineWidth', 2, 'Color', 'g');
title('Take less unbiased samples')
legend('variance','bias');

subplot(2, 2, 3);
plot(lineX, lineY(3,:), 'LineWidth', 2, 'Color', 'b');
hold on;
plot(lineX, lineY(6,:), 'LineWidth', 2, 'Color', 'y');
title('Total error')
legend('more biased samples','less unbiased samples');



% plot(lineX, lineY(7,:), 'LineWidth', 2, 'Color', 'r');
% hold on;
% plot(lineX, lineY(8,:), 'LineWidth', 2, 'Color', 'g');
