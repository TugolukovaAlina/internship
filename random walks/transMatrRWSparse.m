function P = transMatrRWSparse (adj)

numberOfStates = numNodes(adj);
numberOfEdges = nnz(adj)/2;
[nodei, nodej] = find(adj);
num = length (nodei); 

% number of edges 
indexi = zeros(num, 1);
indexj = zeros(num, 1);
values = zeros(num, 1);

%for each state we will regard row of non zero elements
counter = 1;

%counting for all nodes number of neighbors
numOfNeighbors = zeros(numberOfStates, 1);
for i = 1:numberOfStates
    numOfNeighbors(i) = numberOfNeighborsSparse(adj, i);
end

%count the transition matrix
for i = 1:numberOfStates
    nonZeroIndeces = find(adj(:, i));
    di = numOfNeighbors(i);
    for j = 1:length(nonZeroIndeces)
     
        curValue = 1/di;
        
        indexi(counter) = i;
        indexj(counter) =nonZeroIndeces(j);
        values(counter) = curValue;
        
        counter = counter + 1;
    end
  
end

  
P = sparse(indexi, indexj, values, numberOfStates, numberOfStates, 2*numberOfEdges + numberOfStates);
end