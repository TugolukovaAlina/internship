% compCovar

% compare covariances from 2 formulas

GAF

pi = degreeDistribution(graph);
PI = ones(length(graph), 1)*pi;
f = field;

cov2 = zeros(1, 20);
for l = 1:20
    cov2(l) =( mult(f, pi, ((P^l - PI)*f')'));
end

l = 1:20;
cov1 =( mult(f, pi, ((P - PI)*f')')) .^ l;

figure;
plot(l, cov1, l, cov2)
legend('f1', 'f2')