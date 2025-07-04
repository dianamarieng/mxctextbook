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
 
%% 2
fid = fopen('headache_data.txt','r');
behavioral_data = zeros(100000,1);
datarow = 1; 
while ~feof(fid)
    dataline = fgetl(fid); 
    dataline = regexp(dataline,'\t','split'); 
    if ~any(strcmpi('trial',dataline))
        continue 
    end 
    trial_column = find(strcmpi('trial',dataline)); 
    choice_column = find(strcmpi('choice',dataline)); 
    rt_column = find(strcmpi('rt',dataline)); 
    accuracy_column= find(strcmpi('accuracy',dataline)); 

    behavioral_data(datarow,1) = str2double(dataline{trial_column+1});
    behavioral_data(datarow,2) = str2double(dataline{choice_column+1});
    behavioral_data(datarow,3) = str2double(dataline{rt_column+1});
    behavioral_data(datarow,4) = str2double(dataline{accuracy_column+1});
    datarow = datarow+1; 
end
fclose(fid);
behavioral_data = behavioral_data(any(behavioral_data,2),:);

%% 3 CSV Read 
%data = csvread('somedata.csv');
mat3 = 10 + (35-10).*rand(4,4);
csvwrite('randomNumbers.csv',mat3);

%% 4 For Loop 
allFiles = dir; 
for i = 1:length(allFiles) 
    if allFiles(i).isdir == 1 
        newDir(i) = allFiles(i);
    end
end

%% 5 sscanf 
disp('str2double')
tic
for i = 1:1000000
    str2double(string(i));
end
toc

disp('sscanf')
tic
for i = 1:1000000
    sscanf(string(i),'%f');
end
toc

%% 6 
% data = dlmwrite('datafile',M)
% have to loop over fi 

%% 7 FLAG
var4fname = 'name';
var1 = 2; 
varB = 4;
save('var4fname','var1','varB');
% var4fname without strings output to the .mat file named var4name, while
% 'var4name' creates a new one?

%% 8 Yes, the semicolons