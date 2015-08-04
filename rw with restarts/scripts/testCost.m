numberOfVertices = 100;
numberOfEdges = 500;
numberOfSamples = 100000;

%graph = gridOnTorusGraph(10, 20);
graph = randomGraphS(numberOfVertices, numberOfEdges);
avDegree = averageDegree(graph);
cellGraph = graphToCells(graph);
uniCost = 20;


min = (uniCost + 1)/(2*uniCost);
step = 0.04;
max = 0.98;

X = min:step:max;
Y = zeros (1, round((max-min)/step) + 1);

counter = 1;
for delta = min:step:max
        
    [alpha, alpha2] = countAlpha(delta, uniCost, avDegree);
    [samples, selectedSamples, samplesBeforeJump, samplesAfterJump, numberOfJumps, newJumps, samplesTaken] = rwWithRestarts(cellGraph, numberOfSamples, alpha);
    cost1 = ((numberOfSamples - numberOfJumps)*1 + numberOfJumps*uniCost)/length(selectedSamples);
    cost2 = uniCost;

    deltaEmp = cost1/cost2;
    Y(counter) = deltaEmp;
    
    counter = counter + 1;
end

plot(X, Y);