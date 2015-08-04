%b formulaOnTheField

%graph = randomGeometricGraph(200, 0.13);
graph = randomGraph(200, 0.1);

if ~isConnected(graph)
    fprintf('Not connected!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
end

n = 100;
l = 100;
rho = 0;

sum = zeros(1, l);
for i = 1:n
    field = createField(graph, 1:10, 10, 20);
    
    covariance = countCovarianceRW(graph, field, l);
    rho = rho + covariance(2)/covariance(1);
    
    sum = sum + covariance/covariance(1);
   % fprintf('%i ', rho);
end

rho = rho/n;

cov1 = rho.^(0:(l-1));
cov2 = sum/n;

figure;
plot(1:n, cov1, 1:n, cov2);