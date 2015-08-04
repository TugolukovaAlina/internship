% LinAlg


P = transMatrRW(graphLOF);
[V, D, U] = eig(P);
de = diag(U'*V);
for i = 1:length(V)
    V(:, i) = V(:, i)/de(i);
end


% the same as to power l
l = 3;
for i = 1:length(P)
     musum = musum + D(i, i)^l  * V(:, i) * U(:, i)';
end
matrEqual(musum, P^l);


% the same as to power l minus PI
l = 3;
for i = 2:length(P)
     musum = musum + D(i, i)^l  * V(:, i) * U(:, i)';
end
matrEqual(musum, P^l - PI);


% sum(sum(abs(musum - P^l))) < 0.000001
% sum(sum(abs(musum - P^l))) 

% covDist2 = zeros(1, maxN);
% for l = 0:(maxN - 1) 
%     for i = 2:length(P)
%         covDist2(l+1) = covDist2(l+1) + D(i, i)^l * sum(f .* U(:, i)' .* pi) * sum(f .* V(:, i)');
%     end
% end
% 
% for l = 0:(maxN - 1)    
%     res1 = zeros(length(P), length(P));
%     for i = 1:length(P)
%         res1 = res1 + D(i, i)^l*V(:, i)*(U(:, i)');
%     end
% end

% U left
% [V, D, U] = eig(P);
% 
% sum(sum(abs(V^(-1) - U'))) < 0.000001
% sum(sum(abs(V^(-1) - U')))
% U(:, 2)' * V(:, 9)
% 
% 
% 
% sum(sum(abs(P - V*D*U')))
% 
% res1 = zeros(length(P), length(P));
% l = 4;
% 
% for i = 1:length(P)
%     res1 = res1 + D(i, i)*V(:, i)*(U(:, i)');
% end
% 
% sum(sum(abs(P - res1))) < 0.000001
% sum(sum(abs(P - res1)))
% 
% % for l = 0:(maxN - 1)
% %     covDist2(l+1) = ;   
% % end
% 

% [V, D, U] = eig(P);
% 
% res1 = zeros(length(P), length(P));
% U = V^(-1);
% sum(sum(abs(P - V*D*U))) < 0.000001
% for i = 1:length(P)
%     res1 = res1 + D(i, i)*U(:, i)*(V(i, :));
% end
% sum(sum(abs(P - res1))) < 0.000001
% sum(sum(abs(P - res1)))
% sum(sum(abs(Pl - res1))) < 0.000001
% sum(sum(abs(Pl - res1)))


% sum(sum(abs(P - V*D*U'))) < 0.000001
% M = V*D*U';
% M(1:10, 1:10)
% P(1:10, 1:10)

% [V, D] = eig(P);
% 
% counter = 1;
% for n = minN:stepN:maxN
%     for i = 2:length(P)
%           lineW(counter) = lineW(counter) + (1 + D(i,i))/(1 - D(i, i)) * sum(f .* V(:, i)' .* pi)^2;
%     end     
%     
%     lineW(counter) = lineW(counter)/n;
%     counter = counter + 1;
% end

