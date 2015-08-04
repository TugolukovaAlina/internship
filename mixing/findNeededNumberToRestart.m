function rtime = findNeededNumberToRestart(P, min , max) 

%min max rtime
if nargin == 1
    min = 2;
    max = 150;
end

%begin with the first node
initialDistribution = zeros (1, length(P));
initialDistribution(randi(length(P))) = 1;

numberInOne = 10*length(P);
lastSamples = zeros(1, numberInOne);

for rtime = min:max

    %initialDistribution = ones(1, length(P))/length(P);
    
    for j = 1 : numberInOne
        samples = takeSamples(initialDistribution, P, rtime);
        lastSamples(j) = samples(rtime);         
    end
    
   %if chiUniGOF(lastSamples, length(P)) == 0
   [~, pvalue] = chiUniGOF(lastSamples, length(P));
   if pvalue > 0.05
       return;
   end
end

end
