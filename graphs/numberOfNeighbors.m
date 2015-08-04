% returns the number of neighbors of node j
function n = numberOfNeighbors (adj, j)

if iscell(adj)
    n = length(adj{j});
else
    n = nnz(adj(:, j));
end


end