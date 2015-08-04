function [x1, x2] = sq_roots(a, b, c)

x1 = 0;
x2 = 0;

D = b^2 - 4*a*c;
if D < 0
    return;
end

x1 = (-b + sqrt(D))/2*a;
x2 = (-b - sqrt(D))/2*a;

end

