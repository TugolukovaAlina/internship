% here I want to chech what is better to take more but correlated values or
% less values but also less correlated

% Then I introduce cost of one step of random walk and taking the node as a
% participant (to count some statistics)
close all;
realMean = mean(field);

numberOfWalks = 1;
maxStep = 80;

% to be 95% confident that tha samples mean is within a distance maxErrorIWant
maxErrorIWant = 0.2;
fieldVariance = var(field);
numberInOneMin = ceil(4*fieldVariance/maxErrorIWant);


numberOfSamples = maxStep*numberInOneMin;

lineX = 1:maxStep;
lineY = zeros (8, maxStep);

responses = zeros(numberOfWalks, numberOfSamples);


node = 17;
initialDistr = zeros(1, length(P));
initialDistr(randi(length(P))) = 1;


for i = 1:numberOfWalks
    [~, responses(i, :)] = takeSamples(initialDistr, P, numberOfSamples, @propertyForSample, field);
    %[~, responses(i, :)] = takeSamplesMH(node, graph, numberOfSamples, @propertyForSample, field);
end
fprintf('finished here');

for i = 1:maxStep

    currentResponses1 = responses(:, 1:numberInOneMin*i);
    [~, ~, biasR] = statParam(currentResponses1, realMean);   
    lineY(7, i) = biasR;
    
    currentResponses2 = responses(:, i*(1:numberInOneMin));
    [~, ~, biasR] = statParam(currentResponses2, realMean);    
    lineY(8, i) = biasR;
    
end


figure;
subplot(3, 1, 1)
plot(lineX, lineY(7,:), 'LineWidth', 2, 'Color', 'r');
subplot(3, 1, 2)
plot(lineX, lineY(8,:), 'LineWidth', 2, 'Color', 'g');
subplot(3, 1, 3)
plot(lineX, lineY(7,:), 'LineWidth', 2, 'Color', 'r');
hold on;
plot(lineX, lineY(8,:), 'LineWidth', 2, 'Color', 'g');
