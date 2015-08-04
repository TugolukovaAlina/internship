function  buildPlot2 (min, step, max, functionY, parameters)
%build plot according to various parameters

numberOfLines = length(functionY);
lineX = min:step:max;
lineY = zeros (numberOfLines, floor((max-min)/step) + 1);

counter = 1;
for i = min:step:max    
    for j = 1:numberOfLines
        currentFunction = functionY{j};
        %currentParameters = 
        lineY(j, counter) = currentFunction(parameters);
    end
    counter = counter + 1;
end

colors = ['r', 'g', 'b', 'y', 'm', 'c', 'k'];
for j = 1:numberOfLines
    plot(lineX, lineY(j, :), 'LineWidth', 2, 'Color', colors(j));
    hold on;
end


end

