function stats = mikeIsANiceGuy(data)
meanval = mean(data);
medianval = median(data);
minval = min(data);
maxval = max(data);
N = length(data);
stats = [meanval medianval minval maxval N];

disp(['Mean value is ' mum2str(meanval) '.']);
disp(['The median value is ' num2str(medianval) '.']);

function y = myMean(x)
    y = sum(x)/length(x);
end
end