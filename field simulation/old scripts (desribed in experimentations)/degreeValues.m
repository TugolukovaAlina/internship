% check if there is dependency between degree and assigned to it value
% conclusion: probably no connection
% generate graph and field

%%%%% degreeValues 

GAF;

% histValues(1, k) - number of nodes that have degree k
% histValues(2, k) - sum of values of these nodes

histValues = zeros(2, maxDegree(graph));

% number of vertices with degree i
for i = 1:length(graph)
   k = numberOfNeighbors(graph, i);
   
   histValues(1, k) = histValues(1, k) + 1; 
   histValues(2, k) = histValues(2, k) + field(i);
end

% average value of node with degree k
degreeVal = histValues(2, :)./histValues(1, :);

figure;
bar(degreeVal)

xlabel('degree');
ylabel('average value');


% variance dependence of degree
histValues = zeros(2, maxDegree(graph));
for i = 1:length(graph)
   k = numberOfNeighbors(graph, i);
   
   histValues(1, k) = histValues(1, k) + 1; 
   histValues(2, k) = histValues(2, k) + (field(i) - degreeVal(k))^2;
end

degreeVar = histValues(2, :)./(histValues(1, :)-1);

figure;
bar(degreeVar)

xlabel('degree');
ylabel('variance');

% 
% xvalues = zeros(1,length(graph)); 
% yvalues = zeros(1,length(graph)); 
% 
% for i = 1:length(graph)
%    xvalues(i) = numberOfNeighbors(graph, i);
%    yvalues(i) = field(i);
% end
% 
% figure;
% scatter(xvalues, yvalues);


