% covariance of ER graph

% covGraph
% call after RealVarAndNOt

% fieldArr - a lot of fields on graph
% I will check covariance

covMatrix = cov(fieldArr);

% A, B matrices of energy, A - real, B - approximation
A = zeros(length(graphArr), length(graphArr));
B = zeros(length(graphArr), length(graphArr));

for i = 1:length(graphArr)
    for j = 1:length(graphArr)
        if graphArr(i, j) ~= 0
            A(i, j) = variancesReal(i) + variancesReal(j) - 2*covMatrix(i, j);
            %A(i, j) = variancesReal(i) + variancesReal(j);
            B(i, j) = variancesApprox(i) + variancesApprox(j);
        end
    end
end

sum(sum(A))/2

%this coincides with predicted energy
sum(sum(B))/2

diag = zeros(1, length(graphArr));
for i = 1:length(graphArr)
    diag(i) = covMatrix(i, i);
end

%
distanses = bfs(graphArr);
[X, Y] = myhist(distanses(1:length(graphArr)*length(graphArr)) , covMatrix(1:length(graphArr)*length(graphArr)) );
figure;
bar(X, Y)
xlabel('distance', 'FontSize', 16)
ylabel('covariance', 'FontSize', 16)


% normalize covariances
for i = 1:length(graphArr)
    for j = 1:length(graphArr)
        covMatrix(i, j) = covMatrix(i, j)/sqrt(variancesReal(i)*variancesReal(j));
    end
end

[X, Y] = myhist(distanses(1:length(graphArr)*length(graphArr)) , covMatrix(1:length(graphArr)*length(graphArr)) );
figure;
bar(X, Y)
xlabel('distance', 'FontSize', 16)
ylabel('correlation', 'FontSize', 16)


figure
scatter(distanses(1:length(graphArr)*length(graphArr)) , covMatrix(1:length(graphArr)*length(graphArr)) );
xlabel('distance', 'FontSize', 16)
ylabel('correlation', 'FontSize', 16)

