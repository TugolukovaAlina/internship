function [ PP_a, error ] = findProportionOfWhite(responses, degrees, field )
% finds proportion of white population

% 1 - A
% 0 - B

n_a = length(find(responses == 1));
n_b = length(find(responses == 0));

%average degree of A
degreesA = degrees(responses == 1);
Da = n_a / sum(degreesA.^(-1));

%average degree of B
degreesB = degrees(responses == 0);
Db = n_b / sum(degreesB.^(-1));

%recrutments from a to a, a to b, b to a, b to b
r_aa = length(strfind(responses, [1, 1]));
r_ab = length(strfind(responses, [1, 0]));
r_ba = length(strfind(responses, [0, 1]));
r_bb = length(strfind(responses, [0, 0]));



c_ab = r_ab/(r_aa + r_ab);
c_ba = r_ba/(r_bb + r_ba);


% alla = r_aa +r_ab + r_ba + r_bb;
% c_aa = r_aa/(r_aa + r_ab);
% c_bb = r_bb/(r_ba + r_bb);

PP_a = (Db * c_ba) / (Da*c_ab + Db*c_ba);
PP_a_true = length(find(field == 1)) / length(field);

if r_aa + r_ab == (length(responses) - 1)
   PP_a = 1;
end

if r_bb + r_ba == (length(responses) - 1)
   PP_a = 0;
end

error = (PP_a - PP_a_true)^2;

end

