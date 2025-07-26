% Started: 7/25/2025 
% Last edited: 7/25/2025
% Description: More streamlined analysis of TWCF data. Adaptation of
% analysis_250707
% Analysis: 
% S0148, S0002, S0151, S0097, S0004, S0144, S0018, S0108, S0153

%% Tasks 
% 1) Create a structure that has fields with the names of each subject -
% 2) Initialize an array within each subject that has a 20 rows, and a
% columns of NaNs (which will be trimmed later) -
% 3) Loop through each subject, updating the array above with the block
% data of each subject 
% 4) After all loops, trim NaNs


%% Code
fileSampleDir = 'C:\Users\Diana Gamboa\OneDrive\Documents\GitHub\twcf\twcf_expt1_data_BU\twcf_cue_tex_det_fmri\S0000\main_expt\twcf_cue_tex_det_fmri_BU_S0000_main_expt_*_*.mat';
blockN = 20; 
subID = readmatrix("subID.txt","Delimiter","\n","OutputType","char"); 
subjectDataT = struct();

for fi = 1:length(subID)
    % replaces S0000 in sample file directory string with actual subject ID
    fileDirName = strrep(fileSampleDir,'S0000',subID(fi));
    % gets name of file in subject ID folder
    fileName = dir(string(fileDirName)).name; % janky, how to fix?
    % load data of subject, fileDirName 1:110 is the name of the directory folder is in
    load([fileDirName{1}(1:110) fileName],"data");
    subjectDataT(fi).name = subID{fi}; % loads string of subject ID
    % creates fields in subject Data 
    subjectDataT(fi).blockArray = [(1:blockN)',NaN(blockN,100)];
    subjectDataT(fi) = updateBlockData(data,subjectDataT(fi));
end

%Reaction Time Plot
figure
x = dataTable(:,1); 
y = dataTable(:,2);
plot(x,y)
xlabel('block')
ylabel('average RT (ms)')
disp(dataTable)


function subjectData = updateBlockData(data,subjectData)
% Desc: Updates subjectData to reflect block data of each participants 
% Inputs: structure data contains RT from the raw TWCF data mat file,
% subjectDataField is a structure that contains fields named with the subject ID
% name and a NaN block array 
% Output: Updated subjectDataT with updated RT for each participant
disp(subjectData)
    for i = 1:max(data.i_block)
        idx = data.i_block==i; % finds indices with the current block number
        val = data.RT(idx); % val is an array with all the RT values in this block 
        subjectData.blockArray(i,2:length(val)+1) = val; % assigns block values to rows 2 and onwards
    end
end

   