% radius = 0.06;
% numberOfNodes = 800;
% [graph, points] = randomGeometricGraph(numberOfNodes, radius);
% 
% avDegree = averageDegree(graph);
% isCon = isConnected(graph);
% properties = [1, 2, 3, 4, 5, 7, 8];
% temperature = 15;
% 
% [field, avProp] = createField(graph, properties, temperature, 20);
% %drawRGGfield(field, points, radius);
% figure;
% drawField(points, field, graph);
% 
% P = transMatrRW(graph);

% to be 95% confident that tha samples mean is within a distance maxErrorIWant
fieldMean = mean(field)
fieldVariance = var(field);
maxErrorIWant = 0.05*fieldMean;
numberInOneMin = ceil(4*fieldVariance/maxErrorIWant);

% random sampling (to calculate design effect)
randomSample = field(randi(length(field), [1, numberInOneMin]));
meanRandomSample = mean(randomSample);

% alpha = 95% confidence interval
%z_alpha/2 : 1.96
z_alpha2 = 1.96;
intLB = meanRandomSample - z_alpha2*sqrt(fieldVariance/numberInOneMin);
intUB = meanRandomSample + z_alpha2*sqrt(fieldVariance/numberInOneMin);
fprintf('confidence interval [%i, %i] ', intLB, intUB);


%initial distribution proportional to degree of node
initialDistr = degreeDistribution(graph);
[samplesRDS, responses] = takeSamples(initialDistr, P, numberInOneMin, @propertyForSample, field);
meanRDS = estimateRDS(samplesRDS, graph, responses)
var(responses)
var(randomSample)

%design effect: var(RDS)/var(SRS) not right, it is not the same variance
designEffect = var(responses)/var(randomSample)

% var(RDS)


% var(SRS)









