% estimation of proportion of black and white people in population

radius = 0.06;
numberOfNodes = 800;
[graph, points] = randomGeometricGraph(numberOfNodes, radius);

avDegree = averageDegree(graph);
isCon = isConnected(graph);
properties = [1, 2];
temperature = 3;

[field, avProp] = createField(graph, properties, temperature, 20);
%drawRGGfield(field, points, radius);
figure;
drawField(points, field, graph);

P = transMatrRW(graph);
%initial distribution proportional to degree of node
degrees = zeros(1, numberOfNodes);
for i = 1 : numberOfNodes
    degrees(i) = numberOfNeighbors(graph, i);
end
initialDistr = degrees/sum(degrees);

numberOfSamples = 100;
%[samples, responses] = takeSamples(initialDistr, P, 1000, @propertyForSample, field);
[samples, responses] = takeSamples(initialDistr, P, numberOfSamples, 0, @propertyForSample, field);

% 1 - A
% 2 - B


n_a = length(find(responses == 1));
n_b = length(find(responses == 2));


% in future change this, make function takeSamples able to gather multiple
% properties of nodes
degrees = zeros(1, numberOfSamples);
for i = 1 : numberOfSamples   
    degrees(i) = numberOfNeighbors(graph, samples(i));
end


%average degree of A
degreesA = degrees(responses == 1);
Da = n_a / sum(degreesA.^(-1))

%average degree of B
degreesB = degrees(responses == 2);
Db = n_b / sum(degreesB.^(-1))

%recrutments from a to a, a to b, b to a, b to b
r_aa = length(strfind(responses, [1, 1]));
r_ab = length(strfind(responses, [1, 2]));
r_ba = length(strfind(responses, [2, 1]));
r_bb = length(strfind(responses, [2, 2]));

alla = r_aa +r_ab + r_ba + r_bb;

c_ab = r_ab/(r_aa + r_ab)
c_ba = r_ba/(r_bb + r_ba)

c_aa = r_aa/(r_aa + r_ab)
c_bb = r_bb/(r_ba + r_bb)

PP_a = (Db * c_ba) / (Da*c_ab + Db*c_ba)
PP_a_true = length(find(field == 1)) / length(field)



