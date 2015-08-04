function dtime = fun4(graph)

P = transMatrMetropolis(graph);
dtime = toDiscardAvg2(P);

end