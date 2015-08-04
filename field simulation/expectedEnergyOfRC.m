function energy = expectedEnergyOfRC(graph, properties)
% calculates expected energy, where values are assigned randomly
    energy = numberOfEdges(graph)*(length(properties) + 1)*(length(properties) - 1)/6;
end

