function [graph, field] = groupsGraph(size, pa, muA, muB, I)
%UNTITLED4 Summary of this function goes here
%   size: population size
%   pa  : proportion of the population in group A
%   muA : mean of exponential degree distribution for group A
%   muB : mean of exponential degree distribution for group B
%   I   : interconnectedness

if nargin == 0
  % parameters like in paper
  size  = 10000;
  pa    = 0.3;
  muA   = 10;
  muB   = 20;
  I     = 0.6;
end

graph = zeros(size);

% assign nodes to each group (just first pa*size are in group A)
groupAsize = ceil(pa*size);
groupA = 1:groupAsize;
groupB = (groupAsize + 1) : size;

% degrees of each node
degrees = zeros(1, size);
for i = 1:groupAsize
    degrees(i) = ceil(exprnd(muA));
end
for i = (groupAsize + 1) : size
    degrees(i) = ceil(exprnd(muB));
end


% Tab - cross-group ties, Ra - sum of degrees in group A
% control that Ra, Rb, Tab are even
Ra = sum(degrees(groupA)); if mod(Ra, 2) == 1 degrees(1) = degrees(1) + 1; Ra = Ra + 1; end
Rb = sum(degrees(groupB)); if mod(Rb, 2) == 1 degrees(size) = degrees(size) + 1; Rb = Rb + 1; end
Tab = round(I * min(Ra, Rb)); if mod(Tab, 2) ==1 Tab = Tab + 1; end

if ~isempty(find(degrees > size - 1, 1))
    fprintf('NOOOOOOO');
end
    
% stubs: elements

stubsA = [];
stubsB = [];

for i = 1:groupAsize
    stubsA = cat(2, stubsA, ones(1, degrees(i))*i);
end
for i = (groupAsize + 1) : size
    stubsB = cat(2, stubsB, ones(1, degrees(i))*i);
end

Tab
% edges between groups a and b
while Tab > 0
    % random nodes from a and b
    % random stubs
    ind1 = randi(length(stubsA));
    ind2 = randi(length(stubsB));
    randA = stubsA(ind1);
    randB = stubsB(ind2);

    if graph(randA, randB) == 0
        graph = addEdge(graph, randA, randB);
        
        Tab = Tab - 1;
        stubsA(ind1) = [];
        stubsB(ind2) = [];
    end
end

fprintf('1');

while ~isempty(stubsA)
    % random stubs
    ind1 = randi(length(stubsA));
    ind2 = randi(length(stubsA));
    
    % indeces of elements in graph
    rand1 = stubsA(ind1);
    rand2 = stubsA(ind2);

    if graph(rand1, rand2) == 0 && rand1 ~= rand2
        graph = addEdge(graph, rand1, rand2);
        
        stubsA(max(ind1, ind2)) = [];
        stubsA(min(ind1, ind2)) = [];
    end
end
fprintf('2');
length(stubsB)
while ~isempty(stubsB)
    % random stubs
    ind1 = randi(length(stubsB));
    ind2 = randi(length(stubsB));
    
    % indeces of elements in graph
    rand1 = stubsB(ind1);
    rand2 = stubsB(ind2);

    if graph(rand1, rand2) == 0 && rand1 ~= rand2
        graph = addEdge(graph, rand1, rand2);
        
        stubsB(max(ind1, ind2)) = [];
        stubsB(min(ind1, ind2)) = [];
    end
    %stubsB
end
fprintf('3');

field = zeros(1, size);
field(groupB) = 1;

end