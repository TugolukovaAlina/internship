function [H, p_value] = chiSquareTestMC(samples, size, alpha)
% chi-square test 
    % test if the samples are independent within the hypothesis that it is
    % a first-order Markov process
    % from "statistical methods in Markov Chains" Patrick Billingsley
    % size - number of states
    %alpha - level of significance

if nargin == 2
    alpha = 0.05;
end
    
% transition count matrix 
% trCount (i, j) - how many transitions from i to j among samples
trCount = zeros(size, size);
for i = 1:(length(samples) - 1)
    trCount (samples(i), samples(i+1)) = trCount (samples(i), samples(i+1)) + 1;
end

%chi value
%it should asymptotically have the chi-square disrtibution with (size -
%1)^2 degrees of freedom
chi = 0;
n = length(samples) - 1;

Fi = zeros(1, size);
Fj = zeros(1, size);
for i = 1:size
    Fi(i) =  sum(trCount(i, :));
    Fj(i) =  sum(trCount(:, i));
end

for i =1:size
    f_i = Fi(i);
    for j = 1:size
        f_j = Fj(j);
        f_ij = trCount(i, j);
        
        if f_i ~= 0 && f_j ~= 0 
         chi = chi + ((f_ij - f_i*f_j/n)^2)/(f_i*f_j/n);
        end
    end
end

p_value = 1 - chi2cdf(chi, (size - 1)^2);
% fprintf('chi theor %i \n', chi2inv(1 - alpha, (size - 1)^2));
% fprintf('chi pract %i \n', chi);
% fprintf('p value %i \n', 1 - chi2cdf(chi, (size - 1)^2));


if chi2inv(1 - alpha, (size - 1)^2) > chi
    H = 0;
else
    H = 1;
end
end

