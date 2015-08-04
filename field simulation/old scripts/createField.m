function [field, averages, variances, globEnergies] = createField(graph, properties, temperature, numberOfIterations, stat, field)
% assigns to each vertex of a graph value from 'properties' according to
% chosen temperature
%   field - assigned to vertices values
%   averages - mean of field on each step of simulation


if nargin == 5
    field = randomConfiguration(length(graph), properties);
end


averages = zeros(1, numberOfIterations*length(graph) + 1);
averages(1) = mean(field);

variances = zeros(1, numberOfIterations*length(graph) + 1);
variances(1) = var(field);

globEnergies = zeros(1, numberOfIterations*length(graph) + 1);
globEnergies(1) = computeGlobalEnergy(graph, field);

energy = zeros(1, length(properties));

counter = 2;
for j = 1:numberOfIterations
    for i = 1 : length(graph) 
        index = i;
        for k = 1:length(properties)
            field(index) = properties(k);
            energy(k) = computeLocalEnergy(graph, field, index);
        end
        field(index) = chooseProperty(energy, temperature);
        
        if(stat)
            averages(counter) = mean(field);
            variances(counter) = var(field);
            globEnergies(counter) = computeGlobalEnergy(graph, field);
            counter = counter + 1;
        end
    end

    
end

 
end

