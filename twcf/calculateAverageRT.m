function subArray = calculateAverageRT(data, subArray, subCol)
% Desc: Calculates average RT per block for each subject & updates subject
% cell
% Input: data is a structure containing RT from the raw TWCF subject data file
% Output: an updated subArray containing RT across blocks
    for blocki = 1:max(data.i_block)
        idx = data.i_block==blocki; % finds indices with the current block number
        val = data.RT(idx); % val is an array with all the RT values in this block 
        avg = mean(val,'omitnan'); % computes average RT of block
        subArray(blocki,subCol) = avg; % enters average into block number & subject column (subCol)
    end
end
