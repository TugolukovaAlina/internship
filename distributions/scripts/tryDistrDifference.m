%tryDistrDifference
close all;

vX = 0:0.01:1;
dX = distrUniform(length(vX));


vY = 0:0.01:1;
dY = distrUniform(length(vY));

% Z = X - Y
tableZ = distrDifference(cat(1, vX, dX), cat(1, vY, dY));
drawDistribution(tableZ);

figure;
tableZ = distrDifference2(cat(1, vX, dX), cat(1, vY, dY));
drawDistribution(tableZ);