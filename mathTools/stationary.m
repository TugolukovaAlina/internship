function PI = stationary(A)

% Compute the stationary distribution of an ergodic Markov chain
% caracterized by its transition probabilities matrix A such that
% A = Pr(x_{k} | x_{k - 1}) , sum(A , 2) = 1.
%
% PI = stationary(A);
%

[M , N] = size(A);

if (M ~= N)
   
    error('Matrix A not square')
   
end

[V , D ] = eig(A');
 
[foo , tp] = sort(diag(D));
 
PI = (V(: , tp(end))/sum(V(: , tp(end))))';

end