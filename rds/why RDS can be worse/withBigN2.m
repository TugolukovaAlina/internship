% withBigN2
% we skip 10


realValue = mean(field);

% from size 10 by 10 until 
minN = 10;
stepN = 10;
maxN = 2000;


degrees = graphDegrees(graph);


[lineX, lineY] = linesXY(minN, stepN, maxN);

meanExper = zeros(numberOfWalks, length(lineX));
meanExper2 = zeros(numberOfWalks, length(lineX));

counter = 1;
numberOfWalks = 1000;
for n = minN:stepN:maxN
    
    for i = 1:numberOfWalks

        randomNodes = randi(length(graph), [1, n]);
                
        curResponses = field(randomNodes);
        curDegrees   = degrees(randomNodes);
        
        meanExper (i, counter) = mean(curResponses);
        meanExper2(i, counter) = estimateRDS(curDegrees, curResponses);

    end
    counter = counter + 1;  
    
end

errorExper  = MSE(meanExper,  realValue);
errorExper2 = MSE(meanExper2, realValue);

figure;
plot(lineX, errorExper, lineX, errorExper2);
legend('mean','RDS');