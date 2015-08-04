function [alpha1, alpha2, Det1, Det2] = countAlpha(delta, cost, degree)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

Det1 = degree^2*((cost-1)^2 - 4*delta*cost^2*(1-delta));
Det2 = degree^2*(cost^2*(2*delta - 1)^2 - 2*cost + 1);

alpha1 = (degree*(2*delta*cost - cost - 1) + sqrt(Det1))/(2*(cost - cost*delta));
alpha2 = (degree*(2*delta*cost - cost - 1) - sqrt(Det1))/(2*(cost - cost*delta));

end

