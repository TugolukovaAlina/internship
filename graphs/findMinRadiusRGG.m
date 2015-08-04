function radius = findMinRadiusRGG(n, p)
%not right
%returns the minimum radius for RGG(n, r) to be connected with probability p

alpha = -log(-log(p));
radius = sqrt((alpha + log(n))/(pi*n));

end

