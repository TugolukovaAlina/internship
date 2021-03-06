% lineGame1

% let's imagine line where I desribe variances and covariances between all
% the element and then try to launch RWs to estimate variability of mean
% and write very nice formula for it

%1111111111111111111111111111111111

% rho = 0.8;
% variance = 1.4;
% 
% % n is length of RW
% n = 100;
% mu = 5*ones(1, n);
% 
% 
% %variances and covariances (normalized)
% 
% sigma = zeros(n, n);
% 
% for i = 1:n
%     sigma(i, 1) = rho^(i-1);
%     curRho = rho^(-1);
%     for j = 2:n
%         if abs(sigma(i, j-1) - 1) < 0.0000001
%             curRho = rho;
%         end
%         sigma(i, j) = sigma(i, j-1)*curRho;
%     end
% end
% 
% 
% % variance of the mean by formula
% varMean = variance*(n - n*rho^2 - 2*rho + 2*rho^(n+1))/(n^2*(1-rho)^2)
% 
% 
% % 'unnormalize' by multiplying everything by variance
% sigma = sigma * variance;
% % variance of the mean
% varMean2 = 1/n^2 * sum(sum(sigma))
% 
% 
% 
% 
% %sigma
% samp = mvnrnd(mu, sigma, 1000);


%222222222222222222222222222
% 
% rho = 0.9;
% lineX = 10:10:500;
% lineZ = 1./lineX;
% lineL = lineZ*((1 + rho)/(1 - rho));
% 
% %lineX - number of participants
% %lineZ - variance if participants are independent
% %lineY - variance if participants are dependent (there is correlation)
% %lineL - approximation of variance if participants are dependent
% 
% lineY = (lineX - lineX*rho^2 - 2*rho + 2*rho.^(lineX+1))./(lineX.^2*(1-rho)^2);
% 
% figure;
% %plot(lineX, lineY, 'r', lineX, lineZ, 'g', lineX, lineL, 'b');
% plot(lineX, lineL, 'LineWidth', 2);
% hold on;
% plot(lineX, lineY, 'LineWidth', 2);
% %hold on;
% %plot(lineX, lineZ, 'LineWidth', 2);
% 
% xlabel('number of participants', 'FontSize', 20);
% ylabel('variance', 'FontSize', 20);
% %legend({'participants independent', 'participants dependent'}, 'FontSize', 16)
% legend({'approximation', 'formula'}, 'FontSize', 20)

%333333333333333333333333333333

% rho = 0.8;
% B = 100;
% C1 = 1;
% C2 = 4;
% k = 1:20;
% 
% varExpr = ((k*C1 + C2)/B).*((1 + rho.^(k))./(1 - rho.^(k)));
% figure; plot(k, varExpr);
% 
% partB = C2/B*(1 + rho.^(k))./(1 - rho.^(k));
% partA = C1/B*k.*(1 + rho.^(k))./(1 - rho.^(k));
% varExpr2 = partA + partB;
% figure; plot(k, varExpr, 'm', k, varExpr2, 'r', k, partB, 'g', k, partA, 'b');
% 
% % expression for null of function
% [minValue, index] = min(varExpr);
% minX1 = k(index(1))
% x = k(index(1))
% C1*(1 - rho^(2*x)) + 2*C1*x*rho^x*log(rho) + 2*C2*rho^x*log(rho)


%444444444444444444444444444444444444444444 plot for different rho


rho = 0.2;
B = 100;
C1 = 1;
C2 = 4;
k = 1:20;

figure;

for i=0:4
    
    rhoCur = i*rho;
    varExpr = ((k*C1 + C2)/B).*((1 + rhoCur.^(k))./(1 - rhoCur.^(k)));
   % subplot(2, 3, i+1) 
    plot(k, varExpr, 'LineWidth', 2,  'DisplayName',['\rho = '  num2str(rhoCur)]);
    hold on;
end

xlabel('k', 'FontSize', 20);
ylabel('variance', 'FontSize', 20);
legend(gca,'show')


% k = 1;
% for n = lineX
%     varMean = (n - n*rho^2 - 2*rho + 2*rho^(n+1))/(n^2*(1-rho)^2);
%     lineY(k) = varMean;
%     k = k + 1;
% end


%5555555555555555555555555555555555555555555555


% rho = 0.6;
% lineX = 1:200;
% fn = (1 + rho)/(1 - rho);
% lineY = (lineX - lineX*rho^2 - 2*rho + 2*rho.^(lineX+1))./(lineX*(1-rho)^2);
% 
% figure;
% 
% plot([1, 200], [fn fn], 'LineWidth', 1);
% hold on;
% plot(lineX, lineY, 'LineWidth', 2);
% axis([1 200 0 4 ]);
% 
% xlabel('number of participants', 'FontSize', 20);
% ylabel('correlation factor', 'FontSize', 20);


%66666666666666666666666666666 plot for big rho


% rho = 0.9999;
% lineX = 10:10:500;
% 
% %lineY = (lineX - lineX*rho^2 - 2*rho + 2*rho.^(lineX+1))./(lineX.^2*(1-rho)^2);
% lineY = (1 + rho)./(1 - rho);
% 
% 
% figure;
% plot(lineX, lineY, 'LineWidth', 2);

