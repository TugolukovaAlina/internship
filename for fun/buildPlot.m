function  buildPlot (min, step, max, buildGraph, functionY)
%build plot according to various parameters

numberOfVertices = 100;
numberOfLines = length(functionY);
lineX = min:step:max;
lineY = zeros (numberOfLines, floor((max-min)/step) + 1);

counter = 1;
for i = min:step:max    
    graph = buildGraph(numberOfVertices, i);
    while ~isConnected(graph)
        graph = buildGraph(numberOfVertices, i);
    end
        
    for j = 1:numberOfLines
        currentFunction = functionY{j};
        lineY(j, counter) = currentFunction(graph);
    end
    counter = counter + 1;
end

colors = ['r', 'g', 'b', 'y'];
for j = 1:numberOfLines
    plot(lineX, lineY(j, :), 'LineWidth', 3, 'Color', colors(j));
    hold on;
end


end

