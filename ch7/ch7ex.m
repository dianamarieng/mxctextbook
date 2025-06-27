% 7.6 Try-catch 
e = [1 4];
try 
    if e(3)>6, disp('e(3) is big.'), end
catch ME 
    if e(2)>3, disp('e(2) is big.')
    else disp('e(1) is my friend.')
    end
end

%% 1
% Turn the vector 1:15 into 1-2-3-1-2-3
mod(0:14,4)+1

%% 2
% 