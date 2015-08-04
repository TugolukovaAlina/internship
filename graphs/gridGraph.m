function [graph, points] = gridGraph(n, m)
%builds grid n by m
graph = zeros(n*m, n*m);
for i = 1:(n*m)
    if mod(i, m) ~= 0
        graph = addEdge(graph, i, i+1);
    end
    if i <= m*(n-1)
        graph = addEdge(graph, i, i+m);
    end
end

X = zeros(1, n*m);
Y = zeros(1, n*m);

counter = 1;
for i = 1:n
    for j = 1:m
        Y (counter) = i/n;
        X(counter) = j/m;
        counter = counter + 1;
    end
end


points = zeros(n*m, 2); 
points(:, 1) = X; 
points(:, 2) = Y;
%scatter(X, Y, 3);

end

