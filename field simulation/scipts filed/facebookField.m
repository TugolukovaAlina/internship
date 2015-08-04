% facebookField

% I made this script in order to assign values to real graph

% import of facebook graph from csv file
graphFacebook = graphFromCSV;

%creating field
valuesFacebook = 1:20;
fieldFacebook = createFieldF(graphFacebook, valuesFacebook, 1/10, 20);

% exporting field to file
fieldToCSV(fieldFacebook);

% calculateExpectedEnergy(graphFacebook, valuesFacebook, temFacebook)
% energyRF = numberOfEdges(graphFacebook)*(length(valuesFacebook) + 1)*(length(valuesFacebook) - 1)/6;