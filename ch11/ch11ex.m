%% 11.1 
% Plotting a sine wave
srate = 1000; 
time = 0:1/srate:5; 
f = 4; 
a = 2; 
th = pi/2; 
sinewave = a*sin(2*pi*f*time+th);
plot(time,sinewave)
% Complex Sine Wave
csw = exp(1i*2*pi*f*time); 
plot3(time,real(csw),imag(csw))
%11.1 
% Slow Fourier Transofmr 
% N = length(signal);
% fTime = (0:N-1)/N;
% for fi=1:N
% fSine = exp(-1i*2*pi*(fi-1).*fTime);
% signalX(fi) = sum(fSine.*signal);
% end
% signalX = signalX / N;