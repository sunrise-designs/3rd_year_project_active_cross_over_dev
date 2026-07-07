%sets up time and frequnecy
%1. Sample rate
Fs=44100;
%2. Sample period
Ts=1/Fs;
%3. Number of samples
N=882; % to give nice 25 Hz freq resolution
%4 Sample length
L=Ts*N;
%5. Corresponding time axis
t=(0:(N-1))*L/N;
%6. Corresponding frequency axis
f=(0:(N-1))*Fs/2/N; %up to Fs/2