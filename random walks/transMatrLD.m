function P = transMatrLD (adj)

num = length(adj);
P = zeros(num);
for i = 1:num
    sum = 0;
    for j = 1:num
        if adj (i, j)  == 1 && i ~= j
            di = numberOfNeighbors(adj, i);
            dj = numberOfNeighbors(adj, j);
            P (i, j) = 1/(di + dj);
            sum = sum + P (i, j);
        else
            P (i, j) = 0;
        end
    end
    P(i, i) = 1 - sum;
end