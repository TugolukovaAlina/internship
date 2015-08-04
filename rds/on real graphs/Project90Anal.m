%Project90Anal

B = 6000;
C1 = 1;
C2 = 9;

Project90GraphField
[mink, k, fk] = findKtoSkip2(B, C1, C2, graph, field, 100);
figure; plot(k, fk);

[mink, k, fk] = findKToSkipExper(B, C1, C2, graph, field, 100);
hold on; plot(k, fk);

% field = createField(graph, 1:5, 50, 10);
% [mink, k, fk] = findKtoSkip2(B, C1, C2, graph, field, 100);
% figure; plot(k , fk);
