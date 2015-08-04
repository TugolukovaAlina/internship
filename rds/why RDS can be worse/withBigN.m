% withBigN
% we skip 10


realValue = mean(field);

numberOfWalks = 1000;
P = transMatrRW(graph);
initialDistr = degreeDistribution(graph);

k = 5;
% from size 10 by 10 until 
minN = (k-1)*10 + 1;
stepN = k*10;
maxN = k*4000 + 1;


responses = zeros(numberOfWalks, maxN);
degrees = zeros(numberOfWalks, maxN);
for i = 1:numberOfWalks   
    [~,  responses(i, :), degrees(i, :)] = takeSamples(initialDistr, P, maxN, graph, @propertyForSample, field);
    progress(i, 100);
end

[lineX, lineY] = linesXY(minN, stepN, maxN);

meanExper = zeros(numberOfWalks, length(lineX));
meanExper2 = zeros(numberOfWalks, length(lineX));

counter = 1;

for n = minN:stepN:maxN
    
    for i = 1:numberOfWalks

        curResponses =  responses(i, 1:k:n);
        curDegrees   =  degrees  (i, 1:k:n);
                
        meanExper(i, counter) = mean(curResponses);
        meanExper2(i, counter) = estimateRDS(curDegrees, curResponses);

    end
    
    lineX(counter) = length(1:k:n);
    length(curResponses)
    counter = counter + 1;  
    
end


%realValue = mean(graphDegrees(graph));
% varExper = var(meanExper);
% varExper2 = var(meanExper2);
varExper = MSE(meanExper, realValue);
varExper2 = MSE(meanExper2, realValue);

figure;
plot(lineX, varExper, lineX, varExper2);
legend('mean','RDS');