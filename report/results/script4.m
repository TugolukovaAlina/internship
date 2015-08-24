
graphFacebook = graphFromCSV;
field = createField(graph, 1:10, 20, 10);
B = 3000;
C1 = 1;
C2 = 4;
maxToSkip = 100;
[ minK, k, varExper] = findKToSkipExper(B, C1, C2, graph, field, maxToSkip);

covariance = countCovarianceRW(graph, field, 2);
rho = covariance(2)/covariance(1)

sigma = var(field);
[ minK2, k2, varExpr2 ] = findKtoSkip(B, C1, C2, rho, maxToSkip, sigma);

[ minK3, k3, varExpr3 ] = findKtoSkip2(B, C1, C2, graph, field, maxToSkip);
figure;
plot(k, varExper, 'LineWidth', 2);
hold on
%plot(k2, varExpr2, 'LineWidth', 2);
plot(k3, varExpr3, 'LineWidth', 2);

xlabel('k', 'FontSize', 20)
ylabel('variance of the estimator', 'FontSize', 20)

legend({'experiments', 'formula'}, 'Fontsize', 20);