function [pointsX, pointsY] =  circlePoints(num, radius, centerX, centerY, toDraw)


%fprintf('circlePoints');
if nargin == 1
    radius = 1;
    centerX = 0;
    centerY = 0;
    toDraw = 0;
end

alpha = 2*pi/num;


pointsX = zeros(num, 1);
pointsY = zeros(num, 1);

for i = 1:num
    pointsX(i) = centerX + radius*cos(i*alpha);
    pointsY(i) = centerY + radius*sin(i*alpha);
end


if toDraw
    scatter(pointsX, pointsY, 9);
end


end

