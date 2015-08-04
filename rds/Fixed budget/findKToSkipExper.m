function [ minK, k, varExper, meanExper ] = findKToSkipExper(B, C1, C2, graph, field, maxToSkip, numberOfWalks )
% find k to skip experimentally 

if nargin == 6
    numberOfWalks = 1000;
end

% make numberOfWalks of random walks collecting samples
numberOfSamples = ceil(B/(C1 + C2/maxToSkip));
responses = zeros(numberOfWalks, numberOfSamples);
P = transMatrRW(graph);
initialDistr = degreeDistribution(graph);
numberOfSamples
for i = 1:numberOfWalks   
    [~, responses(i, :)] = takeSamples(initialDistr, P, numberOfSamples, 0, @propertyForSample, field);
    progress(i, 20);
end

meanExper = zeros(numberOfWalks, maxToSkip);
counter = 1;
for k = 0:(maxToSkip-1)    

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
        meanExper(i, counter) = mean(responses(i, 1:(k+1):(k+1)*(mCUR-1) + 1));

    end
    counter = counter + 1;  
    
end

%varExper = var(meanExper);
varExper = MSE(meanExper, mean(field));

% min function
k = 0:(maxToSkip-1);
[~, index] = min(varExper);
minK = k(index(1));

end