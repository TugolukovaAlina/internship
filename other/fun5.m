function rtime = fun5(graph)

P = transMatrMetropolis(graph);
rtime = toRestartAvg2(P);

end