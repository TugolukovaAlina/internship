function exportToFile(graph, field, fileName, fieldName)
% format of exported graph is GDF
%   Detailed explanation goes here

if nargin == 3
    fieldName = num2cell(1:size(field, 1));
end
%fileID = fopen(cat(2, '/user/atuholuk/home/Dropbox/', fileName),'w');
%fileID = fopen(cat(2, '/user/atuholuk/home/Documents/MATLAB/RW/gephi/files/', fileName),'w');
fileID = fopen(cat(2, '/user/atuholuk/home/Downloads/install/gephi/graph/', fileName, '.gdf'),'w');

fprintf(fileID,'nodedef>name VARCHAR');

for k = 1:size(field, 1)
    fprintf(fileID, strcat(', value', num2str(fieldName{k}), ' INT'));
end

fprintf(fileID, '\n');
 
for i = 1:size(field, 2)
    fprintf(fileID,'s%i',i);
    for k = 1:size(field, 1)
        fprintf(fileID, ', %i', field(k, i));
    end
    fprintf(fileID,'\n');

end


fprintf(fileID,'edgedef>node1 VARCHAR,node2 VARCHAR\n');
for i = 1:size(field, 2)
    for j = i:size(field, 2)
        if graph(i, j) == 1
            fprintf(fileID,'s%i, s%i\n',i, j);
        end
    end
end


fclose(fileID);



% 
% if nargin == 2
%     fileName = 'graph.gdf';
% end
% %fileID = fopen(cat(2, '/user/atuholuk/home/Dropbox/', fileName),'w');
% %fileID = fopen(cat(2, '/user/atuholuk/home/Documents/MATLAB/RW/gephi/files/', fileName),'w');
% fileID = fopen(cat(2, '/user/atuholuk/home/Downloads/install/gephi/graph/', fileName, '.gdf'),'w');
% 
% fprintf(fileID,'nodedef>name VARCHAR, value DOUBLE\n');
% for i = 1:length(field)
%     fprintf(fileID,'s%i, %i\n',i, field(i));
% end
% 
% fprintf(fileID,'edgedef>node1 VARCHAR,node2 VARCHAR\n');
% for i = 1:length(field)
%     for j = i:length(field)
%         if graph(i, j) == 1
%             fprintf(fileID,'s%i, s%i\n',i, j);
%         end
%     end
% end
% 
% fclose(fileID);

end

