function drawField(points, field, graph, properties)
% it draws nodes as circle with coordinates given by points and with color
% that corresponds to its value in field
%   If graph is given then edges are also drawn

if nargin >= 3
    n = length(graph);
    for i = 1:n
        for j =(i+1):n
          if graph(i, j) == 1
             line ([points(i, 1), points(j, 1)], [points(i, 2), points(j, 2)], 'Color',[.8 .8 .8]);
          end
        end
    end
    hold on;
end


x = points (:, 1)';
y = points (:, 2)';

if nargin > 3
% to have colors considering all possible properties
    scatter([x -1 -1], [y -1 -1], 60, [field min(properties) max(properties)], 'filled')
    axis off;
    axis([0 1 0 1])
else
     scatter(x, y, 60, field, 'filled')
end
colormap(cool);


end

