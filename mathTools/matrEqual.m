function isequal = matrEqual( A, B )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    isequal = sum(sum(abs(A - B))) < 0.000001
    sum(sum(abs(A - B)))
end

