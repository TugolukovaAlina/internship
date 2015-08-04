% % errorPrediction3

% I want to predict variation(error) of RW  - variance of mean that I try
% to estimate, !!!! having covariation from the book!!!!!!


P = transMatrRW(graphLOF);

% we fix field
field = fieldCell{4};
field = field(1, :);

minN = 50; stepN = 50; maxN = 2000;
[lineX, lineY] = linesXY(minN, stepN, maxN);
[~, lineW] = linesXY(minN, stepN, maxN);
[~, lineW2] = linesXY(minN, stepN, maxN);


figure;

% covariance like in the book

pi = degreeDistribution(graphLOF);
f = field;
PI = ones(length(graphLOF), 1)*pi;

covDist = zeros(1, maxN);

Pl = eye(length(graphLOF));
for l = 0:(maxN - 1)
    covDist(l+1) = sum(f .* transpose((Pl - PI)*transpose(f)) .* pi);
    Pl = Pl*P;
end

% variance like in the book1

counter = 1;
for n = minN:stepN:maxN
    for l = 0:(n-1)
        if l == 0
            lineY(counter) = lineY(counter) + (n-l)/n*covDist(l+1);
        else
            lineY(counter) = lineY(counter) + 2*(n-l)/n*covDist(l+1);
        end
    end     
    
    lineY(counter) = lineY(counter)/n;
    counter = counter + 1;
end


plot(lineX, lineY, 'r', 'LineWidth', 2);
hold on;


% variance like in the book approximation

D = diag(pi);
Pstar = D^(1/2)*P*D^(-1/2);

[W, L] = eig(Pstar);
U = (D^(1/2))*W;
V = (D^(-1/2))*W;



counter = 1;
for n = minN:stepN:maxN
    for j = 2:length(P)
        %lineW(counter) = lineW(counter) + 2*L(j, j)/(1 - L(j, j))* sum(f .* pi .* V(:, j)') * (f * U(:, j));
        lineW(counter) = lineW(counter) + 2*(L(j, j) - L(j, j)^2 - L(j, j)/n + (L(j, j)^(n+1))/n )/((1 - L(j, j))^2)* sum(f .* pi .* V(:, j)') * (f * U(:, j));
        
        % formula 6.21
        %lineW2(counter) = lineW2(counter) + (1 + L(j, j))/(1 - L(j, j))* sum(f .* pi .* V(:, j)')^2;
        
        lineW2(counter) = lineW2(counter) + (1 - L(j, j)^2 - 2*L(j, j)/n + 2*(L(j, j)^(n+1))/n )/(1 - L(j, j))^2* sum(f .* pi .* V(:, j)')^2;

    end     
    
    varW = (sum(f .* f .* pi) - sum(f .* (PI*f')' .* pi)); 
    lineW(counter) = (lineW(counter) + varW)/n;
    lineW2(counter) = lineW2(counter)/n;
    counter = counter + 1;
end

plot(lineX, lineW, 'm', 'LineWidth', 2);
hold on;
plot(lineX, lineW2, 'k', 'LineWidth', 2);

legend({'book','book Approx','book Approx2'}, 'FontSize', 18);
xlabel('Number of samples' ,'FontSize', 18);
ylabel('Variance' ,'FontSize', 18);



