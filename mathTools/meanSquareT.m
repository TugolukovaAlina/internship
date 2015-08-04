function meanT2 = meanSquareT( table )
% mean value of suqare of rv from table
meanT2 = sum(table(1, :).^2.* table(2, :)); 
end

