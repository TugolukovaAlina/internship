function [deg, index] = maxDegree( adj)
%function return the maximum degree from all nodes
deg = 0;
index = 1;
num = length(adj);
for i = 1:num
    if numberOfNeighbors(adj, i) > deg
        deg = numberOfNeighbors(adj, i);
        index = i;
    end
end

