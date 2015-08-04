% if graph has loops? 

function P = transMatrMetropolis (adj)

num = length(adj);
P = zeros(num);
for i = 1:num
    sum = 0;
    for j = 1:num
        if adj (i, j)  == 1
            di = numberOfNeighbors(adj, i);
            dj = numberOfNeighbors(adj, j);
            %P (i, j) = (1/di) * min (di/dj, 1);
            P (i, j) = 1 / max (di, dj);
            sum = sum + P (i, j);
        end
    end
    P(i, i) = 1 - sum;
end
