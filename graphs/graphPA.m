function [graph, points] = graphPA (size, edges)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

el = preferentialAttachment(size, edges);
graph = zeros(size, size);

for i = 1:length(el)
    graph(el(i, 1), el(i, 2)) = el(i, 3);
end

points = randomPoints(size);

end

