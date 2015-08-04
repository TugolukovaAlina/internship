function [samples, sampleResponse, sampleDegree] = takeSamples(initialDistribution, P, number, graph, response, param)


% response is response variable on each selected sample
% sampleResponse to collect response variables from all taken samples 

if initialDistribution == 0
    initialDistribution = zeros(1, length(P));
    initialDistribution(randi(length(P))) = 1;
end

samples = zeros(1, number);
%generate first sample
samples(1) = generateRV(initialDistribution);

for i = 2:number
    %acually isSymmetric should be used, but to perform is Symmetric is
    %expensive, so I suppose that matrix is symmetric 
  if (issparse(P))
      samples(i) = generateRV(P (:, samples(i-1))); % take the i-1 column, the same because symetric, but computations are much quicker
  else
      samples(i) = generateRV(P (samples(i-1), :)); % take the i-1 row
  end
end

if nargin > 3
    
    sampleDegree = zeros(1, number);
    sampleResponse = zeros(1, number);
    for i = 1:number
       sampleResponse(i) = response(samples(i), param); 
    end
    
    if nnz(graph) ~= 0
        for i = 1:number 
            sampleDegree(i) = numberOfNeighbors(graph, samples(i));
        end
    end
end

end