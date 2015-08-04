function node = randomNeighbor(graph, node)

neighbors = listOfNeighbors(graph, node);
node = neighbors(randi(length(neighbors)));

end

