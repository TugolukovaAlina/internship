function P = transMatrLDSparse (adj)

numberOfStates = numNodes(adj);
numberOfEdges = nnz(adj)/2;
[nodei, nodej] = find(adj);
num = length (nodei); 

% number of edges plus diag elements
indexi = zeros(num + numberOfStates, 1);
indexj = zeros(num + numberOfStates, 1);
values = zeros(num + numberOfStates, 1);

%for each state we will regard row of non zero elements
counter = 1;

%counting for all nodes number of neighbors
numOfNeighbors = zeros(numberOfStates, 1);
for i = 1:numberOfStates
    numOfNeighbors(i) = numberOfNeighborsSparse(adj, i);
end

%count the transition matrix
for i = 1:numberOfStates
    sum = 0;
    nonZeroIndeces = find(adj(:, i));
    
    for j = 1:length(nonZeroIndeces)
        di = numOfNeighbors(i);
        dj = numOfNeighbors(nonZeroIndeces(j));
        
        curValue = 1/(di + dj);
        
        indexi(counter) = i;
        indexj(counter) =nonZeroIndeces(j);
        values(counter) = curValue;
        
        sum = sum + curValue;
        counter = counter + 1;
    end
    
    indexi(counter) = i;
    indexj(counter) = i;
    values(counter) = 1 - sum;
    counter = counter + 1;
end

% fprintf('%i ', indexi);
%  fprintf('%i ', indexj);
  
P = sparse(indexi, indexj, values, numberOfStates, numberOfStates, 2*numberOfEdges + numberOfStates);
end