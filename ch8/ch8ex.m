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

%% 1
% [all.isdir] means an array of folders. all([all.isdir]) means the
% indices that are all true. = [] makes the directory that is true into
% empty arrays 
% THe second statement 

% Test alla
allFiles = dir; 
allFiles = allFiles(3:end); % eliminates elements '.' and '..' 
fileIndex = [allFiles.isdir] == 0; %0 indicates that it is a file, 
% hence the array is a set of indices that indicate the position of the
% files 
allFiles = allFiles(fileIndex); % This makes allFiles into an array that only contains files in the current directory 
