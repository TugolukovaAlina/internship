% formulaOnTheLine

% I want to check with scenario on the line if I use formula, what will
% happen



% I have line with values that are correlated geometrically. Now I want to
% compute rho like I do when using formula and compare them
rho = 0.8;
variance = 1.4;

% n is length of RW and also length of line
n = 101;
mu = 5*ones(1, n);

%variances and covariances (normalized)
sigma = zeros(n, n);
for i = 1:n
    sigma(i, 1) = rho^(i-1);
    curRho = rho^(-1);
    for j = 2:n
        if abs(sigma(i, j-1) - 1) < 0.0000001
            curRho = rho;
        end
        sigma(i, j) = sigma(i, j-1)*curRho;
    end
end
% unnormalize variance
sigma = sigma * variance;
samp = mvnrnd(mu, sigma, 1000);

% variance of mean coincides experimentally and theoretically
varMean = var(mean(samp, 2))
varMean2 = 1/n^2 * sum(sum(sigma))

% now I count rho as I do
graph = chainGraph(n); 

% transition matrix in this case (on the line)
I = eye(n); P = cat(2,  I(:, length(I)), I(:, 1:(length(I) - 1))); 

%field
covariance1 = zeros(1, n);
for i = 1:1000
    field = mvnrnd(mu, sigma, 1);
    covariance1 = covariance1 + countCovarianceRW(graph, field, n, P);
end
covariance1 = covariance1/1000;
% I will compare correaltion with 1 an d 2 formula
% if I use rho formula
covariance2 = sigma(1, :);

figure;
plot(1:n, covariance1, 1:n, covariance2);

%sigma
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% eig(P)
% 
% pi = ones(1, length(P))/length(P);
% 
% 
% 
% fk = fk./n;
% fk = real(fk);
% k = 0:(maxToSkip-1);
% 
% % min function
% [~, index] = min(fk);
% minK = k(index(1));
% 
