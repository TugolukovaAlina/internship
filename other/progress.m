function progress(index, each)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    if mod(index, each) == 0
        fprintf('ind - %i; ', index);
    end
end

