%1 
mat1 = zeros(30,4);
% a = mat1(31,10);
% MATLAB cannot add a because it is out of bounds 

%2
mouse(1).age = 50; 
mouse(2).age = 60;
ages = [mouse.age]<55;
disp(ages)

%3 
% The second one produces unintended results 
% because (6:10) produces a columncvar = 4;-5