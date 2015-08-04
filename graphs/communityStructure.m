function  communityStructure(s)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

structure = s;

graph
for i = 1:length(structure)
    graph = ;
end

[centersX, centersY] = circlePoints(comNum);

radius = sqrt(2*(1 - cos(2*pi/comNum)))/3;
for i = 1:comNum
    hold on;
    circlePoints(5, radius, centersX(i), centersY(i), 1);
end


end

