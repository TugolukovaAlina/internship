% % errorPrediction4

% I want to predict variation(error) of RW  WITH SKIPPING  having covariation from the book!!!!!!


P = transMatrRW(graphLOF);

% we fix field
field = fieldCell{4};
field = field(1, :);

minN = 50; stepN = 50; maxN = 2000;
[lineX, lineY] = linesXY(minN, stepN, maxN);
[~, lineW2] = linesXY(minN, stepN, maxN);

% variance by experiment
numOfExper = 300;
meansRW = zeros(numOfExper, length(lineX)); 

k = 1;

for exper = 1:numOfExper
    [samples, responses] = takeSamples(0, P, (maxN-1)*k + 1, 0, @propertyForSample, field);   
    counter = 1;
    for n = minN:stepN:maxN
        meansRW(exper, counter) = mean(responses(1:k:k*(n-1) + 1));        
        counter = counter + 1;
    end

end

figure;
lineZ = var(meansRW);
plot(lineX, lineZ, 'g', 'LineWidth', 2);
hold on;


% variance like in the book approximation

pi = degreeDistribution(graphLOF);
f = field;
PI = ones(length(graphLOF), 1)*pi;

D = diag(pi);
Pstar = D^(1/2)*P*D^(-1/2);

[W, L] = eig(Pstar);
U = (D^(1/2))*W;
V = (D^(-1/2))*W;



counter = 1;
for n = minN:stepN:maxN
    
    for j = 2:length(P)        
        l = L(j, j)^k;
        lineW2(counter) = lineW2(counter) + (1 - l^2 - 2*l/n + 2*(l^(n+1))/n )/(1 - l)^2* sum(f .* pi .* V(:, j)')^2;

    end     

    lineW2(counter) = lineW2(counter)/n;
    counter = counter + 1;
end


plot(lineX, lineW2, 'k', 'LineWidth', 2);

legend({'experiments','formula with skipping'}, 'FontSize', 18);
xlabel('Number of samples' ,'FontSize', 18);
ylabel('Variance' ,'FontSize', 18);
