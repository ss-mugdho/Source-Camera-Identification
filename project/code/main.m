clc;
clear all;

%ask user to select main folder
mainfolder = uigetdir();
mainfolderlength = length(mainfolder) + 2;

%getting all subfolders
subfolders = genpath(mainfolder);

remain = subfolders;
folderlist = {};

%putting subfolder address in cells
while true
    [singlefolder, remain] = strtok(remain, ';');
    if isempty(singlefolder)
        break;
    end
    folderlist = [folderlist singlefolder];
end

%number of folders
foldernum = length(folderlist);

features = [];
labels = {};

feature = zeros(1, 686);

%processing all images in subfolders
for folder = 2: foldernum
    thisfolder = folderlist{folder};
    
    filetype = sprintf('%s/*.jpg', thisfolder);
    jpgfiles = dir(filetype);
    jpgnum = length(jpgfiles);
    
    for i =1:jpgnum
        filename = fullfile(thisfolder, jpgfiles(i).name);
        fprintf('Processing image file %s\n', filename);
        d = demosaicing(filename);
    
        feature = d;
        features = [features; feature];
        
        labels = [labels; thisfolder(mainfolderlength:end)];
    end
end

%merging features and labels in table
T = table(features, labels);
save('./features/features1.mat','T');


