function result = distrDifference2(tableX, tableY)
% returns distribution of difference of random variables from tableX and tableY 
%   table1,2 contain 2 rows: first - values, second - their probabilities
%   values can be NOT only integers

% I can change that it is not only for integers: I look at all differences
% possible and their porbabilitie, then sort


valuesX = tableX(1, :);
probX = tableX(2, :);

valuesY = tableY(1, :); 
probY = tableY(2, :);

% possible values of difference: 
valuesZ = Inf(1, length(valuesX)*length(valuesY));
probZ   = zeros(1, length(valuesX)*length(valuesY));


k = 1;
for i = 1:length(valuesX) 
    for j = 1:length(valuesY)
        z = valuesX(i) - valuesY(j);
        
        % here I should write find(valuesZ == z) but matlab sometimes think
        % of the same values as of different
        indexZ = find(abs(valuesZ - z) < 0.000001);
            
        if isempty(indexZ)
           indexZ = k;
           k = k + 1;
        end
        
        valuesZ(indexZ) = z;
        probZ(indexZ) = probZ(indexZ) + probX(i)*probY(j); 
    end
end

% don't take values with 0 probabilities
indeces = (probZ > 0);
probZ = probZ(indeces);
valuesZ = valuesZ(indeces);

% sort according to values
[valuesZ, indeces] = sort(valuesZ);
probZ = probZ(indeces);

result = cat(1, valuesZ, probZ);

end

