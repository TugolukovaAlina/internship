function answer = varianceT( table )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

meanT2 = sum(table(1, :).^2.* table(2, :)); 
answer =  meanT2 - meanT(table)^2;

end

