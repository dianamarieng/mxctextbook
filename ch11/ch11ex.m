%% 11.1 
srate = 1000; 
time = 0:1/srate:5; 
f = 4; 
a = 2; 
th = pi/2; 
sinewave = a*sin(2*pi*f*time+th);
plot(time,sinewave)