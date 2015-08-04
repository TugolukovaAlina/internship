% illustration4, big RGG graph with different temperature


[graph, points] = randomGeometricGraph(200, 0.13);

if ~isConnected(graph)
   fprintf('not connected \n'); 
end
properties = 1:6;
fieldRand = randomConfiguration(length(graph), properties);

temperature = [0.01, 0.05, 1, 2, 4, 8, 15, 20, 100, 1000];
fields = [];

for i = 1:length(temperature)
   curField = createField(graph, properties, temperature(i), 40, fieldRand);
   fields = cat(1, fields, curField); 
   
   covariance = countCovarianceRW(graph, curField, 2);
   rho = covariance(2)/covariance(1)
end


% in order to have in gephi all colors I add two points with caules 1 and 6
graph = blkdiag(zeros(2), graph);
fields = cat(2, ones(size(fields, 1), 1)*min(properties), ones(size(fields, 1), 1)*max(properties), fields);

exportToFile(graph, fields, 'bigRGG');