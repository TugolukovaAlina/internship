function step = findNeededNumberToDiscard(P, mixingTime, max) 
%I want to improve by taking samples incrementaly

if nargin == 2
    max = 200;
end

%begin with the first node
initialDistribution = zeros (1, length(P));
initialDistribution(randi(length(P))) = 1;


%number is max*length(P) because I want to try to discard up to max values
%and have 10*length(P) values in samples
numberInOne = 10*length(P);

samples = takeSamples(initialDistribution, P, mixingTime + numberInOne); 
samples = samples((mixingTime + 1):(numberInOne + mixingTime));

% samples = takeSamples(initialDistribution, P, number); 

%fprintf('finished to take samples %i length\n', length(samples));

for step = 1:max
      
%I take each 'step' value from samples
    testSamples = samples(step*(1:numberInOne));
    if chiSquareTestMC(testSamples, length(P)) == 0
        [~, pvalue ,~] = chi2gof(testSamples, 'cdf' ,@(z)unidcdf(z, length(P)));
           if pvalue <= 0.05
               fprintf('!!! not uniform step = %i \n', step);
           end
        return;
    end
    
    initialDistribution = zeros (1, length(P));
    initialDistribution(samples(numberInOne)) = 1;

    %generate numberInOne more samples
    samples = cat(2, samples, takeSamples(initialDistribution, P, numberInOne));
end

end