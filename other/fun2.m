function dtime = fun2(graph)

P = transMatrMetropolis(graph);
dtime = toDiscardAvg(P);

end