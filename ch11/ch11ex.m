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
% nyquist = srate/2;
% hz = linspace(0,nyquist,N/2+1);
% hz = (0:1/srate:N/2+1)*nyquist;

%% CH11 Exercises 

%11.1 Generate 10 seconds of data at 1 kHz, comprising 4 sine waves with
%different frequencies between 1 and 30 Hz, and different amplitudes. Add a
%little bit of noise and a lot of noise to make two time seires. Compute
%the power spectrum of the simulated time series (using the functoin fft)
%and plot the results separately for a little noise and a lot of noise.
%show frequencies 0 to 35 Hz. 

phase = pi/2;
sinewave = 5*(2*pi*rand(1;))