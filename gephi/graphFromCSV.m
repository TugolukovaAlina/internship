function graph = graphFromCSV(filename)
% import graph from csv file
%   !!!! in graph indeces of vertices should be proper (not zero,
%   consequent numbers)
if nargin == 0
    filename = '/user/atuholuk/home/Downloads/install/gephi/graph/facebook2.csv';
end

M = csvread(filename);

% leave only 2 columns
M = M(:, [1, 2]);
% number of vertices
numberOfVertices = length(unique(M));

graph = zeros(numberOfVertices, numberOfVertices);

for i = 1:length(M(:,1))
   graph(M(i, 1), M(i, 2)) =  1;
   graph(M(i, 2), M(i, 1)) =  1;
end

end

