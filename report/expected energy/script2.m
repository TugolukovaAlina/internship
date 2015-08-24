
%field = randomConfiguration(length(graph), 1:5);
fields = createFieldSaveAllFields(graph, 1:5, 2, 50, field);

energy = zeros(1, size(fields, 1));
for i = 1:size(fields, 1) 
    energy(i) = computeGlobalEnergy(graph, fields(i, :));
end

figure
plot(1:length(energy), energy);

xlabel('Iteration', 'FontSize', 20);
ylabel('Global energy', 'FontSize', 20);