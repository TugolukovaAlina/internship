function [byVar, byCovar, covMod, covNorm, covNormAbs] = countRealVariance(graph, field)
% count energy of field on a graph knowing real distribution of the values
% on nodes (what part of energy is from variance and what from covariance)

variancesReal = zeros(1, length(graph));

% count real variance of value distribution on the nodes
for j = 1:length(graph)
    variancesReal(j) = var(field(:, j));
end

covMatrix = cov(field);
byVar = 0;
byCovar = 0;
covMod = 0;

%count energy contributed by the variance
for i = 1:length(graph)
    for j = 1:length(graph)
        if graph(i, j) ~= 0
            byVar = byVar + variancesReal(i) + variancesReal(j);
            byCovar = byCovar + 2*covMatrix(i, j);
            covMod = covMod + abs(covMatrix(i, j));
        end
    end
end

byVar = byVar/2;
byCovar = byCovar/2;


covNorm = 0;
covNormAbs = 0;
% normalize covariances
for i = 1:length(graph)
    for j = 1:length(graph)
        covMatrix(i, j) = covMatrix(i, j)/sqrt(variancesReal(i)*variancesReal(j));
        if graph(i, j) ~= 0
            covNorm = covNorm + covMatrix(i, j);
            covNormAbs = covNormAbs + abs(covMatrix(i, j));
        end
    end
end

end

