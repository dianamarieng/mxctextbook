% Started: 7/25/2025 
% Last edited: 7/30/2025
% Description: More streamlined analysis of TWCF data. Adaptation of
% analysis_250707
% Analysis: 
% S0148, S0002, S0151, S0097, S0004, S0144, S0018, S0108, S0153

%% Code
fileSampleDir = 'C:\Users\Diana Gamboa\OneDrive\Documents\GitHub\twcf\twcf_expt1_data_BU\twcf_cue_tex_det_fmri\S0000\main_expt\twcf_cue_tex_det_fmri_BU_S0000_main_expt_*_*.mat';
blockN = 20; 
lineN = 5; % numer of available line lengths

subID = readmatrix("subID.txt","Delimiter","\n","OutputType","char"); 
RTArray = zeros(blockN, length(subID)+1); % each column corresponds to subject data, each row corresponds to block number
disArray = zeros(2, length(subID)+1); % row 1: Valid trial, row2: Invalid trials. Rows show probability of correct discrimination 
lineArray = zeros(lineN*2, length(subID)+1); % first 5 rows: Valid trials, each row corresponds to line length. next 5 rows: Invalid trials 


% Updating subjectDataT
for fi = 1:length(subID)
    % replaces S0000 in sample file directory string with actual subject ID
    fileDirName = strrep(fileSampleDir,'S0000',subID(fi));
    % gets name of file in subject ID folder
    fileName = dir(string(fileDirName)).name;
    % load data of subject, fileDirName 1:110 is the name of the directory folder is in
    load([fileDirName{1}(1:110) fileName],"data");
    RTArray = calculateAverageRT(data,RTArray,fi);
    disArray = calculateDis(data,disArray,fi);
end
RTArray(:,length(subID)+1) = mean(RTArray,2); % calculate average RT across participants for each block
disArray(:,length(subID)+1) = mean(disArray,2);

%% Making a table with block Numbers & corresponding subject IDs
subjectIDStr = readlines("subID.txt"); 
header = [subjectIDStr',"Average"];
%subTable = array2table(subArray,"VariableNames",header);

%% Reaction Time Plot
figure
x = 1:blockN; 
y = RTArray;
hold on
plot(x,y(:,1:length(subID)),'LineWidth',0.2);
plot(x,y(:,length(subID)+1),'--','LineWidth',2,'Color','Black');
hold off
xlabel('block')
ylabel('average RT (ms)')
xlim([1 blockN])
legend(header)

%% Discrimination Plot 
figure 
x = header; 
y = disArray; 
bar(x,disArray)
ylabel('Probability of correct discrimination')
legend('Valid','Invalid')
