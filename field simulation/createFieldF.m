function field = createFieldF(graph, properties, fraction, numberOfIterations, field)
% assigns to each vertex of a graph value from 'properties' according to
% chosen temperature
%   field - assigned to vertices values
%   averages - mean of field on each step of simulation


if nargin == 4
    field = randomConfiguration(length(graph), properties);
end

energy = zeros(1, length(properties));


temperature = findTemperature(fraction, graph, properties);
fprintf('t - %i \n', temperature);
for j = 1:numberOfIterations
    for i = 1 : length(graph) 
        index = i;
        for k = 1:length(properties)
            field(index) = properties(k);
            energy(k) = computeLocalEnergy(graph, field, index);
        end
        field(index) = chooseProperty(energy, temperature);
        
    end

    
end

 
end

