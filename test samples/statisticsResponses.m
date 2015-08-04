function [meanR, varianceR, biasR, errorR1] = statisticsResponses(initialDistr, P, field, numberOfResponses, step, numberOfExperiments)
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
realMean = mean(field);
means = zeros(1, numberOfExperiments);
for i = 1:numberOfExperiments
    [~, response] = takeSamples(initialDistr, P, numberOfResponses*step, @propertyForSample, field);
    response = response(step*(1:numberOfResponses));
    means(i) = mean(response);
end

meanR = mean(means);
varianceR = var(means);
biasR = abs(meanR - realMean);
errorR1 = biasR^2 + varianceR;

hist(means);
end

