function energy = computeGlobalEnergy(graph, field)
% computes global energy on graph with given field
% (maybe needed to correct, graph is symmetric, compute energy better)

energy = 0;
for i = 1:length(graph)
    energy = energy + computeLocalEnergy(graph, field, i);
end

energy = energy/2;

end



