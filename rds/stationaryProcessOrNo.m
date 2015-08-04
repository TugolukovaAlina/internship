% stationaryProcessOrNo

GAF;

P = transMatrRW(graph);
[samples, responses] = takeSamples(0, P, 5000, 0, @propertyForSample, field);

realMean = mean(field);

figure;
transpose(acf(transpose(responses), 20))

%let's look at the first differences
first_diff = responses(1:length(responses) - 1) - responses(2:length(responses));
figure;
transpose(acf(transpose(first_diff), 20))

