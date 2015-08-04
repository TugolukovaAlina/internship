function fieldToCSV(field, fileName)


nameFIELD = cat(2, fileName, 'FIELD.csv');
csvwrite(nameFIELD, field, 0, 0);


% export field csv file
%   !!!! in graph indeces of vertices should be proper (not zero,
%   consequent numbers)
% if nargin == 1
%     filename = '/user/atuholuk/home/Downloads/install/gephi/graph/facebookField.csv';
% end
% 
% numberOfVertices = length(field);
% 
% ids = 1:numberOfVertices;
% M = cat(2, transpose(ids), transpose(field));
% csvwrite(filename, M, 1, 0);

end

