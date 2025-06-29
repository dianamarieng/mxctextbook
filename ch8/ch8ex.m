%% 8.2 
% Loading in data from multiple subjects can be done like so: 
addpath('C:\Users\Diana Gamboa\OneDrive\Documents\MATLAB\Denison Lab\ch8\ch08')
data = cell(15,1); % initializing cells 
for fi = 1:15 % Number of files
    data{fi} = load(['data_rat' num2str(fi) '.mat']); % adds contents of each file into corresponding cells 
end

% structure array with 1 element per file/folder in the current directory
allFiles = dir; 
%allFiles.name stores the name of each folder/file in the current
%directory. It also contains the entries "." meaning the current directory
%and ".." the directory higher 

%% 8 Exercises
