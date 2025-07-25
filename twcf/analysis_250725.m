% Started: 7/25/2025 
% Last edited: 7/25/2025
% Description: More streamlined analysis of TWCF data. Adaptation of
% analysis_250707
% Analysis: 
% S0148, S0002, S0151, S0097, S0004, S0144, S0018, S0108, S0153

% File Directory Format
% Sample file directory: C:\Users\Diana
% Gamboa\OneDrive\Documents\GitHub\twcf\twcf_expt1_data_BU\twcf_cue_tex_det_fmri\S0004\main_expt\twcf_cue_tex_det_fmri_BU_S0004_main_expt_20250501_094222.mat
fileSampleDir = 'C:\Users\Diana Gamboa\OneDrive\Documents\GitHub\twcf\twcf_expt1_data_BU\twcf_cue_tex_det_fmri\S0000\main_expt\twcf_cue_tex_det_fmri_BU_S0000_main_expt_*_*.mat';

% List of subjects with completed tests 
subID = readmatrix("subID.txt","Delimiter","\n","OutputType","char"); 
dataTable = [(1:blockN)',zeros(blockN,1)]; 


for fi = 1:length(subID)
    % replaces S0000 in sample file directory string with actual subject ID
    fileDirName = strrep(fileSampleDir,'S0000',subID(fi));
    % gets name of file in subject ID folder
    fileName = dir(string(fileDirName)).name; % janky, how to fix?
    % load data of subject
    % fileDirName 1:110 is the name of the directory folder is in
    load([fileDirName{1}(1:110) fileName],"data");
    % loop through each block and generates block 
    dataTable = calculateSumRT(data,dataTable);
    % dataTable(blockIDX,2) = dataTable(blockIDX,2) + sumRT; % adds sumRT to RT across subjects
end
dataTable(:,2) = dataTable(:,2)/(80*9);

% Reaction Time Plot
figure
x = dataTable(:,1); 
y = dataTable(:,2);
plot(x,y)
xlabel('block')
ylabel('average RT (ms)')
disp(dataTable)


function dataT = calculateSumRT(data,dataT)
% Description: calculates the total sum reaction time across all subjects
% and updates the data table 
% Inputs: structure data contains the loaded data subject's RT, dataT is a
% matrix of average RT against block number 
% Ouput: dataT is updated with new total sum 
    for i = 1:max(data.i_block)
        idx = data.i_block==i; % finds indices with the current block number
        val = data.RT(idx); % val is an array with all the RT values in this block 
        dataT(i,2) = dataT(i,2)+sum(val,"omitnan");
    end
end

    
