% realVarAndNot

% here I wanted to comare real variance and variance of the values
% according to the approximated distribution

% here I build only for one temperature, better use covarianceER

numberOfVertices = 100;
%[graph, points] = chainGraph(numberOfVertices);
%graph = gridOnTorusGraph(numberOfVertices/10, 10);
%radius = 0.13;
%radius = 0.05;
%[graph, points] = randomGeometricGraph(numberOfVertices, radius);
%[graph, points] = graphPA(numberOfVertices, 1);
[graph, points] = randomGraph(numberOfVertices, 0.2);

isConnected(graph)
properties = 1:10;


%approximation
temperature = 100;
distrNodes = zeros(length(graph), length(properties));
variancesApprox = zeros(1, length(graph));

for i = 1:length(graph)
   distrNodes(i, :) = exp(-numberOfNeighbors(graph, i)*(properties - mean(properties)).^2/temperature);
   distrNodes(i, :) = normalize(distrNodes(i, :));
   table = cat(1, properties, distrNodes(i, :));
   variancesApprox(i) = varianceT(table);
end

figure;
bar(variancesApprox)

fprintf('finished 1');

% reality
numberOfExperiments = 1000;

field = zeros(numberOfExperiments, length(graph));
for i = 1:numberOfExperiments
    field(i, :) = createField(graph, properties, temperature, 20, 0);    
    fprintf('finished %i', i);
    
    if mod(i, 50) == 0
        fprintf('\n');
    end
end

fprintf('finished 2');

variancesReal = zeros(1, length(graph));
for i = 1:length(graph)
    variancesReal(i) = var(field(:, i));
end

figure;
bar(variancesReal)

fieldArr = field;
graphArr = graph;

varDegree