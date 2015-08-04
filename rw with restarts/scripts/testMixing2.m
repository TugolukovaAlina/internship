func = cell(1, 2);
%toDiscard r
func{1} = @fun2;

%toRestart g
func{2} = @fun3;


%toDiscard2 b 
func{3} = @fun4;


%toRestart2 y
func{4} = @fun5;

buildPlot(0.05, 0.005, 0.1, @randomGraph, func);