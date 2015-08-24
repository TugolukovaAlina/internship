% part1 -----------------------------------------------
%[graph, points] = randomGeometricGraph(200, 0.1
% properties = 1:5;
% temperature = [0.1, 0.5, 1, 2, 5, 10, 20, 1000];
% fields = zeros(length(temperature), length(graph));
% for i = 1:length(temperature)
%     field = createField(graph, properties, temperature(i), 20);
%     
%     figure;
%     drawField(points, field, graph, properties);
%     fields(i, :)  = field;
% end


% part2 -----------------------------------------------

for i = 1:4
    figure('Position', [500, 500, 500, 250]);
    field = fields(i, :);
    corr = countCovarianceRW(graph, field, 21);
    bar(0:20, corr)
    axis([-0.5 20.5 0 1])
    
    xlabel('k', 'FontSize', 20);
    ylabel('correlation', 'FontSize', 20);
end