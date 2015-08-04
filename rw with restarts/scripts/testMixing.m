graph = randomGraph(100, 0.1);
P = transMatrMetropolis(graph);
%P = transMatrMaxDegree(graph);
%P = transMatrLD(graph);
%P = ones(100)/100;


initialSamples = takeSamples(0, P, 1000000);

samples = initialSamples(900000:1000000);
%samples = randi(100, [1, 1000000]);


hist(samples, length(P));
[ H, p_value, pchi, pchi2] = chiUniGOF(samples, length(P));
[~, pvalue ,~] = chi2gof(samples, 'cdf' ,@(z)unidcdf(z, length(P)), 'NBIns', 100);
[~, pvalue2 ,~] = chi2gof(samples, 'cdf' ,@(z)unidcdf(z, length(P)));

mixTime = findMixingTime(P);

figure;
samples = initialSamples(1:10:1000000);
hist(samples, length(P));
[ H, rp_value, rchi, rchi2 ] = chiUniGOF(samples, length(P));
[~, rpvalue ,~] = chi2gof(samples, 'cdf' ,@(z)unidcdf(z, length(P)), 'NBIns', 100);
[~, rpvalue2 ,~] = chi2gof(samples, 'cdf' ,@(z)unidcdf(z, length(P)));


% P = transMatrRW(graph);
% 
% samples = takeSamples(0, P, 10000);
% [~, pvalue ,~] = chi2gof(samples, 'cdf' ,@(z)unidcdf(z, length(P)), 'NBIns', 100);
% [ H, p_value ] = chiUniGOF(samples, length(P));
% 
% mixTime = findMixingTime(P);
% mixTime2 = toRestartAvg(P);


% func = cell(1, 2);
% func{1} = @fun1;
% func{2} = @fun2;
% func{3} = @fun3;
% 
% buildPlot(0.05, 0.005, 0.1, @randomGraph, func);





% % taking samples after mixTime
% 
% mixTime = findMixingTime(P);
% mixTime = mixTime + 50;
% 
% initialDistribution = zeros(1, length(P));
% initialDistribution(1) = 1;
% numberInOne = 1000*length(P);
% lastSamples = zeros(1, numberInOne);
% for j = 1 : numberInOne
%    samples = takeSamples(initialDistribution, P, mixTime);
%    lastSamples(j) = samples(mixTime);         
% end
% 
% [ H, p_value ] = chiUniGOF(lastSamples, length(P));
% [~, pvalue ,~] = chi2gof(lastSamples, 'cdf' ,@(z)unidcdf(z, length(P)), 'NBIns', length(P));
% [~, pvalue2 ,~] = chi2gof(lastSamples, 'cdf' ,@(z)unidcdf(z, length(P)));
% hist(lastSamples, length(P));






