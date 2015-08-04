function [adj, geom] = randomGeometricGraph( n, r )
% n vertices, r is radius
% each vertex has position [0, 1] * [0, 1]
% if the distance between vertices is less then r than they are connected
% by edge

adj = zeros(n); % initialize adjacency matrix

% 1st - x position, 2nd y position for n vertices
geom = zeros (n, 2);

for i = 1:n
    geom (i, 1) = rand;
    geom (i, 2) = rand;
end

%scatter(geom (:, 1), geom (:, 2), 3)

 for i = 1:n
    for j =(i+1):n
      if (geom(i, 1) - geom(j, 1))^2 + (geom(i, 2) - geom(j, 2))^2 <= r^2
          adj (i, j) = 1;
          adj (j, i) = 1;
        % line ([geom(i, 1), geom(j, 1)], [geom(i, 2), geom(j, 2)]);
      end
    end
  end

end

