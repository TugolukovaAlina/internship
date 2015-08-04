function v = generateRV (distribution)
%it works much better with full matrices
distribution = full(distribution);

size = length(distribution);
%random variable u[0,1]
r = rand;

s = distribution(1);

%fprintf('here');
%disp(distribution);

for v = 1:(size-1)
    if  r <= s
        return;
    else
        s = s +  distribution(v+1);
    end   
end


v = size;

end