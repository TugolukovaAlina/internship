function t = findTemperature(fraction, graph, properties)
% find temperature that brings system to energy that is equal to
% fraction*MaxEnergy
%   Detailed explanation goes here
energyRF = numberOfEdges(graph)*(length(properties) + 1)*(length(properties) - 1)/6;
energyWished = fraction*energyRF;

leftT = 0;
%????
rightT = 100000;

error = 5;
while error > 3
   t = (leftT + rightT)/2; 
   energyCurrent = calculateExpectedEnergy(graph, properties, t);
   if  energyCurrent <  energyWished
       leftT = t;
   else
       rightT = t;
   end
   error = abs(energyWished - energyCurrent);
   %fprintf('t - %i \n', t);
end

end

