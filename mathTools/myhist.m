function [X, Y] = myhist(values1, values2)
% for each of values1 I count the average from corresponding values2

size = length(unique(values1));

X = inf(1, size);
Y = inf(1, size);

counter = 1;
for i = 1:length(values1)
   
   k = values1(i);
    
   if isempty(find(X == k, 1))
        curValInds = find(values1 == k);
        X(counter) = k;
        Y(counter) = sum(values2(curValInds))/length(values2(curValInds));
        
        counter = counter + 1;
   end
end


end

