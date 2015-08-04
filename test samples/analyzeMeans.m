function [meanR, varianceR, biasR, errorR1] = analyzeMeans(samples, realParam)
%returns mean variance, bias and error of estimation parameter realMen,
%accoding to the samples
meanR = mean(samples);
varianceR = var(samples);
biasR = abs(meanR - realParam);
errorR1 = biasR^2 + varianceR;

end

