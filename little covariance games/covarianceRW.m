% covarianceRW

% a lot of rw on the same field what is the covariance between samples

%GAF;
field = fieldCell{4};
field = field(1, :);

numberOfSamples = 20;
P = transMatrRW(graph);

numberOfWalks = 1000;
samples = zeros(numberOfWalks, numberOfSamples);
responses = zeros(numberOfWalks, numberOfSamples);

for i = 1:numberOfWalks
    initDistr = degreeDistribution(graph);
    %initDistr = oneNodeDistribution(length(graph));
    
    %field = field(randi(size(field, 1)), :);
    [samples(i, :), responses(i, :)] = takeSamples(initDistr, P, numberOfSamples, 0, @propertyForSample, field);
end

covarRW = cov(responses);

% built cov depending on distance
distances = zeros(numberOfSamples, numberOfSamples);
for i = 1:numberOfSamples
    distances(i, :) = (-(i-1)):(numberOfSamples-i);
end
distances = abs(distances);


figure;
[X, Y] = myhist(distances(1:numberOfSamples*numberOfSamples) , covarRW(1:numberOfSamples*numberOfSamples) );
bar(X, Y/Y(1))

covDistExper = Y

figure;
scatter(distances(1:numberOfSamples*numberOfSamples) , covarRW(1:numberOfSamples*numberOfSamples));

covarianceRWTheor