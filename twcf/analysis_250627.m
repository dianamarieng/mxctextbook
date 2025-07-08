% Started: 6/27/2025 
% Last edited: 6/27/2025 
% Description: Plotting graphs for participant S0144

% loading main experiment file
% load('twcf_cue_tex_det_fmri_BU_S0144_main_expt_20250515_135127.mat', 'data'); 


%% A plot of responses (discrimination & detection) to cueValidity 
x1 = data.respDis;  
x2 = data.respDet; 
y = data.cueValidity; 
 
% Calculating  the mean of valid and invalid trials
idx = data.stimID_postcue>0 & data.cueValidity==-1;
val = data.correctDis(idx);
mean(val) % calculates the probability

% Calculating mean RT of block 1 vs 20
for iBlock = 1:max(data.i_block)
    idx = data.i_block==iBlock;
    val = data.RT(idx);
    meanRT(iBlock) = mean(val,'omitnan');
end



% Plot against line length!! 
% Plot RT for each finished participant
%% x-axis: respDis and respDet, y-axis: cueValidity
figure
plot(x1,y, 'DisplayName','respDis');
hold on
plot(x2,y, 'DisplayName','respDet');
hold off
xlabel("Response Discrimination/Detection");
ylabel("Cue Validity");
legend

%% correctDis & correctDet 
dis = data.correctDis(1:20);
det = data.correctDet(1:20);
figure
plot(dis, 'DisplayName', 'correctDis')
hold on 
plot(det, 'DisplayName', 'correctDet')
hold off
xlabel("Correct Discrimination/Correct Detection");
ylabel("Trial number");
legend

%% plot of correct discrimination & detection against each corresponding postcue Location

cueLoc = data.postcueLoc;
dis = data.correctDis;
det = data.correctDet;

% WRITE THIS BETTER?
meanDis = zeros(1,4);
meanDet = zeros(1,4);
for i = 1:4 
    meanDis(i) = calculateMeanResponse(dis,cueLoc,i);
    meanDet(i) = calculateMeanResponse(det,cueLoc,i);
end

figure
bar(meanDis)
hold on
bar(meanDet)
xlabel("Quadrant Number")
ylabel("Average Dis/Det response")
legend('Dis','Det')

%% plot of RT 
figure 
plot(data.RT)
ylabel("Response time")
xlabel("Trial number?")


