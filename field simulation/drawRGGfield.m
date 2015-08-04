function drawRGGfield(field, points, radius)
% draws rgg graph with values from field
% and labels near each node

n = length(field);
for i = 1:n
    for j =(i+1):n
      if (points(i, 1) - points(j, 1))^2 + (points(i, 2) - points(j, 2))^2 <= radius^2
         line ([points(i, 1), points(j, 1)], [points(i, 2), points(j, 2)], 'Color',[.8 .8 .8]);
      end
    end
end
  
x = points (:, 1);
y = points (:, 2);
hold on;
scatter(x, y, 60, field, 'filled')
colormap(cool);

a = [1:length(points)]';
b = num2str(a); 
c = cellstr(b);
dx = 0.005; dy = 0.001; 
text(x+dx, y+dy, c);

 
end

