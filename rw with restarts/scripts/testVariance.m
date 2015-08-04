%%% DOES NOT WORK



% radius = 0.13;
% [graph, points] = randomGeometricGraph(200, radius);
% 
% graph = randomGraph(10, 1);
% 
% avDegree = averageDegree(graph);
% isCon = isConnected(graph);
% properties = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
% temperature = 32;
% 
% [field, avProp] = createField(graph, properties, temperature)
% drawRGGfield(field, points, radius);
% 
% P = transMatrMetropolis(graph);
% 
% initialDistr = zeros(1, length(P));
% initialDistr(73) = 1;
%meanField = mean(field);

numberOfResponses = 20;
numberOfExperiments = 1000;
step = 20;
[meanR, varianceR, biasR, errorR1] = testFirstResponses(initialDistr, P, field, numberOfResponses, step, numberOfExperiments)

%characteristics with increasing number of samples
figure;

min = 20;
step = 20;
max = 200;

lineX = min:step:max;
lineY1 = zeros (1, floor((max-min)/step) + 1);
lineY2 = zeros (1, floor((max-min)/step) + 1);

counter = 1;
for numberOfResponses = min:step:max    
    [~, lineY1(counter),lineY2(counter)]  = testFirstResponses(initialDistr, P, field, numberOfResponses, step, numberOfExperiments);
    counter = counter + 1;
end

plot(lineX, lineY1, 'LineWidth', 2, 'Color', 'r');
hold on;
plot(lineX, lineY2, 'LineWidth', 2, 'Color', 'g');


%characteristics with making bigger steps

figure;
numberOfResponses = 20;
min = 1;
step = 1;
max = 200;

lineX = min:step:max;
lineY1 = zeros (1, floor((max-min)/step) + 1);
lineY2 = zeros (1, floor((max-min)/step) + 1);

counter = 1;
for stepS = min:step:max    
    [~, lineY1(counter),lineY2(counter)]  = testFirstResponses(initialDistr, P, field, numberOfResponses, stepS, numberOfExperiments);
    counter = counter + 1;
end

plot(lineX, lineY1, 'LineWidth', 2, 'Color', 'r');
hold on;
plot(lineX, lineY2, 'LineWidth', 2, 'Color', 'g');


%after !!!! change the first node