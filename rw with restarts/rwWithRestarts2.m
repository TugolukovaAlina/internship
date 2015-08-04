function [samples, selectedSamples ] = rwWithRestarts2(graph, numberOfSamples, alpha)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

samples = zeros(1, numberOfSamples);
selectedSamples = zeros(1, numberOfSamples);


size = length(graph);
counter = 1;

% 1 if on the last step was performed jump
lastJump = 0;

samples(1) = randi([1 size]);


for i = 2:numberOfSamples
    p = rand;
    if p <= alpha/(neighbors(samples(i-1)) + alpha)
        samples(i) = randi([1 size]);
        
        if ~lastJump
            selectSample(samples(i-1));
        end
        selectSample(samples(i));
        numberOfJumps = numberOfJumps + 1; 

        lastJump = 1;
    else
        samples(i) = randomNeighbor(samples(i-1));
        
        
        lastJump = 0;
    end
    
    
end 

[~,~,selectedSamples] = find(selectedSamples);
    
    function num = neighbors(m)
        num = length(graph{1, m});
    end

    function selectSample(sample)
        selectedSamples(counter) = sample;
        counter = counter + 1;
    end

    function node2 = randomNeighbor(node1)
        node2 = graph{1, node1}(randi([1 length(graph{1, node1})]));
    end
end
