% generatePictures

workingDir = '/run/netsop/u/sop-nas2a/vol/home_maestro/atuholuk/Documents/MATLAB/RW/video';

% [graph, points] = randomGraphGenerator('rgg', 500, 0.1);
temper = findTemperature(0.03, graph, properties)
createFieldPictures(graph, points, 1:10, temper, 3, 25, workingDir);

%Find all the JPEG file names in the images folder. Convert the set of image names to a cell array.
imageNames = dir(fullfile(workingDir,'images','*.jpg'));
imageNames = {imageNames.name}';

%Create New Video with the Image Sequence
%Construct a VideoWriter object, which creates a Motion-JPEG AVI file by default.

outputVideo = VideoWriter(fullfile(workingDir,'graph5.avi'));
outputVideo.FrameRate = 5;
open(outputVideo)

%Loop through the image sequence, load each image, and then write it to the video.

for ii = 1:length(imageNames)
   fprintf('%i ', ii);
   img = imread(fullfile(workingDir,'images',imageNames{ii}));
   writeVideo(outputVideo,img)
end

%Finalize the video file.
close(outputVideo)
