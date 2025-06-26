function halfOrNot = compareToHalf()
N = randn(1);
if N > 0.5
    disp(['The value is ' num2str(N) ' and is bigger than .5']);
elseif N == 0.5 
    disp(['The value is ' num2str(N) ' and is equal to .5']); 
else
    disp(['The value is ' num2str(N) ' and is less than .5']);
end
end