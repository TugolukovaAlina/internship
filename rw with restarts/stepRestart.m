function [samples, selectedSamples, samplesBeforeJump, samplesAfterJump, numberOfJumps, newJumps, samplesTaken] = stepRestart(graph, numberOfSamples, alpha)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

samples = zeros(1, numberOfSamples);
selectedSamples = zeros(1, numberOfSamples);
samplesBeforeJump = zeros(1, round(numberOfSamples/2));
samplesAfterJump = zeros(1, round(numberOfSamples/2));

numberOfJumps = 0;
newJumps = 0;

size = length(graph);
counter = 1;
counter2 = 1;
counter3 = 1;

% 1 if on the last step was performed jump
lastJump = 0;

samples(1) = randi([1 size]);

samplesTaken = zeros(1, 10*numberOfSamples);
samplesTaken(1) = -1;

dmax = maxDegree(graph);
for i = 2:numberOfSamples

    if mod(i, 2) == 0
        samples(i) = randi([1 size]);
        
        if ~lastJump
            selectSample(samples(i-1));
            
            samplesTaken(counter3) = 1;
            counter3 = counter3 + 1;
            
            newJumps = newJumps + 1;
        end
        selectSample(samples(i));
               
        numberOfJumps = numberOfJumps + 1; 
                
        samplesBeforeJump(counter2) = samples(i-1);
        samplesAfterJump(counter2) = samples(i);
        counter2 = counter2 + 1;
        
        
        samplesTaken(counter3) = 1;
        counter3 = counter3 + 1;
        
        lastJump = 1;
    else
        
%         samples(i) = randomNeighbor(samples(i-1));
        
        %choose according to max degree
%         p = rand;
%         if p <  neighbors(samples(i-1))/dmax
%             samples(i) = randomNeighbor(samples(i-1));
%         else
%             samples(i) = samples(i-1);
%         end
        
        
        %choose according to metropolis hasting
        p = rand;
        samples(i) = randomNeighbor(samples(i-1));
        if p >  neighbors(samples(i-1))/neighbors(samples(i))
            samples(i) = samples(i-1);
        end
        
        
        samplesTaken(counter3) = -1;
        counter3 = counter3 + 1;
        samplesTaken(counter3) = -1;
        counter3 = counter3 + 1;
        
        lastJump = 0;
    end
    
    
end 

[~,~,selectedSamples] = find(selectedSamples);
[~,~,samplesBeforeJump] = find(samplesBeforeJump);
[~,~,samplesAfterJump] = find(samplesAfterJump);
[~,~,samplesTaken] = find(samplesTaken);
    
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
