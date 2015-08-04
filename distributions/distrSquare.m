function result = distrSquare(table1)
% square of rv from table

values1 = table1(1, :);
prob1 = table1(2, :);

%squared values
valuesSquared = values1.^2;
% we should delete repeated values
valuesSquaredUnique = unique(valuesSquared);
probSquared = zeros(1, length(valuesSquaredUnique));

for i = 1:length(valuesSquaredUnique) 
    a = valuesSquaredUnique(i);
    probSquared(i) = sum(prob1(valuesSquared == a));
end

result = cat(1, valuesSquaredUnique, probSquared);

end

