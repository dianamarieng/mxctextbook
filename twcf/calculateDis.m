function subArray = calculateDis(data, subArray, subCol)
% Description: Updates the matrix subArray with probability of correct Discrimination
% for invalid and valid trials 
% Input: data is a structure containing raw TWCF data 
% Output: An updated matrix subArray with probabilities
    for i = 1:max(data.i_block)
        % Could probably change this into a subfunction with variable
        % changing cue validity
        % Valid Trials
        idxValid = data.stimID_postcue>0 & data.cueValidity==1;
        valid = data.correctDis(idxValid);
        validP = mean(valid); % calculates the probability (how again?)

        % Invalid Trials
        idxInvalid = data.stimID_postcue>0 & data.cueValidity==-1;
        invalid =  data.correctDis(idxInvalid);
        invalidP = mean(invalid);

        % Updating Subarray
        subArray(1,subCol) = validP; 
        subArray(2,subCol) = invalidP;
    end
end
