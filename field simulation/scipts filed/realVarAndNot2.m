% realVarAndNot2

temperature = [0 (2*ones(1, maxTlog + 1)).^(0:maxTlog)];

figure;
for j = 1:length(temperature)
    
    temp = temperature(j);
    field = fieldCell{j};

    distrNodes = zeros(length(graph), length(properties));
    variancesApprox = zeros(1, length(graph));

    for i = 1:length(graph)
       distrNodes(i, :) = exp(-numberOfNeighbors(graph, i)*(properties - mean(properties)).^2/temp);
       distrNodes(i, :) = normalize(distrNodes(i, :));
       table = cat(1, properties, distrNodes(i, :));
       variancesApprox(i) = varianceT(table);
    end

    subplot(length(temperature), 2, 2*j - 1)
    bar(1:length(graph), variancesApprox)


    % reality
    variancesReal = var(field);
    subplot(length(temperature), 2, 2*j);
    bar(1:length(graph), variancesReal)


end

% I wanted to see if fractions are the same, but no

% % A = ones(1, 100)*variancesReal(1)./variancesReal;
% % B = ones(1, 100)*variancesApprox(1)./variancesApprox;
% % 
% % l = listOfNeighbors(graph, 1);
% % A(l)
% % B(l)
