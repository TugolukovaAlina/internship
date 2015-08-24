
%graph
degrees = graphDegrees(graph);
correlation = zeros(1, length(fieldsNames));
for i = 1:size(fields, 1)
    fprintf('%s : ', fieldsNames{i});
    field = fields(i, :);
    CORR = corrcoef(degrees, field);
    correlation(i) = CORR(1, 2);
    fprintf(' %i \n', correlation(i));
end

correlation = abs(correlation);
[corrSorted, I] = sort(correlation);
fieldsNamesSorted = fieldsNames(I);

fprintf('\n\n\n');
for i = 1:size(fields, 1)
    fprintf('%s : ', fieldsNamesSorted{i});
    fprintf(' %i \n', corrSorted(i));
end

figure;
scatter(corrSorted, 1:length(fieldsNames))

%axis([0 max(corrSorted) 1 length(fieldsNames)])
set(gca,'YTick', 1:length(fieldsNames))  
set(gca,'YtickLabel',fieldsNamesSorted) 

% to delete-----------------------------------------------
% x = zeros(1, nnz(graph));
% y = zeros(1, nnz(graph));
% 
% c = 1;
% for i = 1:length(graph)
%     Ni = listOfNeighbors(graph, i);
%     for j = 1:length(Ni)
%        x(c) = field(i);
%        y(c) = field(Ni(j));
%        c = c + 1;
%     end
% end
% 
% corrcoef(x,y)

% 
% ax = gca;
% ax.XTick = corrSorted;
% ax.YTick = ['race', 'drug cook', 'homeless', 'retired', 'housewife', 'sex work client', 'disabled', 'thief', 'female', 'pimp', 'drug dealer', 'sex worker', 'unemployed'];