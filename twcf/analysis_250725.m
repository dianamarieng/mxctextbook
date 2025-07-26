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
subArray = zeros(blockN, length(subID)+1); % each column corresponds to subject data, each row corresponds to block number


% Updating subjectDataT
for fi = 1:length(subID)
    % replaces S0000 in sample file directory string with actual subject ID
    fileDirName = strrep(fileSampleDir,'S0000',subID(fi));
    % gets name of file in subject ID folder
    fileName = dir(string(fileDirName)).name; % janky, how to fix?
    % load data of subject, fileDirName 1:110 is the name of the directory folder is in
    load([fileDirName{1}(1:110) fileName],"data");
    subArray = calculateAverageRT(data,subArray,fi);
end
subArray(:,length(subID)+1) = mean(subArray,2);

% Making a table with block Numbers & corresponding subject IDs
subjectIDStr = readlines("subID.txt"); 
header = [subjectIDStr',"Average"];
subTable = array2table(subArray,"VariableNames",header);


%Reaction Time Plot
figure
x = 1:blockN; 
y = subArray;
hold on
plot(x,y(:,1:length(subID)),'LineWidth',0.2);
plot(x,y(:,length(subID)+1),'--','LineWidth',4);
hold off
xlabel('block')
ylabel('average RT (ms)')
xlim([1 blockN])
legend(header)

%% calculate RT average

function subArray = calculateAverageRT(data, subArray, subCol)
% Desc: Calculates average RT per block for each subject & updates subject
% cell
% Input: data is a structure containing RT from the raw TWCF subject data file
    for blocki = 1:max(data.i_block)
        idx = data.i_block==blocki; % finds indices with the current block number
        val = data.RT(idx); % val is an array with all the RT values in this block 
        avg = mean(val,'omitnan'); % computes average RT of block
        subArray(blocki,subCol) = avg;
    end
end

   