% LinAlg2

% pages 202-203

P = transMatrRW(graphLOF);

pi = degreeDistribution(graphLOF);
PI = ones(length(graphLOF), 1)*pi;

D = diag(pi);

Pstar = D^(1/2)*P*D^(-1/2);

[W, Lstar] = eig(Pstar);
[V, L, U] = eig(P);


U1 = (D^(1/2))*W;
V1 = (D^(-1/2))*W;
