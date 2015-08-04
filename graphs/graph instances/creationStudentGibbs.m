%creationStudentGibbs

workingDir = '/user/atuholuk/home/Documents/MATLAB/RW/graphs/graph instances/';
graphName = 'StudentsGibbs';
% generate graph
% generate fields
%StudentGraphField
fieldsNames = {'random', 'degree', 'T10', 'T15', 'T20', 'T40', 'T100', 'T300'};

fields = zeros(length(fieldsNames), length(graph));
fields(1, :) = randomConfiguration(length(graph), 1:10);
fields(2, :) = graphDegrees(graph);
temp = [10, 15, 20, 40, 100, 300];

for i = 1:length(temp)
    fields(2 + i, :) = createField(graph, 1:10, temp(i), 20);
end

% settings
B = 2000;
C1 = 1;
C2 = 5;
maxToSkip = 50;

creation