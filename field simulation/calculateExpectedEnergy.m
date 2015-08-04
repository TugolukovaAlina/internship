function energyPredicted = calculateExpectedEnergy(graph, properties, temperature)
% calculate expected energy on the graph with given values and temperature
%   actually I need form graph only average degree and number of edges

energyPredicted = zeros(1, length(temperature));


for i = 1:length(temperature)
    % % distribution of values on the node
    distrValueNode = exp(-averageDegree(graph)*(properties - mean(properties)).^2/temperature(i));
    distrValueNode = distrValueNode/sum(distrValueNode);


    % distribution of squared differences
    table = zeros(2, length(properties));
    table(1, :) = properties;
    table(2, :) = distrValueNode;

    energyPredicted(i) = 2*numberOfEdges(graph)*varianceT(table);

end

% I checked that this is the same prediction
% table2 = distrSquare( distrDifference(table, table) );
% energyPredicted  = numberOfEdges(graph)*sum(table2(2, :).*table2(1, :));

% I checked that this is the same prediction too
%s = properties.^2;
%energyPredicted2 = 2*numberOfEdges(graph)*(sum(s.*exp(-averageDegree(graph)*(properties - mean(properties)).^2/temperature)) / sum(exp(-averageDegree(graph)*(properties - mean(properties)).^2/temperature)) - mean(properties)^2);


end

