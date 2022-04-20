clc;

folder = uigetdir('F:\');
load('./features/trainedmodel.mat');
features = [];
labels = {};

feature = zeros(1, 686);

filetype = sprintf('%s/*.jpg', folder);
jpgfiles = dir(filetype);
jpgnum = length(jpgfiles);
    
for i =1:jpgnum
    filename = fullfile(folder, jpgfiles(i).name);
    
    d = demosaicing(filename);
    
    feature = d;
    features = [features; feature];
        
    labels = [labels; jpgfiles(i).name];
end

T = table(features, labels);
save('./features/testfeatures.mat','T');

yfit = trainedModel.predictFcn(T)