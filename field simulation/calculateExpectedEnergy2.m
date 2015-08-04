function energyPredicted = calculateExpectedEnergy2(graph, properties, temperature)
% calculate expected energy on the graph with given values and temperature
%energy when distribution of values is different on the nodes
energyPredicted = zeros(1, length(temperature));

for j = 1:length(temperature)
    
    if temperature(j) == 0
        energyPredicted(j) = 0;
    else
    distrNodes = zeros(length(graph), length(properties));
        for i = 1:length(graph)
           Ni = numberOfNeighbors(graph, i);

           distrNodes(i, :) = exp(-Ni*(properties - mean(properties)).^2/temperature(j));
           distrNodes(i, :) = normalize(distrNodes(i, :));

           table = cat(1, properties, distrNodes(i, :));
           energyPredicted(j) = energyPredicted(j) + Ni*varianceT(table);
        end
    end
end


% hmmmmm.... maybe it is the same as: yes, indeed
% energyPredicted2 = 0;
% for i = 1:length(graph)
%     Ni = listOfNeighbors(graph, i);
%     for j = 1:length(Ni)
%         table1 = cat(1, properties, distrNodes(i, :));
%         table2 = cat(1, properties, distrNodes(Ni(j), :));
%         energyPredicted2 = energyPredicted2 + meanT(distrSquare( distrDifference(table1, table2)));
%     end
%    % fprintf('finished with %i \n', i);
% end
% 
% energyPredicted2 = energyPredicted2/2;

end

