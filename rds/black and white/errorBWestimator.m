function [ error ] = errorBWestimator(B, C1, C2, graph, field, numberOfWalks)
%ERRORBWESTIMATOR Summary of this function goes here
%   Detailed explanation goes here

if nargin == 5
    numberOfWalks = 1000;
end


numberOfSamples = floor(B/(C1 + C2));

savedSettings2 = evalin('base', 'savedSettings2');

if savedSettings2 == false
    P = transMatrRW(graph);
    initialDistr = degreeDistribution(graph);

    nodes = zeros(numberOfWalks, numberOfSamples);
    for i = 1:numberOfWalks   
        [nodes(i, :)] = takeSamples(initialDistr, P, numberOfSamples, graph, @propertyForSample, field);
        progress(i, 100);
    end  
else
    nodes = evalin('base', 'nodes');
end

degreesGr = graphDegrees(graph);
responses = field(nodes);
degrees   = degreesGr(nodes);

sumError = 0;
for i = 1:numberOfWalks
    curResponses = responses(i, 1:numberOfSamples); 
    curDegrees   = degrees  (i, 1:numberOfSamples);

    [~, error] = findProportionOfWhite(curResponses, curDegrees, field);
    sumError = sumError + error;
    progress(i, 100);
end

% result
error = sumError/numberOfWalks;


% P = transMatrRW(graph);
% initialDistr = degreeDistribution(graph);
% numberOfSamples = ceil(B/(C1 + C2));
% 
% sumError = 0;
% for i = 1:numberOfWalks
%     [~, responses, degrees] = takeSamples(initialDistr, P, numberOfSamples, graph, @propertyForSample, field);
%     [~, error] = findProportionOfWhite(responses, degrees, field);
%     sumError = sumError + error;
%     progress(i, 20);
% end
% 
% % result
% error = sumError/numberOfWalks;

end

