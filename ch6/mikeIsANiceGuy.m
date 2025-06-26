function stats = mikeIsANiceGuy(data)
% checks inputs 
% checks that data are numeric 
if ~isa(data,'numeric')
    help mikeIsANiceGuy 
    error('Input must contain numbers!');
end

% check that the input is a vector 
if sum(size(data)>1)>1
    help mikeIsANiceGuy 
    error('Data must be a vector!');
end

if length(data)<1
    help mikeIsANiceGuy
    error('Data must contain at least one element!')
end

meanval = myMean(data);
medianval = median(data);
minval = min(data);
maxval = max(data);
N = length(data);
stats = [meanval medianval minval maxval N];

disp(['Mean value is ' num2str(meanval) '.']);
disp(['The median value is ' num2str(medianval) '.']);

    function y = myMean(x)
        y = sum(x)/length(x);
    end
end

%%6.10 Ask for help on this..