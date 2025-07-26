% Started: 7/25/2025 
% Last edited: 7/25/2025
% Description: More streamlined analysis of TWCF data. Adaptation of
% analysis_250707
% Analysis: 
% S0148, S0002, S0151, S0097, S0004, S0144, S0018, S0108, S0153

%% Tasks 
% 1) Make array with raw numbers
% 2) Make table with raw numbers & subject IDs



%% Code
fileSampleDir = 'C:\Users\Diana Gamboa\OneDrive\Documents\GitHub\twcf\twcf_expt1_data_BU\twcf_cue_tex_det_fmri\S0000\main_expt\twcf_cue_tex_det_fmri_BU_S0000_main_expt_*_*.mat';
blockN = 20; 
subID = readmatrix("subID.txt","Delimiter","\n","OutputType","char"); 
subCell = cell(blockN,length(subID)+1); % initializes subject Cells
subCell(2:blockN+1,1) = num2cell(1:blockN); % Rows 2 onwards contains block data, first row is reserved for subject ID name


% Updating subjectDataT
for fi = 1:length(subID)
    % replaces S0000 in sample file directory string with actual subject ID
    fileDirName = strrep(fileSampleDir,'S0000',subID(fi));
    % gets name of file in subject ID folder
    fileName = dir(string(fileDirName)).name; % janky, how to fix?
    % load data of subject, fileDirName 1:110 is the name of the directory folder is in
    load([fileDirName{1}(1:110) fileName],"data");
    subCell(1,fi+1) = subID(fi); % assigns subject ID numbers to first row of cell
    subCell = calculateAverageRT(data,subCell,fi+1); % fi+1 is the column position of the subject data since subject data is shifted to the right 
    
end


%%
%Reaction Time Plot
% figure
% x = [1:blockN];
% 
% plot(x,y)
% xlabel('block')
% ylabel('average RT (ms)')
% disp(dataTable)

%% calculate RT average

function subCell = calculateAverageRT(data, subCell, subCol)
% Desc: Calculates average RT per block for each subject & updates subject
% cell
% Input: data is a structure containing RT from the raw TWCF subject data file
    for blocki = 1:max(data.i_block)
        idx = data.i_block==blocki; % finds indices with the current block number
        val = data.RT(idx); % val is an array with all the RT values in this block 
        avg = mean(val,'omitnan'); % computes average RT of block
        subCell{blocki+1,subCol} = avg; % block number is shifted one downards
    end
end

   