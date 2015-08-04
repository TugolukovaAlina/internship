% influence of neighbors correlation on rds estimator
% for different energy I will look on mean and variance of rds estimator

% the more is fraction the less are values correlated

% on the plot I expect to see that the more is fraction the 

% buddiesCorrelation

fraction = 0.95:-0.05:0.2;


graph = randomGraph(200, 0.03);
%graph = randomGeometricGraph(200, 0.05);
properties = 1:5;
randConf = randomConfiguration(length(graph), properties);
estimations = [];


%for each fraction of final energy I count estimation of mean and depict it
figure;
for i = 1 : length(fraction)
    field = createFieldF(graph, properties, fraction(i), 20, randConf);
    numberOfSamples = 50;
    %estimations = cat(2, estimations, transpose(countRDSEstimator(graph, field, numberOfSamples)));
    estimations = transpose(countRDSEstimator(graph, field, numberOfSamples));
    var(estimations)
    scatter(fraction(i)*ones(1, length(estimations)), estimations);
    hold on;
end


xlabel('fraction', 'FontSize', 18);
ylabel('estimated means', 'FontSize', 18);


% Conclusion: nothing interesting
% less temperature -> bigger variance, but this does not make sense