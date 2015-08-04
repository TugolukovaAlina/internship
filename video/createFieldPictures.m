function field = createFieldPictures(graph, points, properties, temperature, numberOfIterations, step, workingDir, field)
% assigns to each vertex of a graph value from 'properties' according to
% chosen temperature
%   field - assigned to vertices values
%   averages - mean of field on each step of simulation


if nargin == 7
    field = randomConfiguration(length(graph), properties);
end

energy = zeros(1, length(properties));

counter = 0;

% draw random configuration
figure('Position', [100, 100, 800, 800]);
axis off;
drawField(points, field, graph);
oldField = field;


%save first picture
set(gcf,'PaperPositionMode','auto')
numberOfImages = floor(numberOfIterations*length(graph)/step) + 1;

numberOfFinishedImages = 1;
print(fullfile(workingDir, 'images', getFileName()),'-djpeg','-r0');


fprintf('finished 1 from %i \n', numberOfImages);

for j = 1:numberOfIterations
    for i = 1 : length(graph) 
        
        if mod(counter, step) == 0            
            
            
            %  look what values have been changed since last image
            changedInds = find( (field - oldField) ~= 0);
            
            %??? maybe insert here checking that changedInds is not empty
            
            
            % redraw changed nodes
            hold on;
            scatter(points (changedInds, 1), points (changedInds, 2), 60, field(changedInds), 'filled')
            
            % save new picture
            numberOfFinishedImages = numberOfFinishedImages + 1;
            print(fullfile(workingDir, 'images', getFileName()),'-djpeg','-r0');
            oldField = field;
            
            fprintf('finished %i from %i \n', numberOfFinishedImages, numberOfImages);
        end
        counter = counter + 1;
        
        index = i;
        for k = 1:length(properties)
            field(index) = properties(k);
            energy(k) = computeLocalEnergy(graph, field, index);
        end
        field(index) = chooseProperty(energy, temperature);
    end 
end

    function name = getFileName()
        zer = num2str(10 ^ (numberOfDigits(numberOfImages) - numberOfDigits(numberOfFinishedImages)));
        name = strcat('RGG', zer(2:length(zer)), num2str(numberOfFinishedImages));
    end

    function n = numberOfDigits(number)
       n = length(num2str(number));
    end
 
end

