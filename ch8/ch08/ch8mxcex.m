% Chapter 8 Examples & Exercises 
% Edited: 7/4/2025
datafile = load('ch08filename.mat');
data = cell(15,1);
for fi = 1:15 
     % only loads data from rat files, so data{1} would show the data for rat 1
    data{fi} = load(['data_rat' num2str(fi) '.mat']);
end
