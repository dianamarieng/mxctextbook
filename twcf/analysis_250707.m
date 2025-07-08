% Started: 7/7/2025
% Last edited: 7/6/202
% Description: More analysis on TWCF data 
% Analysis: 
% S0148, S0002, S0151, S0097, S0004, S0144, S0018, S0108, S0153

% Task 1: Make a plot of average RT for all participants across blocks 
% 1) Make a loop to load RT across trials for each participant 
% 2) Store data from each trial into corresponding blocks
% 3) Make a table with blocks 1-20 for all participants and average RT for each block
% 4) Plot average reaction time against block number with error bars

% Task 2: Plot average RT across blocks for each participant.

% Repeat Task 1 and 2 for line length

% File Directory Format
% Sample file directory: C:\Users\Diana
% Gamboa\OneDrive\Documents\GitHub\twcf\twcf_expt1_data_BU\twcf_cue_tex_det_fmri\S0004\main_expt\twcf_cue_tex_det_fmri_BU_S0004_main_expt_20250501_094222.mat
fileSampleDir = 'C:\Users\Diana Gamboa\OneDrive\Documents\GitHub\twcf\twcf_expt1_data_BU\twcf_cue_tex_det_fmri\S0000\main_expt\twcf_cue_tex_det_fmri_BU_S0000_main_expt_*_*.mat';

blockN = 20; % Block number
% FLAG: Is it better to intialize as an array or as a structure?

% List of subjects with completed tests 
subID = readmatrix("subID.txt","Delimiter","\n","OutputType","char"); 
dataTable = [(1:blockN)',zeros(blockN,1)]; 


% 1) Loop through directory for each participant. 
% 2) Within this loop, add the reaction time of the participant into a temp
% array representing one block 
% 3) Once all reaction times are stored in the block, average the reaction
% times and put into 'data' array 
% FLAG: Is there some better way to access data from participants
% FLAG: Should I average the average of participants or just average the raw data?
for fi = 1:length(subID)
    % replaces S0000 in sample file directory string with actual subject ID
    fileDirName = strrep(fileSampleDir,'S0000',subID(fi));
    % gets name of file in subject ID folder
    fileName = dir(string(fileDirName)).name; % janky, how to fix?
    % load data of subject
    % fileDirName 1:110 is the name of the directory
    % the folder is in
    load([fileDirName{1}(1:110) fileName],"data");
    % loop through each block and generates block 
    dataTable = calculateSumRT(data.i_block,data.RT,dataTable);
    % dataTable(blockIDX,2) = dataTable(blockIDX,2) + sumRT; % adds sumRT to RT across subjects
end
dataTable = dataTable(:,dataTable(:,2)/1600);
disp(dataTable)

function dataT = calculateSumRT(i_block,RT,dataT)
    for i = 1:max(i_block)
        idx = i_block==i; % finds indices with the current block number
        val = RT(idx); % val is an array with all the RT values in this block 
        dataT(i,2) = dataT(i,2)+sum(val,"omitnan");
    end
end
    




