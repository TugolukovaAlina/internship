close all;
numberOfVertices = 100;
numberOfEdges = 500;
numberOfSamples = 100000;

%graph = gridOnTorusGraph(10, 10);
graph = randomGraphS(numberOfVertices, numberOfEdges);
avDegree = averageDegree(graph);
uniCost = 20;
%deltaTheor = countDeltaForCost(uniCost);
%[alpha2, alpha] = countAlpha(deltaTheor, uniCost, avDegree);


deltaTheor = 1/2*(1 + sqrt(2*uniCost - 1)/uniCost);
%alpha = avDegree*(2*deltaTheor*uniCost - uniCost - 1)/(2*(uniCost - deltaTheor*uniCost));
alpha = avDegree/(uniCost-1) * (1 + sqrt(2*uniCost-1));


cellGraph = graphToCells(graph);

%[samples, selectedSamples, samplesBeforeJump, samplesAfterJump, numberOfJumps, newJumps, samplesTaken] = rwWithRestarts(cellGraph, numberOfSamples, alpha);
[samples, selectedSamples, samplesBeforeJump, samplesAfterJump, numberOfJumps, newJumps, samplesTaken] = stepRestart(cellGraph, numberOfSamples, alpha);
%[samples, selectedSamples, samplesBeforeJump, samplesAfterJump, numberOfJumps, newJumps, samplesTaken] = stepRestartMaxDegree(cellGraph, numberOfSamples, alpha);

cost1 = ((numberOfSamples - numberOfJumps)*1 + numberOfJumps*uniCost)/length(selectedSamples);
cost2 = uniCost;

deltaEmp = cost1/cost2;

[~, pvalue ,~] = chi2gof(samples, 'cdf' ,@(z)unidcdf(z, numberOfVertices));
if pvalue <= 0.05
   fprintf('!!! not uniform 0 \n');
end

% first length(selectedSamples) samples
[~, pvalue ,~] = chi2gof(samples(1:length(selectedSamples)), 'cdf' ,@(z)unidcdf(z, numberOfVertices));
if pvalue <= 0.05
   fprintf('!!! not uniform 1 \n');
end

% last length(selectedSamples) samples
[~, pvalue ,~] = chi2gof(samples(length(samples)-length(selectedSamples) + 1:length(samples)), 'cdf' ,@(z)unidcdf(z, numberOfVertices));
if pvalue <= 0.05
   fprintf('!!! not uniform 2 \n');
end

% each second sample
[~, pvalue ,~] = chi2gof(samples(1:2:length(samples)), 'cdf' ,@(z)unidcdf(z, numberOfVertices));
if pvalue <= 0.05
   fprintf('!!! not uniform 3 \n');
end

% half samples / half random values
[~, pvalue ,~] = chi2gof(cat(2, samples(1:floor(length(selectedSamples)/2)), randi([1 numberOfVertices], 1, ceil(length(selectedSamples)/2))), 'cdf' ,@(z)unidcdf(z, numberOfVertices));
if pvalue <= 0.05
   fprintf('!!! not uniform 4 \n');
end


if numberOfVertices <= 200
    if chiSquareTestMC(selectedSamples, numberOfVertices) == 0
        fprintf('independent 1\n');
    end

    if chiSquareTestMC(samplesBeforeJump, numberOfVertices) == 0
        fprintf('independent 2\n');
    end

    if chiSquareTestMC(samplesAfterJump, numberOfVertices) == 0
        fprintf('independent 3\n');
    end
end
    

[~, pvalue ,~] = chi2gof(selectedSamples, 'cdf' ,@(z)unidcdf(z, numberOfVertices));
if pvalue <= 0.05
   fprintf('!!! not uniform 5 \n');
end

% only samples before jump
[~, pvalue ,~] = chi2gof(samplesBeforeJump, 'cdf' ,@(z)unidcdf(z, numberOfVertices));
if pvalue <= 0.05
   fprintf('!!! not uniform 6 \n');
end

% only samples after jump
[~, pvalue ,~] = chi2gof(samplesAfterJump, 'cdf' ,@(z)unidcdf(z, numberOfVertices));
if pvalue <= 0.05
   fprintf('!!! not uniform 7 \n');
end


figure;
subplot(2, 2, 1);
hist(samples, 100);

subplot(2, 2, 2);
hist(selectedSamples, 100);

subplot(2, 2, 3);
hist(samplesBeforeJump, 100);

subplot(2, 2, 4);
hist(samplesAfterJump, 100);


% sum1 = 0;
% sum2 = 0;
% for i = 1:numberOfVertices
%     sum1 = sum1 + (numberOfNeighbors(graph, i)/(numberOfNeighbors(graph, i) + alpha))/numberOfVertices;
%     sum2 = sum2 + (alpha/(numberOfNeighbors(graph, i) + alpha))/numberOfVertices;
% end
% 
% 
% d = alpha/(avDegree + alpha);
% 
% 
% numNew = 2*numberOfSamples*d*sum1;
% numOld = numberOfSamples*d*sum2;
% numSamples =  numNew + numOld;

% numSamples4 =  numberOfSamples*d*sum1^2* (2 + 3*sum2 + 4*sum2^2 + 5*sum2^3 + 6*sum2^4);
% numSingleSamples =  numberOfSamples* ( (alpha/(avDegree + alpha)) * (sum1) );
% numSingleSamples =  numberOfSamples* ( avDegree*alpha/(avDegree + alpha)^2 );
% numSamples =  numberOfSamples* ( (alpha/(avDegree + alpha))^2 + 2*avDegree*alpha/(avDegree + alpha)^2 );
% numSamples2 =  numberOfSamples* ( alpha*(2*avDegree + alpha) /( avDegree * (avDegree + alpha)) );
% 
% d = alpha/(avDegree + alpha);
% f = avDegree/(avDegree + alpha);
% numSamples3 =  numberOfSamples*f* (2*d + 3*d*d + 4*d*d*d);
% numJump = numberOfSamples* ( alpha/(avDegree + alpha));


% hist(samples, length(samples));
% 
% y = zeros(1, numberOfVertices);
% for i = 1:numberOfVertices
%      y(i) = (numberOfNeighbors(graph, i) + alpha)/(2*numberOfEdges + numberOfVertices*alpha); 
% end
% 
% figure;
% bar(y);

