% covarianceRWTheor

% GAF;

% numberOfSamples = 100;
% P = transMatrRW(graph);
% [V,D] = eig(P);

l = 3;

pi = degreeDistribution(graph);
f = field;
PI = ones(length(graph), 1)*pi;

covDist = zeros(1, numberOfSamples);
for l = 0:(numberOfSamples-1)
    covDist(l+1) = sum(f .* transpose((P^l - PI)*transpose(f)) .* pi);
end

figure;
bar(0:(numberOfSamples - 1), covDist/covDist(1))

covDistTheor = covDist



%sum(sum((abs(V*D*V^(-1) - P)))) < 0.0001

% 
% a1 = sum(f .* f .* pi)
% 
% a2 = 0;
% for i = 1:length(graph)
%     a2 = a2 + pi(i)*f(i)^2;
% end
% a2

% a1 = 0;
% for i = 1:length(graph)
%     for j = 1:length(graph)
%         a1 = a1 + pi(i)*Pl(i,j) * f(i) * f(j);
%     end
% end
% a1
% a2 = sum(f .* transpose((P^l)*transpose(f)) .* pi)Pl = P^l;
% 
% %the same but too mamy lines
% cov1 = 0;
% for i = 1:length(graph)
%     for j = 1:length(graph)
%         cov1 = cov1 + pi(i)* Pl(i,j) * f(i) * f(j);
%     end
% end
% 
% Epi = 0;
% for i = 1:length(graph)
%     Epi = Epi + pi(i)*f(i);
% end
% 
% cov1 = cov1 - Epi^2