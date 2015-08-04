function [ covariance ] = countCovarianceRW(graph, field, maxLength, P)
% count theoretical covariance of rw on the given graph and field
% until maxLength distance between samples

if nargin == 3
    P = transMatrRW(graph);
end

pi = degreeDistribution(graph);
f = field;
PI = ones(length(graph), 1)*pi;
Pl = eye(length(graph));
covariance = zeros(1, maxLength);
for l = 0:(maxLength-1)
    covariance(l+1) =  mult(f, ((Pl - PI)*f')' , pi); 
    Pl = Pl*P;
end

%correlation = covDist/covDist(1);


end

