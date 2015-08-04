function answer = toDiscardAvg(P, mixingTime, experimentNumber)
% how many samples produced by P should I discard to have them independent

if nargin == 1
    mixingTime =  findMixingTime(P);
end

if nargin <= 2
    experimentNumber = 10;
end


values = zeros(1, experimentNumber);
for i = 1:experimentNumber
    values(i) = findNeededNumberToDiscard(P, mixingTime);
end

answer = mean(values);

end

