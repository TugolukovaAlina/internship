function field = createField(graph, properties, temperature, numberOfIterations, field)
% assigns to each vertex of a graph value from 'properties' according to
% chosen temperature
%   field - assigned to vertices values
%   averages - mean of field on each step of simulation


if nargin == 4
    field = randomConfiguration(length(graph), properties);
end

energy = zeros(1, length(properties));

for j = 1:numberOfIterations
    for i = 1 : length(graph) 
        index = i;
        for k = 1:length(properties)
            field(index) = properties(k);
            energy(k) = computeLocalEnergy(graph, field, index);           
        end
        field(index) = chooseProperty(energy, temperature);
        %field
    end

    
end

 
end

