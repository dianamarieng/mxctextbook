%% 10.12 Exercises
%% 1
% a) 4x4
% b) 4x7
% c) Invalid
% d) Valid, 4x5
% e) Invalid
% f) Valid, 4x4
% g) Invalid 
% h) Invalid

%%2
a = [1 -3];
b = [3 1];
% dot product = (1)(3) + (-3)(1) 
figure
plot([0 1], [0 -3]); 
hold on
plot([0 3], [0 1]);
xlim([0 3])
ylim([-3 3])
% no, it can only be orthoganol is the dot product is equal to zero,
% |a||b|cos0 where cosA = 0 and hte angle A is equal to 90