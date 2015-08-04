function adj = randomGraphS(n, E)

%adj = spalloc(n, n, E); % initialize adjacency matrix
counter = 1;

nodei = zeros (1, E);
nodej = zeros (1, E);
 while counter <= E
     
     % pick two random nodes
    i = randi(n); 
    j = randi(n); 
    
    if i == j 
        continue;
    end
    
    nodei (counter) = i;
    nodej (counter) = j;
    
    counter = counter + 1;
 end
 %fprintf('counter1 %i \n', counter);

 numNonZero = nnz(nodei);
 values = ones(1, 2*numNonZero); % i j = 1 and j i = 1
 nodei = nonzeros(nodei);
 nodej = nonzeros(nodej);
 
 %concatanate according to 2 dimention
 nodeij = cat(2, nodei, nodej);
 nodeji = cat(2, nodej, nodei);

  adj = sparse(nodeij, nodeji, values, n, n, 2*E);
  
  %!!!!!!!!!!!!!!!!!!!!!!!!! matlab sums repeated nodes (if I put (1, 1, 2)
  %and (1, 1, 3) => (1, 1, 5)
  [nodeij, nodeji] = find(adj);
 values = ones(1, length(nodeij));
  adj = sparse(nodeij, nodeji, values, n, n, 2*E);
  
  
%   if some nodes were double, find number of edges by now and continue
counter = nnz(adj)/2 + 1;

% fprintf('counter2 %i \n', counter);

 while counter <= E
     % pick two random nodes
    i = randi(n); 
    j = randi(n); 
    if i == j || adj(i,j) == 1
        continue; 
    end  % do not allow self-loops or double edges
    adj(i,j) = 1; 
    adj(j,i) = 1;
    counter = counter + 1;
  end
end