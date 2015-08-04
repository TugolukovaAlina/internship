%dependency number of edges and mixing time
% RGG

close all;

% numberOfNodes = 100;
% numberOfSamples = 10;
% min = findMinRadiusRGG(numberOfNodes, 0.999);
% max = 1;
% step = (max - min)/(numberOfSamples-1);
% 
% 
% line1x = min:step:max;
% line1y = zeros (1, floor((max-min)/step) + 1);
% line2y = zeros (1, floor((max-min)/step) + 1);
% 
% uniCost = 20;
% counter = 1;
% for i = min:step:max
%     graph = randomGeometricGraph(100, i);
%     
%     while ~isConnected(graph)
%           graph = randomGeometricGraph(100, i);
%     end
% 
%     
%     avDegree = averageDegree(graph);
%     alpha = avDegree/(uniCost-1) * (1 + sqrt(2*uniCost-1));
% 
%     [line1y(counter),line2y(counter)] = countAlphaAccuracy(graph, alpha);
%    
%     counter = counter + 1;
% end
% 
% plot(line1x, line1y, 'r', line1x, line2y, 'g');
% 
%     


% 
% numberOfNodes = 100;
% numberOfSamples = 20;
% min = 10;
% max = 1010;
% step = (max - min)/(numberOfSamples-1);
% 
% graph = 0;
%  while ~isConnected(graph)
%     graph = randomGeometricGraph(numberOfNodes, findMinRadiusRGG(numberOfNodes, 0.999));
%  end
%     
% line1x = min:step:max;
% line1y = zeros (1, floor((max-min)/step) + 1);
% line2y = zeros (1, floor((max-min)/step) + 1);
% line3y = zeros (1, floor((max-min)/step) + 1);
% 
% counter = 1;
% avDegree = averageDegree(graph);
% 
% for uniCost = min:step:max
%    
%     alpha = avDegree/(uniCost-1) * (1 + sqrt(2*uniCost-1));
%     [line1y(counter),line2y(counter)] = countAlphaAccuracy(graph, alpha);
%     line3y(counter) = line2y(counter) - line1y(counter);
%     counter = counter + 1;
% end
% 
% plot(line1x, line1y, 'r', line1x, line2y, 'g');
% 
% figure;
% plot(line1x, line3y, 'b');



numberOfVertices = 100;
numberOfEdges = 500;
numberOfSamples = 100000;

%graph = gridOnTorusGraph(10, 10);
graph = randomGraphS(numberOfVertices, numberOfEdges);
cellGraph = graphToCells(graph);
avDegree = averageDegree(graph);


min = 10;
max = 100;
step = 10;

line1x = min:step:max;
line1y = zeros (1, floor((max-min)/step) + 1);
line2y = zeros (1, floor((max-min)/step) + 1);
line3y = zeros (1, floor((max-min)/step) + 1);

counter = 1;

for uniCost = min:step:max
   
    alpha = avDegree/(uniCost-1) * (1 + sqrt(2*uniCost-1));
    [samples, selectedSamples, samplesBeforeJump, samplesAfterJump, numberOfJumps, newJumps, samplesTaken] = rwWithRestarts(cellGraph, numberOfSamples, alpha);
    
    deltaTheor = 1/2*(1 + sqrt(2*uniCost - 1)/uniCost);
    
    cost1 = ((numberOfSamples - numberOfJumps)*1 + numberOfJumps*uniCost)/length(selectedSamples);
    cost2 = uniCost;
    deltaEmp = cost1/cost2;

    line1y(counter) = deltaTheor;
    line2y(counter) = deltaEmp;
    line3y(counter) = line2y(counter) - line1y(counter);
    counter = counter + 1;
    
    
    fprintf('%i    %i   \n', deltaTheor, deltaEmp);
end

plot(line1x, line1y, 'r', line1x, line2y, 'g');

    