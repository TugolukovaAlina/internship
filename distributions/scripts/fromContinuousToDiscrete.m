% in order to count I want to describe distribution as continuous, here I
% will check if it is possible


% conclusion: I can't do this, because of different normalizing member

%fromContinuousToDiscrete

properties = 1:10;
degree = 20;
temperature = 10;

%discrete
distrValueNode = exp(-degree*(properties - mean(properties)).^2/temperature);
distrDiscrete = distrValueNode/sum(distrValueNode);
%continuous
distrContinuous =  distrNormal(properties, sqrt(temperature/(2*degree)));

%plot
figure;
subplot(2, 2, 1)
scatter(properties, distrDiscrete, 'r')
hold on;
scatter(properties, distrContinuous, 'g')
hold on;


x_values = 1:0.2:length(properties);
y_values = pdf('Normal', x_values, mean(properties), sqrt(temperature/(2*degree)));
plot(x_values, y_values)


title('distribution of values on node')


%discrete
table = zeros(2, length(properties));
table(1, :) = properties;
table(2, :) = distrDiscrete;
table2 = distrDifference(table, table);


%continuous
valuesDifference = -(length(properties) - 1):1:(length(properties) - 1);
distrDifferences = distrNormal(valuesDifference, sqrt(temperature/degree));
table1 = cat(1, valuesDifference, distrDifferences);
%plot
subplot(2, 2, 2)

scatter(table2(1, :),table2(2, :), 'r')
hold on;
scatter(table1(1, :),table1(2, :), 'g')
title('distribution of diff')

%discrete
table2 = distrSquare(table2);
%continuous
table1 = distrSquare(table1);


hold on;
x_values = -(length(properties)-1):0.2:(length(properties)-1);
y_values = pdf('Normal', x_values, 0, sqrt(temperature/degree));
plot(x_values, y_values)


%plot
subplot(2, 2, 3)
scatter(table2(1, :),table2(2, :), 'r')
hold on;
scatter(table1(1, :),table1(2, :), 'g')
title('distribution of sqr diff')


% energy prediction
energyPredicted  = numberOfEdges(graph)*sum(table2(2, :).*table2(1, :))
energyPredicted2 = numberOfEdges(graph)*sum(table1(2, :).*table1(1, :))
energyPredicted3 = numberOfEdges(graph)*temperature/degree

