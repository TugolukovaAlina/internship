% facebookFindK

% import of facebook graph from csv file
graphFacebook = graphFromCSV;

%creating field
valuesFacebook = 1:20;
fieldFacebook = createFieldF(graphFacebook, valuesFacebook, 1/20, 20);

maxToSkip = 200;
B = 4000;
C1 = 1;
C2 = 4;


covariance = countCovarianceRW(graphFacebook, fieldFacebook, 2);

rho = covariance(2)/covariance(1)
findKtoSkip(B, C1, C2, rho, maxToSkip)
findKtoSkip2(B, C1, C2, graphFacebook, fieldFacebook, maxToSkip)

numberOfWalks = 1000;
numberOfSamples = ceil(B/C1 + 1);
responses = zeros(numberOfWalks, numberOfSamples);
initialDistr = degreeDistribution(graphFacebook);
P = transMatrRW(graphFacebook);

for i = 1:numberOfWalks   
    [~, responses(i, :)] = takeSamples(initialDistr, P, numberOfSamples, 0, @propertyForSample, fieldFacebook);
end

lineY = zeros(numberOfWalks, maxToSkip);
counter = 1;
for k = 0:(maxToSkip-1)    

    %number of steps
    n = ceil(B*(k+1)/(C1*(k+1) + C2));
        
    %number of participants
    m = B/(C1*(k+1) + C2);

    
    avM = 0;
    for i = 1:numberOfWalks
        if rand < m - floor(m)
            mCUR = ceil(m);
        else
            mCUR = floor(m);
        end
        %avM = avM + mCUR;
        lineY(i, counter) = mean(responses(i, 1:(k+1):(k+1)*(mCUR-1) + 1));
        avM = avM + length(1:(k+1):(k+1)*(mCUR-1) + 1);
    end
    %fprintf('%i - %i \n ', m, avM/numberOfWalks);    
    %budgetReal = n*C1 + avM*C2/numberOfWalks
    counter = counter + 1;  
end
    
hold on;
plot( 0:(maxToSkip-1), var(lineY), 'LineWidth', 2);


legend({'formula','experiments'}, 'FontSize', 18);
xlabel('number to skip' ,'FontSize', 18);
ylabel('variance of mean' ,'FontSize', 18);