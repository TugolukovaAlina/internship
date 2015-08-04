function result = distrDifference(tableX, tableY)
% returns distribution of difference of random variables from tableX and tableY 
%   table1,2 contain 2 rows: first - values, second - their probabilities
%   values can be only integers

% I can change that it is not only for integers: I look at all differences
% possible and their porbabilitie, then sort


valuesX = tableX(1, :);
probX = tableX(2, :);

valuesY = tableY(1, :); 
probY = tableY(2, :);

% possible values of difference: 
valuesZ = ( min(valuesX) - max(valuesY) ):1:( max(valuesX) - min(valuesY) );
%values3 = - (length(values2) - 1):1:(length(values1) - 1);
probZ = zeros(1, length(valuesZ));

minX = min(valuesX);
maxX = max(valuesX);
minY = min(valuesY);
maxY = max(valuesY);

for i = 1:length(valuesZ) 
    a = valuesZ(i);
    probZ(i) = 0;
 
    for b = max([minY, minX-a]):1: min([maxX-a, maxY])
        if ~isempty(probY(valuesY == b)) && ~isempty(probX(valuesX == a + b))
            probZ(i) = probZ(i) + probY(valuesY == b)*probX(valuesX == a + b);
        end
    end
end

% don't take values with 0 probabilities
indeces = (probZ > 0);
probZ = probZ(indeces);
valuesZ = valuesZ(indeces);

% for i = 1:length(values3) 
%     a = values3(i);
%     prob3(i) = 0;
% 
%     m = length(values1);
%     n = length(values2);
%     for j = max([1, 1-a]):1: min ([m-a,n])
%         b = j;
%         prob3(i) = prob3(i) + prob2(values2 == b)*prob1(values1 == a + b);
%     end
% end

result = cat(1, valuesZ, probZ);

end

