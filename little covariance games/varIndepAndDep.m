% varIndepAndDep
% builds variance if values are uncorrelated and correlated for different
% rho
rhoArr = 0:0.2:0.8;

%lineX - number of participants
%lineZ - variance if participants are independent
%lineY - variance if participants are dependent (there is correlation)
lineX = 10:10:500;
lineZ = 1./lineX;

figure;

for rho = rhoArr
    lineY = (lineX - lineX*rho^2 - 2*rho + 2*rho.^(lineX+1))./(lineX.^2*(1-rho)^2);
    plot(lineX, lineY, 'LineWidth', 2, 'DisplayName',['\rho = '  num2str(rho)]);
    hold on;
end

xlabel('number of participants', 'FontSize', 20);
ylabel('variance', 'FontSize', 20);
legend(gca,'show')
%legend(gca,'show')