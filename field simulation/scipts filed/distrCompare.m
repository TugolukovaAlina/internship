% big goal: prove that energy in random configuration is bigger then energy
% predicted

% I will check it by building distributions of (xi - xj)^2
% then I will compare cdf

% conclusion: yes, distributions are stocastically ordered so E[x_rand] >
% E[x_steady]

% distrCompare

[graph, points] = randomGraph(200, 0.1);
properties = 1:15;

% in random configuration
distrValueNode = distrUniform(length(properties));
distrValueNode = distrValueNode/sum(distrValueNode);

% distribution of squared differences
table = zeros(2, length(properties));
table(1, :) = properties;
table(2, :) = distrValueNode;

table2 = distrSquare( distrDifference(table, table) );

figure;
scatter(table2(1,:), table2(2,:), 'g');
cdf1 = cdfDiscrete(table2(2,:));

% temperature = 1;
% in stable state
distrValueNode = exp(-averageDegree(graph)*(properties - mean(properties)).^2/temperature);
distrValueNode = distrValueNode/sum(distrValueNode);

% distribution of squared differences
table = zeros(2, length(properties));
table(1, :) = properties;
table(2, :) = distrValueNode;

table2 = distrSquare( distrDifference(table, table) );

hold on;
scatter(table2(1,:), table2(2,:), 'r');
cdf2 = cdfDiscrete(table2(2,:));


%cdf
figure;
stairs(table2(1,:),cdf1, 'g');
hold on;
stairs(table2(1,:),cdf2, 'r');