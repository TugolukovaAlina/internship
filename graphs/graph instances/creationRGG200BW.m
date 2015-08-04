%creationRGG200BW

%RGG 200 0.13 
workingDir = '/user/atuholuk/home/Documents/MATLAB/RW/graphs/graph instances/';
graphName = 'RGG200BW';
% generate graph
[graph, points] = randomGeometricGraph(200, 0.13);
isConnected(graph)

% generate fields
fieldsNames = {'random', 'T1', 'T2', 'T5', 'T10', 'T20', 'T50', 'T100', 'degrees'};

fields = zeros(length(fieldsNames), length(graph));
fields(1, :) = randomConfiguration(length(graph), 1:2);
temp = [1, 2, 5, 10, 20, 50, 100];

for i = 1:length(temp)
    fields(1 + i, :) = createField(graph, 1:2, temp(i), 20);
end
fields(fields == 2) = 0;
fields(length(fieldsNames), :) = graphDegrees(graph);


% settings
B = 500;
C1 = 1;
C2 = 4;
maxToSkip = 50;

creation