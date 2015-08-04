function globEnergy = calculateEmpEnergy(graph, properties, temperature, numberOfExperiments)
% calculates the mean of energy with given temperature

if nargin == 3
    numberOfExperiments = 50;
end

globEnergy = zeros(1, length(temperature));

for i = 1:length(temperature)
    for j = 1:numberOfExperiments
        field = createField(graph, properties, temperature(i), 20);
        globEnergy(i) = globEnergy(i) + computeGlobalEnergy(graph, field);
    end
end

globEnergy = globEnergy/numberOfExperiments;

end

