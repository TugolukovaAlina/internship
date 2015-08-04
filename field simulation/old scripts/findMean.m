% I want to find mean of value of the node

% I was trying to find mean as Giovanni said
% but it actually equals to the mean of all possible values (properties)

properties = [1, 2, 3, 4, 5];
temperature = [0, 0.1, 0.5, 1, 2, 4, 8, 10, 20, 50, 100, 200];
%temperature = 100;


% I will look at first node

minExp = 1;
stepExp = 0.1;
maxExp = 5;

expValueFact = zeros(1, (maxExp-minExp)/stepExp +1);
lineX = minExp:stepExp:maxExp;

figure
k = ceil(sqrt(length(temperature)));
for i = 1:length(temperature)
    subplot(k, k,i) 
    
    counter = 1;
    for expValueTry = minExp:stepExp:maxExp
        degreeOfFirstNode = numberOfNeighbors(graph, 1);

        distr = exp(-degreeOfFirstNode*(properties - expValueTry).^2/temperature(i));
        distr = distr/sum(distr);

        expValueFact(counter) = sum(distr.*properties);
        counter = counter + 1;
    end 
    
    expValueTry = minExp:stepExp:maxExp;
    plot(lineX, expValueTry, 'LineWidth', 1, 'Color', 'r');
    hold on;
    plot(lineX, expValueFact, 'LineWidth', 1, 'Color', 'g');
    title(sprintf('T = %i',temperature(i)));
end

