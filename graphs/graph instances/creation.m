%creation



%-----------------------------------------------------------------------------------------------------

%working space
mkdir(workingDir, graphName)
workingDir = cat(2, workingDir, '/', graphName, '/');

%export to GDF for gephi
exportToFile(graph, fields, graphName, fieldsNames)

% for each field
for i = 1:size(fields, 1)
    % draw graph if I want
    fieldName = fieldsNames{i};
    field = fields(i, :);
    %drawAndSaveField(points, field, graph, workingDir, fieldName);

    % do analysis
    analyzeEstimators(B, C1, C2, graph, field, maxToSkip, workingDir, fieldName)
    close all;
end

%save(strcat(workingDir, 'variables.mat'), 'B', 'C1', 'C2', 'maxToSkip', 'P', 'pi', 'L', 'V', 'initialDistr', 'graph', 'fields', 'workingDir');


% count bias
biasSq = zeros(1, size(fields, 1));
for i = 1:size(fields, 1)
    f = fields(i, :);
    biasSq(i) = (sum(f .* pi) - mean(f))^2;
end
% dependency of degrees
degrees = graphDegrees(graph);
for i = 1:size(fields, 1)
    fieldName = fieldsNames{i};
    figure; [x, y] = myhist(degrees, fields(i, :)); scatter(x, y)
    fileName = cat(2, workingDir, 'degreesVS', fieldName);
    print(fileName,'-djpeg','-r0');
    savefig(cat(2, fileName, '.fig'));
    close all;
end

save(strcat(workingDir, 'variables.mat'));

%---------------------------------------------------------------------------

% % save graph abd field to CSV
% graphToCSV(graph, workingDir)
% fieldToCSV(fields, strcat(workingDir, 'all'));
%     % save field
%     fieldToCSV(field, strcat(workingDir, fieldName));