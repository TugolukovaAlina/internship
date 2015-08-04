function graph = gridOnTorusGraph(n, m)
%builds grid n by m


graph = gridGraph(n, m);

if m ~= 2
    for i = 1:n
        graph = addEdge( graph, (i-1)*m + 1, m*i);
    end
end

if n ~= 2
    for j = 1:m
        graph = addEdge( graph, j, (n - 1)*m + j);
    end
end

end

