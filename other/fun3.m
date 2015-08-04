function rtime = fun3(graph)

P = transMatrMetropolis(graph);
rtime = toRestartAvg(P);

end