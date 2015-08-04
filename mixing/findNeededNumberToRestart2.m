function rtime = findNeededNumberToRestart2(P, min , max) 

%min max rtime
if nargin == 1
    min = 4;
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
   if chiSquareTestMC(lastSamples, length(P)) == 0
       return;
   end
end

end
