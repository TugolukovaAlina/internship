% first: find first-step covariance of RW and use it as rho
% second : use formula from the book 
% third: experimentations

% checkIFKISOK

%GAF
%StudentGraphField
% count covariance of RW on the graph with field
maxLength = 20;
covariance = countCovarianceRW(graph, field, maxLength);
rho = covariance(2)/covariance(1)


B = 1000;
C1 = 1;
C2 = 10;
maxToSkip = 1000;


figure;

[minK, k, variance] = findKtoSkip(B, C1, C2, rho, maxToSkip, var(field));
plot(k, variance, 'LineWidth', 2);hold on;minK

[minK, k, variance] = findKtoSkip2(B, C1, C2, graph, field, maxToSkip);
plot(k, variance, 'LineWidth', 2);hold on;minK

% [minK, k, variance] = findKToSkipExper(B, C1, C2, graph, field, maxToSkip);
% plot(k, variance, 'LineWidth', 2);hold on;minK


legend({'formula1','formula2'}, 'FontSize', 18);
xlabel('number to skip' ,'FontSize', 18);
ylabel('variance of mean' ,'FontSize', 18);