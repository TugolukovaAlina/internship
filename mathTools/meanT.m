function answer = meanT( table )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

answer = sum(table(1, :).* table(2, :));

end

