% compareEstimators

% GAF;
% B = 500;
% C1 = 1;
% C2 = 4;

%Project90GraphField
%maxToSkip = 100;
[minK1, k1, fk1, fk2] = findKToSkipExperEst2(B, C1, C2, graph, field, maxToSkip); minK1

figure;
plot(k1, fk1, 'LineWidth', 2)
hold on;
plot(k1, fk2, 'LineWidth', 2)


legend({'just mean', 'estimator'}, 'Fontsize', 24);
ylabel('mean squared error', 'Fontsize', 24);
xlabel('to skip', 'Fontsize', 24);