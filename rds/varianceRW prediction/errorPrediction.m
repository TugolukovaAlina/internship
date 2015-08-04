% errorPrediction

fprintf('hey hey');
% I want to predict variation(error) of RW  - variance of mean that I try
% to estimate, !!!! having covariation from gibbs variables


P = transMatrRW(graphLOF);

fieldArray = fieldCell{4};
covMatrix = cov(fieldArray);

%field = field(1, :);

minN = 50; stepN = 50; maxN = 2000;
[lineX, lineY] = linesXY(minN, stepN, maxN);

numOfExper = 300;

meansRW = zeros(numOfExper, length(lineX)); 
for exper = 1:numOfExper
    %after I changed to perform RW on random field but not on the one it
    %became better
    field = fieldArray(randi(size(fieldArray, 1)), :);
    [samples, responses] = takeSamples(0, P, maxN, 0, @propertyForSample, field);   
    counter = 1;
    for n = minN:stepN:maxN
        varTotal = 0;
        for i = 1:n
            for j = 1:n
               varTotal = varTotal + covMatrix(samples(i), samples(j));
            end
        end
        % predicted variation
        varTotal = varTotal/n^2;
        lineY(counter) = lineY(counter) + varTotal;
        
        %realVariation
        %lineZ(counter) = lineZ(counter) + var(responses(1:n))/n;      
        
        % X: different means; Y: different number of length of RW
        meansRW(exper, counter) = mean(responses(1:n));
        
        counter = counter + 1;
    end

end
figure;
plot(lineX, lineY/numOfExper, 'r', 'LineWidth', 2);
hold on;


% plot variance during RW
lineZ = var(meansRW);
plot(lineX, lineZ, 'g', 'LineWidth', 2);


legend({'with gibbs covariance','by experiments'}, 'FontSize', 18);
xlabel('Number of samples' ,'FontSize', 18);
ylabel('Variance' ,'FontSize', 18);

% here I wanted to extract rho but...
% varN = lineZ;
% N = lineX;
% varField = var(field(1, :));
% 
% 
% ro = (N.* varN - varField)./(varField*(N-1))
% figure;
% plot(lineX, ro)
