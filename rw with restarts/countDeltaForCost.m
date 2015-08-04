function delta1 = countDeltaForCost(cost)

a = 1;
b = -1;
c = ((cost - 1)/(2*cost))^2;

[delta1, ~] = sq_roots(a, b, c);
fprintf('[%i, 1] \n', delta1);

end

