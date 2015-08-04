% changingBudget
%GAF;
C1 = 1;
C2 = 4;

minBudget = 10000;
stepBudget = 10000;
maxBudget = 1000000;

[budget, minK] = linesXY(minBudget, stepBudget, maxBudget);
i = 1;
savedSettings = false;
figure;
for B = minBudget:stepBudget:maxBudget
   [minK(i), k, fk] = findKtoSkip2(B, C1, C2, graph, field, 100) ;  
   subplot(10, 10, i)
   plot(k, fk)
   i = i + 1;
end

figure;
plot(budget, minK);