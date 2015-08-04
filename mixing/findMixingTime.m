function step = findMixingTime(P, max, ditstributionToCompare,  eps)

if nargin == 1
    max = 1000;
    ditstributionToCompare = ones(1, length(P))/length(P);
    eps = 1/4;
end


PP = P;
for step = 1:max 
  if (variationDistance(PP, ditstributionToCompare) < eps)
      return;
  end
  PP = PP*P;
end


end

