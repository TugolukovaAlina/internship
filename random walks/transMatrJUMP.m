function P = transMatrJUMP(adj, alpha)

if nargin == 1
    alpha = 0.2;
end

num = numNodes(adj);
P = zeros(num) ;
for i = 1:num
    di = numberOfNeighbors(adj, i);
    
    for j = 1:num
        P (i, j) = alpha/(num*(di + alpha));
        if adj (i, j)  == 1 && i ~= j
            P (i, j) = P (i, j) + 1/(di + alpha);
        end
    end
       
end



