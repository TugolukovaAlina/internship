function answer = toRestartAvg2(P, experimentNumber)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
   
if nargin ==1
    experimentNumber = 10;
end

values = zeros(1, experimentNumber);
for i = 1:experimentNumber
    values(i) = findNeededNumberToRestart2(P);
end

answer = mean(values);

end
