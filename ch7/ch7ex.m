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
% The block will never get to the elseif code because anything that is
% greater than -1 will be satisfied by the if statement. it can be solved
% by swapping the if and elseif statement 

%% 3
% Create a 4x8 matrix. Loop through all rows and columns to test whether
% each element is greater than 0.5. Display a statement that indicates the
% column and row number and whether it is bigger than .5 


mat3 = randn(4,8); 
orderStrings = ["1st", "2nd", "3rd", "4th", "5th", "6th", "7th", "8th"]; % make sure to use double quotes
for row = 1:size(mat3,1) % goes through each element in the row
    for col = 1:size(mat3,2) % goes through each element in the column
            number = mat3(row,col); % The number we are evaluating
            orderStringRow = orderStrings(row); % Corresponding word for the row number of the number we are evaluating
            orderStringCol = orderStrings(col); % Corresponding word for the column number of the number we are evaluating
        if mat3(row,col) > 0.5 
            relation = "greater than ";
        elseif mat3(row,col) < 0.5 
            relation = "less than";
        else 
            relation = "equal to";
        end % ends if statement 
        fprintf("The value in the %s row and %s column is %.3f and is %s .5 ", orderStringRow, orderStringCol, number, relation)
        fprintf("\n")
    end % ends column loop 
end % ends row loop

% Edits made from initial code
% Repetitive code in each if-else statement is moved outside of the code 
% disp was changed to fprintf

%% 4 
% Fix Tim's code 
mat4 = -5:1.1:6;
for i = 1:length(mat4)
    if mod(i,2) == 0
        mat4(i) = mat4(i)^2; 
    end
end
disp(mat4)

%% 5 FLAG 
% Idk how to initialize a matrix in the loop 

