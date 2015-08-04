% covDistTemp
%dependency of covariance from distance between nodes with different
%temperature


figure;


distances = bfs(graphLOF);

[a, b] = myFactor(length(temperature));

for i = 1:length(temperature)
    field = fieldCell{i};
    % normalize covariances
    covMatrix = cov(field);    
    varMatrix = var(field);

    covMatrixNorm = covMatrix./(sqrt(transpose(varMatrix)*varMatrix));

    subplot(a, b, i);
%     scatter(distances(1:length(graph)*length(graph)) , covMatrixNorm(1:length(graph)*length(graph)))
    
    [X, Y] = myhist(distances(1:length(graph)*length(graph)) , covMatrixNorm(1:length(graph)*length(graph)) );
    bar(X, Y)
    Y
    xlabel('distance', 'FontSize', 16)
    ylabel('correlation', 'FontSize', 16)
    title(sprintf('Temperature: %i', temperature(i)));

end


