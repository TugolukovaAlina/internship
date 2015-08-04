function distribution = distTriangular(size)
% this distribution that has triangular shape

distribution = cat(2, 1:1:floor(size/2), ceil(size/2):-1:1);
distribution = distribution/sum(distribution);

end

