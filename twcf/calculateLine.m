function subArray = calculateLine(data, subArray, subCol)
    for linei = 1:5 % NOT GOOD TO HARD CODE BUT ILL LET IT PASS
        % valid 
        idxValid = data.stimID_postcue>0 & data.cueValidity==1 & data.lineLengthID_postcue == linei;
        valid = data.correctDis(idxValid);
        validP = mean(valid); % calculates the probability (how again?)
        subArray(linei,subCol+1) = validP; 
        subArray(linei,1) = linei;

        % invalid
        idxInvalid = data.stimID_postcue>0 & data.cueValidity==-1 & data.lineLengthID_postcue == linei;
        invalid = data.correctDis(idxInvalid);
        invalidP = mean(invalid); % calculates the probability (how again?)
        subArray(linei+5,subCol+1) = invalidP; 
        subArray(linei+5,1) = linei;
    end
end

% Unattended vs attended accuracy by block # 
% Attention effects on the postcue quadrant
