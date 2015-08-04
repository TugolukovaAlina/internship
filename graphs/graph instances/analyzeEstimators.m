function analyzeEstimators (B, C1, C2, graph, field, maxToSkip, nameGraphDir, nameField)

[minK2, k, fk3]         = findKtoSkip2          (B, C1, C2, graph, field, maxToSkip); minK2
[minK1, ~, fk1, fk2]    = findKToSkipExperEst2  (B, C1, C2, graph, field, maxToSkip); minK1

figure('Position', [100, 100, 600, 640]);

plot(k, fk1, 'LineWidth', 2)
hold on;
plot(k, fk2, 'LineWidth', 2)
hold on;
plot(k, fk3, 'LineWidth', 2)

% for those fields, where only two properties)
if isequal( unique(field), [0, 1]) 
    error               = errorBWestimator      (B, C1, C2, graph, field);            error
    hold on;
    scatter( 0 , error, 30, 'filled');
end
 

legend({'sample mean', 'RDS estimator', 'prediction sample mean', 'BW estimator'}, 'Fontsize', 20, 'Location','northoutside');
ylabel('mean squared error', 'Fontsize', 24);
xlabel('to skip', 'Fontsize', 24);

%save to file
if nargin == 8
    fileName = cat(2, nameGraphDir, 'analysis estimators_', nameField);
    print(fileName,'-djpeg','-r0');
    savefig(cat(2, fileName, '.fig'));
end

end