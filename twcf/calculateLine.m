function subArray = calculateLine(data, subArray, subCol)
    lineN = size(lineArray,1);
    for linei = 1:max(lineN)
        idxValid = data.stimID_postcue>0 & data.cueValidity==1 & data.lineLengthID_postcue == linei;
        valid = data.correctDis(idxValid);
        validP = mean(valid); % calculates the probability (how again?)
        subArray()
    end
end
