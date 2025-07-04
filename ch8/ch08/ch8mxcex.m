% Chapter 8 Examples & Exercises 
% Edited: 7/4/2025
% datafile = load('ch08filename.mat');
% data = cell(15,1);
% for fi = 1:15 
%      % only loads data from rat files, so data{1} would show the data for rat 1
%     data{fi} = load(['data_rat' num2str(fi) '.mat']);
% end

% loads files with rat in current directory
% filedir = 'C:\Users\Diana Gamboa\OneDrive\Documents\MATLAB\Denison Lab\ch8\ch08\';
% files = dir([filedir '*rat*.mat']);
% data = cell(size(files)); 
% for fi = 1:length(files)
%     data{fi} = load([filedir files(fi).name]);
% end

% Importing text files 
fid = fopen('headache_data.txt','r'); 
datavar = []; 
row = 1; 
while ~feof(fid)
    aline =fgetl(fid);
    aline = regexp(aline,'\t','split');
    datavar(row,:) = cellfun(@str2double,aline);
    row = row+1; 
end
fclose(fid);

