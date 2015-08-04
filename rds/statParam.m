function [meanR, varianceR, biasR, errorR1, errorR2] = statParam(samples, realParam)
%returns mean variance, bias and error of estimation parameter realMen,
%accoding to the samples
meanR = mean(samples);
varianceR = var(samples);
biasR = abs(meanR - realParam);
errorR1 = biasR^2 + varianceR;

% squared error (should be the same as error1)
errorR2 = sum((samples - realParam).^2)/length(samples);


end

