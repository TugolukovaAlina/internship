% degreeEstimator
% make numberOfWalks of random walks collecting samples


%GAF;
numberOfWalks = 1;
realValue = mean(field);
numberOfSamples = ceil(B/C1 + 1);
responses = zeros(numberOfWalks, numberOfSamples);
degrees = zeros(numberOfWalks, numberOfSamples);
nodes = zeros(numberOfWalks, numberOfSamples);

P = transMatrRW(graph);
initialDistr = degreeDistribution(graph);
for i = 1:numberOfWalks   
    [nodes(i, :),  responses(i, :), degrees(i, :)] = takeSamples(initialDistr, P, numberOfSamples, graph, @propertyForSample, field);
    progress(i, 100);
end



meanExper = zeros(numberOfWalks, maxToSkip);
meanExper2 = zeros(numberOfWalks, maxToSkip);

counter = 1;


for k = 40 
%for k = 0:(maxToSkip-1) 

    %number of steps
    n = ceil(B*(k+1)/(C1*(k+1) + C2));
        
    %number of participants
    m = B/(C1*(k+1) + C2); 
    
    % I want that on average I have m participants, so with probability (m -
    % floor(m)) I choose ceil(m) participants, otherwise floor(m)
    % participants
    
    for i = 1:numberOfWalks
        if rand < m - floor(m)
            mCUR = ceil(m);
        else
            mCUR = floor(m);
        end
        % I take each (k+1) node as a participant. In other words I skip k
        % nodes
        
        %curResponses =  degrees  (i, 1:(k+1):(k+1)*(mCUR-1) + 1);
        curResponses =  responses(i, 1:(k+1):(k+1)*(mCUR-1) + 1);
        curDegrees   =  degrees  (i, 1:(k+1):(k+1)*(mCUR-1) + 1);
        curNodes     =  nodes    (i, 1:(k+1):(k+1)*(mCUR-1) + 1);
        
        meanExper(i, counter) = mean(curResponses);
        meanExper2(i, counter) = estimateRDS(curDegrees, curResponses);

    end
    counter = counter + 1;  
    
end


%realValue = mean(graphDegrees(graph));
% varExper = var(meanExper);
% varExper2 = var(meanExper2);
varExper = MSE(meanExper, realValue);
varExper2 = MSE(meanExper2, realValue);

% min function
k = 0:(maxToSkip-1);
[~, index] = min(varExper);
minK = k(index(1));
