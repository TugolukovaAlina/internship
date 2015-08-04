% blackAndWhiteFixedBudget

% estimation of proportion of black and white people in population
% 
% [graph, field, points] = randomGraphField(1:2, 30, 'rgg', 800, 0.08);
% figure;
% drawField(points, field, graph);


% value depends on degree
% [graph, points] = randomGraphGenerator('rgg', 800, 0.08);
% 
% avDegree = averageDegree(graph);
% field = zeros(1, length(graph));
% for i = 1:length(graph)
%     if  numberOfNeighbors(graph, i) > avDegree
%         field(i) = 1;
%     else
%         field(i) = 2;
%     end
% end
% figure;
% drawField(points, field, graph);
% 
% B = 1000;
% C1 = 1;
% C2 = 9;

% graph
% BWbigGraph
% [graph, field] =  importFromCSV('groupsGraph200_0.3_5_10_0.6'); B = 300; C1 = 1; C2 = 4;
%GAF

% our method
maxToSkip = 70;
[minK, k, variance] = findKtoSkip2(B, C1, C2, graph, field, maxToSkip);
figure; plot(k, variance, 'LineWidth', 2);  minK

[minK, k2, variance2] = findKToSkipExper(B, C1, C2, graph, field, maxToSkip);
hold on; plot(k2, variance2, 'LineWidth', 2);  minK


% method from paper
P = transMatrRW(graph);
initialDistr = degreeDistribution(graph);
numberOfSamples = B/(C1 + C2);

sumError = 0;
sumError2 = 0;
n = 1000;
for i = 1:n
    [~, responses, degrees] = takeSamples(initialDistr, P, numberOfSamples, graph, @propertyForSample, field);
    [~, error] = findProportionOfWhite(responses, degrees, field);
    error2 = (mean(responses) - mean(field))^2;
    sumError = sumError + error;
    sumError2 = sumError2 + error2;
    progress(i, 5);
end

% result
mistakeOurTheor = min(variance)
mistakeBW = sumError/n
mistake3 = sumError2/n