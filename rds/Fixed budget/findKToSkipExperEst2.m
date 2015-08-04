function [ minK, k, varExper, varExper2] = findKToSkipExperEst2(B, C1, C2, graph, field, maxToSkip, numberOfWalks )
% find k to skip experimentally 

if nargin == 6
    numberOfWalks = 1000;
end

% make numberOfWalks of random walks collecting samples

realValue = mean(field);
numberOfSamples = ceil(B/C1 + 1);


savedSettings2 = evalin('base', 'savedSettings2');
P = evalin('base', 'P');
pi = evalin('base', 'pi');
degreesGr = graphDegrees(graph);

if savedSettings2 == false
    nodes = zeros(numberOfWalks, numberOfSamples);
    for i = 1:numberOfWalks   
        nodes(i, :) = takeSamples(pi, P, numberOfSamples, 0, @propertyForSample, field);
        progress(i, 10);
    end
    
    assignin('base', 'nodes', nodes); 
    assignin('base', 'savedSettings2', true);
    
else
    fprintf('\ntake saved 2 \n');
    nodes = evalin('base', 'nodes');
end
    
responses = field(nodes);
degrees   = degreesGr(nodes);

meanExper = zeros(numberOfWalks, maxToSkip);
meanExper2 = zeros(numberOfWalks, maxToSkip);

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
        
        curNodes =  nodes  (i, 1:(k+1):(k+1)*(mCUR-1) + 1);
        %take only once
        curNodes = unique(curNodes);
        curResponses = field(curNodes);
        curDegrees   = degreesGr(curNodes);
        
%         curResponses =  responses(i, 1:(k+1):(k+1)*(mCUR-1) + 1);
%         curDegrees   =  degrees  (i, 1:(k+1):(k+1)*(mCUR-1) + 1);
        
        meanExper(i, counter) = mean(curResponses);
        meanExper2(i, counter) = estimateRDS(curDegrees, curResponses);

    end
    counter = counter + 1;  
    
end

varExper = MSE(meanExper, realValue);
varExper2 = MSE(meanExper2, realValue);

% min function
k = 0:(maxToSkip-1);
[~, index] = min(varExper);
minK = k(index(1));

end