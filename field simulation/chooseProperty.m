function [indexProperty, distribution] = chooseProperty(localEnergy, temperature )
% chooses which value to assign to the node depending on localEnergy with
% each values


if temperature == 0
    temperature = 0.000000001;
end
distribution = exp(-localEnergy/temperature);


if isequal(distribution, zeros(1, length(distribution)))
    %fprintf('I am here %i \n', temperature);
    % maybe try to use logarithm to make value smaller, but how
    % when T is very small I just fut the equal probabilities to the min
    % states
    minIndices = (localEnergy == min(localEnergy));
    distribution = zeros(1, length(distribution));   
    distribution(minIndices) = ones(1, nnz(minIndices))/nnz(minIndices);

else
    %normalization
    distribution = distribution/ sum(distribution);
end
%localEnergy
%distribution

%choose new property according to the distribution
indexProperty = generateRV(distribution);

end

