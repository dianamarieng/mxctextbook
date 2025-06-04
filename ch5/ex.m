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

%4
% 2nd and 3rd would have the same answers because
% MATLAB evaluates the column operator first 

%5
mat5a = [1:10 9:-1:1];
mat5b = [mat5 10 11 12 14];
mat5c = mat5b==8;
disp(mat5a)
disp(mat5b)
disp(mat5c)

%6 
% clear a clears the variable a 
% clear a* clears variables starting with a

%7 
mouse(1).electrodes = 5; 
mouse(2).electrodes = 6; 
totalMouseElectrodes = sum([mouse.electrodes]); 
% square brackets in mouse electrodes are important 
% to create an array 

%8 ***
mat8 = zeros(50,40);

%9 
a9 = 4 + 5/4;
b9 = 19*(48^-4);
c9 = (4+3)/8;
d9 = 4 + 3/8;
e9 = -(4+5^3-0.39)/((2^4)*17.26);

%11 
%7mac11, iHeartData, data-set are all, polyfit are all illegal 

%12 
% 2nd and 3rd because of vertical concatenation 

%13 
aMatrx = [1 3 2 3; 6 7 8 9];
aMatrx = (aMatrx + 4)*6.4-100; 
disp(aMatrx)