function fields = createFieldSaveAllFields(graph, properties, temperature, numberOfIterations, field)
% assigns to each vertex of a graph value from 'properties' according to
% chosen temperature
%   field - assigned to vertices values
%   averages - mean of field on each step of simulation


if nargin == 4
    field = randomConfiguration(length(graph), properties);
end

energy = zeros(1, length(properties));
fields = zeros(numberOfIterations*length(graph), length(graph));
c = 1;
for j = 1:numberOfIterations
    for i = 1 : length(graph) 
        index = i;
        oldValue = field(index);
        for k = 1:length(properties)
            field(index) = properties(k);
            energy(k) = computeLocalEnergy(graph, field, index);           
        end
        field(index) = chooseProperty(energy, temperature);

        
% uncomment if you want only different fields
%        if oldValue ~= field(index)
            fields(c, :) = field;
            c = c + 1;
%        end
        %field
    end

    
end


% uncomment if you want only different fields
%fields = fields(any(fields, 2),:);
 
end
