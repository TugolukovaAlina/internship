% corrOnTheFly

%GAF
%Project90GraphField

B = 6000;
C1 = 1;
C2 = 9;
maxToSkip = 100;


P = transMatrRW(graph); 

numberOfSamples = 1000;
L = 100;
%[ covariance ] = countCovarianceRW(graph, field, L, P);
initialDistr = degreeDistribution(graph);

[~, responses] = takeSamples(initialDistr, P, numberOfSamples, 0, @propertyForSample, field);

covariancePr = [var(responses) var(responses)*acf(responses', L-1)'];

% figure;
% plot(1:L, covariance, 1:L, covariancePr);
% legend('covTheor', 'covPractice');

figure;
[minK1, k1, fk1] = findKtoSkip2(B, C1, C2, graph, field, maxToSkip); minK1
plot(k1, fk1)


[minK2, k2, fk2] = findKtoSkipKnownCov(B, C1, C2, covariancePr, maxToSkip); minK2
hold on;
plot(k2, fk2)
legend('real', 'approx');
