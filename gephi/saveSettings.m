function saveSettings(settings, workingDir)
% I use it for saving B, C1, C2, maxToskip

name = cat(2, workingDir, 'settings.csv');
csvwrite(name, settings, 0, 0);

end

