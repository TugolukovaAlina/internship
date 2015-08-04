% % errorPrediction2

% I want to predict variation(error) of RW  - variance of mean that I try
% to estimate, !!!! having covariation from the book!!!!!!


P = transMatrRW(graphLOF);

% we fix field
field = fieldCell{4};
field = field(1, :);

minN = 50; stepN = 50; maxN = 2000;
[lineX, lineY] = linesXY(minN, stepN, maxN);
[~, lineW] = linesXY(minN, stepN, maxN);

% variance by experiment
numOfExper = 300;

% meansRW = zeros(numOfExper, length(lineX)); 
% for exper = 1:numOfExper
%     [samples, responses] = takeSamples(0, P, maxN, 0, @propertyForSample, field);   
%     counter = 1;
%     for n = minN:stepN:maxN
%         meansRW(exper, counter) = mean(responses(1:n));        
%         counter = counter + 1;
%     end
% 
% end

figure;
lineZ = var(meansRW);
plot(lineX, lineZ, 'g', 'LineWidth', 2);
hold on;

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


% variance like in the book2
% %if we substitute with eigenvalues


% my first way to define u and v
% [V, D, U] = eig(P);
% de = diag(U'*V);
% for i = 1:length(V)
%     V(:, i) = V(:, i)/de(i);
% end

% my second way to define u and v
D = diag(pi);
Pstar = D^(1/2)*P*D^(-1/2);

[W, Lstar] = eig(Pstar);
U = (D^(1/2))*W;
V = (D^(-1/2))*W;

covDist2 = zeros(1, maxN);
for l = 0:(maxN - 1) 
    
    %     %first variant
%     musum = zeros(length(P));
%     for i = 2:length(P)
%         musum = musum + D(i, i)^l * V(:, i) * U(:, i)';
%     end
%     covDist2(l+1) = sum(f .* transpose((musum)*transpose(f)) .* pi);
%     
% 

      %second variant
      musum = 0;
      for i = 2:length(P)
          musum = musum + Lstar(i, i)^l *  sum(f .* V(:, i)' .* pi) * sum(U(:, i)' .*  f);
      end
      covDist2(l+1) = musum;

      
%     %approximation
%     covDist2(l+1) = D(2, 2)^l *  sum(f .* V(:, 2)' .* pi) * sum(U(:, 2)' .*  f);
      
end

counter = 1;
for n = minN:stepN:maxN
    for l = 0:(n-1)
        if l == 0
            lineW(counter) = lineW(counter) + (n-l)/n*covDist2(l+1);
        else
            lineW(counter) = lineW(counter) + 2*(n-l)/n*covDist2(l+1);
        end
    end     
    
    lineW(counter) = lineW(counter)/n;
    counter = counter + 1;
end

plot(lineX, lineW, 'm', 'LineWidth', 2);

legend({'by experiments','book', 'book2'}, 'FontSize', 18);
xlabel('Number of samples' ,'FontSize', 18);
ylabel('Variance' ,'FontSize', 18);



