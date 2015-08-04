
% n = 10;
% dist1 = zeros(2, n);
% dist1(1,:) = 1:n;
% dist1(2,:) = ones(1, n)/n;
% 
% n = 5;
% dist2 = zeros(2, n);
% dist2(1,:) = 1:n;
% dist2(2,:) = ones(1, n)/n;

% n = 20;
% dist1 = zeros(2, n);
% dist1(1,:) = 1:n;
% dist1(2,:) = distrNormal(n, 3);
% 
% n = 20;
% dist2 = zeros(2, n);
% dist2(1,:) = 1:n;
% dist2(2,:) = distrNormal(n, 4);
% 
% 
% result = distrDifference(dist1, dist2);
% scatter(result(1, :), result(2, :));
% sum(result(2, :))
% 
% hold on;
% plot(result(1, :), distrNormal(result(1, :), 5, 0));
% 
% % table1 = dist1;
% table2 = dist2;
% 
% 
% values1 = table1(1, :);
% prob1 = table1(2, :);
% 
% values2 = table2(1, :); 
% prob2 = table2(2, :);
% 
% values3 = - (length(values2) - 1):1:(length(values1) - 1);
% prob3 = zeros(1, length(values3));
% 
% for i = 1:length(values3) 
%     a = values3(i);
%     prob3(i) = 0;
%   %  n = min([0,a])*length(values2)/a + max([0,a])*length(values1)/a
%   m = length(values1);
%   n = length(values2);
%     for j = max([1, 1-a]):1: min ([m-a,n])
%         b = j;
%         prob3(i) = prob3(i) + prob2(values2 == b)*prob1(values1 == a + b);
%     end
% end
% 
% result = cat(1, values3, prob3);
% 

% n = 21;
% dist1 = zeros(2, n);
% dist1(1,:) = 1:n;
% dist1(2,:) = distrNormal(n, 4);
% 
% n = 21;
% dist2 = zeros(2, n);
% dist2(1,:) = 1:n;
% dist2(2,:) = distrNormal(n, 4);

% n = 10;
% dist1 = zeros(2, n);
% dist1(1,:) = 1:n;
% dist1(2,:) = ones(1, n)/n;
% 
% n = 10;
% dist2 = zeros(2, n);
% dist2(1,:) = 1:n;
% dist2(2,:) = ones(1, n)/n;
% 
% 
% figure;
% result = distrDifference(dist1, dist2);
% scatter(result(1, :), result(2, :));
% 
% figure;
% result = distrSquare(result);
% scatter(result(1, :), result(2, :));
% sum(result(2, :))


% if the the values on the nodes are distributed normally?

properties = 1:5;
temperature = 200;
figure;
distrValueNode = exp(-averageDegree(graph)*(properties - mean(properties)).^2/temperature);
distrValueNode = distrValueNode/sum(distrValueNode);
scatter(properties, distrValueNode, 'r')

hold on;
distrValueNode = distrNormal(properties, sqrt(temperature/(2*averageDegree(graph))));
plot(properties, distrValueNode, 'g')



