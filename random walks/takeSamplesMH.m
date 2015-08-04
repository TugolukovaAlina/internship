function [samples, sampleResponse] = takeSamplesMH(startNode, graph, numberOfSamples, response, param)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

samples = zeros(1, numberOfSamples);
size = length(graph);

if startNode == 0
    samples(1) = randi([1 size]);
else
    samples(1) = startNode;
end


for i = 2:numberOfSamples
    p = rand;
    samples(i) = randomNeighbor(graph, samples(i-1));
    if p >  numberOfNeighbors(graph, samples(i-1))/numberOfNeighbors(graph, samples(i))
        samples(i) = samples(i-1);
    end
end 

sampleResponse = zeros(1, numberOfSamples);
if nargin > 3   
    sampleResponse = zeros(1, numberOfSamples);
    for i = 1:numberOfSamples
       sampleResponse(i) = response(samples(i), param); 
    end
end

% figure
% hist(samples, length(graph));
% 
% distr = zeros(1, length(graph));
% for i = 1:length(graph)
%     distr(i) = numberOfNeighbors(graph, i);
% end
% figure
% bar(distr);

end
