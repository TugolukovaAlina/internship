function gap = spectralGap(P)
%returns spectral gap value of matrix P = 1 - lambda2
lambda = eig(P);
gap = 1 - lambda(2);
end

