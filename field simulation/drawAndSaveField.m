function drawAndSaveField(points, field, graph, dirName, fieldName)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
figure; drawField(points, field, graph)
fileName = strcat(dirName, fieldName);

print(fileName,'-djpeg','-r0');
savefig(cat(2, fileName, '.fig'));

end

